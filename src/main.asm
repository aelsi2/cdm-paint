asect 0
main: ext
on_input_interrupt: ext
on_timer_interrupt: ext
asm_handler1: ext
asm_handler2: ext
asm_handler3: ext
asm_handler4: ext

# IVT
dc main, 0b1000000000000000
dc asm_handler1, 0
dc asm_handler2, 0
dc asm_handler3, 0
dc asm_handler4, 0
dc on_input_interrupt, 0
dc on_timer_interrupt, 0
align 0x80

rsect handlers
asm_handler1>
ldi r0, 0xDED1
pop r1
halt

asm_handler2>
ldi r0, 0xDED2
pop r1
halt

asm_handler3>
ldi r0, 0xDED3
pop r1
halt

asm_handler4>
ldi r0, 0xDED4
pop r1
halt

end.
