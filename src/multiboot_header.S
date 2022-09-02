.section .multiboot_header
header_start:
    .ALIGN 8
    .LONG 0xE85250D6
    .LONG 0
    .LONG header_end - header_start
    .LONG 0x100000000 - (0xE85250D6 + 0 + (header_end - header_start))

    .ALIGN 8
    .WORD 0
    .WORD 0
    .LONG 8

header_end:
