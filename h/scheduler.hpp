//
// Created by os on 8/12/22.
//

#ifndef PROBA3_PROJECT_BASE_SCHEDULER_HPP
#define PROBA3_PROJECT_BASE_SCHEDULER_HPP

#include "list.hpp"

//class TCB;
class TCB;

class Scheduler {
private:
    //static List<TCB> readyThreadQueue;
    static List<TCB> readyThreadQueue;

public:
    //static TCB *get();
    static TCB *get();

    //static void put(TCB *tcb);
    static void put(TCB *tcb);
};

#endif //PROBA3_PROJECT_BASE_SCHEDULER_HPP
