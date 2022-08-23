#include "../lib/console.h"
#include "printing.hpp"
#include "../h/list.hpp"
#include "../h/syscall_c.h"
#include "../h/syscallCode.hpp"
#include "../h/riscv.hpp"
#include "../h/memoryAllocator.hpp"
#include "../lib/mem.h"
//#include "../h/workers.hpp"
#include "../h/tcb.hpp"
#include "../h/syscall_cpp.hpp"


/*sem_t sem1;

void p1(void *){
    sem_wait(sem1);

    printString("\nNitA usla");

    TCB::yield();

    //printString("\nNitA ponovo usla");

    sem_signal(sem1);
}

void p2(void *){
    printString("\nNitB nije usla");

    sem_wait(sem1);

    printString("\nNitB usla");

    TCB::yield();
}*/
extern void userMain();

void userWrapperThread(void* arg) {
    userMain();
}

void main() {
    // postavljena adresa prekidne rutine u stvec
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r" (&Riscv::supervisorTrap) );

/*
    thread_t threads[5];
    thread_create(&threads[0], workerBodyA, nullptr);
    TCB::running = threads[0];

    // postavljen bit 1 (SIE) na 1 => omuguceni prekidi
    __asm__ volatile ("csrs sstatus, 0x02");

    thread_create(&threads[1], workerBodyA, nullptr);

    thread_create(&threads[2], workerBodyB, nullptr);
    printString("ThreadB created\n");

    thread_create(&threads[3], workerBodyC, nullptr);
    printString("ThreadC created\n");

    thread_create(&threads[4], workerBodyD, nullptr);
    printString("ThreadD created\n");


    while (!(threads[1]->isFinished() && threads[2]->isFinished() &&
             threads[3]->isFinished() && threads[4]->isFinished())) {
       // TCB::yield();
       thread_dispatch();
    }
    for (auto &thread: threads) { delete thread; }
    printString("Finished\n");
*/


//    printInt((uint64)Riscv::r_sstatus());
//    printString("Sstatus = ");

    // Obavezno postaviti prvo fju main kao pocetnu nit
    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    TCB::running = mainThread;


    volatile thread_t userThread;
    printString("\nuserThread: ");
    printInt((uint64)&userThread, 16, 0);
    if(thread_create((thread_t*)&userThread, userWrapperThread, nullptr) < 0) {
        printString("Greska");
    }


    while(!userThread->isFinished()) {
        thread_dispatch();
    }


/*
    // postavljen bit 1 (SIE) na 1 => omuguceni prekidi
    __asm__ volatile ("csrs sstatus, 0x02");

    testThreadsC();
    */

   // testThreadsCPP();
    // testThreadsC();
    printString("\n Vratio se u main"); // Treba da se vrati u main! Na console treba da pise "Kernel finished"

    //Threads_CPP_API_test();
/*


    if(sem_open(&sem1, 1)) {}

    Thread* t1 = new Thread(p1, nullptr);
    Thread* t2 = new Thread(p2, nullptr);

    t1->start(); t2->start();

    //sem_wait(sem1);https://code-with-me.global.jetbrains.com/nSOVLjqA8sGVbd17C0J6LQ#p=CL&fp=25A6ABE25447327BFE07A9E3EE53AD42521247D8E34CA3C6A9C2E33549EB1D0B

    while(1){
        thread_dispatch();
    }*/



}
