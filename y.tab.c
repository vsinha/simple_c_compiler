/* A Bison parser, made by GNU Bison 2.4.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
   2009, 2010 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */


/* Line 189 of yacc.c  */
#line 72 "y.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     WORD = 258,
     NOTOKEN = 259,
     LPARENT = 260,
     RPARENT = 261,
     LBRACE = 262,
     RBRACE = 263,
     LCURLY = 264,
     RCURLY = 265,
     COMA = 266,
     SEMICOLON = 267,
     EQUAL = 268,
     STRING_CONST = 269,
     LONG = 270,
     LONGSTAR = 271,
     VOID = 272,
     CHARSTAR = 273,
     CHARSTARSTAR = 274,
     INTEGER_CONST = 275,
     AMPERSAND = 276,
     OROR = 277,
     ANDAND = 278,
     EQUALEQUAL = 279,
     NOTEQUAL = 280,
     LESS = 281,
     GREAT = 282,
     LESSEQUAL = 283,
     GREATEQUAL = 284,
     PLUS = 285,
     MINUS = 286,
     TIMES = 287,
     DIVIDE = 288,
     PERCENT = 289,
     IF = 290,
     ELSE = 291,
     WHILE = 292,
     DO = 293,
     FOR = 294,
     CONTINUE = 295,
     BREAK = 296,
     RETURN = 297
   };
#endif
/* Tokens.  */
#define WORD 258
#define NOTOKEN 259
#define LPARENT 260
#define RPARENT 261
#define LBRACE 262
#define RBRACE 263
#define LCURLY 264
#define RCURLY 265
#define COMA 266
#define SEMICOLON 267
#define EQUAL 268
#define STRING_CONST 269
#define LONG 270
#define LONGSTAR 271
#define VOID 272
#define CHARSTAR 273
#define CHARSTARSTAR 274
#define INTEGER_CONST 275
#define AMPERSAND 276
#define OROR 277
#define ANDAND 278
#define EQUALEQUAL 279
#define NOTEQUAL 280
#define LESS 281
#define GREAT 282
#define LESSEQUAL 283
#define GREATEQUAL 284
#define PLUS 285
#define MINUS 286
#define TIMES 287
#define DIVIDE 288
#define PERCENT 289
#define IF 290
#define ELSE 291
#define WHILE 292
#define DO 293
#define FOR 294
#define CONTINUE 295
#define BREAK 296
#define RETURN 297




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 214 of yacc.c  */
#line 12 "simple.y"

		char   *string_val;
		int nargs;
		int my_nlabel;
	


/* Line 214 of yacc.c  */
#line 200 "y.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */

/* Line 264 of yacc.c  */
#line 18 "simple.y"

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



/* Line 264 of yacc.c  */
#line 298 "y.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   143

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  43
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  42
/* YYNRULES -- Number of rules.  */
#define YYNRULES  86
/* YYNRULES -- Number of states.  */
#define YYNSTATES  154

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   297

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     7,    10,    13,    14,    15,    16,
      25,    27,    31,    33,    34,    37,    41,    43,    47,    49,
      51,    53,    55,    57,    61,    68,    73,    75,    79,    81,
      82,    84,    86,    90,    92,    96,    98,   102,   106,   108,
     112,   116,   120,   124,   126,   130,   134,   136,   140,   144,
     148,   150,   152,   154,   159,   162,   164,   168,   172,   175,
     176,   180,   182,   186,   189,   192,   194,   196,   197,   198,
     207,   208,   209,   217,   218,   219,   229,   230,   231,   232,
     245,   246,   249,   252,   253,   256,   259
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      44,     0,    -1,    45,    -1,    46,    -1,    46,    47,    -1,
      46,    53,    -1,    -1,    -1,    -1,    55,     3,    48,     5,
      51,     6,    49,    68,    -1,    52,    -1,    50,    11,    52,
      -1,    50,    -1,    -1,    55,     3,    -1,    55,    54,    12,
      -1,     3,    -1,    54,    11,     3,    -1,    18,    -1,    19,
      -1,    15,    -1,    16,    -1,    17,    -1,     3,    13,    60,
      -1,     3,     7,    60,     8,    13,    60,    -1,     3,     5,
      59,     6,    -1,    60,    -1,    58,    11,    60,    -1,    58,
      -1,    -1,    61,    -1,    62,    -1,    61,    22,    62,    -1,
      63,    -1,    62,    23,    63,    -1,    64,    -1,    63,    24,
      64,    -1,    63,    25,    64,    -1,    65,    -1,    64,    26,
      65,    -1,    64,    27,    65,    -1,    64,    28,    65,    -1,
      64,    29,    65,    -1,    66,    -1,    65,    30,    66,    -1,
      65,    31,    66,    -1,    67,    -1,    66,    32,    67,    -1,
      66,    33,    67,    -1,    66,    34,    67,    -1,    14,    -1,
      57,    -1,     3,    -1,     3,     7,    60,     8,    -1,    21,
       3,    -1,    20,    -1,     5,    60,     6,    -1,     9,    69,
      10,    -1,    69,    72,    -1,    -1,    55,    71,    12,    -1,
       3,    -1,    71,    11,     3,    -1,    56,    12,    -1,    57,
      12,    -1,    70,    -1,    68,    -1,    -1,    -1,    35,     5,
      60,     6,    73,    72,    74,    83,    -1,    -1,    -1,    37,
       5,    75,    60,     6,    76,    72,    -1,    -1,    -1,    38,
      77,    72,    37,     5,    60,     6,    78,    12,    -1,    -1,
      -1,    -1,    39,     5,    56,    12,    79,    60,    12,    80,
      56,     6,    81,    72,    -1,    -1,    82,    84,    -1,    36,
      72,    -1,    -1,    40,    12,    -1,    41,    12,    -1,    42,
      60,    12,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   105,   105,   109,   112,   113,   114,   119,   138,   118,
     161,   162,   166,   167,   170,   183,   192,   198,   206,   211,
     211,   211,   211,   214,   228,   259,   283,   286,   293,   294,
     298,   302,   303,   312,   313,   322,   323,   332,   344,   345,
     354,   363,   373,   386,   387,   395,   406,   407,   416,   430,
     446,   460,   461,   482,   539,   558,   566,   570,   574,   575,
     579,   590,   596,   604,   605,   609,   610,   611,   622,   611,
     633,   640,   633,   652,   657,   652,   667,   673,   687,   667,
     696,   696,   700,   701,   705,   708,   711
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "WORD", "NOTOKEN", "LPARENT", "RPARENT",
  "LBRACE", "RBRACE", "LCURLY", "RCURLY", "COMA", "SEMICOLON", "EQUAL",
  "STRING_CONST", "LONG", "LONGSTAR", "VOID", "CHARSTAR", "CHARSTARSTAR",
  "INTEGER_CONST", "AMPERSAND", "OROR", "ANDAND", "EQUALEQUAL", "NOTEQUAL",
  "LESS", "GREAT", "LESSEQUAL", "GREATEQUAL", "PLUS", "MINUS", "TIMES",
  "DIVIDE", "PERCENT", "IF", "ELSE", "WHILE", "DO", "FOR", "CONTINUE",
  "BREAK", "RETURN", "$accept", "goal", "program", "function_or_var_list",
  "function", "$@1", "$@2", "arg_list", "arguments", "arg", "global_var",
  "global_var_list", "var_type", "assignment", "call", "call_arg_list",
  "call_arguments", "expression", "logical_or_expr", "logical_and_expr",
  "equality_expr", "relational_expr", "additive_expr",
  "multiplicative_expr", "primary_expr", "compound_statement",
  "statement_list", "local_var", "local_var_list", "statement", "$@3",
  "$@4", "$@5", "$@6", "$@7", "$@8", "$@9", "$@10", "$@11", "$@12",
  "else_optional", "jump_statement", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    43,    44,    45,    46,    46,    46,    48,    49,    47,
      50,    50,    51,    51,    52,    53,    54,    54,    55,    55,
      55,    55,    55,    56,    56,    57,    58,    58,    59,    59,
      60,    61,    61,    62,    62,    63,    63,    63,    64,    64,
      64,    64,    64,    65,    65,    65,    66,    66,    66,    66,
      67,    67,    67,    67,    67,    67,    67,    68,    69,    69,
      70,    71,    71,    72,    72,    72,    72,    73,    74,    72,
      75,    76,    72,    77,    78,    72,    79,    80,    81,    72,
      82,    72,    83,    83,    84,    84,    84
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     1,     2,     2,     0,     0,     0,     8,
       1,     3,     1,     0,     2,     3,     1,     3,     1,     1,
       1,     1,     1,     3,     6,     4,     1,     3,     1,     0,
       1,     1,     3,     1,     3,     1,     3,     3,     1,     3,
       3,     3,     3,     1,     3,     3,     1,     3,     3,     3,
       1,     1,     1,     4,     2,     1,     3,     3,     2,     0,
       3,     1,     3,     2,     2,     1,     1,     0,     0,     8,
       0,     0,     7,     0,     0,     9,     0,     0,     0,    12,
       0,     2,     2,     0,     2,     2,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       6,     0,     2,     3,     1,    20,    21,    22,    18,    19,
       4,     5,     0,    16,     0,     0,     0,    15,    13,    17,
      12,     0,    10,     0,     0,     8,    14,    11,     0,    59,
       9,    80,     0,    57,     0,     0,    73,     0,     0,     0,
       0,    66,    65,    58,     0,    29,     0,     0,     0,    70,
      80,     0,    61,     0,    63,    64,     0,     0,     0,    81,
      52,     0,    50,    55,     0,    51,    28,     0,    26,    30,
      31,    33,    35,    38,    43,    46,     0,    23,     0,     0,
       0,     0,     0,     0,    60,    84,    85,     0,     0,     0,
      54,     0,    25,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    67,     0,     0,
      76,    62,    86,     0,    56,    27,    32,    34,    36,    37,
      39,    40,    41,    42,    44,    45,    47,    48,    49,     0,
      80,    71,     0,     0,    53,    24,    68,    80,     0,     0,
      83,    72,    74,    77,    80,    69,     0,     0,    82,    75,
       0,    78,    80,    79
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     2,     3,    10,    15,    28,    20,    21,    22,
      11,    14,    38,    39,    65,    66,    67,    68,    69,    70,
      71,    72,    73,    74,    75,    41,    31,    42,    53,    43,
     130,   140,    79,   137,    50,   146,   133,   147,   152,    44,
     145,    59
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -70
static const yytype_int8 yypact[] =
{
     -70,    20,   -70,    43,   -70,   -70,   -70,   -70,   -70,   -70,
     -70,   -70,    -1,    47,    67,    69,    77,   -70,    43,   -70,
      79,    85,   -70,    91,    43,   -70,   -70,   -70,    87,   -70,
     -70,     7,    -2,   -70,    96,    97,   -70,    99,   102,    95,
      98,   -70,   -70,   -70,    -5,    29,    29,    29,    29,   -70,
      38,   105,   -70,    71,   -70,   -70,   100,   103,    29,   -70,
      33,    29,   -70,   -70,   106,   -70,   107,   108,   -70,    89,
      93,   -11,    37,    54,    35,   -70,   109,   -70,   113,    29,
      83,     2,   110,   120,   -70,   -70,   -70,   112,    29,   119,
     -70,    29,   -70,    29,    29,    29,    29,    29,    29,    29,
      29,    29,    29,    29,    29,    29,   114,   -70,   122,   121,
     -70,   -70,   -70,   123,   -70,   -70,    93,   -11,    37,    37,
      54,    54,    54,    54,    35,    35,   -70,   -70,   -70,    29,
      38,   -70,    29,    29,   -70,   -70,   -70,    38,   124,   117,
     101,   -70,   -70,   -70,    38,   -70,   126,   105,   -70,   -70,
     127,   -70,    38,   -70
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -70,   -70,   -70,   -70,   -70,   -70,   -70,   -70,   -70,   111,
     -70,   -70,     9,   -47,   -31,   -70,   -70,   -40,   -70,    39,
      40,    -9,   -69,    -4,   -33,   115,   -70,   -70,   -70,   -49,
     -70,   -70,   -70,   -70,   -70,   -70,   -70,   -70,   -70,   -70,
     -70,   -70
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -8
static const yytype_int16 yytable[] =
{
      40,    80,    13,    45,    82,    46,    76,    77,    78,    46,
      32,    47,    12,    95,    96,    47,    29,    33,    87,    40,
       4,    89,     5,     6,     7,     8,     9,    23,   120,   121,
     122,   123,    60,    23,    61,    56,    57,    58,    45,   108,
      88,    32,    34,    62,    35,    36,    37,    29,   113,    63,
      64,   115,    -7,     5,     6,     7,     8,     9,     5,     6,
       7,     8,     9,    97,    98,    99,   100,   103,   104,   105,
     126,   127,   128,    34,    18,    35,    36,    37,    16,    17,
      19,   136,    83,    84,   101,   102,   118,   119,   141,   135,
      24,    25,   138,   139,    26,   148,    29,   124,   125,    40,
     150,    48,    49,   153,    51,    52,    40,    54,    81,    90,
      55,    93,    85,    40,    92,    86,    94,   106,    91,   107,
     109,    40,   110,   111,   112,   114,   132,   129,   131,   143,
     142,   134,   116,   151,   117,    27,     0,   144,   149,     0,
       0,     0,     0,    30
};

static const yytype_int16 yycheck[] =
{
      31,    50,     3,     5,    51,     7,    46,    47,    48,     7,
       3,    13,     3,    24,    25,    13,     9,    10,    58,    50,
       0,    61,    15,    16,    17,    18,    19,    18,    97,    98,
      99,   100,     3,    24,     5,    40,    41,    42,     5,    79,
       7,     3,    35,    14,    37,    38,    39,     9,    88,    20,
      21,    91,     5,    15,    16,    17,    18,    19,    15,    16,
      17,    18,    19,    26,    27,    28,    29,    32,    33,    34,
     103,   104,   105,    35,     5,    37,    38,    39,    11,    12,
       3,   130,    11,    12,    30,    31,    95,    96,   137,   129,
      11,     6,   132,   133,     3,   144,     9,   101,   102,   130,
     147,     5,     5,   152,     5,     3,   137,    12,     3,     3,
      12,    22,    12,   144,     6,    12,    23,     8,    11,     6,
      37,   152,    12,     3,    12,     6,     5,    13,     6,    12,
       6,     8,    93,     6,    94,    24,    -1,    36,    12,    -1,
      -1,    -1,    -1,    28
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    44,    45,    46,     0,    15,    16,    17,    18,    19,
      47,    53,    55,     3,    54,    48,    11,    12,     5,     3,
      50,    51,    52,    55,    11,     6,     3,    52,    49,     9,
      68,    69,     3,    10,    35,    37,    38,    39,    55,    56,
      57,    68,    70,    72,    82,     5,     7,    13,     5,     5,
      77,     5,     3,    71,    12,    12,    40,    41,    42,    84,
       3,     5,    14,    20,    21,    57,    58,    59,    60,    61,
      62,    63,    64,    65,    66,    67,    60,    60,    60,    75,
      72,     3,    56,    11,    12,    12,    12,    60,     7,    60,
       3,    11,     6,    22,    23,    24,    25,    26,    27,    28,
      29,    30,    31,    32,    33,    34,     8,     6,    60,    37,
      12,     3,    12,    60,     6,    60,    62,    63,    64,    64,
      65,    65,    65,    65,    66,    66,    67,    67,    67,    13,
      73,     6,     5,    79,     8,    60,    72,    76,    60,    60,
      74,    72,     6,    12,    36,    83,    78,    80,    72,    12,
      56,     6,    81,    72
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 7:

/* Line 1464 of yacc.c  */
#line 119 "simple.y"
    {
		 fprintf(fasm, "\t.text\n");
		 fprintf(fasm, ".globl %s\n", (yyvsp[(2) - (2)].string_val));
		 fprintf(fasm, ".type %s, @function\n", (yyvsp[(2) - (2)].string_val));
		 fprintf(fasm, "%s:\n", (yyvsp[(2) - (2)].string_val));

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
    break;

  case 8:

/* Line 1464 of yacc.c  */
#line 138 "simple.y"
    {
			int i;
			fprintf(fasm, "\t# Save arguments\n");
			for (i = 0; i < nlocals; i++) {
				fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n", regArgs[i], 8*i);
			}
		 }
    break;

  case 9:

/* Line 1464 of yacc.c  */
#line 146 "simple.y"
    {
		 fprintf(fasm, "\n\t# move the stack pointer back to where it was\n");
		 fprintf(fasm, "\taddq $%d, %%rsp\n", 8*MAX_LOCALS);

		 fprintf(fasm, "\t# Restore registers\n");
		 fprintf(fasm, "\tpopq %%r15\n");
		 fprintf(fasm, "\tpopq %%r14\n");
		 fprintf(fasm, "\tpopq %%r13\n");
		 fprintf(fasm, "\tpopq %%r10\n");
		 fprintf(fasm, "\tpopq %%rbx\n");
		 fprintf(fasm, "\tret\n", (yyvsp[(2) - (8)].string_val));
         }
    break;

  case 14:

/* Line 1464 of yacc.c  */
#line 170 "simple.y"
    { 
   		local_vars_table[nlocals] = (yyvsp[(2) - (2)].string_val);
		nlocals++;

		if (charstarfound) {
			//printf("%d, %s;\n", charstarfound, $<string_val>2);
			string_vars_table[nstringvars] = (yyvsp[(2) - (2)].string_val);
			nstringvars++;
			charstarfound = 0;
		}
   }
    break;

  case 15:

/* Line 1464 of yacc.c  */
#line 183 "simple.y"
    {
		if (charstarfound) {
			//printf("%d, %s;\n", charstarfound, $<string_val>2);
			string_vars_table[nstringvars] = (yyvsp[(2) - (3)].string_val);
			nstringvars++;
			charstarfound = 0;
		}
		}
    break;

  case 16:

/* Line 1464 of yacc.c  */
#line 192 "simple.y"
    {
			   nglobals += 1;
			   global_vars_table[nglobals] = (yyvsp[(1) - (1)].string_val);
			   fprintf(fasm, "\t.data\n");
			   fprintf(fasm, "\t.comm\t%s, 8, 8  # nGlobals= %d\n", (yyvsp[(1) - (1)].string_val), nglobals);
        }
    break;

  case 17:

/* Line 1464 of yacc.c  */
#line 198 "simple.y"
    {
			   nglobals += 1;
			   global_vars_table[nglobals] = (yyvsp[(3) - (3)].string_val);
			   fprintf(fasm, "\t.data\n");
			   fprintf(fasm, "\t.comm\t%s, 8, 8  # nGlobals= %d\n", (yyvsp[(3) - (3)].string_val), nglobals);
}
    break;

  case 18:

/* Line 1464 of yacc.c  */
#line 206 "simple.y"
    {
			(yyvsp[(0) - (1)].string_val) = "CHARSTAR";
			charstarfound = 1;
			//printf("found a charstar\n");
		}
    break;

  case 23:

/* Line 1464 of yacc.c  */
#line 214 "simple.y"
    {
	 		char * id = (yyvsp[(1) - (3)].string_val);
			int i = lookupLocalVar(id);
			if (i >= 0) {
				fprintf(fasm, "\t#assign to local var %s\n", id);
				fprintf(fasm, "\tmovq %%%s, %d(%%rsp)\n", regStk[top-1], 8*i);
			}
			else {
	 			fprintf(fasm, "\t#assign to global var %s\n", id);
				fprintf(fasm, "\tmovq %%%s, %s\n", regStk[top-1], (yyvsp[(1) - (3)].string_val));
			}
			top--;
			fprintf(fasm, "\t# 1 top-- = %d\n", top);
		}
    break;

  case 24:

/* Line 1464 of yacc.c  */
#line 228 "simple.y"
    {

	 		char * id = (yyvsp[(1) - (6)].string_val);
			int i = lookupLocalVar(id);
			char*  index = (yyvsp[(3) - (6)].string_val);
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
    break;

  case 25:

/* Line 1464 of yacc.c  */
#line 259 "simple.y"
    {
		 char * funcName = (yyvsp[(1) - (4)].string_val);
		 int nargs = (yyvsp[(3) - (4)].nargs);
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
    break;

  case 26:

/* Line 1464 of yacc.c  */
#line 283 "simple.y"
    {
		(yyval.nargs)=1;
	 }
    break;

  case 27:

/* Line 1464 of yacc.c  */
#line 286 "simple.y"
    {
		(yyval.nargs)++;
	 }
    break;

  case 28:

/* Line 1464 of yacc.c  */
#line 293 "simple.y"
    { (yyval.nargs)=(yyvsp[(1) - (1)].nargs); }
    break;

  case 29:

/* Line 1464 of yacc.c  */
#line 294 "simple.y"
    { (yyval.nargs)=0;}
    break;

  case 32:

/* Line 1464 of yacc.c  */
#line 303 "simple.y"
    {
		fprintf(fasm, "\n\t# ||\n");
		fprintf(fasm, "\torq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
		fprintf(fasm, "\t# 4 top-- = %d\n", top);
	}
    break;

  case 34:

/* Line 1464 of yacc.c  */
#line 313 "simple.y"
    {
		fprintf(fasm, "\n\t# &&\n");
		fprintf(fasm, "\tandq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 5 top-- = %d\n", top);
	}
    break;

  case 36:

/* Line 1464 of yacc.c  */
#line 323 "simple.y"
    {
	 	fprintf(fasm, "\n\t# ==\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsete %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 6 top-- = %d\n", top);
	 }
    break;

  case 37:

/* Line 1464 of yacc.c  */
#line 332 "simple.y"
    {
	 	fprintf(fasm, "\n\t# !=\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsetne %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
	 	top--;
			fprintf(fasm, "\t# 7 top-- = %d\n", top);
	 }
    break;

  case 39:

/* Line 1464 of yacc.c  */
#line 345 "simple.y"
    {
	 	fprintf(fasm, "\n\t# <\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsetl %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 8 top-- = %d\n", top);
	 }
    break;

  case 40:

/* Line 1464 of yacc.c  */
#line 354 "simple.y"
    {
	 	fprintf(fasm, "\n\t# >\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		fprintf(fasm, "\tsetg %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 9 top-- = %d\n", top);
	 }
    break;

  case 41:

/* Line 1464 of yacc.c  */
#line 363 "simple.y"
    {
	 	fprintf(fasm, "\n\t# <=\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		//fprintf(fasm, "\tcmovle $1, %%rax\n");
		fprintf(fasm, "\tsetle %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 10 top-- = %d\n", top);
	 }
    break;

  case 42:

/* Line 1464 of yacc.c  */
#line 373 "simple.y"
    {
	 	fprintf(fasm, "\n\t# >=\n");
		fprintf(fasm, "\tmovq $0, %%rax\n");
		fprintf(fasm, "\tcmpq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
		//fprintf(fasm, "\tcmovge $1, %%rax\n");
		fprintf(fasm, "\tsetge %%al\n");
		fprintf(fasm, "\tmov %%rax, %%%s\n", regStk[top-2]);
		top--;
			fprintf(fasm, "\t# 11 top-- = %d\n", top);
	 }
    break;

  case 44:

/* Line 1464 of yacc.c  */
#line 387 "simple.y"
    {
		fprintf(fasm,"\n\t# +\n");
		if (top<=nregStk) {
			fprintf(fasm, "\taddq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 12 top-- = %d\n", top);
		}
	  }
    break;

  case 45:

/* Line 1464 of yacc.c  */
#line 395 "simple.y"
    {
	  	fprintf(fasm, "\n\t# - \n");
		if (top<=nregStk) {
			fprintf(fasm, "\tsubq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 13 top-- = %d\n", top);
		}
	  }
    break;

  case 47:

/* Line 1464 of yacc.c  */
#line 407 "simple.y"
    {
		fprintf(fasm,"\n\t# *\n");
		if (top<=nregStk) {
			fprintf(fasm, "\t# multiplying %s and %s\n", regStk[top-1], regStk[top-2]);
			fprintf(fasm, "\timulq %%%s, %%%s\n", regStk[top-1], regStk[top-2]);
			top--;
			fprintf(fasm, "\t# 14 top-- = %d\n", top);
		}
      }
    break;

  case 48:

/* Line 1464 of yacc.c  */
#line 416 "simple.y"
    {
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
    break;

  case 49:

/* Line 1464 of yacc.c  */
#line 430 "simple.y"
    {
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
    break;

  case 50:

/* Line 1464 of yacc.c  */
#line 446 "simple.y"
    {
		  // Add string to string table.
		  // String table will be produced later
		  string_table[nstrings]=(yyvsp[(1) - (1)].string_val);
		  fprintf(fasm, "\t#top=%d\n", top);
		  fprintf(fasm, "\n\t# push string %s top=%d\n", (yyvsp[(1) - (1)].string_val), top);
		  if (top<nregStk) {
		  	fprintf(fasm, "\tmovq $string%d, %%%s\n", nstrings, regStk[top]);
			//fprintf(fasm, "\tmovq $%s,%%%s\n", $<string_val>1, regStk[top]);
			top++;
		 	fprintf(fasm, "\t# 2 top = %d\n", top);
		  } 
		nstrings++;
	}
    break;

  case 52:

/* Line 1464 of yacc.c  */
#line 461 "simple.y"
    {
		  // check if it is a global variable

		  char * id = (yyvsp[(1) - (1)].string_val);
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
    break;

  case 53:

/* Line 1464 of yacc.c  */
#line 482 "simple.y"
    {

	  	//if we're here, the WORD is an array
	  	fprintf(fasm, "\t# load array %s\n", (yyvsp[(1) - (4)].string_val));
		//the value at regStk[top] is the index we want to load

		//first figure out if array is global or local
		char * id = (yyvsp[(1) - (4)].string_val);
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
    break;

  case 54:

/* Line 1464 of yacc.c  */
#line 539 "simple.y"
    {
		  char * id = (yyvsp[(2) - (2)].string_val);
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
    break;

  case 55:

/* Line 1464 of yacc.c  */
#line 558 "simple.y"
    {
		  fprintf(fasm, "\n\t# push %s heere\n", (yyvsp[(1) - (1)].string_val));
		  if (top<nregStk) {
			fprintf(fasm, "\tmovq $%s,%%%s\n", (yyvsp[(1) - (1)].string_val), regStk[top]);
			top++;
			fprintf(fasm, "\t# 7 top = %d\n", top);
		  }
	  }
    break;

  case 60:

/* Line 1464 of yacc.c  */
#line 579 "simple.y"
    {
			//printf("%d, %s;\n", charstarfound, $<string_val>2);
			if (charstarfound > 0) {
				string_vars_table[nstringvars] = (yyvsp[(2) - (3)].string_val);
				nstringvars++;
				charstarfound = 0;
			}
		}
    break;

  case 61:

/* Line 1464 of yacc.c  */
#line 590 "simple.y"
    {
			//first local variable
			fprintf(fasm, "\t# adding %s to local vars\n", (yyvsp[(1) - (1)].string_val));
			local_vars_table[nlocals]=(yyvsp[(1) - (1)].string_val); 
			nlocals++;
			}
    break;

  case 62:

/* Line 1464 of yacc.c  */
#line 596 "simple.y"
    {
			fprintf(fasm, "\t# adding %s to local vars\n", (yyvsp[(3) - (3)].string_val));
			local_vars_table[nlocals]=(yyvsp[(3) - (3)].string_val);  
			nlocals++;
			}
    break;

  case 64:

/* Line 1464 of yacc.c  */
#line 605 "simple.y"
    {
	 	top --; //because we don't care about the return value of the function
		fprintf(fasm, "# 18 top-- = %d\n", top);
	 }
    break;

  case 67:

/* Line 1464 of yacc.c  */
#line 611 "simple.y"
    {
	 	//expression will leave a 1 or 0 at regStk[top]
		//if this value is 1, we continue and run the code in statement
		//if this value is 0, we jump to else optional
		(yyvsp[(1) - (4)].my_nlabel) = nlabel;
		nlabel++;
		fprintf(fasm, "# if_start_%d:\n", (yyvsp[(1) - (4)].my_nlabel));
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top-1]);
		fprintf(fasm, "\tje else_%d\n", (yyvsp[(1) - (4)].my_nlabel));
		top--;
		fprintf(fasm, "\t# 19 top-- = %d\n", top);
	 }
    break;

  case 68:

/* Line 1464 of yacc.c  */
#line 622 "simple.y"
    {
	 	//we need to jump over the else if the statement was executed
		fprintf(fasm, "\tjmp end_if_%d\n", (yyvsp[(1) - (6)].my_nlabel));

	 	//jump to here if evaluated expression is 0
		fprintf(fasm, "else_%d:\n", (yyvsp[(1) - (6)].my_nlabel));

	 }
    break;

  case 69:

/* Line 1464 of yacc.c  */
#line 629 "simple.y"
    {
	 	//jump to here if evaluated expression is 1, after running statement
		fprintf(fasm, "end_if_%d:\n", (yyvsp[(1) - (8)].my_nlabel));
	 }
    break;

  case 70:

/* Line 1464 of yacc.c  */
#line 633 "simple.y"
    {
		// act 1
		(yyvsp[(1) - (2)].my_nlabel)=nlabel;
		nlabel++;
		fprintf(fasm, "\n# start while loop\n");
		fprintf(fasm, "restart_loop_%d:\n", (yyvsp[(1) - (2)].my_nlabel));
         }
    break;

  case 71:

/* Line 1464 of yacc.c  */
#line 640 "simple.y"
    {
		// act2
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top - 1]);
		fprintf(fasm, "\tje end_loop_%d\n", (yyvsp[(1) - (5)].my_nlabel));
		top--;
		fprintf(fasm, "# 20 top-- = %d\n", top);
         }
    break;

  case 72:

/* Line 1464 of yacc.c  */
#line 647 "simple.y"
    {
		// act3
		fprintf(fasm, "\tjmp restart_loop_%d\n", (yyvsp[(1) - (7)].my_nlabel));
		fprintf(fasm, "end_loop_%d:\n", (yyvsp[(1) - (7)].my_nlabel));
	 }
    break;

  case 73:

/* Line 1464 of yacc.c  */
#line 652 "simple.y"
    { 
		(yyvsp[(1) - (1)].my_nlabel)=nlabel;
		nlabel++;
		fprintf(fasm, "\n# start do while loop\n");
		fprintf(fasm, "restart_loop_%d:\n", (yyvsp[(1) - (1)].my_nlabel));
	 }
    break;

  case 74:

/* Line 1464 of yacc.c  */
#line 657 "simple.y"
    {
	 	//jump back to the start if the expression is not false
		fprintf(fasm, "\tcmpq $0, %%%s\n", regStk[top - 1]);
		fprintf(fasm, "\tjne restart_loop_%d\n", (yyvsp[(1) - (7)].my_nlabel));
		top--;
		fprintf(fasm, "# 21 top-- = %d\n", top);
	 }
    break;

  case 75:

/* Line 1464 of yacc.c  */
#line 663 "simple.y"
    {
	 	fprintf(fasm, "end_loop_%d:\n", (yyvsp[(1) - (9)].my_nlabel));
	 }
    break;

  case 76:

/* Line 1464 of yacc.c  */
#line 667 "simple.y"
    {
	 	//check expression
	 	(yyvsp[(1) - (4)].my_nlabel)=nlabel;
		nlabel++;
		fprintf(fasm, "\n# start for loop\n");
		fprintf(fasm, "check_expression_%d:\n", (yyvsp[(1) - (4)].my_nlabel));
	 }
    break;

  case 77:

/* Line 1464 of yacc.c  */
#line 673 "simple.y"
    {
		//if false, jump to end
		fprintf(fasm, "\tcmpq $0, %%rbx\n");
		fprintf(fasm, "\tje end_loop_%d\n", (yyvsp[(1) - (7)].my_nlabel));
		//else, jump to start of loop statement
		fprintf(fasm, "\tjmp for_start_%d\n", (yyvsp[(1) - (7)].my_nlabel));

		//run statement
		//jump to assignment
		//run assignment
		//jump back to check expression

		fprintf(fasm, "restart_loop_%d:\n", (yyvsp[(1) - (7)].my_nlabel));

	 }
    break;

  case 78:

/* Line 1464 of yacc.c  */
#line 687 "simple.y"
    {
		fprintf(fasm, "\tjmp check_expression_%d\n", (yyvsp[(1) - (10)].my_nlabel));
	 	fprintf(fasm, "for_start_%d:\n", (yyvsp[(1) - (10)].my_nlabel));
		top--;
	 }
    break;

  case 79:

/* Line 1464 of yacc.c  */
#line 691 "simple.y"
    {
	 	fprintf(fasm, "\tjmp restart_loop_%d\n", (yyvsp[(1) - (12)].my_nlabel));
	 	fprintf(fasm, "end_loop_%d:\n", (yyvsp[(1) - (12)].my_nlabel));
		//top--;
	 }
    break;

  case 80:

/* Line 1464 of yacc.c  */
#line 696 "simple.y"
    { loopID = nlabel - 2; }
    break;

  case 84:

/* Line 1464 of yacc.c  */
#line 705 "simple.y"
    {
		fprintf(fasm, "\tjmp restart_loop_%d # continue\n", loopID);
     }
    break;

  case 85:

/* Line 1464 of yacc.c  */
#line 708 "simple.y"
    {
	 	fprintf(fasm, "\tjmp end_loop_%d # break\n", loopID);
	 }
    break;

  case 86:

/* Line 1464 of yacc.c  */
#line 711 "simple.y"
    {
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
    break;



/* Line 1464 of yacc.c  */
#line 2492 "y.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1684 of yacc.c  */
#line 732 "simple.y"



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

