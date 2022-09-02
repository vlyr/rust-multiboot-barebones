
.GLOBAL start
.EXTERN kmain

.section .text
start:
    mov dword ptr [0xb8000], 0x0F21

    jmp kmain
    hlt
