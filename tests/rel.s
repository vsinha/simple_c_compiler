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

	# push string "9>8=%d\n" top=0
	movq $string0, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 8 heere
	movq $8,%r13
	# 7 top = 3

	# <
	movq $0, %rax
	cmpq %r13, %r10
	setl %al
	mov %rax, %r10
	# 8 top-- = 2

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

	# push string "8<9=%d\n" top=0
	movq $string1, %rbx
	# 2 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# <
	movq $0, %rax
	cmpq %r13, %r10
	setl %al
	mov %rax, %r10
	# 8 top-- = 2

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

	# push string "9<8=%d\n" top=0
	movq $string2, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 8 heere
	movq $8,%r13
	# 7 top = 3

	# <
	movq $0, %rax
	cmpq %r13, %r10
	setl %al
	mov %rax, %r10
	# 8 top-- = 2

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

	# push string "8<9=%d\n" top=0
	movq $string3, %rbx
	# 2 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# <
	movq $0, %rax
	cmpq %r13, %r10
	setl %al
	mov %rax, %r10
	# 8 top-- = 2

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

	# push string "9>=8=%d\n" top=0
	movq $string4, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 8 heere
	movq $8,%r13
	# 7 top = 3

	# >=
	movq $0, %rax
	cmpq %r13, %r10
	setge %al
	mov %rax, %r10
	# 11 top-- = 2

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

	# push string "8>=9=%d\n" top=0
	movq $string5, %rbx
	# 2 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# >=
	movq $0, %rax
	cmpq %r13, %r10
	setge %al
	mov %rax, %r10
	# 11 top-- = 2

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

	# push string "9>=9=%d\n" top=0
	movq $string6, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# >=
	movq $0, %rax
	cmpq %r13, %r10
	setge %al
	mov %rax, %r10
	# 11 top-- = 2

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

	# push string "9>=9=%d\n" top=0
	movq $string7, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# >=
	movq $0, %rax
	cmpq %r13, %r10
	setge %al
	mov %rax, %r10
	# 11 top-- = 2

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

	# push string "9<=8=%d\n" top=0
	movq $string8, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 8 heere
	movq $8,%r13
	# 7 top = 3

	# <=
	movq $0, %rax
	cmpq %r13, %r10
	setle %al
	mov %rax, %r10
	# 10 top-- = 2

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

	# push string "8<=9=%d\n" top=0
	movq $string9, %rbx
	# 2 top = 1

	# push 8 heere
	movq $8,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# <=
	movq $0, %rax
	cmpq %r13, %r10
	setle %al
	mov %rax, %r10
	# 10 top-- = 2

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

	# push string "9<=9=%d\n" top=0
	movq $string10, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# <=
	movq $0, %rax
	cmpq %r13, %r10
	setle %al
	mov %rax, %r10
	# 10 top-- = 2

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

	# push string "9<=9=%d\n" top=0
	movq $string11, %rbx
	# 2 top = 1

	# push 9 heere
	movq $9,%r10
	# 7 top = 2

	# push 9 heere
	movq $9,%r13
	# 7 top = 3

	# <=
	movq $0, %rax
	cmpq %r13, %r10
	setle %al
	mov %rax, %r10
	# 10 top-- = 2

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
	.string "9>8=%d\n"

string1:
	.string "8<9=%d\n"

string2:
	.string "9<8=%d\n"

string3:
	.string "8<9=%d\n"

string4:
	.string "9>=8=%d\n"

string5:
	.string "8>=9=%d\n"

string6:
	.string "9>=9=%d\n"

string7:
	.string "9>=9=%d\n"

string8:
	.string "9<=8=%d\n"

string9:
	.string "8<=9=%d\n"

string10:
	.string "9<=9=%d\n"

string11:
	.string "9<=9=%d\n"

