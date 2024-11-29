%include 'in_out.asm'

SECTION .data
msg_func db "Функция: f(x)=4x+3", 0xA, 0
msg_result db "Результат: ", 0

SECTION .text
global _start

_start:
; кол-во аргументов
pop ecx
pop edx
sub ecx, 1
; Инициализация суммы
mov esi, 0

; вывод сообщения
mov eax, msg_func
call sprint

next:
cmp ecx, 0
jz _end
; Извлекаю аргумент со стека
pop eax
; Преобразую аргумент в число
call atoi

; Вычисляю f(x) = 4x + 3
mov ebx, 4
mul ebx
add eax, 3	; Добавляем 3 к нижней части результата

add esi, eax

loop next

_end:
mov eax, msg_result
call sprint
mov eax, esi
call iprintLF
call quit

