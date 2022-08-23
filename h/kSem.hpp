//
// Created by os on 8/19/22.
//

#ifndef PROBA3_PROJECT_BASE_KSEM_HPP
#define PROBA3_PROJECT_BASE_KSEM_HPP

#include "../h/list.hpp"
#include "../h/tcb.hpp"

class KSem;
typedef KSem* sem_t;

class KSem {
public:
    static KSem* createSem(unsigned int val);

    void signal();

    void wait();

   // int sem_close();

    //int val() const;

  //  void updateTime();

    ~KSem();

    static KSem *getSem();

    //static void put(TCB *tcb);
    static void putSem(KSem *sem);

private:
    KSem(unsigned int val);



    List<TCB> suspendThreadsQueue;

    //static TCB *get();
    TCB *getSuspended();

    //static void put(TCB *tcb);
    void putSuspended(TCB *tcb);

    int val;
};


#endif //PROBA3_PROJECT_BASE_KSEM_HPP
