# Assembly in practice

## Why?

### I always had this curiosity, but I always found little usability for this language, even so I decided to learn

## Registers

| 64-Bit        | 32-Bit      | use |
| ------|-----|-----|
| rax  	| eax  |  Values that are returned from commands in a register	|
| rbx  	| ebx 	| preserved register 	|
| rcx  	| ecx	| Free use 	|
| rdx  	| edx 	| Free use in some commands 	|
| rsp	| esp	| Pointer from a stack 	|
| rbp	| ebp | Record preserved. Store stack poiters (sometimes) 	|
| rdi	| edi | Number of arguments 	|
| rsi	| esi | Past arguments 	|
| r8 to r15 | r8d to r15d | Used in current moves during programming.|

## Comparators

| Comparator  |  Use  |
|-------------|-------|
|     je      | '='   |
|     jg      | '>'   |
|     jge     | '>='  |
|     jl      | '<'   |
|     jle     | '<='  |
|     jne     | '!='  |

> [Course link](https://www.youtube.com/watch?v=JL0P5Jv1oVU)
