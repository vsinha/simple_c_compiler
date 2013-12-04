	.text
.globl mystrlen
.type mystrlen, @function
mystrlen:
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
	# adding l to local vars

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#assign to local var l
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

# start while loop
restart_loop_0:
	# variable l is at 1 position in the list
	movq 8(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# load array s
	movq 0(%rsp), %r10 # load s local
	# 5 top = 2
	imulq $1, %rbx
	addq %rbx, %r10
	movzx (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_0
	movq $0, %rbx
char_access_0:
	cmpq $0, %rbx
	je end_loop_0
# 20 top-- = 0
	# variable l is at 1 position in the list
	movq 8(%rsp), %rbx # load l from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to local var l
	movq %rbx, 8(%rsp)
	# 1 top-- = 0
	jmp restart_loop_0
end_loop_0:
	# variable l is at 1 position in the list
	movq 8(%rsp), %rbx # load l from local vars
	# 3 top = 1
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
.globl mystrcpy
.type mystrcpy, @function
mystrcpy:
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
	movq %rsi, 8(%rsp)

# start while loop
restart_loop_1:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# load array s2
	movq 8(%rsp), %r10 # load s2 local
	# 5 top = 2
	imulq $1, %rbx
	addq %rbx, %r10
	movzx (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_1
	movq $0, %rbx
char_access_1:
	cmpq $0, %rbx
	je end_loop_1
# 20 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	# load array s2
	movq 8(%rsp), %r13 # load s2 local
	# 5 top = 3
	imulq $1, %r10
	addq %r10, %r13
	movzx (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_2
	movq $0, %r10
char_access_2:
	#assign to local array s1
	movq 0(%rsp), %r13
	imulq $1, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# variable s1 is at 0 position in the list
	movq 0(%rsp), %rbx # load s1 from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to local var s1
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	# variable s2 is at 1 position in the list
	movq 8(%rsp), %rbx # load s2 from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to local var s2
	movq %rbx, 8(%rsp)
	# 1 top-- = 0
	jmp restart_loop_1
end_loop_1:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	#assign to local array s1
	movq 0(%rsp), %r13
	imulq $1, %rbx
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

	# push 30 heere
	movq $30,%rbx
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
	# variable h is at 0 position in the list
	movq 0(%rsp), %rbx # load h from local vars
	# 3 top = 1
	#top=1

	# push string "Hello world" top=1
	movq $string0, %r10
	# 2 top = 2

	# func=mystrcpy nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call mystrcpy
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	#top=0

	# push string "h=%s\n" top=0
	movq $string1, %rbx
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
	#top=0

	# push string "l=%d\n" top=0
	movq $string2, %rbx
	# 2 top = 1
	# variable h is at 0 position in the list
	movq 0(%rsp), %r10 # load h from local vars
	# 3 top = 2

	# func=mystrlen nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rdi
	call mystrlen
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

	# push 30 heere
	movq $30,%rbx
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
	movq g, %rbx # load value from global var
	# 4 top = 1
	#top=1

	# push string "This is a great course" top=1
	movq $string3, %r10
	# 2 top = 2

	# func=strcpy nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call strcpy
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	#top=0

	# push string "g=%s\n" top=0
	movq $string4, %rbx
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
	#top=0

	# push string "l=%d\n" top=0
	movq $string5, %rbx
	# 2 top = 1
	movq g, %r10 # load value from global var
	# 4 top = 2

	# func=mystrlen nargs=1
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rdi
	call mystrlen
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
	.string "Hello world"

string1:
	.string "h=%s\n"

string2:
	.string "l=%d\n"

string3:
	.string "This is a great course"

string4:
	.string "g=%s\n"

string5:
	.string "l=%d\n"

