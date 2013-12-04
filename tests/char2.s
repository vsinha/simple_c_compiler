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

	# push 20 heere
	movq $20,%rbx
	# 7 top = 1

	# func=malloc nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	# 1 top = 1
	#assign to local var h
	movq %rbx, 0(%rsp)
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 65 heere
	movq $65,%r10
	# 7 top = 2
	#assign to local array h
	movq 0(%rsp), %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1

	# push 66 heere
	movq $66,%r10
	# 7 top = 2
	#assign to local array h
	movq 0(%rsp), %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 2 heere
	movq $2,%rbx
	# 7 top = 1

	# push 67 heere
	movq $67,%r10
	# 7 top = 2
	#assign to local array h
	movq 0(%rsp), %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 3 heere
	movq $3,%rbx
	# 7 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	#assign to local array h
	movq 0(%rsp), %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	#top=0

	# push string "h=%s\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable h is at 0 position in the list
	movq 0(%rsp), %r10 # load h from local vars
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

	# push 20 heere
	movq $20,%rbx
	# 7 top = 1

	# func=malloc nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	# 1 top = 1
	#assign to global var g
	movq %rbx, g
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 68 heere
	movq $68,%r10
	# 7 top = 2
	#assign to global array g
	movq g, %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1

	# push 69 heere
	movq $69,%r10
	# 7 top = 2
	#assign to global array g
	movq g, %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 2 heere
	movq $2,%rbx
	# 7 top = 1

	# push 70 heere
	movq $70,%r10
	# 7 top = 2
	#assign to global array g
	movq g, %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 3 heere
	movq $3,%rbx
	# 7 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	#assign to global array g
	movq g, %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	#top=0

	# push string "g=%s\n" top=0
	movq $string1, %rbx
	# 2 top = 1
	movq g, %r10 # load value from global var
	# 4 top = 2

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
	.string "h=%s\n"

string1:
	.string "g=%s\n"

