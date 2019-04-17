.data
	up_addr: .word 0x840
	down_addr: .word 0x840
	sel_addr: .word 0x840
	back_addr: .word 0x840
	led_addr: .word 0x810
	
.text
.global _start
	_start:
        	br main

	main:
        	br menu1

	menu1:
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 8
		stw r9, 0(r12)
	
        	movia r12, sel_addr
		ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel1

       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu5

        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
		movi r11, 2
        	beq r12, r11, menu2

        	br menu1

	menu2:
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 4
		stw r9, 0(r12)
		
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel2

       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu1

        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu3

        	br menu2
        	
        menu3:
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 12
		stw r9, 0(r12)
		
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel3

       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu2

        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu4

        	br menu3
        	
        menu4:
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 2
		stw r9, 0(r12)
        
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel4

       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu3

        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu5

        	br menu4
        	
        menu5:
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 10
		stw r9, 0(r12)
		
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel5

       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu4

        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu1

        	br menu5

	sel1:
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu1

        	br sel1

	sel2:
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu2

        	br sel2
        	
        sel3:
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu3

        	br sel3
        	
        sel4:
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu4

        	br sel4
        	
        sel5:
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu5

        	br sel5

	end:
        	br end
        	.end
