//
// Created by os on 8/20/22.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.h"
#include "../h/riscv.hpp"

Thread::Thread(void (*body)(void *), void *arg) {
    MASK_INTR

    void *stack_space = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);

    myHandle = TCB::createTCB(body, arg, stack_space);

    UMASK_INTR
}

int Thread::start() {
        if(myHandle == nullptr) {

            printString("Usao u start");
            void *stack_space = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
            myHandle = TCB::createTCB(starter, this, stack_space);
            myHandle->TCB::putTCBinQueue(myHandle);
        } else putThread(myHandle);
        return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t) {

    return 0;
}

Thread::~Thread() {
    delete myHandle;
}

Thread::Thread() : myHandle(nullptr) {}

void Thread::starter(void* toStart) {
    //printString("\nSTARTER\n");
    Thread* t = (Thread*)toStart;
    if(t) t->run();
}