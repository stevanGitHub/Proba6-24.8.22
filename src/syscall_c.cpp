//
// Created by os on 8/11/22.
//
#include "../h/syscall_c.h"

#include "../h/syscallCode.hpp"
#include "../lib/hw.h"
#include "../h/memoryAllocator.hpp"
#include "printing.hpp"
#include "../h/tcb.hpp"
#include "../lib/mem.h"
#include "../h/kSem.hpp"


void* mem_alloc (size_t size){
    // size -> block
    size_t numOfBlock = size / MEM_BLOCK_SIZE + ((size % MEM_BLOCK_SIZE) ? 1 : 0);
//    printString("\nBr blokova u mem_alloc: ");
//    printInt(numOfBlock);
//    uint64 code = MEM_ALLOC;
//    __asm__ volatile ("mv a1, %[numOfBlock]" : : [numOfBlock] "r" (numOfBlock));
//    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
//
//    __asm__ volatile ("ecall");

    MemoryAllocator* mem = MemoryAllocator::getInstance();

    void *ret;

    ret = mem->myMalloc(numOfBlock);
//    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    //  printString("\nVraca se u main");
    return ret;
}

int mem_free (void* ptr) {
    uint64 code = MEM_FREE;
    __asm__ volatile ("mv a1, %[ptr]" : : [ptr] "r" (ptr));
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    return ret;
}

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg) {
    uint64 code = THREAD_CREATE;
//    void *stack_space = __mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    void *stack_space = MemoryAllocator::getInstance()->myMalloc(DEFAULT_STACK_SIZE*sizeof(uint64));

//    printString("\nhandle u thread_create: ");
//    printInt((uint64)handle, 16, 0);

    __asm__ volatile ("mv a4, %[stack_space]" : : [stack_space] "r" (stack_space));
    __asm__ volatile ("mv a3, %[arg]" : : [arg] "r" (arg));
    __asm__ volatile ("mv a2, %[body]" : : [body] "r" (start_routine));
    __asm__ volatile ("mv a1, %[handle]" : : [handle] "r" (handle));
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    return ret;
    /*
    *handle = TCB::createThread(start_routine, arg, stack_space);
    if(*handle) return 0;
    else return -3;
    */
}

int thread_exit () {
    uint64 code = THREAD_EXIT;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));

    __asm__ volatile ("ecall");

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    return ret;
}


void thread_dispatch (){
    uint64 code = THREAD_DISPATCH;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));

    __asm__ volatile ("ecall");
    //TCB::yield();
}

void putThread(TCB* tcb){
    uint64 code = PUT_THREAD;
    __asm__ volatile ("mv a1, %[tcb]" : : [tcb] "r" (tcb));
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));

    __asm__ volatile ("ecall");
}

int sem_open (sem_t* handle, unsigned init){

    *handle = KSem::createSem(init);

    return 0;
}


int sem_close (sem_t handle){

    return 0;
}

int sem_wait (sem_t id){

    id->wait();

    return 0;
}

int sem_signal (sem_t id){

    id->signal();

    return 0;
}

void changeMod() {
    uint64 code = CHANGE_MOD;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));

    __asm__ volatile ("ecall");
}