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

	# push string "((3*4)/2+9-7)%9=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1

	# push 3 heere
	movq $3,%r10
	# 7 top = 2

	# push 4 heere
	movq $4,%r13
	# 7 top = 3

	# *
	# multiplying r13 and r10
	imulq %r13, %r10
	# 14 top-- = 2

	# push 2 heere
	movq $2,%r13
	# 7 top = 3

	# /
	# dividing r13 and r10
	# put divisor in rax
	movq $0, %rdx # clear rdx (will store modulo)
	movq %r10, %rax
	divq %r13
	movq %rax, %r10 # move quotient to top of stackh

	# 15 top-- = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2

	# push 7 heere
	movq $7,%r13
	# 7 top = 3

	# - 
	subq %r13, %r10
	# 13 top-- = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# %
	# dividing r13 and r10
	# put divisor in rax
	movq $0, %rdx # clear rdx (will store modulo)
	movq %r10, %rax
	divq %r13
	movq %rdx, %r10 # move modulo to top of stack

	# 16 top-- = 2

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
	.string "((3*4)/2+9-7)%9=%d\n"

