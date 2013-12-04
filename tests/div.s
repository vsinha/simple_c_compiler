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

	# push string "88/11=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1

	# push 88 heere
	movq $88,%r10
	# 7 top = 2

	# push 11 heere
	movq $11,%r13
	# 7 top = 3

	# /
	# dividing r13 and r10
	# put divisor in rax
	movq $0, %rdx # clear rdx (will store modulo)
	movq %r10, %rax
	divq %r13
	movq %rax, %r10 # move quotient to top of stackh

	# 15 top-- = 2

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

	# push string "83%11=%d\n" top=0
	movq $string1, %rbx
	# 2 top = 1

	# push 83 heere
	movq $83,%r10
	# 7 top = 2

	# push 11 heere
	movq $11,%r13
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
	.string "88/11=%d\n"

string1:
	.string "83%11=%d\n"

