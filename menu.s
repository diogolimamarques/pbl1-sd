.data
	# Variáveis para controle dos botões. Aqui estão todas como iguais por conta
	# de como o JNiosEmu funciona, mas deixei separadas para facilitar o port para
	# a FPGA 
	
	up_addr: .word 0x840
	down_addr: .word 0x840
	sel_addr: .word 0x840
	back_addr: .word 0x840
	
	# Variáveis para controle dos LEDs. Provavelmente será necessário adicionar uma
	# para cada LED na versão final... 
	
	led_addr: .word 0x810
	
.text
.global _start
	_start:
        	br menu1

	menu1:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr   # Salva o endereço da variável led_addr no registrador R12
		ldwio r12, 0(r12)     # Lê o conteúdo do endereço de memória salvo (encontrando o endereço do GPIO do LED)
 		movi r9, 8            # Adiciona ao R9 o valor correspondente à combinação de LEDs que deverá ser acesa
		stw r9, 0(r12)        # Escreve o valor de R9 na posição de memória do LED
	
		# Lógica de verificar se o botão foi pressionado (Select) [Serve para todos os botões]
        	movia r12, sel_addr   # Salva o endereço da variável do botão (nesse caso sel_addr) no registrador R12
		ldwio r12, 0(r12)     # Lê o conteúdo de R12 (Endereço de memória do GPIO)
        	ldwio r12, 0(r12)     # Lê o conteúdo de R12 (Valor real no endereço do GPIO)
        	movi r11, 4           # Adiciona ao R11 o valor correspondente à combinação de botões que devem ser pressionados
        	beq r12, r11, sel1    # Verifica se o valor do GPIO é igual ao valor de R11 e vai para o próximo estado

		# Lógica de verificar se o botão foi pressionado (Up)
       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu5

		# Lógica de verificar se o botão foi pressionado (Down)
        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
		movi r11, 2
        	beq r12, r11, menu2

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br menu1

	menu2:
		# Lógica de acender o LED específico do estado	
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 4
		stw r9, 0(r12)
		
		# Lógica de verificar se o botão foi pressionado (Select)
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel2

		# Lógica de verificar se o botão foi pressionado (Up)
       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu1

		# Lógica de verificar se o botão foi pressionado (Down)
        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu3

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br menu2
        	
        menu3:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 12
		stw r9, 0(r12)

		# Lógica de verificar se o botão foi pressionado (Select)		
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel3

		# Lógica de verificar se o botão foi pressionado (Up)
       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu2

		# Lógica de verificar se o botão foi pressionado (Down)
        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu4

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br menu3
        	
        menu4:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 2
		stw r9, 0(r12)

		# Lógica de verificar se o botão foi pressionado (Select)        
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel4

		# Lógica de verificar se o botão foi pressionado (Up)
       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu3

		# Lógica de verificar se o botão foi pressionado (Down)
        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu5

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br menu4
        	
        menu5:
		# Lógica de acender o LED específico do estado
		movia r12, led_addr
		ldwio r12, 0(r12)
		movi r9, 10
		stw r9, 0(r12)
		
		# Lógica de verificar se o botão foi pressionado (Select)
        	movia r12, sel_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 4
        	beq r12, r11, sel5

		# Lógica de verificar se o botão foi pressionado (Up)
       		movia r12, up_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 1
        	beq r12, r11, menu4

		# Lógica de verificar se o botão foi pressionado (Down)
        	movia r12, down_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 2
        	beq r12, r11, menu1

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br menu5

	sel1:
		# Lógica de verificar se o botão foi pressionado (Back)
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu1

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br sel1

	sel2:
		# Lógica de verificar se o botão foi pressionado (Back)
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu2

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br sel2
        	
        sel3:
       		# Lógica de verificar se o botão foi pressionado (Back)
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu3

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br sel3
        	
        sel4:
		# Lógica de verificar se o botão foi pressionado (Back)
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu4

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br sel4
        	
        sel5:
       		# Lógica de verificar se o botão foi pressionado (Down)
        	movia r12, back_addr
        	ldwio r12, 0(r12)
        	ldwio r12, 0(r12)
        	movi r11, 8
        	beq r12, r11, menu5

		# Volta para o começo do estado caso nada tenha sido pressionado
        	br sel5

	# Label para encerrar o programa (Não utilizado pois se trata de um loop)
	end:
        	br end
        	.end
