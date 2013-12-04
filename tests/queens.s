	.data
	.comm	queens, 8, 8  # nGlobals= 1
	.data
	.comm	solid, 8, 8  # nGlobals= 2
	.text
.globl abs
.type abs, @function
abs:
	# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15

	# move the stack pointer for 32 vars of space
	subq $256, %rsp
	# Save arguments
	movq %rdi, 0(%rsp)
	# variable v is at 0 position in the list
	movq 0(%rsp), %rbx # load v from local vars
	# 3 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
# if_start_0:
	cmpq $0, %rbx
	je else_0
	# 19 top-- = 0

	# push -1 heere
	movq $-1,%rbx
	# 7 top = 1
	# variable v is at 0 position in the list
	movq 0(%rsp), %r10 # load v from local vars
	# 3 top = 2

	# *
	# multiplying r10 and rbx
	imulq %r10, %rbx
	# 14 top-- = 1
	# return!
	movq %rbx, %rax	 # jump_statement

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	jmp end_if_0
else_0:
end_if_0:
	# variable v is at 0 position in the list
	movq 0(%rsp), %rbx # load v from local vars
	# 3 top = 1
	# return!
	movq %rbx, %rax	 # jump_statement

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl check
.type check, @function
check:
	# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15

	# move the stack pointer for 32 vars of space
	subq $256, %rsp
	# Save arguments
	movq %rdi, 0(%rsp)
	# adding i to local vars

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_1:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1
	# variable depth is at 0 position in the list
	movq 0(%rsp), %r10 # load depth from local vars
	# 3 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_1
	jmp for_start_1
restart_loop_1:
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 8(%rsp)
	# 1 top-- = 1
	jmp check_expression_1
for_start_1:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1
	# load array queens
	movq queens, %r10 # load value from global var
	# 6 top = 2
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_0
	movq $0, %rbx
char_access_0:
	# variable depth is at 0 position in the list
	movq 0(%rsp), %r10 # load depth from local vars
	# 3 top = 2
	# load array queens
	movq queens, %r13 # load value from global var
	# 6 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_1
	movq $0, %r10
char_access_1:

	# ==
	movq $0, %rax
	cmpq %r10, %rbx
	sete %al
	mov %rax, %rbx
	# 6 top-- = 1
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# load array queens
	movq queens, %r13 # load value from global var
	# 6 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_2
	movq $0, %r10
char_access_2:
	# variable depth is at 0 position in the list
	movq 0(%rsp), %r13 # load depth from local vars
	# 3 top = 3
	# load array queens
	movq queens, %r14 # load value from global var
	# 6 top = 4
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r13
	# 17 top-- = 3
	mov %r13b, %al
	test %al, %al
	jne char_access_3
	movq $0, %r13
char_access_3:

	# - 
	subq %r13, %r10
	# 13 top-- = 2

	# func=abs nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rdi
	call abs
	movq %rax, %r10
	# 1 top = 2
	# variable depth is at 0 position in the list
	movq 0(%rsp), %r13 # load depth from local vars
	# 3 top = 3
	# variable i is at 1 position in the list
	movq 8(%rsp), %r14 # load i from local vars
	# 3 top = 4

	# - 
	subq %r14, %r13
	# 13 top-- = 3

	# ==
	movq $0, %rax
	cmpq %r13, %r10
	sete %al
	mov %rax, %r10
	# 6 top-- = 2

	# ||
	orq %r10, %rbx
	# 4 top-- = 1
# if_start_2:
	cmpq $0, %rbx
	je else_2
	# 19 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# return!
	movq %rbx, %rax	 # jump_statement

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	jmp end_if_2
else_2:
end_if_2:
	jmp restart_loop_1
end_loop_1:

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1
	# return!
	movq %rbx, %rax	 # jump_statement

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl bruteforce
.type bruteforce, @function
bruteforce:
	# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15

	# move the stack pointer for 32 vars of space
	subq $256, %rsp
	# Save arguments
	movq %rdi, 0(%rsp)
	# variable depth is at 0 position in the list
	movq 0(%rsp), %rbx # load depth from local vars
	# 3 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# ==
	movq $0, %rax
	cmpq %r10, %rbx
	sete %al
	mov %rax, %rbx
	# 6 top-- = 1
# if_start_3:
	cmpq $0, %rbx
	je else_3
	# 19 top-- = 0
	# adding i to local vars
	#top=0

	# push string "Solution #%2ld = [ " top=0
	movq $string0, %rbx
	# 2 top = 1
	movq solid, %r10 # load value from global var
	# 4 top = 2

	# func=printf nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	movl $0, %eax # return val for printf
	call printf
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	movq solid, %rbx # load value from global var
	# 4 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to global var solid
	movq %rbx, solid
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_4:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_4
	jmp for_start_4
restart_loop_4:
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 8(%rsp)
	# 1 top-- = 1
	jmp check_expression_4
for_start_4:
	#top=0

	# push string "%ld " top=0
	movq $string1, %rbx
	# 2 top = 1
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# load array queens
	movq queens, %r13 # load value from global var
	# 6 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_4
	movq $0, %r10
char_access_4:

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2

	# func=printf nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	movl $0, %eax # return val for printf
	call printf
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	jmp restart_loop_4
end_loop_4:
	#top=0

	# push string "]\n" top=0
	movq $string2, %rbx
	# 2 top = 1

	# func=printf nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	movl $0, %eax # return val for printf
	call printf
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# return!
	movq %rbx, %rax	 # jump_statement

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	jmp end_if_3
else_3:
end_if_3:
	# adding i to local vars

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_5:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_5
	jmp for_start_5
restart_loop_5:
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 8(%rsp)
	# 1 top-- = 1
	jmp check_expression_5
for_start_5:
	# variable depth is at 0 position in the list
	movq 0(%rsp), %rbx # load depth from local vars
	# 3 top = 1
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2
	#assign to global array queens
	movq queens, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# variable depth is at 0 position in the list
	movq 0(%rsp), %rbx # load depth from local vars
	# 3 top = 1

	# func=check nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call check
	movq %rax, %rbx
	# 1 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# !=
	movq $0, %rax
	cmpq %r10, %rbx
	setne %al
	mov %rax, %rbx
	# 7 top-- = 1
# if_start_6:
	cmpq $0, %rbx
	je else_6
	# 19 top-- = 0
	# variable depth is at 0 position in the list
	movq 0(%rsp), %rbx # load depth from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1

	# func=bruteforce nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call bruteforce
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	jmp end_if_6
else_6:
end_if_6:
	jmp restart_loop_5
end_loop_5:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# return!
	movq %rbx, %rax	 # jump_statement

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
	.text
.globl main
.type main, @function
main:
	# Save registers
	pushq %rbx
	pushq %r10
	pushq %r13
	pushq %r14
	pushq %r15

	# move the stack pointer for 32 vars of space
	subq $256, %rsp
	# Save arguments

	# push 8 heere
	movq $8,%rbx
	# 7 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# *
	# multiplying r10 and rbx
	imulq %r10, %rbx
	# 14 top-- = 1

	# func=malloc nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	# 1 top = 1
	#assign to global var queens
	movq %rbx, queens
	# 1 top-- = 0

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1
	#assign to global var solid
	movq %rbx, solid
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# func=bruteforce nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call bruteforce
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0

	# move the stack pointer back to where it was
	addq $256, %rsp
	# Restore registers
	popq %r15
	popq %r14
	popq %r13
	popq %r10
	popq %rbx
	ret
string0:
	.string "Solution #%2ld = [ "

string1:
	.string "%ld "

string2:
	.string "]\n"

