//
// Created by os on 8/17/22.
//

#ifndef PROBA3_PROJECT_BASE_TCB_HPP
#define PROBA3_PROJECT_BASE_TCB_HPP

#include "../lib/hw.h"
#include "../h/scheduler.hpp"
#include "../h/memoryAllocator.hpp"
#include "../lib/mem.h"



#define THREADS_NUM 64

//  IZLASKOM IZ F-JA WOKRERA NITI SE IMPLICINTNO ZAVRSAVAJU

extern void printString(char const *string);


void *operator new(uint64 n);
void *operator new[](uint64 n);

typedef TCB* thread_t;

class TCB {
public:

    static void dispatch();

    ~TCB() { delete[] stack;
        printString("\nDestructor is executed\n");
    }

    bool isFinished() const { return finished; }

    bool isSuspended() const { return suspended; }

    void setFinished(bool value) { finished = value; }

    void setSuspended(bool value) { suspended = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    // using Body = void (*)();
    using Body = void (*)(void *);

    static TCB *createThread(Body body, void *arg, void* stack_space);

    static TCB *createTCB(Body body, void *arg, void* stack_space);

    void putTCBinQueue(TCB *tcb);

    static void yield();

    static TCB *running;

private:
   // TCB(Body body, uint64 timeSlice);
     TCB(Body body, uint64 timeSlice, void *arg, void* stack_space) :
        body(body)
    {
       this->arg = arg;
       // UMESTO new uint64[STACK_SIZE] -> (uint64*)MemoryAllocator::getInstance()->myMalloc(STACK_SIZE*sizeof(uint64)) RADI
       //stack = body != nullptr ? new uint64[STACK_SIZE] : nullptr;

       //stack = body != nullptr ? (uint64*)__mem_alloc(STACK_SIZE) : nullptr;
       stack = body != nullptr ? (uint64*)stack_space : nullptr;

        //******* new?

        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};

        this->timeSlice = DEFAULT_TIME_SLICE;
        finished = false;
        suspended = false;
       // if (body != nullptr) { Scheduler::put(this); }
    }


    void putInQueue(TCB *tcb){
        if (body != nullptr) { Scheduler::put(this); }
    }

    struct Context {
        uint64 ra;
        uint64 sp;
        // vrv mora se dodati fp
    };

   void* arg;

    Body body;

    uint64 *stack;

    Context context;

    uint64 timeSlice;

    bool finished;

    bool suspended;

    bool ready;

    friend class Riscv;

                                  // mora se napraviti pocetni kontekst niti,
    static void threadWrapper(void* arg);  // ova f-ja ce biti staticka metoda koja ce se
                                  // izvrsavati za svaku novonapravljenu nit

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static uint64 timeSliceCounter;

    //static uint64 constexpr STACK_SIZE = 1024; // imaju datu vec STACK_SIZE

   // static uint64 constexpr STACK_SIZE = DEFAULT_STACK_SIZE;

    //static uint64 constexpr TIME_SLICE = 2;

    static uint64 constexpr TIME_SLICE = DEFAULT_TIME_SLICE;


};



#endif //PROBA3_PROJECT_BASE_TCB_HPP
