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

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1
# if_start_0:
	cmpq $0, %rbx
	je else_0
	# 19 top-- = 0
	#top=0

	# push string "OK1\n" top=0
	movq $string0, %rbx
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
	jmp end_if_0
else_0:
end_if_0:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
# if_start_1:
	cmpq $0, %rbx
	je else_1
	# 19 top-- = 0
	#top=0

	# push string "OK2\n" top=0
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
	jmp end_if_1
else_1:
end_if_1:

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1
# if_start_2:
	cmpq $0, %rbx
	je else_2
	# 19 top-- = 0
	#top=0

	# push string "OK3\n" top=0
	movq $string2, %rbx
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
	jmp end_if_2
else_2:
	#top=0

	# push string "OK4\n" top=0
	movq $string3, %rbx
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
end_if_2:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
# if_start_3:
	cmpq $0, %rbx
	je else_3
	# 19 top-- = 0
	#top=0

	# push string "OK5\n" top=0
	movq $string4, %rbx
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
	jmp end_if_3
else_3:
	#top=0

	# push string "OK6\n" top=0
	movq $string5, %rbx
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
end_if_3:
	#top=0

	# push string "OK7\n" top=0
	movq $string6, %rbx
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
	.string "OK1\n"

string1:
	.string "OK2\n"

string2:
	.string "OK3\n"

string3:
	.string "OK4\n"

string4:
	.string "OK5\n"

string5:
	.string "OK6\n"

string6:
	.string "OK7\n"

