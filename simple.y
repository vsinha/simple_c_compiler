/*
 * CS250
 *
 * simple.l: simple parser for the simple "C" language
 *
 */

%token	<string_val> WORD

%token 	NOTOKEN LPARENT RPARENT LBRACE RBRACE LCURLY RCURLY COMA SEMICOLON EQUAL STRING_CONST LONG LONGSTAR VOID CHARSTAR CHARSTARSTAR INTEGER_CONST AMPERSAND OROR ANDAND EQUALEQUAL NOTEQUAL LESS GREAT LESSEQUAL GREATEQUAL PLUS MINUS TIMES DIVIDE PERCENT IF ELSE WHILE DO FOR CONTINUE BREAK RETURN 

%union	{
		char   *string_val;
		int nargs;
		int my_nlabel;
	}

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int line_number;
const char * input_file;
char * asm_file;
FILE * fasm;

#define MAX_ARGS 5
int nargs;
char * args_table[MAX_ARGS];

#define MAX_GLOBALS 100
int nglobals = 0;
char * global_vars_table[MAX_GLOBALS];

#define MAX_LOCALS 32
int nlocals = 0;
char * local_vars_table[MAX_LOCALS];

#define MAX_STRINGS 100
int nstrings = 0;
char * string_table[MAX_STRINGS];

int nstringvars = 0;
char * string_vars_table[MAX_STRINGS];

char *regStk[]={ "rbx", "r10", "r13", "r14", "r15"};
char nregStk = sizeof(regStk)/sizeof(char*);

char *byteRegStk[]={ "bl", "r10b", "r13b", "r14b", "r15b"};

char *regArgs[]={ "rdi", "rsi", "rdx", "rcx", "r8", "r9"};
char nregArgs = sizeof(regArgs)/sizeof(char*);


int top = 0;

int nargs =0;
 
int nlabel = 0;

int alabel = 0; //for array character accesses

int loopID = 0;

int charstarfound = 0;

int lookupLocalVar(char *id) {
	int i;
	for (i = 0; i < nlocals; i++) {
		if (!strcmp(local_vars_table[i], id)) {
			return i;
		}
	}
	return -1;
}

int lookupGlobalVar(char* id) {
	int i;
	for (i = 0; i < nglobals; i++) {
		if (!strcmp(global_vars_table[i], id)) {
			return i;
		}
	}
	return -1;
}

int lookupStringVar(char* id) {
	//printf("looking up %s, nstringvars = %d, (%d)\n", id, nstringvars, line_number);
	int i;
	for (i = 0; i < nstringvars; i++) {
		if (!strcmp(string_vars_table[i], id)) {
			//printf("returning %d\n", i);
			return i;
		}
	}
	//printf("returning -1\n");
	return -1;
}

%}

%%

goal:	program
	;

program :
        function_or_var_list;

function_or_var_list:
        function_or_var_list function
        | function_or_var_list global_var
        | /*empty */
	;

function:
         var_type WORD
         {
		 fprintf(fasm, "\t.text\n");
		 fprintf(fasm, ".globl %s\n", $2);
		 fprintf(fasm, ".type %s, @function\n", $2);
		 fprintf(fasm, "%s:\n", $2);

		 fprintf(fasm, "\t# Save registers\n");
		 fprintf(fasm, "\tpushq %%rbx\n");
		 fprintf(fasm, "\tpushq %%r10\n");
		 fprintf(fasm, "\tpushq %%r13\n");
		 fprintf(fasm, "\tpushq %%r14\n");
		 fprintf(fasm, "\tpushq %%r15\n");
		 
		 fprintf(fasm, "\n\t# move the stack pointer for 32 vars of space\n");
		 fprintf(fasm, "\tsubq $%d, %%rsp\n", 8*MAX_LOCALS);

		 nlocals = 0;

	 	 }
		 LPARENT arguments RPARENT {
			int i;
			fprintf(fasm, "\t# Save arguments\n");
			for (i = 0; i < nlocals; i++) {
				fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n", regArgs[i], 8*i);
			}
		 }
		 compound_statement
         {
		 fprintf(fasm, "\n\t# move the stack pointer back to where it was\n");
		 fprintf(fasm, "\taddq $%d, %%rsp\n", 8*MAX_LOCALS);

		 fprintf(fasm, "\t# Restore registers\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n", $2);
         }
	;

arg_list:
         arg
         | arg_list COMA arg
	 ;

arguments:
         arg_list
	 | /*empty*/
	 ;

arg: var_type WORD { 
   		local_vars_table[nlocals] = $2;
		nlocals++;

		if (charstarfound) {
			//printf("%d, %s;\n", charstarfound, $<string_val>2);
			string_vars_table[nstringvars] = $<string_val>2;
			nstringvars++;
			charstarfound = 0;
		}
   };

global_var: 
        var_type global_var_list SEMICOLON {
		if (charstarfound) {
			//printf("%d, %s;\n", charstarfound, $<string_val>2);
			string_vars_table[nstringvars] = $<string_val>2;
			nstringvars++;
			charstarfound = 0;
		}
		};

global_var_list: WORD {
			   nglobals += 1;
			   global_vars_table[nglobals] = $1;
			   fprintf(fasm, "\t.data\n");
			   fprintf(fasm, "\t.comm\t%s, 8, 8  # nGlobals= %d\n", $1, nglobals);
        }
| global_var_list COMA WORD {
			   nglobals += 1;
			   global_vars_table[nglobals] = $3;
			   fprintf(fasm, "\t.data\n");
			   fprintf(fasm, "\t.comm\t%s, 8, 8  # nGlobals= %d\n", $3, nglobals);
}
        ;

var_type: CHARSTAR {
			$<string_val>0 = "CHARSTAR";
			charstarfound = 1;
			//printf("found a charstar\n");
		}
		| CHARSTARSTAR | LONG | LONGSTAR | VOID;

assignment:
     WORD EQUAL expression {
	 		char * id = $1;
			int i = lookupLocalVar(id);
			if (i >= 0) {
				fprintf(fasm, "\t#assign to local var %s\n", id);
				fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n", regStk[top-1], 8*i);
			}
			else {
	 			fprintf(fasm, "\t#assign to global var %s\n", id);
				fprintf(fasm, "\tmovq %%%s, %s\n", regStk[top-1], $1);
			}
			top--;
			fprintf(fasm, "\t# 1 top-- = %d\n", top);
		}
	 | WORD LBRACE expression RBRACE EQUAL expression {

	 		char * id = $1;
			int i = lookupLocalVar(id);
			char*  index = $<string_val>3;
			if (i >= 0) {
				fprintf(fasm, "\t#assign to local array %s\n", id);
				fprintf(fasm, "\tmovq %d(%%rsp), %%%s\n", 8*i, regStk[top]);
			} else {
	 			fprintf(fasm, "\t#assign to global array %s\n", id);
				fprintf(fasm, "\tmovq %s, %%%s\n", id, regStk[top]);
			}
			
			if (lookupStringVar(id) >= 0) {
				fprintf(fasm, "\timulq $1, %%%s\n", regStk[top - 2]);
			} else {
				fprintf(fasm, "\timulq $8, %%%s\n", regStk[top - 2]);
			}
			

			//add the multiplied index to the loaded address
			fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top-2], regStk[top]);
			fprintf(fasm, "\tmovq %%%s, (%%%s)\n", regStk[top-1], regStk[top]);
			fprintf(fasm, "\tmovq %%%s, %%%s\n", regStk[top], regStk[top-2]);
			top--;
			top--;
			fprintf(fasm, "\t# 2 top-- = %d\n", top);
	 }
	 ;

call :
	 WORD LPARENT  call_arguments RPARENT {
		 char * funcName = $<string_val>1;
		 int nargs = $<nargs>3;
		 int i;
		 fprintf(fasm, "\n\t# func=%s nargs=%d\n", funcName, nargs);
			 fprintf(fasm, "\t# Move values from reg stack to reg args\n");
		 for (i=nargs-1; i>=0; i--) {
			top--;
			fprintf(fasm, "# 3 top-- = %d\n", top);
			fprintf(fasm, "\tmovq %%%s, %%%s\n", regStk[top], regArgs[i]);
		 }
		 if (!strcmp(funcName, "printf")) {
			 // printf has a variable number of arguments
			 // and it need the following
			 fprintf(fasm, "\tmovl $0, %%eax # return val for printf\n");
		 }
		 fprintf(fasm, "\tcall %s\n", funcName);
		 fprintf(fasm, "\tmovq %%rax, %%%s\n", regStk[top]);
		 top++;
		 fprintf(fasm, "\t# 1 top = %d\n", top);
	 }
      ;

call_arg_list:
         expression {
		$<nargs>$=1;
	 }
         | call_arg_list COMA expression {
		$<nargs>$++;
	 }

	 ;

call_arguments:
         call_arg_list { $<nargs>$=$<nargs>1; }
	 | /*empty*/ { $<nargs>$=0;}
	 ;

expression :
         logical_or_expr
	 ;

logical_or_expr:
         logical_and_expr
	 | logical_or_expr OROR logical_and_expr {
		fprintf(fasm, "\n\t# ||\n");
		fprintf(fasm, "\torq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
		fprintf(fasm, "\t# 4 top-- = %d\n", top);
	}
	 ;

logical_and_expr:
         equality_expr
	 | logical_and_expr ANDAND equality_expr {
		fprintf(fasm, "\n\t# &&\n");
		fprintf(fasm, "\tandq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 5 top-- = %d\n", top);
	}
	 ;

equality_expr:
         relational_expr
	 | equality_expr EQUALEQUAL relational_expr {
	 	fprintf(fasm, "\n\t# ==\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsete %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 6 top-- = %d\n", top);
	 }
	 | equality_expr NOTEQUAL relational_expr {
	 	fprintf(fasm, "\n\t# !=\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsetne %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
	 	top--;
			fprintf(fasm, "\t# 7 top-- = %d\n", top);
	 }
	 ;

relational_expr:
         additive_expr
	 | relational_expr LESS additive_expr {
	 	fprintf(fasm, "\n\t# <\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsetl %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 8 top-- = %d\n", top);
	 }
	 | relational_expr GREAT additive_expr {
	 	fprintf(fasm, "\n\t# >\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsetg %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 9 top-- = %d\n", top);
	 }
	 | relational_expr LESSEQUAL additive_expr {
	 	fprintf(fasm, "\n\t# <=\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		//fprintf(fasm, "\tcmovle $1, %%rax\n");
		fprintf(fasm, "\tsetle %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 10 top-- = %d\n", top);
	 }
	 | relational_expr GREATEQUAL additive_expr {
	 	fprintf(fasm, "\n\t# >=\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		//fprintf(fasm, "\tcmovge $1, %%rax\n");
		fprintf(fasm, "\tsetge %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 11 top-- = %d\n", top);
	 }
	 ;

additive_expr:
          multiplicative_expr
	  | additive_expr PLUS multiplicative_expr {
		fprintf(fasm,"\n\t# +\n");
		if (top<=nregStk) {
			fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 12 top-- = %d\n", top);
		}
	  }
	  | additive_expr MINUS multiplicative_expr {
	  	fprintf(fasm, "\n\t# - \n");
		if (top<=nregStk) {
			fprintf(fasm, "\tsubq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 13 top-- = %d\n", top);
		}
	  }
	  ;

multiplicative_expr:
          primary_expr
	  | multiplicative_expr TIMES primary_expr {
		fprintf(fasm,"\n\t# *\n");
		if (top<=nregStk) {
			fprintf(fasm, "\t# multiplying %s and %s\n", regStk[top-1], regStk[top-2]);
			fprintf(fasm, "\timulq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 14 top-- = %d\n", top);
		}
      }
	  | multiplicative_expr DIVIDE primary_expr {
	  	fprintf(fasm, "\n\t# /\n");
		if (top <= nregStk) {
			fprintf(fasm, "\t# dividing %s and %s\n", regStk[top-1], regStk[top-2]);
			fprintf(fasm, "\t# put divisor in rax\n");
			fprintf(fasm, "\tmovq $0, %%rdx # clear rdx (will store modulo)\n");
			fprintf(fasm, "\tmovq %%%s, %%rax\n", regStk[top-2]);
			fprintf(fasm, "\tdivq %%%s\n", regStk[top-1]);
			//fprintf(fasm, "\tmovq %%rax, %%rbx # move quotient to rbx\n\n");
			fprintf(fasm, "\tmovq %%rax, %%%s # move quotient to top of stackh\n\n", regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 15 top-- = %d\n", top);
		}
	  }
	  | multiplicative_expr PERCENT primary_expr {
	  	fprintf(fasm, "\n\t# %%\n");
		if (top <= nregStk) {
			fprintf(fasm, "\t# dividing %s and %s\n", regStk[top-1], regStk[top-2]);
			fprintf(fasm, "\t# put divisor in rax\n");
			fprintf(fasm, "\tmovq $0, %%rdx # clear rdx (will store modulo)\n");
			fprintf(fasm, "\tmovq %%%s, %%rax\n", regStk[top-2]);
			fprintf(fasm, "\tdivq %%%s\n", regStk[top-1]);
			fprintf(fasm, "\tmovq %%rdx, %%%s # move modulo to top of stack\n\n", regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 16 top-- = %d\n", top);
		}
	  }
	  ;

primary_expr:
	STRING_CONST {
		  // Add string to string table.
		  // String table will be produced later
		  string_table[nstrings]=$<string_val>1;
		  fprintf(fasm, "\t#top=%d\n", top);
		  fprintf(fasm, "\n\t# push string %s top=%d\n", $<string_val>1, top);
		  if (top<nregStk) {
		  	fprintf(fasm, "\tmovq $string%d, %%%s\n", nstrings, regStk[top]);
			//fprintf(fasm, "\tmovq $%s,%%%s\n", $<string_val>1, regStk[top]);
			top++;
		 	fprintf(fasm, "\t# 2 top = %d\n", top);
		  } 
		nstrings++;
	}
    | call
	| WORD {
		  // check if it is a global variable

		  char * id = $<string_val>1;
		  int i = lookupLocalVar(id); // position in array of local variables

		  if (i >= 0) // handle as local variable
		  {
		  	//load local variable from its position on the stack
			fprintf(fasm, "\t# variable %s is at %d position in the list\n", id, i);
			fprintf(fasm, "\tmovq %d(%%rsp), %%%s # load %s from local vars\n", 8*i, regStk[top], id);
			top++;
		 fprintf(fasm, "\t# 3 top = %d\n", top);

		  } else { 
		  	  //global var
			  fprintf(fasm, "\tmovq %s, %%%s # load value from global var\n", id, regStk[top]);
			  top++;
		 fprintf(fasm, "\t# 4 top = %d\n", top);
		  }
	  }
	  | WORD LBRACE expression RBRACE {

	  	//if we're here, the WORD is an array
	  	fprintf(fasm, "\t# load array %s\n", $<string_val>1);
		//the value at regStk[top] is the index we want to load

		//first figure out if array is global or local
		char * id = $<string_val>1;
		int i = lookupLocalVar(id);

		//then store the address we want (grabbed either from local or global)
		if (i >= 0) { //handle as local variable
			fprintf(fasm, "\tmovq %d(%%rsp), %%%s # load %s local\n", 8*i, regStk[top], id);
			top++;
		 	fprintf(fasm, "\t# 5 top = %d\n", top);
	  	} else {
			//global
			fprintf(fasm, "\tmovq %s, %%%s # load value from global var\n", id, regStk[top]);
			top++;
		 	fprintf(fasm, "\t# 6 top = %d\n", top);
		}

		//if id is in the string_id table, then the offset should be 1 instead of 8
		//offset the address by index * 8
		//index is already loaded (expression leaves it in top-1)
		//multiply by 8
		int strID = lookupStringVar(id);
		if (strID >= 0) {
			fprintf(fasm, "\timulq $1, %%%s\n", regStk[top - 2]);
		} else {
			fprintf(fasm, "\timulq $8, %%%s\n", regStk[top - 2]);
		}

		//add to address
		fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top-2], regStk[top-1]);

		//then load the value at the modified address
		//zero out the rest of the register if we're just moving a char
		if (strID >= 0) {
			fprintf(fasm, "\tmovzx (%%%s), %%%s\n", regStk[top-1], regStk[top-2]);
		} else {
			fprintf(fasm, "\tmovq (%%%s), %%%s\n", regStk[top-1], regStk[top-2]);
		}

		top--;
		fprintf(fasm, "\t# 17 top-- = %d\n", top);

		//if we have the null terminator, we should set this to 0
		//use the byte stack table to figure out what the byte register name is
		fprintf(fasm, "\tmov %%%s, %%al\n", byteRegStk[top-1]);
		fprintf(fasm, "\ttest %%al, %%al\n"); //will be 0 if NUL
		fprintf(fasm, "\tjne char_access_%d\n", alabel);
		fprintf(fasm, "\tmovq $0, %%%s\n", regStk[top-1]);
		fprintf(fasm, "char_access_%d:\n", alabel);
		alabel++;
		
	  }
	  | AMPERSAND WORD {
		  char * id = $<string_val>2;
		  int i = lookupLocalVar(id); // position in array of local variables

		  if (i >= 0) // handle as local variable
		  {
		  	//load local variable from its position on the stack
			fprintf(fasm, "\t# variable %s is at %d position in the list\n", id, i);
			fprintf(fasm, "\tleaq %d(%%rsp), %%%s # load %s from local vars\n", 8*i, regStk[top], id);
			top++;
		 fprintf(fasm, "\t# 3 top = %d\n", top);

		  } else { 
		  	  //global var
			  fprintf(fasm, "\tleaq %s, %%%s # load value from global var\n", id, regStk[top]);
			  top++;
		 fprintf(fasm, "\t# 4 top = %d\n", top);
		  }
	  }
	  | INTEGER_CONST {
		  fprintf(fasm, "\n\t# push %s heere\n", $<string_val>1);
		  if (top<nregStk) {
			fprintf(fasm, "\tmovq $%s,%%%s\n", $<string_val>1, regStk[top]);
			top++;
			fprintf(fasm, "\t# 7 top = %d\n", top);
		  }
	  }
	  | LPARENT expression RPARENT
	  ;

compound_statement:
	 LCURLY statement_list RCURLY
	 ;

statement_list:
         statement_list statement
	 | /*empty*/
	 ;

local_var:
        var_type local_var_list SEMICOLON {
			//printf("%d, %s;\n", charstarfound, $<string_val>2);
			if (charstarfound > 0) {
				string_vars_table[nstringvars] = $<string_val>2;
				nstringvars++;
				charstarfound = 0;
			}
		}
		;

local_var_list: 
		WORD {
			//first local variable
			fprintf(fasm, "\t# adding %s to local vars\n", $1);
			local_vars_table[nlocals]=$<string_val>1; 
			nlocals++;
			}
        | local_var_list COMA WORD {
			fprintf(fasm, "\t# adding %s to local vars\n", $3);
			local_vars_table[nlocals]=$<string_val>3;  
			nlocals++;
			}
        ;

statement:
         assignment SEMICOLON
	 | call SEMICOLON {
	 	top --; //because we don't care about the return value of the function
		fprintf(fasm, "# 18 top-- = %d\n", top);
	 }
	 | local_var
	 | compound_statement
	 | IF LPARENT expression RPARENT {
	 	//expression will leave a 1 or 0 at regStk[top]
		//if this value is 1, we continue and run the code in statement
		//if this value is 0, we jump to else optional
		$<my_nlabel>1 = nlabel;
		nlabel++;
		fprintf(fasm, "# if_start_%d:\n", $<my_nlabel>1);
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
		fprintf(fasm, "\tje else_%d\n", $<my_nlabel>1);
		top--;
		fprintf(fasm, "\t# 19 top-- = %d\n", top);
	 } statement {
	 	//we need to jump over the else if the statement was executed
		fprintf(fasm, "\tjmp end_if_%d\n", $<my_nlabel>1);

	 	//jump to here if evaluated expression is 0
		fprintf(fasm, "else_%d:\n", $<my_nlabel>1);

	 } else_optional {
	 	//jump to here if evaluated expression is 1, after running statement
		fprintf(fasm, "end_if_%d:\n", $<my_nlabel>1);
	 }
	 | WHILE LPARENT {
		// act 1
		$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "\n# start while loop\n");
		fprintf(fasm, "restart_loop_%d:\n", $<my_nlabel>1);
         }
         expression RPARENT {
		// act2
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top - 1]);
		fprintf(fasm, "\tje end_loop_%d\n", $<my_nlabel>1);
		top--;
		fprintf(fasm, "# 20 top-- = %d\n", top);
         }
         statement {
		// act3
		fprintf(fasm, "\tjmp restart_loop_%d\n", $<my_nlabel>1);
		fprintf(fasm, "end_loop_%d:\n", $<my_nlabel>1);
	 }
	 | DO { 
		$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "\n# start do while loop\n");
		fprintf(fasm, "restart_loop_%d:\n", $<my_nlabel>1);
	 } statement WHILE LPARENT expression RPARENT {
	 	//jump back to the start if the expression is not false
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top - 1]);
		fprintf(fasm, "\tjne restart_loop_%d\n", $<my_nlabel>1);
		top--;
		fprintf(fasm, "# 21 top-- = %d\n", top);
	 } SEMICOLON {
	 	fprintf(fasm, "end_loop_%d:\n", $<my_nlabel>1);
	 }
	 
	 | FOR LPARENT assignment SEMICOLON {
	 	//check expression
	 	$<my_nlabel>1=nlabel;
		nlabel++;
		fprintf(fasm, "\n# start for loop\n");
		fprintf(fasm, "check_expression_%d:\n", $<my_nlabel>1);
	 } expression SEMICOLON {
		//if false, jump to end
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tje end_loop_%d\n", $<my_nlabel>1);
		//else, jump to start of loop statement
		fprintf(fasm, "\tjmp for_start_%d\n", $<my_nlabel>1);

		//run statement
		//jump to assignment
		//run assignment
		//jump back to check expression

		fprintf(fasm, "restart_loop_%d:\n", $<my_nlabel>1);

	 } assignment RPARENT {
		fprintf(fasm, "\tjmp check_expression_%d\n", $<my_nlabel>1);
	 	fprintf(fasm, "for_start_%d:\n", $<my_nlabel>1);
		top--;
	 } statement {
	 	fprintf(fasm, "\tjmp restart_loop_%d\n", $<my_nlabel>1);
	 	fprintf(fasm, "end_loop_%d:\n", $<my_nlabel>1);
		//top--;
	 }
	 | { loopID = nlabel - 2; } jump_statement
	 ;

else_optional:
         ELSE  statement
	 | /* empty */
         ;

jump_statement:
       CONTINUE SEMICOLON {
		fprintf(fasm, "\tjmp restart_loop_%d # continue\n", loopID);
     }
	 | BREAK SEMICOLON {
	 	fprintf(fasm, "\tjmp end_loop_%d # break\n", loopID);
	 }
	 | RETURN expression SEMICOLON {
		 //move the return value into place
		 fprintf(fasm, "\t# return!\n");
		 fprintf(fasm, "\tmovq %%rbx, %%rax\t # jump_statement\n");

		 //restore the registers, then jump
		 fprintf(fasm, "\n\t# move the stack pointer back to where it was\n");
		 fprintf(fasm, "\taddq $%d, %%rsp\n", 8*MAX_LOCALS);

		 fprintf(fasm, "\t# Restore registers\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n");

		 top = 0;
	 }
	 ;

%%


void yyset_in (FILE *  in_str );

int
yyerror(const char * s)
{
	fprintf(stderr,"%s:%d: %s\n", input_file, line_number, s);
}

int
main(int argc, char **argv)
{
	// Make sure there are enough arguments
	if (argc <2) {
		fprintf(stderr, "Usage: simple file\n");
		exit(1);
	}

	// Get file name
	input_file = strdup(argv[1]);

	int len = strlen(input_file);
	if (len < 2 || input_file[len-2]!='.' || input_file[len-1]!='c') {
		fprintf(stderr, "Error: file extension is not .c\n");
		exit(1);
	}

	// Get assembly file name
	asm_file = strdup(input_file);
	asm_file[len-1]='s';

	// Open file to compile
	FILE * f = fopen(input_file, "r");
	if (f==NULL) {
		fprintf(stderr, "Cannot open file %s\n", input_file);
		perror("fopen");
		exit(1);
	}

	// Create assembly file
	fasm = fopen(asm_file, "w");
	if (fasm==NULL) {
		fprintf(stderr, "Cannot open file %s\n", asm_file);
		perror("fopen");
		exit(1);
	}

	// Uncomment for debugging
	//fasm = stderr; 

	// Create compilation file
	// 
	yyset_in(f);
	yyparse();

	// Generate string table
	int i;
	for (i = 0; i<nstrings; i++) {
		fprintf(fasm, "string%d:\n", i);
		fprintf(fasm, "\t.string %s\n\n", string_table[i]);
	}

	fclose(f);
	fclose(fasm);

	return 0;
}
