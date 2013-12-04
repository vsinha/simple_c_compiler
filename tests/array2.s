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
	# adding i to local vars

	# push 8 heere
	movq $8,%rbx
	# 7 top = 1

	# push 20 heere
	movq $20,%r10
	# 7 top = 2

	# *
	# multiplying r10 and rbx
	imulq %r10, %rbx
	# 14 top-- = 1

	# func=malloc nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 0
	movq %rbx, %rdi
	call malloc
	movq %rax, %rbx
	# 1 top = 1
	#assign to local var a
	movq %rbx, 0(%rsp)
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_0:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1

	# push 20 heere
	movq $20,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_0
	jmp for_start_0
restart_loop_0:
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 8(%rsp)
	# 1 top-- = 1
	jmp check_expression_0
for_start_0:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1

	# push 3 heere
	movq $3,%r10
	# 7 top = 2
	# variable i is at 1 position in the list
	movq 8(%rsp), %r13 # load i from local vars
	# 3 top = 3

	# *
	# multiplying r13 and r10
	imulq %r13, %r10
	# 14 top-- = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	jmp restart_loop_0
end_loop_0:
	#top=0

	# push string "Ok so far\n" top=0
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

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var i
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_1:
	# variable i is at 1 position in the list
	movq 8(%rsp), %rbx # load i from local vars
	# 3 top = 1

	# push 20 heere
	movq $20,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_1
	jmp for_start_1
restart_loop_1:
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 8(%rsp)
	# 1 top-- = 1
	jmp check_expression_1
for_start_1:
	#top=0

	# push string "%d: %d\n" top=0
	movq $string1, %rbx
	# 2 top = 1
	# variable i is at 1 position in the list
	movq 8(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# variable i is at 1 position in the list
	movq 8(%rsp), %r13 # load i from local vars
	# 3 top = 3
	# load array a
	movq 0(%rsp), %r14 # load a local
	# 5 top = 4
	imulq $8, %r13
	addq %r13, %r14
	movq (%r14), %r13
	# 17 top-- = 3
	mov %r13b, %al
	test %al, %al
	jne char_access_0
	movq $0, %r13
char_access_0:

	# func=printf nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	movl $0, %eax # return val for printf
	call printf
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	jmp restart_loop_1
end_loop_1:

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
	.string "Ok so far\n"

string1:
	.string "%d: %d\n"

