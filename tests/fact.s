	.text
.globl fact
.type fact, @function
fact:
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
	# variable n is at 0 position in the list
	movq 0(%rsp), %rbx # load n from local vars
	# 3 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# ==
	movq $0, %rax
	cmpq %r10, %rbx
	sete %al
	mov %rax, %rbx
	# 6 top-- = 1
# if_start_0:
	cmpq $0, %rbx
	je else_0
	# 19 top-- = 0

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
	jmp end_if_0
else_0:
end_if_0:
	# variable n is at 0 position in the list
	movq 0(%rsp), %rbx # load n from local vars
	# 3 top = 1
	# variable n is at 0 position in the list
	movq 0(%rsp), %r10 # load n from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# - 
	subq %r13, %r10
	# 13 top-- = 2

	# func=fact nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rdi
	call fact
	movq %rax, %r10
	# 1 top = 2

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

	# push string " Factorial of 5 = %d\n" top=0
	movq $string0, %rbx
	# 2 top = 1

	# push 5 heere
	movq $5,%r10
	# 7 top = 2

	# func=fact nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rdi
	call fact
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
	.string " Factorial of 5 = %d\n"

