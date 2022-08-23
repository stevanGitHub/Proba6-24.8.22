//
// Created by os on 8/14/22.
//

#ifndef PROBA3_PROJECT_BASE_MEMORYALLOCATOR_HPP
#define PROBA3_PROJECT_BASE_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator {
private:

    int countSizeBytes(int blockNum){
        return blockNum * MEM_BLOCK_SIZE;
    }

    MemoryAllocator() {
        freeList=(struct metaData*)HEAP_START_ADDR;
        // ```` Pocetni size je velicina pocetnog memorijskog prostora
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
        freeList->free = 1;
        freeList->next = 0;
    }

    struct metaData{
        size_t size;
        int free;
        struct metaData *next;
    } ;

    struct metaData* freeList;

    void split(struct metaData *fitting_slot,size_t size);

public:
    static MemoryAllocator* getInstance(){
        // using static variable
        static MemoryAllocator instance;
        return &instance;
    }

    void *myMalloc(size_t noOfBlocks);

    int myFree(void*);

    void merge();

   // MemoryAllocator() = delete;

    MemoryAllocator(const MemoryAllocator &) = delete;

    MemoryAllocator &operator=(const MemoryAllocator &) = delete;
};

#endif //PROBA3_PROJECT_BASE_MEMORYALLOCATOR_HPP
