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
/*

sem_t agent,mutex,matches,paper,tabacco;
void agentfun(void *arg);
void smoker1(void* arg);
void smoker2(void* arg);
void smoker3(void* arg);
*/

bool finishedP1 = false;
bool finishedP2 = false;

void p1(void *) {
    for(int i  = 0; i < 10; ++i) {
        if(i == 5){
            Thread::dispatch();
        }
        printInt(i, 10, 0);
        printString("\n");
    }
    bool finishedP1 = true;
}

void p2(void *) {
    for(int i  = 10; i > 0; --i) {
        if(i == 5){
            Thread::dispatch();
        }
        printInt(i, 10, 0);
        printString("\n");
    }
    finishedP2 = true;
}

class IzvedenaThread1: public Thread {
//    void workerBodyC(void* arg);
public:
    IzvedenaThread1():Thread() {}

    void run() override {
        p1(nullptr);
    }
};

class IzvedenaThread2: public Thread {
//    void workerBodyC(void* arg);
public:
    IzvedenaThread2():Thread() {}

    void run() override {
        p2(nullptr);
    }
};

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


   // changeMod();
    // Obavezno postaviti prvo fju main kao pocetnu nit
    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    TCB::running = mainThread;


 //   Thread* thr1 = new Thread(p1, nullptr);
//    Thread* thr2 = new Thread(p2, nullptr);
//
 //   thr1->start(); //thr2->start();

    Thread* t1 = new IzvedenaThread1();
//
   t1->start();
//    while(1) {
//        Thread::dispatch();
//    }
    //Thread::dispatch();

    while (!(finishedP1)) {
        Thread::dispatch();
    }


    //  Riscv::mc_sstatus(Riscv::SSTATUS_SPP);

//    thread_t userThread;
//  thread_create(&userThread, userWrapperThread, nullptr);


//   userMain();

//    while(!userThread->isFinished()) {
//        thread_dispatch();
//    }


/*
    // postavljen bit 1 (SIE) na 1 => omuguceni prekidi
    __asm__ volatile ("csrs sstatus, 0x02");

    testThreadsC();
    */

  // printString("\n Vratio se u main\n"); // Treba da se vrati u main! Na console treba da pise "Kernel finished"
/*


    if(sem_open(&sem1, 1)) {}

    Thread* t1 = new Thread(p1, nullptr);
    Thread* t2 = new Thread(p2, nullptr);

    t1->start(); t2->start();

    //sem_wait(sem1);https://code-with-me.global.jetbrains.com/nSOVLjqA8sGVbd17C0J6LQ#p=CL&fp=25A6ABE25447327BFE07A9E3EE53AD42521247D8E34CA3C6A9C2E33549EB1D0B

    while(1){
        thread_dispatch();
    }*/


/*    sem_open(&mutex,1);
    sem_open(&paper,0);
    sem_open(&matches,0);
    sem_open(&agent,0);
    sem_open(&tabacco,0);

    thread_t t= nullptr;
    thread_t t1= nullptr;
    thread_t t2= nullptr;
    thread_t t3= nullptr;

    thread_create(&t, agentfun, nullptr);
    thread_create(&t1, smoker1, nullptr);
    thread_create(&t2, smoker2, nullptr);
    thread_create(&t3, smoker3, nullptr);

    for (int i = 0; i < 31; ++i) {
        thread_dispatch();
    }*/


}


/*

void agentfun(void *args){
    int i=0;
    while (true){
        sem_wait(mutex);
        switch (i%3) {
            case 0:
                printString("Na stolu su: duvan i papir\n");
                sem_signal(matches);
                break;
            case 1:
                printString("Na stolu su: duvan i sibice\n");
                sem_signal(paper);
                break;
            case 2:
                printString("Na stolu su: sibice i papir\n");
                sem_signal(tabacco);
                break;
        }
        i++;
        sem_signal(mutex);
        sem_wait(agent);
    }
}

void smoker1(void *arg){
    while (true){
        sem_wait(paper);
        sem_wait(mutex);

        printString("Pera ima papir i pusi\n");
        sem_signal(agent);
        sem_signal(mutex);
    }
}

void smoker2(void *arg){
    while (true){
        sem_wait(matches);
        sem_wait(mutex);

        printString("Mika ima sibice i pusi\n");
        sem_signal(agent);
        sem_signal(mutex);
    }
}

void smoker3(void *arg){
    while (true){
        sem_wait(tabacco);
        sem_wait(mutex);
        printString("Zika ima duvan i pusi\n");
        sem_signal(agent);
        sem_signal(mutex);
    }
}*/
