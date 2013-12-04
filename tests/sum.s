	.text
.globl sum
.type sum, @function
sum:
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
	# adding s to local vars

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var s
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
	# variable n is at 0 position in the list
	movq 0(%rsp), %r10 # load n from local vars
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
	# variable s is at 3 position in the list
	movq 24(%rsp), %rbx # load s from local vars
	# 3 top = 1
	# variable i is at 2 position in the list
	movq 16(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# load array a
	movq 8(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_0
	movq $0, %r10
char_access_0:

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to local var s
	movq %rbx, 24(%rsp)
	# 1 top-- = 0
	jmp restart_loop_0
end_loop_0:
	# variable s is at 3 position in the list
	movq 24(%rsp), %rbx # load s from local vars
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
	# adding a to local vars

	# push 5 heere
	movq $5,%rbx
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
	#assign to local var a
	movq %rbx, 0(%rsp)
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 4 heere
	movq $4,%r10
	# 7 top = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1

	# push 3 heere
	movq $3,%r10
	# 7 top = 2
	#assign to local array a
	movq 0(%rsp), %r13
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
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 3 heere
	movq $3,%rbx
	# 7 top = 1

	# push 7 heere
	movq $7,%r10
	# 7 top = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 4 heere
	movq $4,%rbx
	# 7 top = 1

	# push 6 heere
	movq $6,%r10
	# 7 top = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# adding s to local vars

	# push 5 heere
	movq $5,%rbx
	# 7 top = 1
	# variable a is at 0 position in the list
	movq 0(%rsp), %r10 # load a from local vars
	# 3 top = 2

	# func=sum nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call sum
	movq %rax, %rbx
	# 1 top = 1
	#assign to local var s
	movq %rbx, 8(%rsp)
	# 1 top-- = 0
	#top=0

	# push string "sum=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable s is at 1 position in the list
	movq 8(%rsp), %r10 # load s from local vars
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
	.string "sum=%d\n"

