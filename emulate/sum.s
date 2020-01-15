.section .sum,"ax",%progbits

.global _sum
.type _sum, %function
_sum:
    lui a3, 0x80000
    lui a4, 0x10038
    sd a4, 0x200(a3)


    li a5, -2
    li a6, 3
    blt a5, a6, _add

    li a6, 3
    mret
_add:
    add a6, a5, a7 # adding registers together
    mret
_fallthrough:
    j _fallthrough
.size _sum, .-_sum
