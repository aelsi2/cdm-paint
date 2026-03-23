.section .ivt, "a", @progbits

.short main, 0x8000
.short asm_handler1, 0
.short asm_handler2, 0
.short asm_handler3, 0
.short asm_handler4, 0
.short on_input_interrupt, 0
.short on_timer_interrupt, 0

.section .text

asm_handler1:
ldi r0, 0xDED1
pop r1
halt

asm_handler2:
ldi r0, 0xDED2
pop r1
halt

asm_handler3:
ldi r0, 0xDED3
pop r1
halt

asm_handler4:
ldi r0, 0xDED4
pop r1
halt
