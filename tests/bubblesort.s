	.text
.globl mysort
.type mysort, @function
mysort:
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
	# adding j to local vars
	# adding tmp to local vars
	# variable n is at 0 position in the list
	movq 0(%rsp), %rbx # load n from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# - 
	subq %r10, %rbx
	# 13 top-- = 1
	#assign to local var i
	movq %rbx, 16(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_0:
	# variable i is at 2 position in the list
	movq 16(%rsp), %rbx # load i from local vars
	# 3 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# >
	movq $0, %rax
	cmpq %r10, %rbx
	setg %al
	mov %rax, %rbx
	# 9 top-- = 1
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

	# - 
	subq %r13, %r10
	# 13 top-- = 2
	#assign to local var i
	movq %r10, 16(%rsp)
	# 1 top-- = 1
	jmp check_expression_0
for_start_0:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var j
	movq %rbx, 24(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_1:
	# variable j is at 3 position in the list
	movq 24(%rsp), %rbx # load j from local vars
	# 3 top = 1
	# variable i is at 2 position in the list
	movq 16(%rsp), %r10 # load i from local vars
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
	# variable j is at 3 position in the list
	movq 24(%rsp), %r10 # load j from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var j
	movq %r10, 24(%rsp)
	# 1 top-- = 1
	jmp check_expression_1
for_start_1:
	# variable j is at 3 position in the list
	movq 24(%rsp), %rbx # load j from local vars
	# 3 top = 1
	# load array a
	movq 8(%rsp), %r10 # load a local
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
	# variable j is at 3 position in the list
	movq 24(%rsp), %r10 # load j from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	# load array a
	movq 8(%rsp), %r13 # load a local
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

	# >
	movq $0, %rax
	cmpq %r10, %rbx
	setg %al
	mov %rax, %rbx
	# 9 top-- = 1
# if_start_2:
	cmpq $0, %rbx
	je else_2
	# 19 top-- = 0
	# variable j is at 3 position in the list
	movq 24(%rsp), %rbx # load j from local vars
	# 3 top = 1
	# load array a
	movq 8(%rsp), %r10 # load a local
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
	#assign to local var tmp
	movq %rbx, 32(%rsp)
	# 1 top-- = 0
	# variable j is at 3 position in the list
	movq 24(%rsp), %rbx # load j from local vars
	# 3 top = 1
	# variable j is at 3 position in the list
	movq 24(%rsp), %r10 # load j from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	# load array a
	movq 8(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_3
	movq $0, %r10
char_access_3:
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# variable j is at 3 position in the list
	movq 24(%rsp), %rbx # load j from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	# variable tmp is at 4 position in the list
	movq 32(%rsp), %r10 # load tmp from local vars
	# 3 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	jmp end_if_2
else_2:
end_if_2:
	jmp restart_loop_1
end_loop_1:
	jmp restart_loop_0
end_loop_0:

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
.globl printArray
.type printArray, @function
printArray:
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
	movq %rdx, 16(%rsp)
	# adding i to local vars
	#top=0

	# push string "----------- %s -----------\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable s is at 0 position in the list
	movq 0(%rsp), %r10 # load s from local vars
	# 3 top = 2

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

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 24(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_3:
	# variable i is at 3 position in the list
	movq 24(%rsp), %rbx # load i from local vars
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
	je end_loop_3
	jmp for_start_3
restart_loop_3:
	# variable i is at 3 position in the list
	movq 24(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 24(%rsp)
	# 1 top-- = 1
	jmp check_expression_3
for_start_3:
	#top=0

	# push string "%d\n" top=0
	movq $string1, %rbx
	# 2 top = 1
	# variable i is at 3 position in the list
	movq 24(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# load array a
	movq 16(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_4
	movq $0, %r10
char_access_4:

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
	jmp restart_loop_3
end_loop_3:

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
	# adding n to local vars

	# push 10 heere
	movq $10,%rbx
	# 7 top = 1
	#assign to local var n
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	# adding a to local vars
	# variable n is at 0 position in the list
	movq 0(%rsp), %rbx # load n from local vars
	# 3 top = 1

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
	#assign to local var a
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
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
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	#top=0

	# push string "Before" top=0
	movq $string2, %rbx
	# 2 top = 1
	# variable n is at 0 position in the list
	movq 0(%rsp), %r10 # load n from local vars
	# 3 top = 2
	# variable a is at 1 position in the list
	movq 8(%rsp), %r13 # load a from local vars
	# 3 top = 3

	# func=printArray nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call printArray
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	# variable n is at 0 position in the list
	movq 0(%rsp), %rbx # load n from local vars
	# 3 top = 1
	# variable a is at 1 position in the list
	movq 8(%rsp), %r10 # load a from local vars
	# 3 top = 2

	# func=mysort nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call mysort
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	#top=0

	# push string "After" top=0
	movq $string3, %rbx
	# 2 top = 1
	# variable n is at 0 position in the list
	movq 0(%rsp), %r10 # load n from local vars
	# 3 top = 2
	# variable a is at 1 position in the list
	movq 8(%rsp), %r13 # load a from local vars
	# 3 top = 3

	# func=printArray nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call printArray
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
	.string "----------- %s -----------\n"

string1:
	.string "%d\n"

string2:
	.string "Before"

string3:
	.string "After"

