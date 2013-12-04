	.data
	.comm	g, 8, 8  # nGlobals= 1
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
	# adding h to local vars
	#top=0

	# push string "Hello world" top=0
	movq $string0, %rbx
	# 2 top = 1
	#assign to local var h
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	#top=0

	# push string "h[6]=%c\n" top=0
	movq $string1, %rbx
	# 2 top = 1

	# push 6 heere
	movq $6,%r10
	# 7 top = 2
	# load array h
	movq 0(%rsp), %r13 # load h local
	# 5 top = 3
	imulq $1, %r10
	addq %r10, %r13
	movzx (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_0
	movq $0, %r10
char_access_0:

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

	# push string "This is a great class!!" top=0
	movq $string2, %rbx
	# 2 top = 1
	#assign to global var g
	movq %rbx, g
	# 1 top-- = 0
	#top=0

	# push string "g[11]=%c\n" top=0
	movq $string3, %rbx
	# 2 top = 1

	# push 11 heere
	movq $11,%r10
	# 7 top = 2
	# load array g
	movq g, %r13 # load value from global var
	# 6 top = 3
	imulq $1, %r10
	addq %r10, %r13
	movzx (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_1
	movq $0, %r10
char_access_1:

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
	.string "Hello world"

string1:
	.string "h[6]=%c\n"

string2:
	.string "This is a great class!!"

string3:
	.string "g[11]=%c\n"

