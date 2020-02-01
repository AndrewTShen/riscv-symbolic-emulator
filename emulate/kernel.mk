KERNEL = kernel

KERNEL_OBJS := \
	kernel/startup.o \
	kernel/traphandler.o \
	kernel/kernelvec.o \
	kernel/kernel.o \
	kernel/math.o \
	kernel/string.o \
	kernel/user.bin.o \

USER_OBJS := \
	kernel/string.o \
	kernel/math.o \
	kernel/user.o \
	kernel/trampoline.o \

$(KERNEL)/%.o: $(KERNEL)/%.c
	@printf "building kernel.elf~n"
	$(CC) $(CFLAGS) -c $< -o $@

$(KERNEL)/%.o: $(KERNEL)/%.s
	$(CC) $(CFLAGS) -c $< -o $@

$(KERNEL)/kernel.elf: $(KERNEL_OBJS) $(KERNEL)/kernel.ld
	@printf "building kernel.elf~n"
	$(CC) $(CFLAGS) -T $(KERNEL)/kernel.ld $(KERNEL_OBJS) -o $@

$(KERNEL)/user.elf: $(USER_OBJS) $(KERNEL)/user.ld
	$(CC) $(CFLAGS) -T $(KERNEL)/user.ld $(USER_OBJS) -o $@

$(KERNEL)/%.bin.o: $(KERNEL)/%.bin
	$(OBJCOPY) -I binary -B riscv -O elf64-littleriscv --rename-section .data=.rodata,contents,alloc,load,readonly,data $< $@ 

$(KERNEL)/%.bin: $(KERNEL)/%.elf
	$(OBJCOPY) -O binary $< $@

$(KERNEL)/%.lst: $(KERNEL)/%.elf
	$(OBJDUMP) $(OBJDUMPFLAGS) $< > $@
