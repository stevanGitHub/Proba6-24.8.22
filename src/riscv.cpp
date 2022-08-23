//
// Created by os on 8/13/22.
//
#include "printing.hpp"
#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/scauseCode.hpp"
#include "../h/syscallCode.hpp"
#include "../h/memoryAllocator.hpp"
#include "../h/tcb.hpp"

//uint64  timerCounter = 0;

void Riscv::popSppSpie() {
    __asm__ volatile ("csrw sepc, ra"); // ne treba da se vrati u prekidnu posle dispatcha,
                                        // vec odmah posle poziva ove f-je u tgreadWrapper
    __asm__ volatile ("sret"); // sret sig je popovati spp, tj upisati..
}

void Riscv::handleSupervisorTrap() {
    uint64 scause = r_scause();

    uint64 pc;

    uint64 sepc, sstatus;
    thread_t *handle;
    TCB::Body body;
    TCB* tcb;
    void* arg, *stack_space;

    uint64 code, par1, ret;
    void* ptr, *pr;
    MemoryAllocator* mem = MemoryAllocator::getInstance();

    switch (scause) {
        case SOFTW_INTR:  // desio se prekid od tajmera = softw interrupt
             TCB::timeSliceCounter++;
            if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
                uint64 sepc = r_sepc(); uint64 sstatus = r_sstatus();
                TCB::timeSliceCounter = 0; // nit krece da se izvrsava iz pocetka
                TCB::dispatch();
                w_sstatus(sstatus); w_sepc(sepc);
            }
            // ova asihrona promena konteksta ce raditi samo za niti koje su vec napravljane
            __asm__ volatile ("csrc sip, 0x02"); // prekid obradjen
            break;

        case HW_INTR: // Spoljasnji hardverski prekid

            console_handler();

            break;

        case ECALL_USER: // ecall iz korisnickog rezima
           // printString("\nUsao u ecall iz korisnickog rezima\n");

            // dodat deo
            __asm__ volatile ("ld %[code], 10 * 8(fp)" : [code] "=r" (code)); // procita code iz a0 sa steka

            switch (code) {
                case MEM_ALLOC:
                    // printString("\nUsao u MEM_ALLOC\n");

                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (par1) ); // pop a1 from stack

                    //  printString("\n par1: ");
                    //  printInt(par1);
                    //   printString("\n");

                    ptr = (void*)mem->myMalloc(par1);

                    //   printString("Vrednost ptr:");
                    //   printInt((uint64)ptr);
                    //   printString("\n");

                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ptr) ); // store a0 on stack

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                    //   printString("\nIzlazi iz MEM_ALLOC\n");
                    break;

                case MEM_FREE:

                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (pr) ); // pop a1 from stack

                    ret = mem->myFree(pr);

                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                    break;
                case THREAD_CREATE:
                    //  printString("Usao u THREAD_CREATE");

                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (handle) ); // pop a1 from stack
                    __asm__ volatile ("ld %[par1], 12 * 8(fp)" : [par1] "=r" (body) ); // pop a2 from stack
                    __asm__ volatile ("ld %[par1], 13 * 8(fp)" : [par1] "=r" (arg) ); // pop a3 from stack
                    __asm__ volatile ("ld %[stack_space], 14 * 8(fp)" : [stack_space] "=r" (stack_space) ); // pop a4 from stack

                    *handle = TCB::createThread(body, arg, stack_space);
                    if(*handle) ret =  0;
                    else ret = -3;

                    printString("\nhandle: ");
                    printInt((uint64)handle, 16, 0);

                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                    //  printString("\nIzlazi iz THREAD_CREATE\n");

                    break;
                case THREAD_EXIT:

                    sepc = r_sepc() + 4; sstatus = r_sstatus(); // ovo ne treba?

                    TCB::timeSliceCounter = 0;
                    TCB::running->setFinished(true);
                    TCB::dispatch();

                    w_sstatus(sstatus); w_sepc(sepc); // ovo ne treba?

                    break;
                case THREAD_DISPATCH:

                    sepc = r_sepc() + 4; sstatus = r_sstatus();
                    TCB::timeSliceCounter = 0;
                    TCB::dispatch();
                    w_sstatus(sstatus); w_sepc(sepc);

                    break;

                case PUT_THREAD:
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (tcb) ); // pop a1 from stack

                    tcb->putTCBinQueue(tcb);

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                    break;
                case SEM_OPEN:

                    break;
                case SEM_CLOSE:

                    break;
                case SEM_WAIT:

                    break;
                case SEM_SIGNAL:

                    break;
                case TIME_SLEEP:

                    break;
                case GETC:

                    break;
                case PUTC:

                    break;
                default:
                    // interrupt: no; cause code: environment call from S-mode(9) == YIELD
                    uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
                    TCB::timeSliceCounter = 0;
                    TCB::dispatch();
                    w_sstatus(sstatus); w_sepc(sepc);

                    break;

            }

            w_sepc(r_sepc() + 4UL);
            __asm__ volatile ("csrc sip, 0x02");

            break;

        case ECALL_SYST: // ecall iz sistemskog rezima ** ulazice se ovde zbog sys_calla i yielda
        //   __asm__ volatile ("mv %[code], a0" : [code] "=r" (code) );
           __asm__ volatile ("ld %[code], 10 * 8(fp)" : [code] "=r" (code)); // procita code iz a0 sa steka

            switch (code) {
                case MEM_ALLOC:
                   // printString("\nUsao u MEM_ALLOC\n");

                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (par1) ); // pop a1 from stack

                  //  printString("\n par1: ");
                  //  printInt(par1);
                 //   printString("\n");

                    ptr = (void*)mem->myMalloc(par1);

                 //   printString("Vrednost ptr:");
                 //   printInt((uint64)ptr);
                 //   printString("\n");

                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ptr) ); // store a0 on stack

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                 //   printString("\nIzlazi iz MEM_ALLOC\n");
                    break;

                case MEM_FREE:

                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (pr) ); // pop a1 from stack

                    ret = mem->myFree(pr);

                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                    break;
                case THREAD_CREATE:
                  //  printString("Usao u THREAD_CREATE");

                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (handle) ); // pop a1 from stack
                    __asm__ volatile ("ld %[par1], 12 * 8(fp)" : [par1] "=r" (body) ); // pop a2 from stack
                    __asm__ volatile ("ld %[par1], 13 * 8(fp)" : [par1] "=r" (arg) ); // pop a3 from stack
                    __asm__ volatile ("ld %[stack_space], 14 * 8(fp)" : [stack_space] "=r" (stack_space) ); // pop a4 from stack

                    *handle = TCB::createThread(body, arg, stack_space);
                    if(*handle) ret =  0;
                    else ret = -3;

                    printString("\nhandle: ");
                    printInt((uint64)handle, 16, 0);

                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                  //  printString("\nIzlazi iz THREAD_CREATE\n");

                    break;
                case THREAD_EXIT:

                    sepc = r_sepc() + 4; sstatus = r_sstatus(); // ovo ne treba?

                    TCB::timeSliceCounter = 0;
                    TCB::running->setFinished(true);
                    TCB::dispatch();

                    w_sstatus(sstatus); w_sepc(sepc); // ovo ne treba?

                    break;
                case THREAD_DISPATCH:

                    sepc = r_sepc() + 4; sstatus = r_sstatus();
                    TCB::timeSliceCounter = 0;
                    TCB::dispatch();
                    w_sstatus(sstatus); w_sepc(sepc);

                    break;

                case PUT_THREAD:
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (tcb) ); // pop a1 from stack

                    tcb->putTCBinQueue(tcb);

                    w_sepc(r_sepc() + 4UL);
                    __asm__ volatile ("csrc sip, 0x02");

                    break;
                case SEM_OPEN:

                    break;
                case SEM_CLOSE:

                    break;
                case SEM_WAIT:

                    break;
                case SEM_SIGNAL:

                    break;
                case TIME_SLEEP:

                    break;
                case GETC:

                    break;
                case PUTC:

                    break;
                default:
                    // interrupt: no; cause code: environment call from S-mode(9)
                    uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
                    TCB::timeSliceCounter = 0;
                    TCB::dispatch();
                    w_sstatus(sstatus); w_sepc(sepc);

                    break;

            }


            break;
        default:
            // unexpected
            pc = r_sepc();
            printString("\nUnexpected trap cause; value of scause = ");
            printInt(r_scause());

            printString("; \nvalue of sepc(pc) = ");
            printInt(pc);
            printString("; value of sstatus = ");
            printInt(r_sstatus());
            printString("; \nvalue of stval = ");
            printInt(r_stval());
            break;

    }

}


