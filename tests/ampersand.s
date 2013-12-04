	.text
.globl inc
.type inc, @function
inc:
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

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	# load array a
	movq 0(%rsp), %r13 # load a local
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

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

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

	# push 8 heere
	movq $8,%rbx
	# 7 top = 1
	#assign to local var a
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	#top=0

	# push string "a=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable a is at 0 position in the list
	movq 0(%rsp), %r10 # load a from local vars
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
	# variable a is at 0 position in the list
	leaq 0(%rsp), %rbx # load a from local vars
	# 3 top = 1

	# func=inc nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call inc
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	#top=0

	# push string "a=%d\n" top=0
	movq $string1, %rbx
	# 2 top = 1
	# variable a is at 0 position in the list
	movq 0(%rsp), %r10 # load a from local vars
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
	.string "a=%d\n"

string1:
	.string "a=%d\n"

