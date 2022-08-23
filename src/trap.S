.extern _ZN5Riscv20handleSupervisorTrapEv # ovo je uvezena f-ja iz .cpp

.global _ZN5Riscv14supervisorTrapEv # napravljena da bude globalna, da bi je videli van ovog fajla
.align 4 # adrese poravnate na 4
.type _ZN5Riscv14supervisorTrapEv, @function

_ZN5Riscv14supervisorTrapEv:
    addi sp, sp, -256

    # push all register x0-x31 to stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _ZN5Riscv20handleSupervisorTrapEv



    # (pop) restore register x0-x31 from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr

    addi sp, sp, 256

    sret