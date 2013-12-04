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

# start for loop
check_expression_0:
	movq i, %rbx # load value from global var
	# 4 top = 1

	# push 15 heere
	movq $15,%r10
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
	movq i, %r10 # load value from global var
	# 4 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to global var i
	movq %r10, i
	# 1 top-- = 1
	jmp check_expression_0
for_start_0:
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

	# push 6 heere
	movq $6,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
# if_start_1:
	cmpq $0, %rbx
	je else_1
	# 19 top-- = 0
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
	jmp restart_loop_0 # continue
	jmp end_if_1
else_1:
end_if_1:
	jmp restart_loop_0
end_loop_0:
	#top=0

	# push string "for i=%d\n" top=0
	movq $string1, %rbx
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

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0

# start while loop
restart_loop_2:
	movq i, %rbx # load value from global var
	# 4 top = 1

	# push 15 heere
	movq $15,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_2
# 20 top-- = 0
	#top=0

	# push string "i=%d\n" top=0
	movq $string2, %rbx
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

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
# if_start_3:
	cmpq $0, %rbx
	je else_3
	# 19 top-- = 0
	movq i, %rbx # load value from global var
	# 4 top = 1

	# push 2 heere
	movq $2,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0
	jmp restart_loop_2 # continue
	jmp end_if_3
else_3:
end_if_3:
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
	jmp restart_loop_2
end_loop_2:
	#top=0

	# push string "while i=%d\n" top=0
	movq $string3, %rbx
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

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0

# start do while loop
restart_loop_4:
	#top=0

	# push string "i=%d\n" top=0
	movq $string4, %rbx
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

	# push 10 heere
	movq $10,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
# if_start_5:
	cmpq $0, %rbx
	je else_5
	# 19 top-- = 0
	movq i, %rbx # load value from global var
	# 4 top = 1

	# push 2 heere
	movq $2,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to global var i
	movq %rbx, i
	# 1 top-- = 0
	jmp restart_loop_4 # continue
	jmp end_if_5
else_5:
end_if_5:
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

	# push 15 heere
	movq $15,%r10
	# 7 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	jne restart_loop_4
# 21 top-- = 0
end_loop_4:
	#top=0

	# push string "do/while i=%d\n" top=0
	movq $string5, %rbx
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
	#top=0

	# push string "OK\n" top=0
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
	.string "i=%d\n"

string1:
	.string "for i=%d\n"

string2:
	.string "i=%d\n"

string3:
	.string "while i=%d\n"

string4:
	.string "i=%d\n"

string5:
	.string "do/while i=%d\n"

string6:
	.string "OK\n"

