//
// Created by os on 8/19/22.
//

#include "../h/kSem.hpp"
#include "../h/tcb.hpp"


KSem *KSem::createSem(unsigned int val) {
    return new KSem(val);
}

KSem::KSem(unsigned int valInit) {
    this->val = valInit;
}

void KSem::wait() {
 /*
    if val<0 then
            begin
    suspend the running process by putting it into the suspended queue of S
    take another process from the ready queue and switch the context to it
    end */
     if (--val < 0) { // block
         TCB::running->setSuspended(true);
         putSuspended(TCB::running);
         TCB::dispatch(); // MOZDA ove treba poziv yielda???
     }
}

void KSem::signal() {
    /*
    val:=val+1;
    if val<=0 then
      begin
        take one process from the suspended queue of S
        and deblock it by putting it into the ready queue
      end */


    if (val++<0) { // deblock
        thread_t temp = getSuspended();
        if(temp) {
            Scheduler::put(temp);
        }
    }
}

void KSem::putSuspended(TCB *tcb) {
    suspendThreadsQueue.addLast(tcb);
}

TCB *KSem::getSuspended() {
    return suspendThreadsQueue.removeFirst();
}
