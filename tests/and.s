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

	# push string "0 && 0 = %d\n" top=0
	movq $string0, %rbx
	# 2 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# &&
	andq %r13, %r10
	# 5 top-- = 2

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

	# push string "0 && 1 = %d\n" top=0
	movq $string1, %rbx
	# 2 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# &&
	andq %r13, %r10
	# 5 top-- = 2

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

	# push string "1 && 0 = %d\n" top=0
	movq $string2, %rbx
	# 2 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# &&
	andq %r13, %r10
	# 5 top-- = 2

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

	# push string "1 && 1 = %d\n" top=0
	movq $string3, %rbx
	# 2 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# &&
	andq %r13, %r10
	# 5 top-- = 2

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
	.string "0 && 0 = %d\n"

string1:
	.string "0 && 1 = %d\n"

string2:
	.string "1 && 0 = %d\n"

string3:
	.string "1 && 1 = %d\n"

