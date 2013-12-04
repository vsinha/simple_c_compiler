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
	# adding l to local vars

	# push 6 heere
	movq $6,%rbx
	# 7 top = 1
	#assign to local var l
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	#top=0

	# push string "l=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable l is at 0 position in the list
	movq 0(%rsp), %r10 # load l from local vars
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
	.string "l=%d\n"

