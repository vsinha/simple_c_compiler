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
	# adding x to local vars
	# variable a is at 0 position in the list
	movq 0(%rsp), %rbx # load a from local vars
	# 3 top = 1
	# variable b is at 1 position in the list
	movq 8(%rsp), %r10 # load b from local vars
	# 3 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to local var x
	movq %rbx, 16(%rsp)
	# 1 top-- = 0
	# variable x is at 2 position in the list
	movq 16(%rsp), %rbx # load x from local vars
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
	# adding f to local vars

	# push 5 heere
	movq $5,%rbx
	# 7 top = 1

	# push 6 heere
	movq $6,%r10
	# 7 top = 2

	# func=compute nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call compute
	movq %rax, %rbx
	# 1 top = 1
	#assign to local var f
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	#top=0

	# push string "sum=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable f is at 0 position in the list
	movq 0(%rsp), %r10 # load f from local vars
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

