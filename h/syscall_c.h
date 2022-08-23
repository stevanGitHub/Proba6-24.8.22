//
// Created by os on 8/11/22.
//

#ifndef PROBA3_PROJECT_BASE_SYSCALL_C_H
#define PROBA3_PROJECT_BASE_SYSCALL_C_H

#include "../lib/hw.h"
#include "../h/tcb.hpp"
#include "../h/kSem.hpp"

void* mem_alloc (size_t size);

int mem_free (void*);

//class _thread;

int thread_create (
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

int thread_exit ();

void thread_dispatch (); // ISTO STO I TCB::yield?

void putThread(TCB* tcb);





typedef KSem* sem_t;
int sem_open (
        sem_t* handle,
        unsigned init
);

int sem_close (sem_t handle);

int sem_wait (sem_t id);

int sem_signal (sem_t id);



#endif //PROBA3_PROJECT_BASE_SYSCALL_C_H
