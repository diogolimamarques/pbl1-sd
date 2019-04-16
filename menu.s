.data
	var1: .word 2
.text
.global _start
    _start:
        movi r8, 0
        movi r9, 1
        movi r10, 0
        movi r11, 0
        br main

    main:
        br menu1

    menu1:
        mov r12, r10
        bne r12, r0, sel1

        mov r12, r8
        bne r12, r0, menu5

        mov r12, r9
        bne r12, r0, menu2

        br menu1

    menu2:
        mov r12, r10
        bne r12, r0, sel2

        mov r12, r8
        bne r12, r0, menu1

        mov r12, r9
        bne r12, r0, menu3

        br menu2

    menu3:
        mov r12, r10
        bne r12, r0, sel3

        mov r12, r8
        bne r12, r0, menu2

        mov r12, r9
        bne r12, r0, menu4

        br menu3

    menu4:
        mov r12, r10
        bne r12, r0, sel4

        mov r12, r8
        bne r12, r0, menu3

        mov r12, r9
        bne r12, r0, menu5

        br menu4

    menu5:
        mov r12, r10
        bne r12, r0, sel5

        mov r12, r8
        bne r12, r0, menu4

        mov r12, r9
        bne r12, r0, menu1

        br menu5

    sel1:
        mov r12, r11
        bne r12, r0, menu1

        br sel1

    sel2:
        mov r12, r11
        bne r12, r0, menu2

        br sel2

    sel3:
        mov r12, r11
        bne r12, r0, menu3

        br sel3

    sel4:
        mov r12, r11
        bne r12, r0, menu4

        br sel4

    sel5:
        mov r12, r11
        bne r12, r0, menu5

        br sel5

    end:
        br end
        .end
