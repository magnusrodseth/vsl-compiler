.section __TEXT, __cstring
intout: .asciz "%ld "
strout: .asciz "%s "
errout: .asciz "Wrong number of arguments"
string0: 	.asciz "Hello, World!"

.section __DATA, __bss
.align 8

.text
.main:
	pushq %rbp
	movq %rsp, %rbp
	leaq strout(%rip), %rdi
	leaq string0(%rip), %rsi
	call safe_printf
	movq $'\n', %rdi
	call putchar
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret

main:
	pushq %rbp
	movq %rsp, %rbp
	subq $1, %rdi
	cmpq $0, %rdi
	jne ABORT
	call .main
	movq %rax, %rdi
	call exit
ABORT:
	leaq errout(%rip), %rdi
	call puts
	movq $1, %rdi
	call exit
safe_printf:
	pushq %rbp
	movq %rsp, %rbp
	andq $-16, %rsp
	call printf
	movq %rbp, %rsp
	popq %rbp
	ret
.set printf, _printf
.set putchar, _putchar
.set puts, _puts
.set strtol, _strtol
.set exit, _exit
.set _main, main
.global _main
