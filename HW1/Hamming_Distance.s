.data
str: .string "The Hamming Distance is "

.text
# main funciton
main:
        addi    sp, sp, -12
        sw      ra, 8(sp)
        sw      s0, 4(sp)
        sw      s1, 0(sp)
        addi    s0, zero, 1  # x = 1
        addi    s1, zero, 4  # y = 4
        mv      a0, s0       # a0 = x
        mv      a1, s1       # a1 = y
        jal     ra, hammingDistance
        jal     ra, printResult
        lw      s0, 0(s0)
        lw      s1, 4(sp)
        lw      ra, 8(sp)
        addi    sp, sp, 12
        li      a7, 10
        ecall

# print function
printResult:
        addi    sp, sp, -4
        sw      ra, 0(sp)
        mv      t0, a0
        la      a0, str
        li      a7, 4
        ecall
        mv      a0, t0
        li      a7, 1
        ecall
        lw      ra, 0(sp)
        addi    sp, sp, 4
        ret

# hammingDistance function
hammingDistance:
        addi    sp, sp, -12
        sw      ra, 8(sp)
        sw      s0, 4(sp)
        sw      s1, 0(sp)
        xor     s0, a0, a1      # s0 = cmpResult
        mv      s1, zero        # s1 = dis
while:
        beq     s0, zero, return
isOdd:
        andi    t0, s0, 1       # cmpResult & 1
        beq     t0, zero, shiftRightOne
        addi    s1, s1, 1       # ++dis
shiftRightOne:
        srai    s0, s0, 1
        j       while
return:
        mv      a0, a1
        lw      s0, 0(s0)
        lw      s1, 4(sp)
        lw      ra, 8(sp)
        addi    sp, sp, 12
        ret
