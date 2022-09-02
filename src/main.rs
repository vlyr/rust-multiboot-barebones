#![no_std]
#![no_main]

use core::arch::global_asm;
use core::panic::PanicInfo;

// I hope there's a more elegant way to link Rust with Assembly and use a custom linker script
global_asm!(include_str!("multiboot_header.S"));
global_asm!(include_str!("start.S"));

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
unsafe fn kmain() -> ! {
    let addr: *mut u16 = 0xb8000 as *mut _;

    *addr.offset(4) = 0x0F21;

    loop {}
}
