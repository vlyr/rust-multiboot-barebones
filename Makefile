arch ?= x86_64

.PHONY: iso build run

all: iso build 

prepare:
	@mkdir -p build/isofiles/boot/grub

clean:
	@rm -r build

iso: build
	@cp ./grub.cfg ./build/isofiles/boot/grub/grub.cfg
	@cp ./target/$(arch)-none-bodaci/debug/bodaci-rs ./build/isofiles/boot/kernel.bin
	@grub-mkrescue -o build/bodaci-$(arch).iso ./build/isofiles

build: prepare
	@cargo build

run: build
	@qemu-system-x86_64 -cdrom build/bodaci-$(arch).iso
