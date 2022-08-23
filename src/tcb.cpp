//
// Created by os on 8/17/22.
//

#include "../h/tcb.hpp"
#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/memoryAllocator.hpp"
#include "../h/syscall_c.h"
//
//void *operator new(uint64 n) { return __mem_alloc(n); }
//void *operator new[](uint64 n) { return __mem_alloc(n); }
//
//void operator delete(void *p) noexcept { __mem_free(p); }
//void operator delete[](void *p) noexcept { __mem_free(p); }

/*

void *operator new(uint64 n) { return MemoryAllocator::getInstance()->myMalloc(n); }
void *operator new[](uint64 n) { return MemoryAllocator::getInstance()->myMalloc(n); }

void operator delete(void *p) noexcept { MemoryAllocator::getInstance()->myFree(p); }
void operator delete[](void *p) noexcept { MemoryAllocator::getInstance()->myFree(p); }
*/

void *operator new(uint64 n) { return mem_alloc(n); }
void *operator new[](uint64 n) { return mem_alloc(n); }

void operator delete(void *p) noexcept { mem_free(p); }
void operator delete[](void *p) noexcept { mem_free(p); }


TCB *TCB::running = nullptr;


uint64 TCB::timeSliceCounter = 0;


TCB *TCB::createFromStart(TCB::Body body) {
    void *stack_space = MemoryAllocator::getInstance()->myMalloc(DEFAULT_STACK_SIZE*sizeof(uint64));
    void *arg = nullptr;
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    return ret;
}

TCB *TCB::createTCB(TCB::Body body, void *arg, void *stack_space) {
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    return ret;
}

void TCB::putTCBinQueue(TCB *tcb) {
    tcb->putInQueue(tcb);
}

TCB *TCB::createThread(Body body, void *arg, void* stack_space) {
//    return (TCB*)MemoryAllocator::getInstance()->myMalloc(sizeof)
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    ret->putInQueue(ret);
    return ret;
}

void TCB::yield() { __asm__ volatile ("ecall"); }

void TCB::dispatch() {
    TCB *old = running;
   // TCB::Context oldContext  = {old->context.ra, old->context.sp};
   //TCB::Context oldCont = old->context; // mozda treba da bude globalna var
    if (!old->isFinished() && !old->isSuspended()) { Scheduler::put(old); }
    else if(old->isFinished()) {
        // delete?
        delete old;
    }
    running = Scheduler::get();

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper(void *arg) {
    // Mozda ovde treba ubaciti run, vrv ne
    // Ovo clear-uje SPP registar (SPP = 0 -> korisnicki rezim)
    //Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    Riscv::popSppSpie();
    running->body(arg);
    running->setFinished(true);
    TCB::yield();
}


