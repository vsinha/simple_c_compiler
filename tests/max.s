	.text
.globl max
.type max, @function
max:
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
	movq %rsi, 8(%rsp)
	# adding i to local vars
	# adding m to local vars

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# load array a
	movq 0(%rsp), %r10 # load a local
	# 5 top = 2
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_0
	movq $0, %rbx
char_access_0:
	#assign to local var m
	movq %rbx, 24(%rsp)
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 16(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_0:
	# variable i is at 2 position in the list
	movq 16(%rsp), %rbx # load i from local vars
	# 3 top = 1
	# variable n is at 1 position in the list
	movq 8(%rsp), %r10 # load n from local vars
	# 3 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_0
	jmp for_start_0
restart_loop_0:
	# variable i is at 2 position in the list
	movq 16(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 16(%rsp)
	# 1 top-- = 1
	jmp check_expression_0
for_start_0:
	# variable m is at 3 position in the list
	movq 24(%rsp), %rbx # load m from local vars
	# 3 top = 1
	# variable i is at 2 position in the list
	movq 16(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# load array a
	movq 0(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_1
	movq $0, %r10
char_access_1:

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
# if_start_1:
	cmpq $0, %rbx
	je else_1
	# 19 top-- = 0
	# variable i is at 2 position in the list
	movq 16(%rsp), %rbx # load i from local vars
	# 3 top = 1
	# load array a
	movq 0(%rsp), %r10 # load a local
	# 5 top = 2
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_2
	movq $0, %rbx
char_access_2:
	#assign to local var m
	movq %rbx, 24(%rsp)
	# 1 top-- = 0
	jmp end_if_1
else_1:
end_if_1:
	jmp restart_loop_0
end_loop_0:
	# variable m is at 3 position in the list
	movq 24(%rsp), %rbx # load m from local vars
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
	.data
	.comm	a, 8, 8  # nGlobals= 1
	.data
	.comm	n, 8, 8  # nGlobals= 2
	.data
	.comm	i, 8, 8  # nGlobals= 3
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

	# push 10 heere
	movq $10,%rbx
	# 7 top = 1
	#assign to global var n
	movq %rbx, n
	# 1 top-- = 0

	# push 10 heere
	movq $10,%rbx
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
	#assign to global var a
	movq %rbx, a
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1

	# push 7 heere
	movq $7,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 2 heere
	movq $2,%rbx
	# 7 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 3 heere
	movq $3,%rbx
	# 7 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 4 heere
	movq $4,%rbx
	# 7 top = 1

	# push 11 heere
	movq $11,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 5 heere
	movq $5,%rbx
	# 7 top = 1

	# push 83 heere
	movq $83,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 6 heere
	movq $6,%rbx
	# 7 top = 1

	# push 7 heere
	movq $7,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 7 heere
	movq $7,%rbx
	# 7 top = 1

	# push 13 heere
	movq $13,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 8 heere
	movq $8,%rbx
	# 7 top = 1

	# push 94 heere
	movq $94,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 9 heere
	movq $9,%rbx
	# 7 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2
	#assign to global array a
	movq a, %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0

# start for loop
check_expression_2:
	movq i, %rbx # load value from global var
	# 4 top = 1
	movq n, %r10 # load value from global var
	# 4 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_2
	jmp for_start_2
restart_loop_2:
	movq i, %r10 # load value from global var
	# 4 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to global var i
	movq %r10, i
	# 1 top-- = 1
	jmp check_expression_2
for_start_2:
	#top=0

	# push string "%d: %d\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	movq i, %r10 # load value from global var
	# 4 top = 2
	movq i, %r13 # load value from global var
	# 4 top = 3
	# load array a
	movq a, %r14 # load value from global var
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

	# func=printf nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	movl $0, %eax # return val for printf
	call printf
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	jmp restart_loop_2
end_loop_2:
	#top=0

	# push string "n=%d\n" top=0
	movq $string1, %rbx
	# 2 top = 1
	movq n, %r10 # load value from global var
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
	#top=0

	# push string "max=%d\n" top=0
	movq $string2, %rbx
	# 2 top = 1
	movq a, %r10 # load value from global var
	# 4 top = 2
	movq n, %r13 # load value from global var
	# 4 top = 3

	# func=max nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rsi
# 3 top-- = 1
	movq %r10, %rdi
	call max
	movq %rax, %r10
	# 1 top = 2

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
	.string "%d: %d\n"

string1:
	.string "n=%d\n"

string2:
	.string "max=%d\n"

