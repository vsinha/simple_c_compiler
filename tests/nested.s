	.data
	.comm	h, 8, 8  # nGlobals= 1
	.text
.globl compute
.type compute, @function
compute:
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
	# adding d to local vars

	# push 10 heere
	movq $10,%rbx
	# 7 top = 1
	#assign to local var d
	movq %rbx, 24(%rsp)
	# 1 top-- = 0

	# push 11 heere
	movq $11,%rbx
	# 7 top = 1
	#assign to global var h
	movq %rbx, h
	# 1 top-- = 0

	# push 2 heere
	movq $2,%rbx
	# 7 top = 1
	# variable a is at 0 position in the list
	movq 0(%rsp), %r10 # load a from local vars
	# 3 top = 2

	# *
	# multiplying r10 and rbx
	imulq %r10, %rbx
	# 14 top-- = 1
	# variable a is at 0 position in the list
	movq 0(%rsp), %r10 # load a from local vars
	# 3 top = 2

	# *
	# multiplying r10 and rbx
	imulq %r10, %rbx
	# 14 top-- = 1

	# push 4 heere
	movq $4,%r10
	# 7 top = 2
	# variable b is at 1 position in the list
	movq 8(%rsp), %r13 # load b from local vars
	# 3 top = 3
	# variable c is at 2 position in the list
	movq 16(%rsp), %r14 # load c from local vars
	# 3 top = 4

	# - 
	subq %r14, %r13
	# 13 top-- = 3

	# *
	# multiplying r13 and r10
	imulq %r13, %r10
	# 14 top-- = 2
	# variable d is at 3 position in the list
	movq 24(%rsp), %r13 # load d from local vars
	# 3 top = 3

	# *
	# multiplying r13 and r10
	imulq %r13, %r10
	# 14 top-- = 2

	# - 
	subq %r10, %rbx
	# 13 top-- = 1
	movq h, %r10 # load value from global var
	# 4 top = 2

	# - 
	subq %r10, %rbx
	# 13 top-- = 1
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
	#top=0

	# push string "compute=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# push 2 heere
	movq $2,%r13
	# 7 top = 3

	# push 3 heere
	movq $3,%r14
	# 7 top = 4

	# func=compute nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 3
	movq %r14, %rdx
# 3 top-- = 2
	movq %r13, %rsi
# 3 top-- = 1
	movq %r10, %rdi
	call compute
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
	.string "compute=%d\n"

