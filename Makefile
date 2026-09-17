all:
	nasm -f bin boot/entry.asm -o boot.bin
	nasm -f bin kernel/kernel.asm -o kernel.bin
	cat boot.bin kernel.bin > os.bin

run:
	qemu-system-x86_64 -drive format=raw,file=os.bin

run-text:
	qemu-system-x86_64 -drive format=raw,file=os.bin -nographic

clean:
	rm -f *.bin
	