	.text
.globl printArray
.type printArray, @function
printArray:
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
	movq %rdx, 16(%rsp)
	# adding i to local vars
	# variable left is at 1 position in the list
	movq 8(%rsp), %rbx # load left from local vars
	# 3 top = 1
	#assign to local var i
	movq %rbx, 24(%rsp)
	# 1 top-- = 0

# start for loop
check_expression_0:
	# variable i is at 3 position in the list
	movq 24(%rsp), %rbx # load i from local vars
	# 3 top = 1
	# variable right is at 2 position in the list
	movq 16(%rsp), %r10 # load right from local vars
	# 3 top = 2

	# <=
	movq $0, %rax
	cmpq %r10, %rbx
	setle %al
	mov %rax, %rbx
	# 10 top-- = 1
	cmpq $0, %rbx
	je end_loop_0
	jmp for_start_0
restart_loop_0:
	# variable i is at 3 position in the list
	movq 24(%rsp), %r10 # load i from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	#assign to local var i
	movq %r10, 24(%rsp)
	# 1 top-- = 1
	jmp check_expression_0
for_start_0:
	#top=0

	# push string "%d: %s\n" top=0
	movq $string0, %rbx
	# 2 top = 1
	# variable i is at 3 position in the list
	movq 24(%rsp), %r10 # load i from local vars
	# 3 top = 2
	# variable i is at 3 position in the list
	movq 24(%rsp), %r13 # load i from local vars
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
	jmp restart_loop_0
end_loop_0:

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
.globl print
.type print, @function
print:
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
	#top=0

	# push string "==%s==\n" top=0
	movq $string1, %rbx
	# 2 top = 1
	# variable s is at 0 position in the list
	movq 0(%rsp), %r10 # load s from local vars
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
	.text
.globl mystrcmp
.type mystrcmp, @function
mystrcmp:
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
	# load array s1
	movq 0(%rsp), %r10 # load s1 local
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

	# &&
	andq %r10, %rbx
	# 5 top-- = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	# load array s1
	movq 0(%rsp), %r13 # load s1 local
	# 5 top = 3
	imulq $1, %r10
	addq %r10, %r13
	movzx (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_3
	movq $0, %r10
char_access_3:

	# push 0 heere
	movq $0,%r13
	# 7 top = 3
	# load array s2
	movq 8(%rsp), %r14 # load s2 local
	# 5 top = 4
	imulq $1, %r13
	addq %r13, %r14
	movzx (%r14), %r13
	# 17 top-- = 3
	mov %r13b, %al
	test %al, %al
	jne char_access_4
	movq $0, %r13
char_access_4:

	# ==
	movq $0, %rax
	cmpq %r13, %r10
	sete %al
	mov %rax, %r10
	# 6 top-- = 2

	# &&
	andq %r10, %rbx
	# 5 top-- = 1
	cmpq $0, %rbx
	je end_loop_1
# 20 top-- = 0
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
	# load array s1
	movq 0(%rsp), %r10 # load s1 local
	# 5 top = 2
	imulq $1, %rbx
	addq %rbx, %r10
	movzx (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_5
	movq $0, %rbx
char_access_5:

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# ==
	movq $0, %rax
	cmpq %r10, %rbx
	sete %al
	mov %rax, %rbx
	# 6 top-- = 1

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
	jne char_access_6
	movq $0, %r10
char_access_6:

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# ==
	movq $0, %rax
	cmpq %r13, %r10
	sete %al
	mov %rax, %r10
	# 6 top-- = 2

	# &&
	andq %r10, %rbx
	# 5 top-- = 1
# if_start_2:
	cmpq $0, %rbx
	je else_2
	# 19 top-- = 0

	# push 0 heere
	movq $0,%rbx
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
	jmp end_if_2
else_2:
end_if_2:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# load array s1
	movq 0(%rsp), %r10 # load s1 local
	# 5 top = 2
	imulq $1, %rbx
	addq %rbx, %r10
	movzx (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_7
	movq $0, %rbx
char_access_7:

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# ==
	movq $0, %rax
	cmpq %r10, %rbx
	sete %al
	mov %rax, %rbx
	# 6 top-- = 1

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
	jne char_access_8
	movq $0, %r10
char_access_8:

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# !=
	movq $0, %rax
	cmpq %r13, %r10
	setne %al
	mov %rax, %r10
	# 7 top-- = 2

	# &&
	andq %r10, %rbx
	# 5 top-- = 1
# if_start_3:
	cmpq $0, %rbx
	je else_3
	# 19 top-- = 0

	# push -1 heere
	movq $-1,%rbx
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
	jmp end_if_3
else_3:
end_if_3:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# load array s1
	movq 0(%rsp), %r10 # load s1 local
	# 5 top = 2
	imulq $1, %rbx
	addq %rbx, %r10
	movzx (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_9
	movq $0, %rbx
char_access_9:

	# push 0 heere
	movq $0,%r10
	# 7 top = 2

	# !=
	movq $0, %rax
	cmpq %r10, %rbx
	setne %al
	mov %rax, %rbx
	# 7 top-- = 1

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
	jne char_access_10
	movq $0, %r10
char_access_10:

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# ==
	movq $0, %rax
	cmpq %r13, %r10
	sete %al
	mov %rax, %r10
	# 6 top-- = 2

	# &&
	andq %r10, %rbx
	# 5 top-- = 1
# if_start_4:
	cmpq $0, %rbx
	je else_4
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
	jmp end_if_4
else_4:
end_if_4:

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	# load array s1
	movq 0(%rsp), %r10 # load s1 local
	# 5 top = 2
	imulq $1, %rbx
	addq %rbx, %r10
	movzx (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_11
	movq $0, %rbx
char_access_11:

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
	jne char_access_12
	movq $0, %r10
char_access_12:

	# >
	movq $0, %rax
	cmpq %r10, %rbx
	setg %al
	mov %rax, %rbx
	# 9 top-- = 1
# if_start_5:
	cmpq $0, %rbx
	je else_5
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
	jmp end_if_5
else_5:
end_if_5:

	# push -1 heere
	movq $-1,%rbx
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
.globl quicksortsubrange
.type quicksortsubrange, @function
quicksortsubrange:
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
	movq %rdx, 16(%rsp)
	# variable left is at 1 position in the list
	movq 8(%rsp), %rbx # load left from local vars
	# 3 top = 1
	# variable right is at 2 position in the list
	movq 16(%rsp), %r10 # load right from local vars
	# 3 top = 2

	# >=
	movq $0, %rax
	cmpq %r10, %rbx
	setge %al
	mov %rax, %rbx
	# 11 top-- = 1
# if_start_6:
	cmpq $0, %rbx
	je else_6
	# 19 top-- = 0

	# push 0 heere
	movq $0,%rbx
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
	jmp end_if_6
else_6:
end_if_6:
	# adding x to local vars
	# variable right is at 2 position in the list
	movq 16(%rsp), %rbx # load right from local vars
	# 3 top = 1
	# load array a
	movq 0(%rsp), %r10 # load a local
	# 5 top = 2
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_13
	movq $0, %rbx
char_access_13:
	#assign to local var x
	movq %rbx, 24(%rsp)
	# 1 top-- = 0
	# adding l to local vars
	# variable left is at 1 position in the list
	movq 8(%rsp), %rbx # load left from local vars
	# 3 top = 1
	#assign to local var l
	movq %rbx, 32(%rsp)
	# 1 top-- = 0
	# adding g to local vars
	# variable right is at 2 position in the list
	movq 16(%rsp), %rbx # load right from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# - 
	subq %r10, %rbx
	# 13 top-- = 1
	#assign to local var g
	movq %rbx, 40(%rsp)
	# 1 top-- = 0

# start while loop
restart_loop_7:
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	cmpq $0, %rbx
	je end_loop_7
# 20 top-- = 0

# start while loop
restart_loop_8:
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	# variable l is at 4 position in the list
	movq 32(%rsp), %r10 # load l from local vars
	# 3 top = 2
	# load array a
	movq 0(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_14
	movq $0, %r10
char_access_14:
	# variable x is at 3 position in the list
	movq 24(%rsp), %r13 # load x from local vars
	# 3 top = 3

	# func=mystrcmp nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rsi
# 3 top-- = 1
	movq %r10, %rdi
	call mystrcmp
	movq %rax, %r10
	# 1 top = 2

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# <
	movq $0, %rax
	cmpq %r13, %r10
	setl %al
	mov %rax, %r10
	# 8 top-- = 2

	# &&
	andq %r10, %rbx
	# 5 top-- = 1
	cmpq $0, %rbx
	je end_loop_8
# 20 top-- = 0
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# +
	addq %r10, %rbx
	# 12 top-- = 1
	#assign to local var l
	movq %rbx, 32(%rsp)
	# 1 top-- = 0
	jmp restart_loop_8
end_loop_8:

# start while loop
restart_loop_9:
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2
	# load array a
	movq 0(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_15
	movq $0, %r10
char_access_15:
	# variable x is at 3 position in the list
	movq 24(%rsp), %r13 # load x from local vars
	# 3 top = 3

	# func=mystrcmp nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rsi
# 3 top-- = 1
	movq %r10, %rdi
	call mystrcmp
	movq %rax, %r10
	# 1 top = 2

	# push 0 heere
	movq $0,%r13
	# 7 top = 3

	# >=
	movq $0, %rax
	cmpq %r13, %r10
	setge %al
	mov %rax, %r10
	# 11 top-- = 2

	# &&
	andq %r10, %rbx
	# 5 top-- = 1
	cmpq $0, %rbx
	je end_loop_9
# 20 top-- = 0
	# variable g is at 5 position in the list
	movq 40(%rsp), %rbx # load g from local vars
	# 3 top = 1

	# push 1 heere
	movq $1,%r10
	# 7 top = 2

	# - 
	subq %r10, %rbx
	# 13 top-- = 1
	#assign to local var g
	movq %rbx, 40(%rsp)
	# 1 top-- = 0
	jmp restart_loop_9
end_loop_9:
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2

	# <
	movq $0, %rax
	cmpq %r10, %rbx
	setl %al
	mov %rax, %rbx
	# 8 top-- = 1
# if_start_10:
	cmpq $0, %rbx
	je else_10
	# 19 top-- = 0
	# adding tmp to local vars
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# load array a
	movq 0(%rsp), %r10 # load a local
	# 5 top = 2
	imulq $8, %rbx
	addq %rbx, %r10
	movq (%r10), %rbx
	# 17 top-- = 1
	mov %bl, %al
	test %al, %al
	jne char_access_16
	movq $0, %rbx
char_access_16:
	#assign to local var tmp
	movq %rbx, 48(%rsp)
	# 1 top-- = 0
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2
	# load array a
	movq 0(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_17
	movq $0, %r10
char_access_17:
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# variable g is at 5 position in the list
	movq 40(%rsp), %rbx # load g from local vars
	# 3 top = 1
	# variable tmp is at 6 position in the list
	movq 48(%rsp), %r10 # load tmp from local vars
	# 3 top = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	jmp end_if_10
else_10:
end_if_10:
	jmp restart_loop_7
end_loop_7:
	# variable right is at 2 position in the list
	movq 16(%rsp), %rbx # load right from local vars
	# 3 top = 1
	# variable l is at 4 position in the list
	movq 32(%rsp), %r10 # load l from local vars
	# 3 top = 2
	# load array a
	movq 0(%rsp), %r13 # load a local
	# 5 top = 3
	imulq $8, %r10
	addq %r10, %r13
	movq (%r13), %r10
	# 17 top-- = 2
	mov %r10b, %al
	test %al, %al
	jne char_access_18
	movq $0, %r10
char_access_18:
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# variable l is at 4 position in the list
	movq 32(%rsp), %rbx # load l from local vars
	# 3 top = 1
	# variable x is at 3 position in the list
	movq 24(%rsp), %r10 # load x from local vars
	# 3 top = 2
	#assign to local array a
	movq 0(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	# variable a is at 0 position in the list
	movq 0(%rsp), %rbx # load a from local vars
	# 3 top = 1
	# variable left is at 1 position in the list
	movq 8(%rsp), %r10 # load left from local vars
	# 3 top = 2
	# variable l is at 4 position in the list
	movq 32(%rsp), %r13 # load l from local vars
	# 3 top = 3

	# push 1 heere
	movq $1,%r14
	# 7 top = 4

	# - 
	subq %r14, %r13
	# 13 top-- = 3

	# func=quicksortsubrange nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call quicksortsubrange
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	# variable a is at 0 position in the list
	movq 0(%rsp), %rbx # load a from local vars
	# 3 top = 1
	# variable g is at 5 position in the list
	movq 40(%rsp), %r10 # load g from local vars
	# 3 top = 2

	# push 1 heere
	movq $1,%r13
	# 7 top = 3

	# +
	addq %r13, %r10
	# 12 top-- = 2
	# variable right is at 2 position in the list
	movq 16(%rsp), %r13 # load right from local vars
	# 3 top = 3

	# func=quicksortsubrange nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call quicksortsubrange
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
	.text
.globl quicksort
.type quicksort, @function
quicksort:
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
	# variable a is at 0 position in the list
	movq 0(%rsp), %rbx # load a from local vars
	# 3 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	# variable n is at 1 position in the list
	movq 8(%rsp), %r13 # load n from local vars
	# 3 top = 3

	# push 1 heere
	movq $1,%r14
	# 7 top = 4

	# - 
	subq %r14, %r13
	# 13 top-- = 3

	# func=quicksortsubrange nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call quicksortsubrange
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
	# adding n to local vars

	# push 6 heere
	movq $6,%rbx
	# 7 top = 1
	#assign to local var n
	movq %rbx, 0(%rsp)
	# 1 top-- = 0
	# adding a to local vars
	# variable n is at 0 position in the list
	movq 0(%rsp), %rbx # load n from local vars
	# 3 top = 1

	# push 8 heere
	movq $8,%r10
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
	movq %rbx, 8(%rsp)
	# 1 top-- = 0

	# push 0 heere
	movq $0,%rbx
	# 7 top = 1
	#top=1

	# push string "Rachael" top=1
	movq $string2, %r10
	# 2 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 1 heere
	movq $1,%rbx
	# 7 top = 1
	#top=1

	# push string "Monica" top=1
	movq $string3, %r10
	# 2 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 2 heere
	movq $2,%rbx
	# 7 top = 1
	#top=1

	# push string "Phoebe" top=1
	movq $string4, %r10
	# 2 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 3 heere
	movq $3,%rbx
	# 7 top = 1
	#top=1

	# push string "Joey" top=1
	movq $string5, %r10
	# 2 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 4 heere
	movq $4,%rbx
	# 7 top = 1
	#top=1

	# push string "Ross" top=1
	movq $string6, %r10
	# 2 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0

	# push 5 heere
	movq $5,%rbx
	# 7 top = 1
	#top=1

	# push string "Chandler" top=1
	movq $string7, %r10
	# 2 top = 2
	#assign to local array a
	movq 8(%rsp), %r13
	imulq $8, %rbx
	addq %rbx, %r13
	movq %r10, (%r13)
	movq %r13, %rbx
	# 2 top-- = 0
	#top=0

	# push string "-------- Before -------\n" top=0
	movq $string8, %rbx
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
	# variable a is at 1 position in the list
	movq 8(%rsp), %rbx # load a from local vars
	# 3 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	# variable n is at 0 position in the list
	movq 0(%rsp), %r13 # load n from local vars
	# 3 top = 3

	# push 1 heere
	movq $1,%r14
	# 7 top = 4

	# - 
	subq %r14, %r13
	# 13 top-- = 3

	# func=printArray nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call printArray
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	# variable a is at 1 position in the list
	movq 8(%rsp), %rbx # load a from local vars
	# 3 top = 1
	# variable n is at 0 position in the list
	movq 0(%rsp), %r10 # load n from local vars
	# 3 top = 2

	# func=quicksort nargs=2
	# Move values from reg stack to reg args
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call quicksort
	movq %rax, %rbx
	# 1 top = 1
# 18 top-- = 0
	#top=0

	# push string "-------- After -------\n" top=0
	movq $string9, %rbx
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
	# variable a is at 1 position in the list
	movq 8(%rsp), %rbx # load a from local vars
	# 3 top = 1

	# push 0 heere
	movq $0,%r10
	# 7 top = 2
	# variable n is at 0 position in the list
	movq 0(%rsp), %r13 # load n from local vars
	# 3 top = 3

	# push 1 heere
	movq $1,%r14
	# 7 top = 4

	# - 
	subq %r14, %r13
	# 13 top-- = 3

	# func=printArray nargs=3
	# Move values from reg stack to reg args
# 3 top-- = 2
	movq %r13, %rdx
# 3 top-- = 1
	movq %r10, %rsi
# 3 top-- = 0
	movq %rbx, %rdi
	call printArray
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
	.string "%d: %s\n"

string1:
	.string "==%s==\n"

string2:
	.string "Rachael"

string3:
	.string "Monica"

string4:
	.string "Phoebe"

string5:
	.string "Joey"

string6:
	.string "Ross"

string7:
	.string "Chandler"

string8:
	.string "-------- Before -------\n"

string9:
	.string "-------- After -------\n"

