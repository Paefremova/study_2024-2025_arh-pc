%include 'in_out.asm'

SECTION .data
msg db "Результат: ",0

SECTION .text
global _start

_start:

pop ecx  ; Количество аргументов
pop edx  ; Имя программы
sub ecx, 1 ; Количество аргументов без имени программы

mov esi, 1 ; Инициализация произведения (нейтральный элемент)

next:
cmp ecx, 0h
jz _end

pop eax ; Извлекаем аргумент со стека
call atoi ; Преобразуем в число
mul esi ; Умножаем текущее произведение на новый аргумент (результат в edx:eax)
mov esi, eax ; Сохраняем нижнюю часть результата в esi

loop next

_end:
mov eax, msg
call sprint
mov eax, esi
call iprintLF
call quit
