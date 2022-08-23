//
// Created by os on 8/13/22.
//

#ifndef PROBA3_PROJECT_BASE_SYSCALLCODE_HPP
#define PROBA3_PROJECT_BASE_SYSCALLCODE_HPP

#define MEM_ALLOC 0x01
#define MEM_FREE 0x02
#define THREAD_CREATE 0x11
#define THREAD_EXIT 0x12
#define THREAD_DISPATCH 0x13

#define PUT_THREAD 0x14

#define SEM_OPEN 0x21
#define SEM_CLOSE 0x22
#define SEM_WAIT 0x23
#define SEM_SIGNAL 0x24
#define TIME_SLEEP 0x31
#define GETC 0x41
#define PUTC 0x42



#endif //PROBA3_PROJECT_BASE_SYSCALLCODE_HPP
