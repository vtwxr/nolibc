.intel_syntax noprefix

.global _start
_start:
	xor rbp, rbp /* zero rbp register */
	pop rdi /* get argc */
	mov rsi, rsp /* get pointer to argv */
	call main
