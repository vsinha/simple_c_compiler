	.data
	.comm	i, 8, 8  # nGlobals= 1
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

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0

# start do while loop
restart_loop_0:
	#top=0

	# push string "i=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	movq i, %r10 # load value from global var
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
	movq i, %rbx # load value from global var
	# 4 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0
	movq i, %rbx # load value from global var
	# 4 top = 1

	# push 11 heere
	movq $11,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	jne restart_loop_0
# 21 top-- = 0
end_loop_0:
	#top=0

	# push string "OK\n" top=0
	movq $string1, %rbx
	# 2 top = 1

	# func=printf nargs=1
	# Move values from reg stack to reg args
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
	.string "i=%d\n"

string1:
	.string "OK\n"

