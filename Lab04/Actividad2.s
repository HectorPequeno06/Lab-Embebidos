@PROBLEMA 2
@   D. Thiebaut
@   Illustrates how to pass 2 ints by reference
@   to a function that adds them up and returns	
@   the sum in r0.

@ ---------------------------------------
@	Data Section
@ ---------------------------------------
	
.data
.balign 4	
output1: .asciz "your input: %d\n"
output2: .asciz "your input: %d\n"
prompt1: .asciz "Give me the first operand:\n"
prompt2: .asciz "Give me the second operand:\n"
string: .asciz "\n %d + %d = %d\n"
format1: .asciz "%d"
format2: .asciz "%d"
a:	.word	0
b:	.word	0
c:	.word 	0		@ will contain a+b 
	
@ ---------------------------------------
@	Code Section
@ ---------------------------------------
	
.text
.global main
.extern printf
.extern scanf

	
@ ---------------------------------------
@ main: passes 2 ints to sumFunc and prints
@ the resulting value using printf	
main:   push 	{ip, lr}        @ push return address + dummy register for alignment

@ c = a + b

@Prompt First Message
	ldr r0,=prompt1
	bl printf
@Read Input
	ldr r0,=format1
	ldr r1,=a
	bl scanf
@Guardamos valor
	ldr r1,=a
	ldr r4,[r1] @r4 contiene el contenido de a
	
@Prompt Second Message
	ldr r0,=prompt2
	bl printf
@read input
	ldr r0,=format2
	ldr r1,=b
	bl scanf
@GUardamos valor
	ldr r1,=b
	ldr r5,[r1] @r5 contiene el contenido de b

@Calculamos c 
	add r3,r4,r5 @realizamos suma

@Desplegamos resultados
	ldr r0,=string
	ldr r4,=a
	ldr r1,[r4]
	ldr r5,=b
	ldr r2,[r5]

	bl printf


@ return to OS	
        pop 	{ip, pc}        @ pop return address into pc
