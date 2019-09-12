.intel_syntax noprefix

/**
 * syscall calling reg: rdi, rsi, rdx, r10, r8, r9
 * functi  calling reg: rdi, rsi, rdx, rcx, r8, r9
 */

.global _write
_write: /* write(int fd (rdi), const void *buf(rsi), size_t count(rdx)) */
	mov eax, 0x1 /* syscall number */
	// rdi will be set to one to point to stdout
	// rsi will be set to pointer to string
	// rdx will be set to string length
	/**
	 * Since RCX and R10 are the only difference, 
	 * we need to move param from rcx to r10 incase
	 * there was any param set in rcx
	 */
	mov r10, rcx
	syscall
	ret

.global _exit
_exit: /* exit(int status) */
	mov rax, 0x3c /* syscall number 60 */
	syscall
	ret
