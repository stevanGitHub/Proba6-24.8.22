//
// Created by os on 8/14/22.
//

#include "../h/memoryAllocator.hpp"
#include "../lib/hw.h"
#include "printing.hpp"

void* MemoryAllocator::myMalloc(size_t noOfBlocks){
    struct metaData *curr, *prev;
    void *result;

    int noOfBytes = countSizeBytes(noOfBlocks);

    curr = freeList;
    while( ( ( (curr->size) < noOfBytes) || ( (curr->free) == 0) ) && (curr->next != 0) ){
        prev=curr;
        curr=curr->next;
       // printString("One block checked\n");
    }
    if((curr->size)==noOfBytes && curr->free){
        curr->free=0;
        result=(void*)(++curr);
       // printString("Exact fitting block allocated\n");
        return result;
    }
    else if((curr->size)>(noOfBytes+sizeof(struct metaData)) && curr->free){
        split(curr,noOfBytes);
        result=(void*)(++curr);
      //  printString("Fitting block allocated with a split\n");
        return result;
    }
    else{
        result=0;
      //  printString("Sorry. No sufficient memory to allocate\n");
        return result;
    }

}

void MemoryAllocator::split(struct metaData *fitting_slot,size_t size){

    struct metaData *newBlock = (struct metaData*)((char *)fitting_slot + size + sizeof(struct metaData));
    newBlock->size = (fitting_slot->size)-size-sizeof(struct metaData);
    newBlock->free = 1;
    newBlock->next=fitting_slot->next;
    fitting_slot->size = size;
    fitting_slot->free = 0;
    fitting_slot->next = newBlock;
}

int MemoryAllocator::myFree(void *ptr) {
   // printString("\nUsao u myFree\n");
    if((char*)ptr >= (char*)HEAP_START_ADDR && ptr < (char*)HEAP_END_ADDR){
        struct metaData* curr = (struct metaData*)ptr;
        --curr;
        curr->free = 1;
        merge();
        return 0;
    } else {
       // printString("\nAdresa nije u validnom opsegu");
        return -1;
    }
}

void MemoryAllocator::merge() {
    struct metaData* temp = freeList;
    while(temp && temp->next) {
        if(temp->free && temp->next->free){
            temp->size = temp->size + sizeof(struct metaData) + temp->next->size;
            temp->next = temp->next->next; // prevezani
        }
        temp = temp->next;
    }
}