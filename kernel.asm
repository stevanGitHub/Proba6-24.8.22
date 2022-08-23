
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	54013103          	ld	sp,1344(sp) # 80007540 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	169030ef          	jal	ra,80003984 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5Riscv14supervisorTrapEv>:
.global _ZN5Riscv14supervisorTrapEv # napravljena da bude globalna, da bi je videli van ovog fajla
.align 4 # adrese poravnate na 4
.type _ZN5Riscv14supervisorTrapEv, @function

_ZN5Riscv14supervisorTrapEv:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256

    # push all register x0-x31 to stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call _ZN5Riscv20handleSupervisorTrapEv
    80001084:	461010ef          	jal	ra,80002ce4 <_ZN5Riscv20handleSupervisorTrapEv>


    # (pop) restore register x0-x31 from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001088:	00013003          	ld	zero,0(sp)
    8000108c:	00813083          	ld	ra,8(sp)
    80001090:	01013103          	ld	sp,16(sp)
    80001094:	01813183          	ld	gp,24(sp)
    80001098:	02013203          	ld	tp,32(sp)
    8000109c:	02813283          	ld	t0,40(sp)
    800010a0:	03013303          	ld	t1,48(sp)
    800010a4:	03813383          	ld	t2,56(sp)
    800010a8:	04013403          	ld	s0,64(sp)
    800010ac:	04813483          	ld	s1,72(sp)
    800010b0:	05013503          	ld	a0,80(sp)
    800010b4:	05813583          	ld	a1,88(sp)
    800010b8:	06013603          	ld	a2,96(sp)
    800010bc:	06813683          	ld	a3,104(sp)
    800010c0:	07013703          	ld	a4,112(sp)
    800010c4:	07813783          	ld	a5,120(sp)
    800010c8:	08013803          	ld	a6,128(sp)
    800010cc:	08813883          	ld	a7,136(sp)
    800010d0:	09013903          	ld	s2,144(sp)
    800010d4:	09813983          	ld	s3,152(sp)
    800010d8:	0a013a03          	ld	s4,160(sp)
    800010dc:	0a813a83          	ld	s5,168(sp)
    800010e0:	0b013b03          	ld	s6,176(sp)
    800010e4:	0b813b83          	ld	s7,184(sp)
    800010e8:	0c013c03          	ld	s8,192(sp)
    800010ec:	0c813c83          	ld	s9,200(sp)
    800010f0:	0d013d03          	ld	s10,208(sp)
    800010f4:	0d813d83          	ld	s11,216(sp)
    800010f8:	0e013e03          	ld	t3,224(sp)
    800010fc:	0e813e83          	ld	t4,232(sp)
    80001100:	0f013f03          	ld	t5,240(sp)
    80001104:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256
    80001108:	10010113          	addi	sp,sp,256

    8000110c:	10200073          	sret

0000000080001110 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001110:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001114:	00b29a63          	bne	t0,a1,80001128 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001118:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000111c:	fe029ae3          	bnez	t0,80001110 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001120:	00000513          	li	a0,0
    jr ra                  # Return.
    80001124:	00008067          	ret

0000000080001128 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001128:	00100513          	li	a0,1
    8000112c:	00008067          	ret

0000000080001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001130:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    80001134:	00253423          	sd	sp,8(a0)
    # vrv mora i fp

    ld ra, 0 * 8(a1)
    80001138:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    8000113c:	0085b103          	ld	sp,8(a1)

    ret
    80001140:	00008067          	ret

0000000080001144 <_Z9mem_allocm>:
#include "../h/tcb.hpp"
#include "../lib/mem.h"
#include "../h/kSem.hpp"


void* mem_alloc (size_t size){
    80001144:	ff010113          	addi	sp,sp,-16
    80001148:	00113423          	sd	ra,8(sp)
    8000114c:	00813023          	sd	s0,0(sp)
    80001150:	01010413          	addi	s0,sp,16
    // size -> block
    size_t numOfBlock = size / MEM_BLOCK_SIZE + ((size % MEM_BLOCK_SIZE) ? 1 : 0);
    80001154:	00655593          	srli	a1,a0,0x6
    80001158:	03f57513          	andi	a0,a0,63
    8000115c:	00050463          	beqz	a0,80001164 <_Z9mem_allocm+0x20>
    80001160:	00100513          	li	a0,1
    80001164:	00a585b3          	add	a1,a1,a0
    void split(struct metaData *fitting_slot,size_t size);

public:
    static MemoryAllocator* getInstance(){
        // using static variable
        static MemoryAllocator instance;
    80001168:	00006797          	auipc	a5,0x6
    8000116c:	4387c783          	lbu	a5,1080(a5) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001170:	04079663          	bnez	a5,800011bc <_Z9mem_allocm+0x78>
        freeList=(struct metaData*)HEAP_START_ADDR;
    80001174:	00006797          	auipc	a5,0x6
    80001178:	3b47b783          	ld	a5,948(a5) # 80007528 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000117c:	0007b703          	ld	a4,0(a5)
    80001180:	00006697          	auipc	a3,0x6
    80001184:	42868693          	addi	a3,a3,1064 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001188:	00e6b023          	sd	a4,0(a3)
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
    8000118c:	00006797          	auipc	a5,0x6
    80001190:	3c47b783          	ld	a5,964(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001194:	0007b783          	ld	a5,0(a5)
    80001198:	40e787b3          	sub	a5,a5,a4
    8000119c:	fe878793          	addi	a5,a5,-24
    800011a0:	00f73023          	sd	a5,0(a4)
        freeList->free = 1;
    800011a4:	0006b703          	ld	a4,0(a3)
    800011a8:	00100793          	li	a5,1
    800011ac:	00f72423          	sw	a5,8(a4)
        freeList->next = 0;
    800011b0:	00073823          	sd	zero,16(a4)
        static MemoryAllocator instance;
    800011b4:	00006717          	auipc	a4,0x6
    800011b8:	3ef70623          	sb	a5,1004(a4) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>

    MemoryAllocator* mem = MemoryAllocator::getInstance();

    void *ret;

    ret = mem->myMalloc(numOfBlock);
    800011bc:	00006517          	auipc	a0,0x6
    800011c0:	3ec50513          	addi	a0,a0,1004 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800011c4:	00001097          	auipc	ra,0x1
    800011c8:	728080e7          	jalr	1832(ra) # 800028ec <_ZN15MemoryAllocator8myMallocEm>
//    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    //  printString("\nVraca se u main");
    return ret;
}
    800011cc:	00813083          	ld	ra,8(sp)
    800011d0:	00013403          	ld	s0,0(sp)
    800011d4:	01010113          	addi	sp,sp,16
    800011d8:	00008067          	ret

00000000800011dc <_Z8mem_freePv>:

int mem_free (void* ptr) {
    800011dc:	ff010113          	addi	sp,sp,-16
    800011e0:	00813423          	sd	s0,8(sp)
    800011e4:	01010413          	addi	s0,sp,16
    uint64 code = MEM_FREE;
    __asm__ volatile ("mv a1, %[ptr]" : : [ptr] "r" (ptr));
    800011e8:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    800011ec:	00200793          	li	a5,2
    800011f0:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    800011f4:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    800011f8:	00050513          	mv	a0,a0
    return ret;
}
    800011fc:	0005051b          	sext.w	a0,a0
    80001200:	00813403          	ld	s0,8(sp)
    80001204:	01010113          	addi	sp,sp,16
    80001208:	00008067          	ret

000000008000120c <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create (thread_t* handle, void(*start_routine)(void*), void* arg) {
    8000120c:	fd010113          	addi	sp,sp,-48
    80001210:	02113423          	sd	ra,40(sp)
    80001214:	02813023          	sd	s0,32(sp)
    80001218:	00913c23          	sd	s1,24(sp)
    8000121c:	01213823          	sd	s2,16(sp)
    80001220:	01313423          	sd	s3,8(sp)
    80001224:	03010413          	addi	s0,sp,48
    80001228:	00050493          	mv	s1,a0
    8000122c:	00058913          	mv	s2,a1
    80001230:	00060993          	mv	s3,a2
    80001234:	00006797          	auipc	a5,0x6
    80001238:	36c7c783          	lbu	a5,876(a5) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    8000123c:	04079663          	bnez	a5,80001288 <_Z13thread_createPP3TCBPFvPvES2_+0x7c>
        freeList=(struct metaData*)HEAP_START_ADDR;
    80001240:	00006797          	auipc	a5,0x6
    80001244:	2e87b783          	ld	a5,744(a5) # 80007528 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001248:	0007b703          	ld	a4,0(a5)
    8000124c:	00006697          	auipc	a3,0x6
    80001250:	35c68693          	addi	a3,a3,860 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001254:	00e6b023          	sd	a4,0(a3)
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
    80001258:	00006797          	auipc	a5,0x6
    8000125c:	2f87b783          	ld	a5,760(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001260:	0007b783          	ld	a5,0(a5)
    80001264:	40e787b3          	sub	a5,a5,a4
    80001268:	fe878793          	addi	a5,a5,-24
    8000126c:	00f73023          	sd	a5,0(a4)
        freeList->free = 1;
    80001270:	0006b703          	ld	a4,0(a3)
    80001274:	00100793          	li	a5,1
    80001278:	00f72423          	sw	a5,8(a4)
        freeList->next = 0;
    8000127c:	00073823          	sd	zero,16(a4)
        static MemoryAllocator instance;
    80001280:	00006717          	auipc	a4,0x6
    80001284:	32f70023          	sb	a5,800(a4) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    uint64 code = THREAD_CREATE;
//    void *stack_space = __mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    void *stack_space = MemoryAllocator::getInstance()->myMalloc(DEFAULT_STACK_SIZE*sizeof(uint64));
    80001288:	000085b7          	lui	a1,0x8
    8000128c:	00006517          	auipc	a0,0x6
    80001290:	31c50513          	addi	a0,a0,796 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001294:	00001097          	auipc	ra,0x1
    80001298:	658080e7          	jalr	1624(ra) # 800028ec <_ZN15MemoryAllocator8myMallocEm>

//    printString("\nhandle u thread_create: ");
//    printInt((uint64)handle, 16, 0);

    __asm__ volatile ("mv a4, %[stack_space]" : : [stack_space] "r" (stack_space));
    8000129c:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a3, %[arg]" : : [arg] "r" (arg));
    800012a0:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a2, %[body]" : : [body] "r" (start_routine));
    800012a4:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a1, %[handle]" : : [handle] "r" (handle));
    800012a8:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    800012ac:	01100793          	li	a5,17
    800012b0:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    800012b4:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    800012b8:	00050513          	mv	a0,a0
    /*
    *handle = TCB::createThread(start_routine, arg, stack_space);
    if(*handle) return 0;
    else return -3;
    */
}
    800012bc:	0005051b          	sext.w	a0,a0
    800012c0:	02813083          	ld	ra,40(sp)
    800012c4:	02013403          	ld	s0,32(sp)
    800012c8:	01813483          	ld	s1,24(sp)
    800012cc:	01013903          	ld	s2,16(sp)
    800012d0:	00813983          	ld	s3,8(sp)
    800012d4:	03010113          	addi	sp,sp,48
    800012d8:	00008067          	ret

00000000800012dc <_Z11thread_exitv>:

int thread_exit () {
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00813423          	sd	s0,8(sp)
    800012e4:	01010413          	addi	s0,sp,16
    uint64 code = THREAD_EXIT;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    800012e8:	01200793          	li	a5,18
    800012ec:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    800012f0:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    800012f4:	00050513          	mv	a0,a0
    return ret;
}
    800012f8:	0005051b          	sext.w	a0,a0
    800012fc:	00813403          	ld	s0,8(sp)
    80001300:	01010113          	addi	sp,sp,16
    80001304:	00008067          	ret

0000000080001308 <_Z15thread_dispatchv>:


void thread_dispatch (){
    80001308:	ff010113          	addi	sp,sp,-16
    8000130c:	00813423          	sd	s0,8(sp)
    80001310:	01010413          	addi	s0,sp,16
    uint64 code = THREAD_DISPATCH;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    80001314:	01300793          	li	a5,19
    80001318:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    8000131c:	00000073          	ecall
    //TCB::yield();
}
    80001320:	00813403          	ld	s0,8(sp)
    80001324:	01010113          	addi	sp,sp,16
    80001328:	00008067          	ret

000000008000132c <_Z9putThreadP3TCB>:

void putThread(TCB* tcb){
    8000132c:	ff010113          	addi	sp,sp,-16
    80001330:	00813423          	sd	s0,8(sp)
    80001334:	01010413          	addi	s0,sp,16
    uint64 code = PUT_THREAD;
    __asm__ volatile ("mv a1, %[tcb]" : : [tcb] "r" (tcb));
    80001338:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    8000133c:	01400793          	li	a5,20
    80001340:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    80001344:	00000073          	ecall
}
    80001348:	00813403          	ld	s0,8(sp)
    8000134c:	01010113          	addi	sp,sp,16
    80001350:	00008067          	ret

0000000080001354 <_Z8sem_openPP4KSemj>:

int sem_open (sem_t* handle, unsigned init){
    80001354:	fe010113          	addi	sp,sp,-32
    80001358:	00113c23          	sd	ra,24(sp)
    8000135c:	00813823          	sd	s0,16(sp)
    80001360:	00913423          	sd	s1,8(sp)
    80001364:	02010413          	addi	s0,sp,32
    80001368:	00050493          	mv	s1,a0

    *handle = KSem::createSem(init);
    8000136c:	00058513          	mv	a0,a1
    80001370:	00002097          	auipc	ra,0x2
    80001374:	fec080e7          	jalr	-20(ra) # 8000335c <_ZN4KSem9createSemEj>
    80001378:	00a4b023          	sd	a0,0(s1)

    return 0;
}
    8000137c:	00000513          	li	a0,0
    80001380:	01813083          	ld	ra,24(sp)
    80001384:	01013403          	ld	s0,16(sp)
    80001388:	00813483          	ld	s1,8(sp)
    8000138c:	02010113          	addi	sp,sp,32
    80001390:	00008067          	ret

0000000080001394 <_Z9sem_closeP4KSem>:


int sem_close (sem_t handle){
    80001394:	ff010113          	addi	sp,sp,-16
    80001398:	00813423          	sd	s0,8(sp)
    8000139c:	01010413          	addi	s0,sp,16

    return 0;
}
    800013a0:	00000513          	li	a0,0
    800013a4:	00813403          	ld	s0,8(sp)
    800013a8:	01010113          	addi	sp,sp,16
    800013ac:	00008067          	ret

00000000800013b0 <_Z8sem_waitP4KSem>:

int sem_wait (sem_t id){
    800013b0:	ff010113          	addi	sp,sp,-16
    800013b4:	00113423          	sd	ra,8(sp)
    800013b8:	00813023          	sd	s0,0(sp)
    800013bc:	01010413          	addi	s0,sp,16

    id->wait();
    800013c0:	00002097          	auipc	ra,0x2
    800013c4:	058080e7          	jalr	88(ra) # 80003418 <_ZN4KSem4waitEv>

    return 0;
}
    800013c8:	00000513          	li	a0,0
    800013cc:	00813083          	ld	ra,8(sp)
    800013d0:	00013403          	ld	s0,0(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z10sem_signalP4KSem>:

int sem_signal (sem_t id){
    800013dc:	ff010113          	addi	sp,sp,-16
    800013e0:	00113423          	sd	ra,8(sp)
    800013e4:	00813023          	sd	s0,0(sp)
    800013e8:	01010413          	addi	s0,sp,16

    id->signal();
    800013ec:	00002097          	auipc	ra,0x2
    800013f0:	0e8080e7          	jalr	232(ra) # 800034d4 <_ZN4KSem6signalEv>

    return 0;
}
    800013f4:	00000513          	li	a0,0
    800013f8:	00813083          	ld	ra,8(sp)
    800013fc:	00013403          	ld	s0,0(sp)
    80001400:	01010113          	addi	sp,sp,16
    80001404:	00008067          	ret

0000000080001408 <_Z9changeModv>:

void changeMod() {
    80001408:	ff010113          	addi	sp,sp,-16
    8000140c:	00813423          	sd	s0,8(sp)
    80001410:	01010413          	addi	s0,sp,16
    uint64 code = CHANGE_MOD;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    80001414:	04300793          	li	a5,67
    80001418:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    8000141c:	00000073          	ecall
    80001420:	00813403          	ld	s0,8(sp)
    80001424:	01010113          	addi	sp,sp,16
    80001428:	00008067          	ret

000000008000142c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    8000142c:	fe010113          	addi	sp,sp,-32
    80001430:	00113c23          	sd	ra,24(sp)
    80001434:	00813823          	sd	s0,16(sp)
    80001438:	00913423          	sd	s1,8(sp)
    8000143c:	02010413          	addi	s0,sp,32
    80001440:	00050493          	mv	s1,a0
    LOCK();
    80001444:	00100613          	li	a2,1
    80001448:	00000593          	li	a1,0
    8000144c:	00006517          	auipc	a0,0x6
    80001450:	16450513          	addi	a0,a0,356 # 800075b0 <lockPrint>
    80001454:	00000097          	auipc	ra,0x0
    80001458:	cbc080e7          	jalr	-836(ra) # 80001110 <copy_and_swap>
    8000145c:	fe0514e3          	bnez	a0,80001444 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001460:	0004c503          	lbu	a0,0(s1)
    80001464:	00050a63          	beqz	a0,80001478 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001468:	00004097          	auipc	ra,0x4
    8000146c:	5e4080e7          	jalr	1508(ra) # 80005a4c <__putc>
        string++;
    80001470:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001474:	fedff06f          	j	80001460 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001478:	00000613          	li	a2,0
    8000147c:	00100593          	li	a1,1
    80001480:	00006517          	auipc	a0,0x6
    80001484:	13050513          	addi	a0,a0,304 # 800075b0 <lockPrint>
    80001488:	00000097          	auipc	ra,0x0
    8000148c:	c88080e7          	jalr	-888(ra) # 80001110 <copy_and_swap>
    80001490:	fe0514e3          	bnez	a0,80001478 <_Z11printStringPKc+0x4c>
}
    80001494:	01813083          	ld	ra,24(sp)
    80001498:	01013403          	ld	s0,16(sp)
    8000149c:	00813483          	ld	s1,8(sp)
    800014a0:	02010113          	addi	sp,sp,32
    800014a4:	00008067          	ret

00000000800014a8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    800014a8:	fd010113          	addi	sp,sp,-48
    800014ac:	02113423          	sd	ra,40(sp)
    800014b0:	02813023          	sd	s0,32(sp)
    800014b4:	00913c23          	sd	s1,24(sp)
    800014b8:	01213823          	sd	s2,16(sp)
    800014bc:	01313423          	sd	s3,8(sp)
    800014c0:	01413023          	sd	s4,0(sp)
    800014c4:	03010413          	addi	s0,sp,48
    800014c8:	00050993          	mv	s3,a0
    800014cc:	00058a13          	mv	s4,a1
    LOCK();
    800014d0:	00100613          	li	a2,1
    800014d4:	00000593          	li	a1,0
    800014d8:	00006517          	auipc	a0,0x6
    800014dc:	0d850513          	addi	a0,a0,216 # 800075b0 <lockPrint>
    800014e0:	00000097          	auipc	ra,0x0
    800014e4:	c30080e7          	jalr	-976(ra) # 80001110 <copy_and_swap>
    800014e8:	fe0514e3          	bnez	a0,800014d0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800014ec:	00000913          	li	s2,0
    800014f0:	00090493          	mv	s1,s2
    800014f4:	0019091b          	addiw	s2,s2,1
    800014f8:	03495a63          	bge	s2,s4,8000152c <_Z9getStringPci+0x84>
        cc = __getc();
    800014fc:	00004097          	auipc	ra,0x4
    80001500:	58c080e7          	jalr	1420(ra) # 80005a88 <__getc>
        if(cc < 1)
    80001504:	02050463          	beqz	a0,8000152c <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001508:	009984b3          	add	s1,s3,s1
    8000150c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001510:	00a00793          	li	a5,10
    80001514:	00f50a63          	beq	a0,a5,80001528 <_Z9getStringPci+0x80>
    80001518:	00d00793          	li	a5,13
    8000151c:	fcf51ae3          	bne	a0,a5,800014f0 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001520:	00090493          	mv	s1,s2
    80001524:	0080006f          	j	8000152c <_Z9getStringPci+0x84>
    80001528:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    8000152c:	009984b3          	add	s1,s3,s1
    80001530:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001534:	00000613          	li	a2,0
    80001538:	00100593          	li	a1,1
    8000153c:	00006517          	auipc	a0,0x6
    80001540:	07450513          	addi	a0,a0,116 # 800075b0 <lockPrint>
    80001544:	00000097          	auipc	ra,0x0
    80001548:	bcc080e7          	jalr	-1076(ra) # 80001110 <copy_and_swap>
    8000154c:	fe0514e3          	bnez	a0,80001534 <_Z9getStringPci+0x8c>
    return buf;
}
    80001550:	00098513          	mv	a0,s3
    80001554:	02813083          	ld	ra,40(sp)
    80001558:	02013403          	ld	s0,32(sp)
    8000155c:	01813483          	ld	s1,24(sp)
    80001560:	01013903          	ld	s2,16(sp)
    80001564:	00813983          	ld	s3,8(sp)
    80001568:	00013a03          	ld	s4,0(sp)
    8000156c:	03010113          	addi	sp,sp,48
    80001570:	00008067          	ret

0000000080001574 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001574:	ff010113          	addi	sp,sp,-16
    80001578:	00813423          	sd	s0,8(sp)
    8000157c:	01010413          	addi	s0,sp,16
    80001580:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001584:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001588:	0006c603          	lbu	a2,0(a3)
    8000158c:	fd06071b          	addiw	a4,a2,-48
    80001590:	0ff77713          	andi	a4,a4,255
    80001594:	00900793          	li	a5,9
    80001598:	02e7e063          	bltu	a5,a4,800015b8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000159c:	0025179b          	slliw	a5,a0,0x2
    800015a0:	00a787bb          	addw	a5,a5,a0
    800015a4:	0017979b          	slliw	a5,a5,0x1
    800015a8:	00168693          	addi	a3,a3,1
    800015ac:	00c787bb          	addw	a5,a5,a2
    800015b0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800015b4:	fd5ff06f          	j	80001588 <_Z11stringToIntPKc+0x14>
    return n;
}
    800015b8:	00813403          	ld	s0,8(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret

00000000800015c4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800015c4:	fc010113          	addi	sp,sp,-64
    800015c8:	02113c23          	sd	ra,56(sp)
    800015cc:	02813823          	sd	s0,48(sp)
    800015d0:	02913423          	sd	s1,40(sp)
    800015d4:	03213023          	sd	s2,32(sp)
    800015d8:	01313c23          	sd	s3,24(sp)
    800015dc:	04010413          	addi	s0,sp,64
    800015e0:	00050493          	mv	s1,a0
    800015e4:	00058913          	mv	s2,a1
    800015e8:	00060993          	mv	s3,a2
    LOCK();
    800015ec:	00100613          	li	a2,1
    800015f0:	00000593          	li	a1,0
    800015f4:	00006517          	auipc	a0,0x6
    800015f8:	fbc50513          	addi	a0,a0,-68 # 800075b0 <lockPrint>
    800015fc:	00000097          	auipc	ra,0x0
    80001600:	b14080e7          	jalr	-1260(ra) # 80001110 <copy_and_swap>
    80001604:	fe0514e3          	bnez	a0,800015ec <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001608:	00098463          	beqz	s3,80001610 <_Z8printIntiii+0x4c>
    8000160c:	0804c463          	bltz	s1,80001694 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001610:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001614:	00000593          	li	a1,0
    }

    i = 0;
    80001618:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    8000161c:	0009079b          	sext.w	a5,s2
    80001620:	0325773b          	remuw	a4,a0,s2
    80001624:	00048613          	mv	a2,s1
    80001628:	0014849b          	addiw	s1,s1,1
    8000162c:	02071693          	slli	a3,a4,0x20
    80001630:	0206d693          	srli	a3,a3,0x20
    80001634:	00006717          	auipc	a4,0x6
    80001638:	e7c70713          	addi	a4,a4,-388 # 800074b0 <digits>
    8000163c:	00d70733          	add	a4,a4,a3
    80001640:	00074683          	lbu	a3,0(a4)
    80001644:	fd040713          	addi	a4,s0,-48
    80001648:	00c70733          	add	a4,a4,a2
    8000164c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001650:	0005071b          	sext.w	a4,a0
    80001654:	0325553b          	divuw	a0,a0,s2
    80001658:	fcf772e3          	bgeu	a4,a5,8000161c <_Z8printIntiii+0x58>
    if(neg)
    8000165c:	00058c63          	beqz	a1,80001674 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001660:	fd040793          	addi	a5,s0,-48
    80001664:	009784b3          	add	s1,a5,s1
    80001668:	02d00793          	li	a5,45
    8000166c:	fef48823          	sb	a5,-16(s1)
    80001670:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001674:	fff4849b          	addiw	s1,s1,-1
    80001678:	0204c463          	bltz	s1,800016a0 <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    8000167c:	fd040793          	addi	a5,s0,-48
    80001680:	009787b3          	add	a5,a5,s1
    80001684:	ff07c503          	lbu	a0,-16(a5)
    80001688:	00004097          	auipc	ra,0x4
    8000168c:	3c4080e7          	jalr	964(ra) # 80005a4c <__putc>
    80001690:	fe5ff06f          	j	80001674 <_Z8printIntiii+0xb0>
        x = -xx;
    80001694:	4090053b          	negw	a0,s1
        neg = 1;
    80001698:	00100593          	li	a1,1
        x = -xx;
    8000169c:	f7dff06f          	j	80001618 <_Z8printIntiii+0x54>

    UNLOCK();
    800016a0:	00000613          	li	a2,0
    800016a4:	00100593          	li	a1,1
    800016a8:	00006517          	auipc	a0,0x6
    800016ac:	f0850513          	addi	a0,a0,-248 # 800075b0 <lockPrint>
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	a60080e7          	jalr	-1440(ra) # 80001110 <copy_and_swap>
    800016b8:	fe0514e3          	bnez	a0,800016a0 <_Z8printIntiii+0xdc>
    800016bc:	03813083          	ld	ra,56(sp)
    800016c0:	03013403          	ld	s0,48(sp)
    800016c4:	02813483          	ld	s1,40(sp)
    800016c8:	02013903          	ld	s2,32(sp)
    800016cc:	01813983          	ld	s3,24(sp)
    800016d0:	04010113          	addi	sp,sp,64
    800016d4:	00008067          	ret

00000000800016d8 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    800016d8:	fe010113          	addi	sp,sp,-32
    800016dc:	00113c23          	sd	ra,24(sp)
    800016e0:	00813823          	sd	s0,16(sp)
    800016e4:	00913423          	sd	s1,8(sp)
    800016e8:	01213023          	sd	s2,0(sp)
    800016ec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800016f0:	00000913          	li	s2,0
    800016f4:	0380006f          	j	8000172c <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) {  /*busy wait*/  }
            thread_dispatch();
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	c10080e7          	jalr	-1008(ra) # 80001308 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001700:	00148493          	addi	s1,s1,1
    80001704:	000027b7          	lui	a5,0x2
    80001708:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000170c:	0097ee63          	bltu	a5,s1,80001728 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) {  /*busy wait*/  }
    80001710:	00000713          	li	a4,0
    80001714:	000077b7          	lui	a5,0x7
    80001718:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000171c:	fce7eee3          	bltu	a5,a4,800016f8 <_Z11workerBodyAPv+0x20>
    80001720:	00170713          	addi	a4,a4,1
    80001724:	ff1ff06f          	j	80001714 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80001728:	00190913          	addi	s2,s2,1
    8000172c:	00900793          	li	a5,9
    80001730:	0527e063          	bltu	a5,s2,80001770 <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80001734:	00005517          	auipc	a0,0x5
    80001738:	8ec50513          	addi	a0,a0,-1812 # 80006020 <CONSOLE_STATUS+0x10>
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	cf0080e7          	jalr	-784(ra) # 8000142c <_Z11printStringPKc>
    80001744:	00000613          	li	a2,0
    80001748:	00a00593          	li	a1,10
    8000174c:	0009051b          	sext.w	a0,s2
    80001750:	00000097          	auipc	ra,0x0
    80001754:	e74080e7          	jalr	-396(ra) # 800015c4 <_Z8printIntiii>
    80001758:	00005517          	auipc	a0,0x5
    8000175c:	a0850513          	addi	a0,a0,-1528 # 80006160 <CONSOLE_STATUS+0x150>
    80001760:	00000097          	auipc	ra,0x0
    80001764:	ccc080e7          	jalr	-820(ra) # 8000142c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001768:	00000493          	li	s1,0
    8000176c:	f99ff06f          	j	80001704 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80001770:	00005517          	auipc	a0,0x5
    80001774:	8b850513          	addi	a0,a0,-1864 # 80006028 <CONSOLE_STATUS+0x18>
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	cb4080e7          	jalr	-844(ra) # 8000142c <_Z11printStringPKc>
    finishedA = true;
    80001780:	00100793          	li	a5,1
    80001784:	00006717          	auipc	a4,0x6
    80001788:	e2f70a23          	sb	a5,-460(a4) # 800075b8 <finishedA>
}
    8000178c:	01813083          	ld	ra,24(sp)
    80001790:	01013403          	ld	s0,16(sp)
    80001794:	00813483          	ld	s1,8(sp)
    80001798:	00013903          	ld	s2,0(sp)
    8000179c:	02010113          	addi	sp,sp,32
    800017a0:	00008067          	ret

00000000800017a4 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    800017a4:	fe010113          	addi	sp,sp,-32
    800017a8:	00113c23          	sd	ra,24(sp)
    800017ac:	00813823          	sd	s0,16(sp)
    800017b0:	00913423          	sd	s1,8(sp)
    800017b4:	01213023          	sd	s2,0(sp)
    800017b8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800017bc:	00000913          	li	s2,0
    800017c0:	0380006f          	j	800017f8 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) {  /*busy wait*/  }
            thread_dispatch();
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	b44080e7          	jalr	-1212(ra) # 80001308 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800017cc:	00148493          	addi	s1,s1,1
    800017d0:	000027b7          	lui	a5,0x2
    800017d4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800017d8:	0097ee63          	bltu	a5,s1,800017f4 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) {  /*busy wait*/  }
    800017dc:	00000713          	li	a4,0
    800017e0:	000077b7          	lui	a5,0x7
    800017e4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800017e8:	fce7eee3          	bltu	a5,a4,800017c4 <_Z11workerBodyBPv+0x20>
    800017ec:	00170713          	addi	a4,a4,1
    800017f0:	ff1ff06f          	j	800017e0 <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800017f4:	00190913          	addi	s2,s2,1
    800017f8:	00f00793          	li	a5,15
    800017fc:	0527e063          	bltu	a5,s2,8000183c <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80001800:	00005517          	auipc	a0,0x5
    80001804:	83850513          	addi	a0,a0,-1992 # 80006038 <CONSOLE_STATUS+0x28>
    80001808:	00000097          	auipc	ra,0x0
    8000180c:	c24080e7          	jalr	-988(ra) # 8000142c <_Z11printStringPKc>
    80001810:	00000613          	li	a2,0
    80001814:	00a00593          	li	a1,10
    80001818:	0009051b          	sext.w	a0,s2
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	da8080e7          	jalr	-600(ra) # 800015c4 <_Z8printIntiii>
    80001824:	00005517          	auipc	a0,0x5
    80001828:	93c50513          	addi	a0,a0,-1732 # 80006160 <CONSOLE_STATUS+0x150>
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	c00080e7          	jalr	-1024(ra) # 8000142c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001834:	00000493          	li	s1,0
    80001838:	f99ff06f          	j	800017d0 <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000183c:	00005517          	auipc	a0,0x5
    80001840:	80450513          	addi	a0,a0,-2044 # 80006040 <CONSOLE_STATUS+0x30>
    80001844:	00000097          	auipc	ra,0x0
    80001848:	be8080e7          	jalr	-1048(ra) # 8000142c <_Z11printStringPKc>
    finishedB = true;
    8000184c:	00100793          	li	a5,1
    80001850:	00006717          	auipc	a4,0x6
    80001854:	d6f704a3          	sb	a5,-663(a4) # 800075b9 <finishedB>
    thread_dispatch();
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	ab0080e7          	jalr	-1360(ra) # 80001308 <_Z15thread_dispatchv>
}
    80001860:	01813083          	ld	ra,24(sp)
    80001864:	01013403          	ld	s0,16(sp)
    80001868:	00813483          	ld	s1,8(sp)
    8000186c:	00013903          	ld	s2,0(sp)
    80001870:	02010113          	addi	sp,sp,32
    80001874:	00008067          	ret

0000000080001878 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80001878:	fe010113          	addi	sp,sp,-32
    8000187c:	00113c23          	sd	ra,24(sp)
    80001880:	00813823          	sd	s0,16(sp)
    80001884:	00913423          	sd	s1,8(sp)
    80001888:	01213023          	sd	s2,0(sp)
    8000188c:	02010413          	addi	s0,sp,32
    80001890:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80001894:	00000913          	li	s2,0
    80001898:	00c0006f          	j	800018a4 <_Z16producerKeyboardPv+0x2c>
    while ((key = __getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000189c:	00000097          	auipc	ra,0x0
    800018a0:	a6c080e7          	jalr	-1428(ra) # 80001308 <_Z15thread_dispatchv>
    while ((key = __getc()) != 0x1b) {
    800018a4:	00004097          	auipc	ra,0x4
    800018a8:	1e4080e7          	jalr	484(ra) # 80005a88 <__getc>
    800018ac:	0005059b          	sext.w	a1,a0
    800018b0:	01b00793          	li	a5,27
    800018b4:	02f58a63          	beq	a1,a5,800018e8 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800018b8:	0084b503          	ld	a0,8(s1)
    800018bc:	00002097          	auipc	ra,0x2
    800018c0:	e44080e7          	jalr	-444(ra) # 80003700 <_ZN6Buffer3putEi>
        i++;
    800018c4:	0019071b          	addiw	a4,s2,1
    800018c8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800018cc:	0004a683          	lw	a3,0(s1)
    800018d0:	0026979b          	slliw	a5,a3,0x2
    800018d4:	00d787bb          	addw	a5,a5,a3
    800018d8:	0017979b          	slliw	a5,a5,0x1
    800018dc:	02f767bb          	remw	a5,a4,a5
    800018e0:	fc0792e3          	bnez	a5,800018a4 <_Z16producerKeyboardPv+0x2c>
    800018e4:	fb9ff06f          	j	8000189c <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800018e8:	00100793          	li	a5,1
    800018ec:	00006717          	auipc	a4,0x6
    800018f0:	ccf72823          	sw	a5,-816(a4) # 800075bc <threadEnd>
    data->buffer->put('!');
    800018f4:	02100593          	li	a1,33
    800018f8:	0084b503          	ld	a0,8(s1)
    800018fc:	00002097          	auipc	ra,0x2
    80001900:	e04080e7          	jalr	-508(ra) # 80003700 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80001904:	0104b503          	ld	a0,16(s1)
    80001908:	00000097          	auipc	ra,0x0
    8000190c:	ad4080e7          	jalr	-1324(ra) # 800013dc <_Z10sem_signalP4KSem>
}
    80001910:	01813083          	ld	ra,24(sp)
    80001914:	01013403          	ld	s0,16(sp)
    80001918:	00813483          	ld	s1,8(sp)
    8000191c:	00013903          	ld	s2,0(sp)
    80001920:	02010113          	addi	sp,sp,32
    80001924:	00008067          	ret

0000000080001928 <_Z8producerPv>:

void producer(void *arg) {
    80001928:	fe010113          	addi	sp,sp,-32
    8000192c:	00113c23          	sd	ra,24(sp)
    80001930:	00813823          	sd	s0,16(sp)
    80001934:	00913423          	sd	s1,8(sp)
    80001938:	01213023          	sd	s2,0(sp)
    8000193c:	02010413          	addi	s0,sp,32
    80001940:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001944:	00000913          	li	s2,0
    80001948:	00c0006f          	j	80001954 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	9bc080e7          	jalr	-1604(ra) # 80001308 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80001954:	00006797          	auipc	a5,0x6
    80001958:	c687a783          	lw	a5,-920(a5) # 800075bc <threadEnd>
    8000195c:	02079e63          	bnez	a5,80001998 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80001960:	0004a583          	lw	a1,0(s1)
    80001964:	0305859b          	addiw	a1,a1,48
    80001968:	0084b503          	ld	a0,8(s1)
    8000196c:	00002097          	auipc	ra,0x2
    80001970:	d94080e7          	jalr	-620(ra) # 80003700 <_ZN6Buffer3putEi>
        i++;
    80001974:	0019071b          	addiw	a4,s2,1
    80001978:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000197c:	0004a683          	lw	a3,0(s1)
    80001980:	0026979b          	slliw	a5,a3,0x2
    80001984:	00d787bb          	addw	a5,a5,a3
    80001988:	0017979b          	slliw	a5,a5,0x1
    8000198c:	02f767bb          	remw	a5,a4,a5
    80001990:	fc0792e3          	bnez	a5,80001954 <_Z8producerPv+0x2c>
    80001994:	fb9ff06f          	j	8000194c <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80001998:	0104b503          	ld	a0,16(s1)
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	a40080e7          	jalr	-1472(ra) # 800013dc <_Z10sem_signalP4KSem>
}
    800019a4:	01813083          	ld	ra,24(sp)
    800019a8:	01013403          	ld	s0,16(sp)
    800019ac:	00813483          	ld	s1,8(sp)
    800019b0:	00013903          	ld	s2,0(sp)
    800019b4:	02010113          	addi	sp,sp,32
    800019b8:	00008067          	ret

00000000800019bc <_Z8consumerPv>:

void consumer(void *arg) {
    800019bc:	fd010113          	addi	sp,sp,-48
    800019c0:	02113423          	sd	ra,40(sp)
    800019c4:	02813023          	sd	s0,32(sp)
    800019c8:	00913c23          	sd	s1,24(sp)
    800019cc:	01213823          	sd	s2,16(sp)
    800019d0:	01313423          	sd	s3,8(sp)
    800019d4:	03010413          	addi	s0,sp,48
    800019d8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800019dc:	00000993          	li	s3,0
    800019e0:	01c0006f          	j	800019fc <_Z8consumerPv+0x40>
        i++;

        __putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800019e4:	00000097          	auipc	ra,0x0
    800019e8:	924080e7          	jalr	-1756(ra) # 80001308 <_Z15thread_dispatchv>
    800019ec:	0500006f          	j	80001a3c <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            __putc('\n');
    800019f0:	00a00513          	li	a0,10
    800019f4:	00004097          	auipc	ra,0x4
    800019f8:	058080e7          	jalr	88(ra) # 80005a4c <__putc>
    while (!threadEnd) {
    800019fc:	00006797          	auipc	a5,0x6
    80001a00:	bc07a783          	lw	a5,-1088(a5) # 800075bc <threadEnd>
    80001a04:	06079063          	bnez	a5,80001a64 <_Z8consumerPv+0xa8>
        int key = data->buffer->get();
    80001a08:	00893503          	ld	a0,8(s2)
    80001a0c:	00002097          	auipc	ra,0x2
    80001a10:	d84080e7          	jalr	-636(ra) # 80003790 <_ZN6Buffer3getEv>
        i++;
    80001a14:	0019849b          	addiw	s1,s3,1
    80001a18:	0004899b          	sext.w	s3,s1
        __putc(key);
    80001a1c:	0ff57513          	andi	a0,a0,255
    80001a20:	00004097          	auipc	ra,0x4
    80001a24:	02c080e7          	jalr	44(ra) # 80005a4c <__putc>
        if (i % (5 * data->id) == 0) {
    80001a28:	00092703          	lw	a4,0(s2)
    80001a2c:	0027179b          	slliw	a5,a4,0x2
    80001a30:	00e787bb          	addw	a5,a5,a4
    80001a34:	02f4e7bb          	remw	a5,s1,a5
    80001a38:	fa0786e3          	beqz	a5,800019e4 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80001a3c:	05000793          	li	a5,80
    80001a40:	02f4e4bb          	remw	s1,s1,a5
    80001a44:	fa049ce3          	bnez	s1,800019fc <_Z8consumerPv+0x40>
    80001a48:	fa9ff06f          	j	800019f0 <_Z8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) { //getCnt
        int key = data->buffer->get();
    80001a4c:	00893503          	ld	a0,8(s2)
    80001a50:	00002097          	auipc	ra,0x2
    80001a54:	d40080e7          	jalr	-704(ra) # 80003790 <_ZN6Buffer3getEv>
        __putc(key);
    80001a58:	0ff57513          	andi	a0,a0,255
    80001a5c:	00004097          	auipc	ra,0x4
    80001a60:	ff0080e7          	jalr	-16(ra) # 80005a4c <__putc>
    while (data->buffer->getCnt() > 0) { //getCnt
    80001a64:	00893503          	ld	a0,8(s2)
    80001a68:	00002097          	auipc	ra,0x2
    80001a6c:	db4080e7          	jalr	-588(ra) # 8000381c <_ZN6Buffer6getCntEv>
    80001a70:	fca04ee3          	bgtz	a0,80001a4c <_Z8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80001a74:	01093503          	ld	a0,16(s2)
    80001a78:	00000097          	auipc	ra,0x0
    80001a7c:	964080e7          	jalr	-1692(ra) # 800013dc <_Z10sem_signalP4KSem>
}
    80001a80:	02813083          	ld	ra,40(sp)
    80001a84:	02013403          	ld	s0,32(sp)
    80001a88:	01813483          	ld	s1,24(sp)
    80001a8c:	01013903          	ld	s2,16(sp)
    80001a90:	00813983          	ld	s3,8(sp)
    80001a94:	03010113          	addi	sp,sp,48
    80001a98:	00008067          	ret

0000000080001a9c <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80001a9c:	fe010113          	addi	sp,sp,-32
    80001aa0:	00113c23          	sd	ra,24(sp)
    80001aa4:	00813823          	sd	s0,16(sp)
    80001aa8:	00913423          	sd	s1,8(sp)
    80001aac:	01213023          	sd	s2,0(sp)
    80001ab0:	02010413          	addi	s0,sp,32
    80001ab4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001ab8:	00100793          	li	a5,1
    80001abc:	02a7f863          	bgeu	a5,a0,80001aec <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001ac0:	00a00793          	li	a5,10
    80001ac4:	02f577b3          	remu	a5,a0,a5
    80001ac8:	02078e63          	beqz	a5,80001b04 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001acc:	fff48513          	addi	a0,s1,-1
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	fcc080e7          	jalr	-52(ra) # 80001a9c <_Z9fibonaccim>
    80001ad8:	00050913          	mv	s2,a0
    80001adc:	ffe48513          	addi	a0,s1,-2
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	fbc080e7          	jalr	-68(ra) # 80001a9c <_Z9fibonaccim>
    80001ae8:	00a90533          	add	a0,s2,a0
}
    80001aec:	01813083          	ld	ra,24(sp)
    80001af0:	01013403          	ld	s0,16(sp)
    80001af4:	00813483          	ld	s1,8(sp)
    80001af8:	00013903          	ld	s2,0(sp)
    80001afc:	02010113          	addi	sp,sp,32
    80001b00:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001b04:	00000097          	auipc	ra,0x0
    80001b08:	804080e7          	jalr	-2044(ra) # 80001308 <_Z15thread_dispatchv>
    80001b0c:	fc1ff06f          	j	80001acc <_Z9fibonaccim+0x30>

0000000080001b10 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    80001b10:	fe010113          	addi	sp,sp,-32
    80001b14:	00113c23          	sd	ra,24(sp)
    80001b18:	00813823          	sd	s0,16(sp)
    80001b1c:	00913423          	sd	s1,8(sp)
    80001b20:	01213023          	sd	s2,0(sp)
    80001b24:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001b28:	00000493          	li	s1,0
    80001b2c:	0400006f          	j	80001b6c <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001b30:	00004517          	auipc	a0,0x4
    80001b34:	52050513          	addi	a0,a0,1312 # 80006050 <CONSOLE_STATUS+0x40>
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	8f4080e7          	jalr	-1804(ra) # 8000142c <_Z11printStringPKc>
    80001b40:	00000613          	li	a2,0
    80001b44:	00a00593          	li	a1,10
    80001b48:	00048513          	mv	a0,s1
    80001b4c:	00000097          	auipc	ra,0x0
    80001b50:	a78080e7          	jalr	-1416(ra) # 800015c4 <_Z8printIntiii>
    80001b54:	00004517          	auipc	a0,0x4
    80001b58:	60c50513          	addi	a0,a0,1548 # 80006160 <CONSOLE_STATUS+0x150>
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	8d0080e7          	jalr	-1840(ra) # 8000142c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001b64:	0014849b          	addiw	s1,s1,1
    80001b68:	0ff4f493          	andi	s1,s1,255
    80001b6c:	00200793          	li	a5,2
    80001b70:	fc97f0e3          	bgeu	a5,s1,80001b30 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80001b74:	00004517          	auipc	a0,0x4
    80001b78:	4e450513          	addi	a0,a0,1252 # 80006058 <CONSOLE_STATUS+0x48>
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	8b0080e7          	jalr	-1872(ra) # 8000142c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001b84:	00700313          	li	t1,7
    thread_dispatch();
    80001b88:	fffff097          	auipc	ra,0xfffff
    80001b8c:	780080e7          	jalr	1920(ra) # 80001308 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001b90:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80001b94:	00004517          	auipc	a0,0x4
    80001b98:	4d450513          	addi	a0,a0,1236 # 80006068 <CONSOLE_STATUS+0x58>
    80001b9c:	00000097          	auipc	ra,0x0
    80001ba0:	890080e7          	jalr	-1904(ra) # 8000142c <_Z11printStringPKc>
    80001ba4:	00000613          	li	a2,0
    80001ba8:	00a00593          	li	a1,10
    80001bac:	0009051b          	sext.w	a0,s2
    80001bb0:	00000097          	auipc	ra,0x0
    80001bb4:	a14080e7          	jalr	-1516(ra) # 800015c4 <_Z8printIntiii>
    80001bb8:	00004517          	auipc	a0,0x4
    80001bbc:	5a850513          	addi	a0,a0,1448 # 80006160 <CONSOLE_STATUS+0x150>
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	86c080e7          	jalr	-1940(ra) # 8000142c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001bc8:	00c00513          	li	a0,12
    80001bcc:	00000097          	auipc	ra,0x0
    80001bd0:	ed0080e7          	jalr	-304(ra) # 80001a9c <_Z9fibonaccim>
    80001bd4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80001bd8:	00004517          	auipc	a0,0x4
    80001bdc:	49850513          	addi	a0,a0,1176 # 80006070 <CONSOLE_STATUS+0x60>
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	84c080e7          	jalr	-1972(ra) # 8000142c <_Z11printStringPKc>
    80001be8:	00000613          	li	a2,0
    80001bec:	00a00593          	li	a1,10
    80001bf0:	0009051b          	sext.w	a0,s2
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	9d0080e7          	jalr	-1584(ra) # 800015c4 <_Z8printIntiii>
    80001bfc:	00004517          	auipc	a0,0x4
    80001c00:	56450513          	addi	a0,a0,1380 # 80006160 <CONSOLE_STATUS+0x150>
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	828080e7          	jalr	-2008(ra) # 8000142c <_Z11printStringPKc>
    80001c0c:	0400006f          	j	80001c4c <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
       printString("C: i="); printInt(i); printString("\n");
    80001c10:	00004517          	auipc	a0,0x4
    80001c14:	44050513          	addi	a0,a0,1088 # 80006050 <CONSOLE_STATUS+0x40>
    80001c18:	00000097          	auipc	ra,0x0
    80001c1c:	814080e7          	jalr	-2028(ra) # 8000142c <_Z11printStringPKc>
    80001c20:	00000613          	li	a2,0
    80001c24:	00a00593          	li	a1,10
    80001c28:	00048513          	mv	a0,s1
    80001c2c:	00000097          	auipc	ra,0x0
    80001c30:	998080e7          	jalr	-1640(ra) # 800015c4 <_Z8printIntiii>
    80001c34:	00004517          	auipc	a0,0x4
    80001c38:	52c50513          	addi	a0,a0,1324 # 80006160 <CONSOLE_STATUS+0x150>
    80001c3c:	fffff097          	auipc	ra,0xfffff
    80001c40:	7f0080e7          	jalr	2032(ra) # 8000142c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001c44:	0014849b          	addiw	s1,s1,1
    80001c48:	0ff4f493          	andi	s1,s1,255
    80001c4c:	00500793          	li	a5,5
    80001c50:	fc97f0e3          	bgeu	a5,s1,80001c10 <_Z11workerBodyCPv+0x100>
    }
    printString("C finished!\n");
    80001c54:	00004517          	auipc	a0,0x4
    80001c58:	42c50513          	addi	a0,a0,1068 # 80006080 <CONSOLE_STATUS+0x70>
    80001c5c:	fffff097          	auipc	ra,0xfffff
    80001c60:	7d0080e7          	jalr	2000(ra) # 8000142c <_Z11printStringPKc>
    finishedC = true;
    80001c64:	00100793          	li	a5,1
    80001c68:	00006717          	auipc	a4,0x6
    80001c6c:	94f70c23          	sb	a5,-1704(a4) # 800075c0 <finishedC>
    thread_dispatch();
    80001c70:	fffff097          	auipc	ra,0xfffff
    80001c74:	698080e7          	jalr	1688(ra) # 80001308 <_Z15thread_dispatchv>
}
    80001c78:	01813083          	ld	ra,24(sp)
    80001c7c:	01013403          	ld	s0,16(sp)
    80001c80:	00813483          	ld	s1,8(sp)
    80001c84:	00013903          	ld	s2,0(sp)
    80001c88:	02010113          	addi	sp,sp,32
    80001c8c:	00008067          	ret

0000000080001c90 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    80001c90:	fe010113          	addi	sp,sp,-32
    80001c94:	00113c23          	sd	ra,24(sp)
    80001c98:	00813823          	sd	s0,16(sp)
    80001c9c:	00913423          	sd	s1,8(sp)
    80001ca0:	01213023          	sd	s2,0(sp)
    80001ca4:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001ca8:	00a00493          	li	s1,10
    80001cac:	0400006f          	j	80001cec <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001cb0:	00004517          	auipc	a0,0x4
    80001cb4:	3e050513          	addi	a0,a0,992 # 80006090 <CONSOLE_STATUS+0x80>
    80001cb8:	fffff097          	auipc	ra,0xfffff
    80001cbc:	774080e7          	jalr	1908(ra) # 8000142c <_Z11printStringPKc>
    80001cc0:	00000613          	li	a2,0
    80001cc4:	00a00593          	li	a1,10
    80001cc8:	00048513          	mv	a0,s1
    80001ccc:	00000097          	auipc	ra,0x0
    80001cd0:	8f8080e7          	jalr	-1800(ra) # 800015c4 <_Z8printIntiii>
    80001cd4:	00004517          	auipc	a0,0x4
    80001cd8:	48c50513          	addi	a0,a0,1164 # 80006160 <CONSOLE_STATUS+0x150>
    80001cdc:	fffff097          	auipc	ra,0xfffff
    80001ce0:	750080e7          	jalr	1872(ra) # 8000142c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001ce4:	0014849b          	addiw	s1,s1,1
    80001ce8:	0ff4f493          	andi	s1,s1,255
    80001cec:	00c00793          	li	a5,12
    80001cf0:	fc97f0e3          	bgeu	a5,s1,80001cb0 <_Z11workerBodyDPv+0x20>
    }

   printString("D: dispatch\n");
    80001cf4:	00004517          	auipc	a0,0x4
    80001cf8:	3a450513          	addi	a0,a0,932 # 80006098 <CONSOLE_STATUS+0x88>
    80001cfc:	fffff097          	auipc	ra,0xfffff
    80001d00:	730080e7          	jalr	1840(ra) # 8000142c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001d04:	00500313          	li	t1,5
    thread_dispatch();
    80001d08:	fffff097          	auipc	ra,0xfffff
    80001d0c:	600080e7          	jalr	1536(ra) # 80001308 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80001d10:	01000513          	li	a0,16
    80001d14:	00000097          	auipc	ra,0x0
    80001d18:	d88080e7          	jalr	-632(ra) # 80001a9c <_Z9fibonaccim>
    80001d1c:	00050913          	mv	s2,a0
   printString("D: fibonaci="); printInt(result); printString("\n");
    80001d20:	00004517          	auipc	a0,0x4
    80001d24:	38850513          	addi	a0,a0,904 # 800060a8 <CONSOLE_STATUS+0x98>
    80001d28:	fffff097          	auipc	ra,0xfffff
    80001d2c:	704080e7          	jalr	1796(ra) # 8000142c <_Z11printStringPKc>
    80001d30:	00000613          	li	a2,0
    80001d34:	00a00593          	li	a1,10
    80001d38:	0009051b          	sext.w	a0,s2
    80001d3c:	00000097          	auipc	ra,0x0
    80001d40:	888080e7          	jalr	-1912(ra) # 800015c4 <_Z8printIntiii>
    80001d44:	00004517          	auipc	a0,0x4
    80001d48:	41c50513          	addi	a0,a0,1052 # 80006160 <CONSOLE_STATUS+0x150>
    80001d4c:	fffff097          	auipc	ra,0xfffff
    80001d50:	6e0080e7          	jalr	1760(ra) # 8000142c <_Z11printStringPKc>
    80001d54:	0400006f          	j	80001d94 <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
       printString("D: i="); printInt(i); printString("\n");
    80001d58:	00004517          	auipc	a0,0x4
    80001d5c:	33850513          	addi	a0,a0,824 # 80006090 <CONSOLE_STATUS+0x80>
    80001d60:	fffff097          	auipc	ra,0xfffff
    80001d64:	6cc080e7          	jalr	1740(ra) # 8000142c <_Z11printStringPKc>
    80001d68:	00000613          	li	a2,0
    80001d6c:	00a00593          	li	a1,10
    80001d70:	00048513          	mv	a0,s1
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	850080e7          	jalr	-1968(ra) # 800015c4 <_Z8printIntiii>
    80001d7c:	00004517          	auipc	a0,0x4
    80001d80:	3e450513          	addi	a0,a0,996 # 80006160 <CONSOLE_STATUS+0x150>
    80001d84:	fffff097          	auipc	ra,0xfffff
    80001d88:	6a8080e7          	jalr	1704(ra) # 8000142c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001d8c:	0014849b          	addiw	s1,s1,1
    80001d90:	0ff4f493          	andi	s1,s1,255
    80001d94:	00f00793          	li	a5,15
    80001d98:	fc97f0e3          	bgeu	a5,s1,80001d58 <_Z11workerBodyDPv+0xc8>
    }

   printString("D finished!\n");
    80001d9c:	00004517          	auipc	a0,0x4
    80001da0:	31c50513          	addi	a0,a0,796 # 800060b8 <CONSOLE_STATUS+0xa8>
    80001da4:	fffff097          	auipc	ra,0xfffff
    80001da8:	688080e7          	jalr	1672(ra) # 8000142c <_Z11printStringPKc>
    finishedD = true;
    80001dac:	00100793          	li	a5,1
    80001db0:	00006717          	auipc	a4,0x6
    80001db4:	80f708a3          	sb	a5,-2031(a4) # 800075c1 <finishedD>
    thread_dispatch();
    80001db8:	fffff097          	auipc	ra,0xfffff
    80001dbc:	550080e7          	jalr	1360(ra) # 80001308 <_Z15thread_dispatchv>
}
    80001dc0:	01813083          	ld	ra,24(sp)
    80001dc4:	01013403          	ld	s0,16(sp)
    80001dc8:	00813483          	ld	s1,8(sp)
    80001dcc:	00013903          	ld	s2,0(sp)
    80001dd0:	02010113          	addi	sp,sp,32
    80001dd4:	00008067          	ret

0000000080001dd8 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80001dd8:	fd010113          	addi	sp,sp,-48
    80001ddc:	02113423          	sd	ra,40(sp)
    80001de0:	02813023          	sd	s0,32(sp)
    80001de4:	03010413          	addi	s0,sp,48
    thread_t threads[4];
//    printString("\nthr0: ");
//    printInt((uint64)&threads[0], 16, 0);
    thread_create(&threads[0], workerBodyA, nullptr);
    80001de8:	00000613          	li	a2,0
    80001dec:	00000597          	auipc	a1,0x0
    80001df0:	8ec58593          	addi	a1,a1,-1812 # 800016d8 <_Z11workerBodyAPv>
    80001df4:	fd040513          	addi	a0,s0,-48
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	414080e7          	jalr	1044(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80001e00:	00004517          	auipc	a0,0x4
    80001e04:	2c850513          	addi	a0,a0,712 # 800060c8 <CONSOLE_STATUS+0xb8>
    80001e08:	fffff097          	auipc	ra,0xfffff
    80001e0c:	624080e7          	jalr	1572(ra) # 8000142c <_Z11printStringPKc>

//    printString("\nthr0: ");
//    printInt((uint64)&threads[1], 16, 0);
    thread_create(&threads[1], workerBodyB, nullptr);
    80001e10:	00000613          	li	a2,0
    80001e14:	00000597          	auipc	a1,0x0
    80001e18:	99058593          	addi	a1,a1,-1648 # 800017a4 <_Z11workerBodyBPv>
    80001e1c:	fd840513          	addi	a0,s0,-40
    80001e20:	fffff097          	auipc	ra,0xfffff
    80001e24:	3ec080e7          	jalr	1004(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80001e28:	00004517          	auipc	a0,0x4
    80001e2c:	2b850513          	addi	a0,a0,696 # 800060e0 <CONSOLE_STATUS+0xd0>
    80001e30:	fffff097          	auipc	ra,0xfffff
    80001e34:	5fc080e7          	jalr	1532(ra) # 8000142c <_Z11printStringPKc>

//    printString("\nthr0: ");
//    printInt((uint64)&threads[2], 16, 0);
    thread_create(&threads[2], workerBodyC, nullptr);
    80001e38:	00000613          	li	a2,0
    80001e3c:	00000597          	auipc	a1,0x0
    80001e40:	cd458593          	addi	a1,a1,-812 # 80001b10 <_Z11workerBodyCPv>
    80001e44:	fe040513          	addi	a0,s0,-32
    80001e48:	fffff097          	auipc	ra,0xfffff
    80001e4c:	3c4080e7          	jalr	964(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80001e50:	00004517          	auipc	a0,0x4
    80001e54:	2a850513          	addi	a0,a0,680 # 800060f8 <CONSOLE_STATUS+0xe8>
    80001e58:	fffff097          	auipc	ra,0xfffff
    80001e5c:	5d4080e7          	jalr	1492(ra) # 8000142c <_Z11printStringPKc>

//    printString("\nthr0: ");
//    printInt((uint64)&threads[3], 16, 0);
    thread_create(&threads[3], workerBodyD, nullptr);
    80001e60:	00000613          	li	a2,0
    80001e64:	00000597          	auipc	a1,0x0
    80001e68:	e2c58593          	addi	a1,a1,-468 # 80001c90 <_Z11workerBodyDPv>
    80001e6c:	fe840513          	addi	a0,s0,-24
    80001e70:	fffff097          	auipc	ra,0xfffff
    80001e74:	39c080e7          	jalr	924(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80001e78:	00004517          	auipc	a0,0x4
    80001e7c:	29850513          	addi	a0,a0,664 # 80006110 <CONSOLE_STATUS+0x100>
    80001e80:	fffff097          	auipc	ra,0xfffff
    80001e84:	5ac080e7          	jalr	1452(ra) # 8000142c <_Z11printStringPKc>
    80001e88:	00c0006f          	j	80001e94 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80001e8c:	fffff097          	auipc	ra,0xfffff
    80001e90:	47c080e7          	jalr	1148(ra) # 80001308 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80001e94:	00005797          	auipc	a5,0x5
    80001e98:	7247c783          	lbu	a5,1828(a5) # 800075b8 <finishedA>
    80001e9c:	fe0788e3          	beqz	a5,80001e8c <_Z18Threads_C_API_testv+0xb4>
    80001ea0:	00005797          	auipc	a5,0x5
    80001ea4:	7197c783          	lbu	a5,1817(a5) # 800075b9 <finishedB>
    80001ea8:	fe0782e3          	beqz	a5,80001e8c <_Z18Threads_C_API_testv+0xb4>
    80001eac:	00005797          	auipc	a5,0x5
    80001eb0:	7147c783          	lbu	a5,1812(a5) # 800075c0 <finishedC>
    80001eb4:	fc078ce3          	beqz	a5,80001e8c <_Z18Threads_C_API_testv+0xb4>
    80001eb8:	00005797          	auipc	a5,0x5
    80001ebc:	7097c783          	lbu	a5,1801(a5) # 800075c1 <finishedD>
    80001ec0:	fc0786e3          	beqz	a5,80001e8c <_Z18Threads_C_API_testv+0xb4>
    }

}
    80001ec4:	02813083          	ld	ra,40(sp)
    80001ec8:	02013403          	ld	s0,32(sp)
    80001ecc:	03010113          	addi	sp,sp,48
    80001ed0:	00008067          	ret

0000000080001ed4 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80001ed4:	f9010113          	addi	sp,sp,-112
    80001ed8:	06113423          	sd	ra,104(sp)
    80001edc:	06813023          	sd	s0,96(sp)
    80001ee0:	04913c23          	sd	s1,88(sp)
    80001ee4:	05213823          	sd	s2,80(sp)
    80001ee8:	05313423          	sd	s3,72(sp)
    80001eec:	05413023          	sd	s4,64(sp)
    80001ef0:	03513c23          	sd	s5,56(sp)
    80001ef4:	03613823          	sd	s6,48(sp)
    80001ef8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80001efc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80001f00:	00004517          	auipc	a0,0x4
    80001f04:	22850513          	addi	a0,a0,552 # 80006128 <CONSOLE_STATUS+0x118>
    80001f08:	fffff097          	auipc	ra,0xfffff
    80001f0c:	524080e7          	jalr	1316(ra) # 8000142c <_Z11printStringPKc>
    getString(input, 30);
    80001f10:	01e00593          	li	a1,30
    80001f14:	fa040493          	addi	s1,s0,-96
    80001f18:	00048513          	mv	a0,s1
    80001f1c:	fffff097          	auipc	ra,0xfffff
    80001f20:	58c080e7          	jalr	1420(ra) # 800014a8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80001f24:	00048513          	mv	a0,s1
    80001f28:	fffff097          	auipc	ra,0xfffff
    80001f2c:	64c080e7          	jalr	1612(ra) # 80001574 <_Z11stringToIntPKc>
    80001f30:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80001f34:	00004517          	auipc	a0,0x4
    80001f38:	21450513          	addi	a0,a0,532 # 80006148 <CONSOLE_STATUS+0x138>
    80001f3c:	fffff097          	auipc	ra,0xfffff
    80001f40:	4f0080e7          	jalr	1264(ra) # 8000142c <_Z11printStringPKc>
    getString(input, 30);
    80001f44:	01e00593          	li	a1,30
    80001f48:	00048513          	mv	a0,s1
    80001f4c:	fffff097          	auipc	ra,0xfffff
    80001f50:	55c080e7          	jalr	1372(ra) # 800014a8 <_Z9getStringPci>
    n = stringToInt(input);
    80001f54:	00048513          	mv	a0,s1
    80001f58:	fffff097          	auipc	ra,0xfffff
    80001f5c:	61c080e7          	jalr	1564(ra) # 80001574 <_Z11stringToIntPKc>
    80001f60:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80001f64:	00004517          	auipc	a0,0x4
    80001f68:	20450513          	addi	a0,a0,516 # 80006168 <CONSOLE_STATUS+0x158>
    80001f6c:	fffff097          	auipc	ra,0xfffff
    80001f70:	4c0080e7          	jalr	1216(ra) # 8000142c <_Z11printStringPKc>
    80001f74:	00000613          	li	a2,0
    80001f78:	00a00593          	li	a1,10
    80001f7c:	00090513          	mv	a0,s2
    80001f80:	fffff097          	auipc	ra,0xfffff
    80001f84:	644080e7          	jalr	1604(ra) # 800015c4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80001f88:	00004517          	auipc	a0,0x4
    80001f8c:	1f850513          	addi	a0,a0,504 # 80006180 <CONSOLE_STATUS+0x170>
    80001f90:	fffff097          	auipc	ra,0xfffff
    80001f94:	49c080e7          	jalr	1180(ra) # 8000142c <_Z11printStringPKc>
    80001f98:	00000613          	li	a2,0
    80001f9c:	00a00593          	li	a1,10
    80001fa0:	00048513          	mv	a0,s1
    80001fa4:	fffff097          	auipc	ra,0xfffff
    80001fa8:	620080e7          	jalr	1568(ra) # 800015c4 <_Z8printIntiii>
    printString(".\n");
    80001fac:	00004517          	auipc	a0,0x4
    80001fb0:	1ec50513          	addi	a0,a0,492 # 80006198 <CONSOLE_STATUS+0x188>
    80001fb4:	fffff097          	auipc	ra,0xfffff
    80001fb8:	478080e7          	jalr	1144(ra) # 8000142c <_Z11printStringPKc>
    if(threadNum > n) {
    80001fbc:	0324c463          	blt	s1,s2,80001fe4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80001fc0:	03205c63          	blez	s2,80001ff8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80001fc4:	03800513          	li	a0,56
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	48c080e7          	jalr	1164(ra) # 80002454 <_Znwm>
    80001fd0:	00050a13          	mv	s4,a0
    80001fd4:	00048593          	mv	a1,s1
    80001fd8:	00001097          	auipc	ra,0x1
    80001fdc:	68c080e7          	jalr	1676(ra) # 80003664 <_ZN6BufferC1Ei>
    80001fe0:	0300006f          	j	80002010 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80001fe4:	00004517          	auipc	a0,0x4
    80001fe8:	1bc50513          	addi	a0,a0,444 # 800061a0 <CONSOLE_STATUS+0x190>
    80001fec:	fffff097          	auipc	ra,0xfffff
    80001ff0:	440080e7          	jalr	1088(ra) # 8000142c <_Z11printStringPKc>
        return;
    80001ff4:	0140006f          	j	80002008 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80001ff8:	00004517          	auipc	a0,0x4
    80001ffc:	1e850513          	addi	a0,a0,488 # 800061e0 <CONSOLE_STATUS+0x1d0>
    80002000:	fffff097          	auipc	ra,0xfffff
    80002004:	42c080e7          	jalr	1068(ra) # 8000142c <_Z11printStringPKc>
        return;
    80002008:	000b0113          	mv	sp,s6
    8000200c:	1500006f          	j	8000215c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002010:	00000593          	li	a1,0
    80002014:	00005517          	auipc	a0,0x5
    80002018:	5b450513          	addi	a0,a0,1460 # 800075c8 <waitForAll>
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	338080e7          	jalr	824(ra) # 80001354 <_Z8sem_openPP4KSemj>
    thread_t threads[threadNum];
    80002024:	00391793          	slli	a5,s2,0x3
    80002028:	00f78793          	addi	a5,a5,15
    8000202c:	ff07f793          	andi	a5,a5,-16
    80002030:	40f10133          	sub	sp,sp,a5
    80002034:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002038:	0019071b          	addiw	a4,s2,1
    8000203c:	00171793          	slli	a5,a4,0x1
    80002040:	00e787b3          	add	a5,a5,a4
    80002044:	00379793          	slli	a5,a5,0x3
    80002048:	00f78793          	addi	a5,a5,15
    8000204c:	ff07f793          	andi	a5,a5,-16
    80002050:	40f10133          	sub	sp,sp,a5
    80002054:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002058:	00191613          	slli	a2,s2,0x1
    8000205c:	012607b3          	add	a5,a2,s2
    80002060:	00379793          	slli	a5,a5,0x3
    80002064:	00f987b3          	add	a5,s3,a5
    80002068:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    8000206c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002070:	00005717          	auipc	a4,0x5
    80002074:	55873703          	ld	a4,1368(a4) # 800075c8 <waitForAll>
    80002078:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    8000207c:	00078613          	mv	a2,a5
    80002080:	00000597          	auipc	a1,0x0
    80002084:	93c58593          	addi	a1,a1,-1732 # 800019bc <_Z8consumerPv>
    80002088:	f9840513          	addi	a0,s0,-104
    8000208c:	fffff097          	auipc	ra,0xfffff
    80002090:	180080e7          	jalr	384(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002094:	00000493          	li	s1,0
    80002098:	0280006f          	j	800020c0 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000209c:	fffff597          	auipc	a1,0xfffff
    800020a0:	7dc58593          	addi	a1,a1,2012 # 80001878 <_Z16producerKeyboardPv>
                      data + i);
    800020a4:	00179613          	slli	a2,a5,0x1
    800020a8:	00f60633          	add	a2,a2,a5
    800020ac:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800020b0:	00c98633          	add	a2,s3,a2
    800020b4:	fffff097          	auipc	ra,0xfffff
    800020b8:	158080e7          	jalr	344(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800020bc:	0014849b          	addiw	s1,s1,1
    800020c0:	0524d263          	bge	s1,s2,80002104 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    800020c4:	00149793          	slli	a5,s1,0x1
    800020c8:	009787b3          	add	a5,a5,s1
    800020cc:	00379793          	slli	a5,a5,0x3
    800020d0:	00f987b3          	add	a5,s3,a5
    800020d4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800020d8:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800020dc:	00005717          	auipc	a4,0x5
    800020e0:	4ec73703          	ld	a4,1260(a4) # 800075c8 <waitForAll>
    800020e4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800020e8:	00048793          	mv	a5,s1
    800020ec:	00349513          	slli	a0,s1,0x3
    800020f0:	00aa8533          	add	a0,s5,a0
    800020f4:	fa9054e3          	blez	s1,8000209c <_Z22producerConsumer_C_APIv+0x1c8>
    800020f8:	00000597          	auipc	a1,0x0
    800020fc:	83058593          	addi	a1,a1,-2000 # 80001928 <_Z8producerPv>
    80002100:	fa5ff06f          	j	800020a4 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002104:	fffff097          	auipc	ra,0xfffff
    80002108:	204080e7          	jalr	516(ra) # 80001308 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000210c:	00000493          	li	s1,0
    80002110:	00994e63          	blt	s2,s1,8000212c <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002114:	00005517          	auipc	a0,0x5
    80002118:	4b453503          	ld	a0,1204(a0) # 800075c8 <waitForAll>
    8000211c:	fffff097          	auipc	ra,0xfffff
    80002120:	294080e7          	jalr	660(ra) # 800013b0 <_Z8sem_waitP4KSem>
    for (int i = 0; i <= threadNum; i++) {
    80002124:	0014849b          	addiw	s1,s1,1
    80002128:	fe9ff06f          	j	80002110 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    8000212c:	00005517          	auipc	a0,0x5
    80002130:	49c53503          	ld	a0,1180(a0) # 800075c8 <waitForAll>
    80002134:	fffff097          	auipc	ra,0xfffff
    80002138:	260080e7          	jalr	608(ra) # 80001394 <_Z9sem_closeP4KSem>
    delete buffer;
    8000213c:	000a0e63          	beqz	s4,80002158 <_Z22producerConsumer_C_APIv+0x284>
    80002140:	000a0513          	mv	a0,s4
    80002144:	00001097          	auipc	ra,0x1
    80002148:	760080e7          	jalr	1888(ra) # 800038a4 <_ZN6BufferD1Ev>
    8000214c:	000a0513          	mv	a0,s4
    80002150:	00000097          	auipc	ra,0x0
    80002154:	354080e7          	jalr	852(ra) # 800024a4 <_ZdlPv>
    80002158:	000b0113          	mv	sp,s6

}
    8000215c:	f9040113          	addi	sp,s0,-112
    80002160:	06813083          	ld	ra,104(sp)
    80002164:	06013403          	ld	s0,96(sp)
    80002168:	05813483          	ld	s1,88(sp)
    8000216c:	05013903          	ld	s2,80(sp)
    80002170:	04813983          	ld	s3,72(sp)
    80002174:	04013a03          	ld	s4,64(sp)
    80002178:	03813a83          	ld	s5,56(sp)
    8000217c:	03013b03          	ld	s6,48(sp)
    80002180:	07010113          	addi	sp,sp,112
    80002184:	00008067          	ret
    80002188:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000218c:	000a0513          	mv	a0,s4
    80002190:	00000097          	auipc	ra,0x0
    80002194:	314080e7          	jalr	788(ra) # 800024a4 <_ZdlPv>
    80002198:	00048513          	mv	a0,s1
    8000219c:	00006097          	auipc	ra,0x6
    800021a0:	52c080e7          	jalr	1324(ra) # 800086c8 <_Unwind_Resume>

00000000800021a4 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    800021a4:	ff010113          	addi	sp,sp,-16
    800021a8:	00113423          	sd	ra,8(sp)
    800021ac:	00813023          	sd	s0,0(sp)
    800021b0:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    800021b4:	00000097          	auipc	ra,0x0
    800021b8:	c24080e7          	jalr	-988(ra) # 80001dd8 <_Z18Threads_C_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
   // ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    800021bc:	00813083          	ld	ra,8(sp)
    800021c0:	00013403          	ld	s0,0(sp)
    800021c4:	01010113          	addi	sp,sp,16
    800021c8:	00008067          	ret

00000000800021cc <_Z17userWrapperThreadPv>:

    TCB::yield();
}*/
extern void userMain();

void userWrapperThread(void* arg) {
    800021cc:	ff010113          	addi	sp,sp,-16
    800021d0:	00113423          	sd	ra,8(sp)
    800021d4:	00813023          	sd	s0,0(sp)
    800021d8:	01010413          	addi	s0,sp,16
    userMain();
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	fc8080e7          	jalr	-56(ra) # 800021a4 <_Z8userMainv>
}
    800021e4:	00813083          	ld	ra,8(sp)
    800021e8:	00013403          	ld	s0,0(sp)
    800021ec:	01010113          	addi	sp,sp,16
    800021f0:	00008067          	ret

00000000800021f4 <_Z2p1Pv>:
*/

bool finishedP1 = false;
bool finishedP2 = false;

void p1(void *) {
    800021f4:	fe010113          	addi	sp,sp,-32
    800021f8:	00113c23          	sd	ra,24(sp)
    800021fc:	00813823          	sd	s0,16(sp)
    80002200:	00913423          	sd	s1,8(sp)
    80002204:	02010413          	addi	s0,sp,32
    for(int i  = 0; i < 10; ++i) {
    80002208:	00000493          	li	s1,0
    8000220c:	0340006f          	j	80002240 <_Z2p1Pv+0x4c>
        if(i == 5){
            Thread::dispatch();
    80002210:	00001097          	auipc	ra,0x1
    80002214:	a30080e7          	jalr	-1488(ra) # 80002c40 <_ZN6Thread8dispatchEv>
        }
        printInt(i, 10, 0);
    80002218:	00000613          	li	a2,0
    8000221c:	00a00593          	li	a1,10
    80002220:	00048513          	mv	a0,s1
    80002224:	fffff097          	auipc	ra,0xfffff
    80002228:	3a0080e7          	jalr	928(ra) # 800015c4 <_Z8printIntiii>
        printString("\n");
    8000222c:	00004517          	auipc	a0,0x4
    80002230:	f3450513          	addi	a0,a0,-204 # 80006160 <CONSOLE_STATUS+0x150>
    80002234:	fffff097          	auipc	ra,0xfffff
    80002238:	1f8080e7          	jalr	504(ra) # 8000142c <_Z11printStringPKc>
    for(int i  = 0; i < 10; ++i) {
    8000223c:	0014849b          	addiw	s1,s1,1
    80002240:	00900793          	li	a5,9
    80002244:	0097c863          	blt	a5,s1,80002254 <_Z2p1Pv+0x60>
        if(i == 5){
    80002248:	00500793          	li	a5,5
    8000224c:	fcf496e3          	bne	s1,a5,80002218 <_Z2p1Pv+0x24>
    80002250:	fc1ff06f          	j	80002210 <_Z2p1Pv+0x1c>
    }
    bool finishedP1 = true;
}
    80002254:	01813083          	ld	ra,24(sp)
    80002258:	01013403          	ld	s0,16(sp)
    8000225c:	00813483          	ld	s1,8(sp)
    80002260:	02010113          	addi	sp,sp,32
    80002264:	00008067          	ret

0000000080002268 <_Z2p2Pv>:

void p2(void *) {
    80002268:	fe010113          	addi	sp,sp,-32
    8000226c:	00113c23          	sd	ra,24(sp)
    80002270:	00813823          	sd	s0,16(sp)
    80002274:	00913423          	sd	s1,8(sp)
    80002278:	02010413          	addi	s0,sp,32
    for(int i  = 10; i > 0; --i) {
    8000227c:	00a00493          	li	s1,10
    80002280:	0340006f          	j	800022b4 <_Z2p2Pv+0x4c>
        if(i == 5){
            Thread::dispatch();
    80002284:	00001097          	auipc	ra,0x1
    80002288:	9bc080e7          	jalr	-1604(ra) # 80002c40 <_ZN6Thread8dispatchEv>
        }
        printInt(i, 10, 0);
    8000228c:	00000613          	li	a2,0
    80002290:	00a00593          	li	a1,10
    80002294:	00048513          	mv	a0,s1
    80002298:	fffff097          	auipc	ra,0xfffff
    8000229c:	32c080e7          	jalr	812(ra) # 800015c4 <_Z8printIntiii>
        printString("\n");
    800022a0:	00004517          	auipc	a0,0x4
    800022a4:	ec050513          	addi	a0,a0,-320 # 80006160 <CONSOLE_STATUS+0x150>
    800022a8:	fffff097          	auipc	ra,0xfffff
    800022ac:	184080e7          	jalr	388(ra) # 8000142c <_Z11printStringPKc>
    for(int i  = 10; i > 0; --i) {
    800022b0:	fff4849b          	addiw	s1,s1,-1
    800022b4:	00905863          	blez	s1,800022c4 <_Z2p2Pv+0x5c>
        if(i == 5){
    800022b8:	00500793          	li	a5,5
    800022bc:	fcf498e3          	bne	s1,a5,8000228c <_Z2p2Pv+0x24>
    800022c0:	fc5ff06f          	j	80002284 <_Z2p2Pv+0x1c>
    }
    finishedP2 = true;
    800022c4:	00100793          	li	a5,1
    800022c8:	00005717          	auipc	a4,0x5
    800022cc:	30f70423          	sb	a5,776(a4) # 800075d0 <finishedP2>
}
    800022d0:	01813083          	ld	ra,24(sp)
    800022d4:	01013403          	ld	s0,16(sp)
    800022d8:	00813483          	ld	s1,8(sp)
    800022dc:	02010113          	addi	sp,sp,32
    800022e0:	00008067          	ret

00000000800022e4 <main>:
    void run() override {
        p2(nullptr);
    }
};

void main() {
    800022e4:	fd010113          	addi	sp,sp,-48
    800022e8:	02113423          	sd	ra,40(sp)
    800022ec:	02813023          	sd	s0,32(sp)
    800022f0:	00913c23          	sd	s1,24(sp)
    800022f4:	01213823          	sd	s2,16(sp)
    800022f8:	03010413          	addi	s0,sp,48
    // postavljena adresa prekidne rutine u stvec
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r" (&Riscv::supervisorTrap) );
    800022fc:	00005797          	auipc	a5,0x5
    80002300:	2347b783          	ld	a5,564(a5) # 80007530 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002304:	10579073          	csrw	stvec,a5


   // changeMod();
    // Obavezno postaviti prvo fju main kao pocetnu nit
    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    80002308:	00000613          	li	a2,0
    8000230c:	00000593          	li	a1,0
    80002310:	fd840513          	addi	a0,s0,-40
    80002314:	fffff097          	auipc	ra,0xfffff
    80002318:	ef8080e7          	jalr	-264(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainThread;
    8000231c:	00005797          	auipc	a5,0x5
    80002320:	22c7b783          	ld	a5,556(a5) # 80007548 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002324:	fd843703          	ld	a4,-40(s0)
    80002328:	00e7b023          	sd	a4,0(a5)
 //   Thread* thr1 = new Thread(p1, nullptr);
//    Thread* thr2 = new Thread(p2, nullptr);
//
 //   thr1->start(); //thr2->start();

    Thread* t1 = new IzvedenaThread1();
    8000232c:	01000513          	li	a0,16
    80002330:	00000097          	auipc	ra,0x0
    80002334:	124080e7          	jalr	292(ra) # 80002454 <_Znwm>
    80002338:	00050493          	mv	s1,a0
    IzvedenaThread1():Thread() {}
    8000233c:	00001097          	auipc	ra,0x1
    80002340:	948080e7          	jalr	-1720(ra) # 80002c84 <_ZN6ThreadC1Ev>
    80002344:	00005797          	auipc	a5,0x5
    80002348:	19c78793          	addi	a5,a5,412 # 800074e0 <_ZTV15IzvedenaThread1+0x10>
    8000234c:	00f4b023          	sd	a5,0(s1)
//
   t1->start();
    80002350:	00048513          	mv	a0,s1
    80002354:	00001097          	auipc	ra,0x1
    80002358:	864080e7          	jalr	-1948(ra) # 80002bb8 <_ZN6Thread5startEv>
//    while(1) {
//        Thread::dispatch();
//    }
    //Thread::dispatch();

    while (!(finishedP1)) {
    8000235c:	00005797          	auipc	a5,0x5
    80002360:	2757c783          	lbu	a5,629(a5) # 800075d1 <finishedP1>
    80002364:	02079663          	bnez	a5,80002390 <main+0xac>
        Thread::dispatch();
    80002368:	00001097          	auipc	ra,0x1
    8000236c:	8d8080e7          	jalr	-1832(ra) # 80002c40 <_ZN6Thread8dispatchEv>
    80002370:	fedff06f          	j	8000235c <main+0x78>
    80002374:	00050913          	mv	s2,a0
    Thread* t1 = new IzvedenaThread1();
    80002378:	00048513          	mv	a0,s1
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	128080e7          	jalr	296(ra) # 800024a4 <_ZdlPv>
    80002384:	00090513          	mv	a0,s2
    80002388:	00006097          	auipc	ra,0x6
    8000238c:	340080e7          	jalr	832(ra) # 800086c8 <_Unwind_Resume>
    for (int i = 0; i < 31; ++i) {
        thread_dispatch();
    }*/


}
    80002390:	02813083          	ld	ra,40(sp)
    80002394:	02013403          	ld	s0,32(sp)
    80002398:	01813483          	ld	s1,24(sp)
    8000239c:	01013903          	ld	s2,16(sp)
    800023a0:	03010113          	addi	sp,sp,48
    800023a4:	00008067          	ret

00000000800023a8 <_ZN15IzvedenaThread1D1Ev>:
class IzvedenaThread1: public Thread {
    800023a8:	ff010113          	addi	sp,sp,-16
    800023ac:	00113423          	sd	ra,8(sp)
    800023b0:	00813023          	sd	s0,0(sp)
    800023b4:	01010413          	addi	s0,sp,16
    800023b8:	00005797          	auipc	a5,0x5
    800023bc:	12878793          	addi	a5,a5,296 # 800074e0 <_ZTV15IzvedenaThread1+0x10>
    800023c0:	00f53023          	sd	a5,0(a0)
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	6bc080e7          	jalr	1724(ra) # 80002a80 <_ZN6ThreadD1Ev>
    800023cc:	00813083          	ld	ra,8(sp)
    800023d0:	00013403          	ld	s0,0(sp)
    800023d4:	01010113          	addi	sp,sp,16
    800023d8:	00008067          	ret

00000000800023dc <_ZN15IzvedenaThread1D0Ev>:
    800023dc:	fe010113          	addi	sp,sp,-32
    800023e0:	00113c23          	sd	ra,24(sp)
    800023e4:	00813823          	sd	s0,16(sp)
    800023e8:	00913423          	sd	s1,8(sp)
    800023ec:	02010413          	addi	s0,sp,32
    800023f0:	00050493          	mv	s1,a0
    800023f4:	00005797          	auipc	a5,0x5
    800023f8:	0ec78793          	addi	a5,a5,236 # 800074e0 <_ZTV15IzvedenaThread1+0x10>
    800023fc:	00f53023          	sd	a5,0(a0)
    80002400:	00000097          	auipc	ra,0x0
    80002404:	680080e7          	jalr	1664(ra) # 80002a80 <_ZN6ThreadD1Ev>
    80002408:	00048513          	mv	a0,s1
    8000240c:	00000097          	auipc	ra,0x0
    80002410:	098080e7          	jalr	152(ra) # 800024a4 <_ZdlPv>
    80002414:	01813083          	ld	ra,24(sp)
    80002418:	01013403          	ld	s0,16(sp)
    8000241c:	00813483          	ld	s1,8(sp)
    80002420:	02010113          	addi	sp,sp,32
    80002424:	00008067          	ret

0000000080002428 <_ZN15IzvedenaThread13runEv>:
    void run() override {
    80002428:	ff010113          	addi	sp,sp,-16
    8000242c:	00113423          	sd	ra,8(sp)
    80002430:	00813023          	sd	s0,0(sp)
    80002434:	01010413          	addi	s0,sp,16
        p1(nullptr);
    80002438:	00000513          	li	a0,0
    8000243c:	00000097          	auipc	ra,0x0
    80002440:	db8080e7          	jalr	-584(ra) # 800021f4 <_Z2p1Pv>
    }
    80002444:	00813083          	ld	ra,8(sp)
    80002448:	00013403          	ld	s0,0(sp)
    8000244c:	01010113          	addi	sp,sp,16
    80002450:	00008067          	ret

0000000080002454 <_Znwm>:

void operator delete(void *p) noexcept { MemoryAllocator::getInstance()->myFree(p); }
void operator delete[](void *p) noexcept { MemoryAllocator::getInstance()->myFree(p); }
*/

void *operator new(uint64 n) { return mem_alloc(n); }
    80002454:	ff010113          	addi	sp,sp,-16
    80002458:	00113423          	sd	ra,8(sp)
    8000245c:	00813023          	sd	s0,0(sp)
    80002460:	01010413          	addi	s0,sp,16
    80002464:	fffff097          	auipc	ra,0xfffff
    80002468:	ce0080e7          	jalr	-800(ra) # 80001144 <_Z9mem_allocm>
    8000246c:	00813083          	ld	ra,8(sp)
    80002470:	00013403          	ld	s0,0(sp)
    80002474:	01010113          	addi	sp,sp,16
    80002478:	00008067          	ret

000000008000247c <_Znam>:
void *operator new[](uint64 n) { return mem_alloc(n); }
    8000247c:	ff010113          	addi	sp,sp,-16
    80002480:	00113423          	sd	ra,8(sp)
    80002484:	00813023          	sd	s0,0(sp)
    80002488:	01010413          	addi	s0,sp,16
    8000248c:	fffff097          	auipc	ra,0xfffff
    80002490:	cb8080e7          	jalr	-840(ra) # 80001144 <_Z9mem_allocm>
    80002494:	00813083          	ld	ra,8(sp)
    80002498:	00013403          	ld	s0,0(sp)
    8000249c:	01010113          	addi	sp,sp,16
    800024a0:	00008067          	ret

00000000800024a4 <_ZdlPv>:

void operator delete(void *p) noexcept { mem_free(p); }
    800024a4:	ff010113          	addi	sp,sp,-16
    800024a8:	00113423          	sd	ra,8(sp)
    800024ac:	00813023          	sd	s0,0(sp)
    800024b0:	01010413          	addi	s0,sp,16
    800024b4:	fffff097          	auipc	ra,0xfffff
    800024b8:	d28080e7          	jalr	-728(ra) # 800011dc <_Z8mem_freePv>
    800024bc:	00813083          	ld	ra,8(sp)
    800024c0:	00013403          	ld	s0,0(sp)
    800024c4:	01010113          	addi	sp,sp,16
    800024c8:	00008067          	ret

00000000800024cc <_ZdaPv>:
void operator delete[](void *p) noexcept { mem_free(p); }
    800024cc:	ff010113          	addi	sp,sp,-16
    800024d0:	00113423          	sd	ra,8(sp)
    800024d4:	00813023          	sd	s0,0(sp)
    800024d8:	01010413          	addi	s0,sp,16
    800024dc:	fffff097          	auipc	ra,0xfffff
    800024e0:	d00080e7          	jalr	-768(ra) # 800011dc <_Z8mem_freePv>
    800024e4:	00813083          	ld	ra,8(sp)
    800024e8:	00013403          	ld	s0,0(sp)
    800024ec:	01010113          	addi	sp,sp,16
    800024f0:	00008067          	ret

00000000800024f4 <_ZN3TCB15createFromStartEPFvPvE>:


uint64 TCB::timeSliceCounter = 0;


TCB *TCB::createFromStart(TCB::Body body) {
    800024f4:	fe010113          	addi	sp,sp,-32
    800024f8:	00113c23          	sd	ra,24(sp)
    800024fc:	00813823          	sd	s0,16(sp)
    80002500:	00913423          	sd	s1,8(sp)
    80002504:	01213023          	sd	s2,0(sp)
    80002508:	02010413          	addi	s0,sp,32
    8000250c:	00050913          	mv	s2,a0
    void split(struct metaData *fitting_slot,size_t size);

public:
    static MemoryAllocator* getInstance(){
        // using static variable
        static MemoryAllocator instance;
    80002510:	00005797          	auipc	a5,0x5
    80002514:	0907c783          	lbu	a5,144(a5) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80002518:	04079663          	bnez	a5,80002564 <_ZN3TCB15createFromStartEPFvPvE+0x70>
        freeList=(struct metaData*)HEAP_START_ADDR;
    8000251c:	00005797          	auipc	a5,0x5
    80002520:	00c7b783          	ld	a5,12(a5) # 80007528 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002524:	0007b703          	ld	a4,0(a5)
    80002528:	00005697          	auipc	a3,0x5
    8000252c:	08068693          	addi	a3,a3,128 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002530:	00e6b023          	sd	a4,0(a3)
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
    80002534:	00005797          	auipc	a5,0x5
    80002538:	01c7b783          	ld	a5,28(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000253c:	0007b783          	ld	a5,0(a5)
    80002540:	40e787b3          	sub	a5,a5,a4
    80002544:	fe878793          	addi	a5,a5,-24
    80002548:	00f73023          	sd	a5,0(a4)
        freeList->free = 1;
    8000254c:	0006b703          	ld	a4,0(a3)
    80002550:	00100793          	li	a5,1
    80002554:	00f72423          	sw	a5,8(a4)
        freeList->next = 0;
    80002558:	00073823          	sd	zero,16(a4)
        static MemoryAllocator instance;
    8000255c:	00005717          	auipc	a4,0x5
    80002560:	04f70223          	sb	a5,68(a4) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    void *stack_space = MemoryAllocator::getInstance()->myMalloc(DEFAULT_STACK_SIZE*sizeof(uint64));
    80002564:	000085b7          	lui	a1,0x8
    80002568:	00005517          	auipc	a0,0x5
    8000256c:	04050513          	addi	a0,a0,64 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002570:	00000097          	auipc	ra,0x0
    80002574:	37c080e7          	jalr	892(ra) # 800028ec <_ZN15MemoryAllocator8myMallocEm>
    80002578:	00050493          	mv	s1,a0
    void *arg = nullptr;
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    8000257c:	03800513          	li	a0,56
    80002580:	00000097          	auipc	ra,0x0
    80002584:	ed4080e7          	jalr	-300(ra) # 80002454 <_Znwm>
    static TCB *running;

private:
   // TCB(Body body, uint64 timeSlice);
     TCB(Body body, uint64 timeSlice, void *arg, void* stack_space) :
        body(body)
    80002588:	01253423          	sd	s2,8(a0)
    {
       this->arg = arg;
    8000258c:	00053023          	sd	zero,0(a0)
       // UMESTO new uint64[STACK_SIZE] -> (uint64*)MemoryAllocator::getInstance()->myMalloc(STACK_SIZE*sizeof(uint64)) RADI
       //stack = body != nullptr ? new uint64[STACK_SIZE] : nullptr;

       //stack = body != nullptr ? (uint64*)__mem_alloc(STACK_SIZE) : nullptr;
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    80002590:	04090663          	beqz	s2,800025dc <_ZN3TCB15createFromStartEPFvPvE+0xe8>
    80002594:	00953823          	sd	s1,16(a0)

        //******* new?

        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80002598:	04048863          	beqz	s1,800025e8 <_ZN3TCB15createFromStartEPFvPvE+0xf4>
    8000259c:	000087b7          	lui	a5,0x8
    800025a0:	00f484b3          	add	s1,s1,a5
    800025a4:	00000797          	auipc	a5,0x0
    800025a8:	20078793          	addi	a5,a5,512 # 800027a4 <_ZN3TCB13threadWrapperEPv>
    800025ac:	00f53c23          	sd	a5,24(a0)
    800025b0:	02953023          	sd	s1,32(a0)

        this->timeSlice = DEFAULT_TIME_SLICE;
    800025b4:	00200793          	li	a5,2
    800025b8:	02f53423          	sd	a5,40(a0)
        finished = false;
    800025bc:	02050823          	sb	zero,48(a0)
        suspended = false;
    800025c0:	020508a3          	sb	zero,49(a0)
    return ret;
}
    800025c4:	01813083          	ld	ra,24(sp)
    800025c8:	01013403          	ld	s0,16(sp)
    800025cc:	00813483          	ld	s1,8(sp)
    800025d0:	00013903          	ld	s2,0(sp)
    800025d4:	02010113          	addi	sp,sp,32
    800025d8:	00008067          	ret
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    800025dc:	00053823          	sd	zero,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    800025e0:	00000493          	li	s1,0
    800025e4:	fc1ff06f          	j	800025a4 <_ZN3TCB15createFromStartEPFvPvE+0xb0>
    800025e8:	00000493          	li	s1,0
    800025ec:	fb9ff06f          	j	800025a4 <_ZN3TCB15createFromStartEPFvPvE+0xb0>

00000000800025f0 <_ZN3TCB9createTCBEPFvPvES0_S0_>:

TCB *TCB::createTCB(TCB::Body body, void *arg, void *stack_space) {
    800025f0:	fd010113          	addi	sp,sp,-48
    800025f4:	02113423          	sd	ra,40(sp)
    800025f8:	02813023          	sd	s0,32(sp)
    800025fc:	00913c23          	sd	s1,24(sp)
    80002600:	01213823          	sd	s2,16(sp)
    80002604:	01313423          	sd	s3,8(sp)
    80002608:	03010413          	addi	s0,sp,48
    8000260c:	00050913          	mv	s2,a0
    80002610:	00058993          	mv	s3,a1
    80002614:	00060493          	mv	s1,a2
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    80002618:	03800513          	li	a0,56
    8000261c:	00000097          	auipc	ra,0x0
    80002620:	e38080e7          	jalr	-456(ra) # 80002454 <_Znwm>
        body(body)
    80002624:	01253423          	sd	s2,8(a0)
       this->arg = arg;
    80002628:	01353023          	sd	s3,0(a0)
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    8000262c:	04090863          	beqz	s2,8000267c <_ZN3TCB9createTCBEPFvPvES0_S0_+0x8c>
    80002630:	00953823          	sd	s1,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80002634:	04048a63          	beqz	s1,80002688 <_ZN3TCB9createTCBEPFvPvES0_S0_+0x98>
    80002638:	00008637          	lui	a2,0x8
    8000263c:	00c484b3          	add	s1,s1,a2
    80002640:	00000797          	auipc	a5,0x0
    80002644:	16478793          	addi	a5,a5,356 # 800027a4 <_ZN3TCB13threadWrapperEPv>
    80002648:	00f53c23          	sd	a5,24(a0)
    8000264c:	02953023          	sd	s1,32(a0)
        this->timeSlice = DEFAULT_TIME_SLICE;
    80002650:	00200793          	li	a5,2
    80002654:	02f53423          	sd	a5,40(a0)
        finished = false;
    80002658:	02050823          	sb	zero,48(a0)
        suspended = false;
    8000265c:	020508a3          	sb	zero,49(a0)
    return ret;
}
    80002660:	02813083          	ld	ra,40(sp)
    80002664:	02013403          	ld	s0,32(sp)
    80002668:	01813483          	ld	s1,24(sp)
    8000266c:	01013903          	ld	s2,16(sp)
    80002670:	00813983          	ld	s3,8(sp)
    80002674:	03010113          	addi	sp,sp,48
    80002678:	00008067          	ret
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    8000267c:	00053823          	sd	zero,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80002680:	00000493          	li	s1,0
    80002684:	fbdff06f          	j	80002640 <_ZN3TCB9createTCBEPFvPvES0_S0_+0x50>
    80002688:	00000493          	li	s1,0
    8000268c:	fb5ff06f          	j	80002640 <_ZN3TCB9createTCBEPFvPvES0_S0_+0x50>

0000000080002690 <_ZN3TCB13putTCBinQueueEPS_>:
       // if (body != nullptr) { Scheduler::put(this); }
    }


    void putInQueue(TCB *tcb){
        if (body != nullptr) { Scheduler::put(this); }
    80002690:	0085b783          	ld	a5,8(a1) # 8008 <_entry-0x7fff7ff8>
    80002694:	02078863          	beqz	a5,800026c4 <_ZN3TCB13putTCBinQueueEPS_+0x34>

void TCB::putTCBinQueue(TCB *tcb) {
    80002698:	ff010113          	addi	sp,sp,-16
    8000269c:	00113423          	sd	ra,8(sp)
    800026a0:	00813023          	sd	s0,0(sp)
    800026a4:	01010413          	addi	s0,sp,16
    800026a8:	00058513          	mv	a0,a1
    800026ac:	00001097          	auipc	ra,0x1
    800026b0:	f18080e7          	jalr	-232(ra) # 800035c4 <_ZN9Scheduler3putEP3TCB>
    tcb->putInQueue(tcb);
}
    800026b4:	00813083          	ld	ra,8(sp)
    800026b8:	00013403          	ld	s0,0(sp)
    800026bc:	01010113          	addi	sp,sp,16
    800026c0:	00008067          	ret
    800026c4:	00008067          	ret

00000000800026c8 <_ZN3TCB12createThreadEPFvPvES0_S0_>:

TCB *TCB::createThread(Body body, void *arg, void* stack_space) {
    800026c8:	fd010113          	addi	sp,sp,-48
    800026cc:	02113423          	sd	ra,40(sp)
    800026d0:	02813023          	sd	s0,32(sp)
    800026d4:	00913c23          	sd	s1,24(sp)
    800026d8:	01213823          	sd	s2,16(sp)
    800026dc:	01313423          	sd	s3,8(sp)
    800026e0:	01413023          	sd	s4,0(sp)
    800026e4:	03010413          	addi	s0,sp,48
    800026e8:	00050993          	mv	s3,a0
    800026ec:	00058a13          	mv	s4,a1
    800026f0:	00060913          	mv	s2,a2
//    return (TCB*)MemoryAllocator::getInstance()->myMalloc(sizeof)
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    800026f4:	03800513          	li	a0,56
    800026f8:	00000097          	auipc	ra,0x0
    800026fc:	d5c080e7          	jalr	-676(ra) # 80002454 <_Znwm>
    80002700:	00050493          	mv	s1,a0
        body(body)
    80002704:	01353423          	sd	s3,8(a0)
       this->arg = arg;
    80002708:	01453023          	sd	s4,0(a0)
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    8000270c:	06098463          	beqz	s3,80002774 <_ZN3TCB12createThreadEPFvPvES0_S0_+0xac>
    80002710:	01253823          	sd	s2,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80002714:	06090663          	beqz	s2,80002780 <_ZN3TCB12createThreadEPFvPvES0_S0_+0xb8>
    80002718:	00008637          	lui	a2,0x8
    8000271c:	00c90933          	add	s2,s2,a2
    80002720:	00000797          	auipc	a5,0x0
    80002724:	08478793          	addi	a5,a5,132 # 800027a4 <_ZN3TCB13threadWrapperEPv>
    80002728:	00f4bc23          	sd	a5,24(s1)
    8000272c:	0324b023          	sd	s2,32(s1)
        this->timeSlice = DEFAULT_TIME_SLICE;
    80002730:	00200793          	li	a5,2
    80002734:	02f4b423          	sd	a5,40(s1)
        finished = false;
    80002738:	02048823          	sb	zero,48(s1)
        suspended = false;
    8000273c:	020488a3          	sb	zero,49(s1)
        if (body != nullptr) { Scheduler::put(this); }
    80002740:	00098863          	beqz	s3,80002750 <_ZN3TCB12createThreadEPFvPvES0_S0_+0x88>
    80002744:	00048513          	mv	a0,s1
    80002748:	00001097          	auipc	ra,0x1
    8000274c:	e7c080e7          	jalr	-388(ra) # 800035c4 <_ZN9Scheduler3putEP3TCB>
    ret->putInQueue(ret);
    return ret;
}
    80002750:	00048513          	mv	a0,s1
    80002754:	02813083          	ld	ra,40(sp)
    80002758:	02013403          	ld	s0,32(sp)
    8000275c:	01813483          	ld	s1,24(sp)
    80002760:	01013903          	ld	s2,16(sp)
    80002764:	00813983          	ld	s3,8(sp)
    80002768:	00013a03          	ld	s4,0(sp)
    8000276c:	03010113          	addi	sp,sp,48
    80002770:	00008067          	ret
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    80002774:	00053823          	sd	zero,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80002778:	00000913          	li	s2,0
    8000277c:	fa5ff06f          	j	80002720 <_ZN3TCB12createThreadEPFvPvES0_S0_+0x58>
    80002780:	00000913          	li	s2,0
    80002784:	f9dff06f          	j	80002720 <_ZN3TCB12createThreadEPFvPvES0_S0_+0x58>

0000000080002788 <_ZN3TCB5yieldEv>:

void TCB::yield() { __asm__ volatile ("ecall"); }
    80002788:	ff010113          	addi	sp,sp,-16
    8000278c:	00813423          	sd	s0,8(sp)
    80002790:	01010413          	addi	s0,sp,16
    80002794:	00000073          	ecall
    80002798:	00813403          	ld	s0,8(sp)
    8000279c:	01010113          	addi	sp,sp,16
    800027a0:	00008067          	ret

00000000800027a4 <_ZN3TCB13threadWrapperEPv>:
    running = Scheduler::get();

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper(void *arg) {
    800027a4:	fe010113          	addi	sp,sp,-32
    800027a8:	00113c23          	sd	ra,24(sp)
    800027ac:	00813823          	sd	s0,16(sp)
    800027b0:	00913423          	sd	s1,8(sp)
    800027b4:	01213023          	sd	s2,0(sp)
    800027b8:	02010413          	addi	s0,sp,32
    800027bc:	00050493          	mv	s1,a0
    // Mozda ovde treba ubaciti run, vrv ne
    // Ovo clear-uje SPP registar (SPP = 0 -> korisnicki rezim)
    //Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    Riscv::popSppSpie();
    800027c0:	00000097          	auipc	ra,0x0
    800027c4:	504080e7          	jalr	1284(ra) # 80002cc4 <_ZN5Riscv10popSppSpieEv>
    running->body(arg);
    800027c8:	00005917          	auipc	s2,0x5
    800027cc:	e1090913          	addi	s2,s2,-496 # 800075d8 <_ZN3TCB7runningE>
    800027d0:	00093783          	ld	a5,0(s2)
    800027d4:	0087b783          	ld	a5,8(a5)
    800027d8:	00048513          	mv	a0,s1
    800027dc:	000780e7          	jalr	a5
    running->setFinished(true);
    800027e0:	00093783          	ld	a5,0(s2)
    void setFinished(bool value) { finished = value; }
    800027e4:	00100713          	li	a4,1
    800027e8:	02e78823          	sb	a4,48(a5)
    TCB::yield();
    800027ec:	00000097          	auipc	ra,0x0
    800027f0:	f9c080e7          	jalr	-100(ra) # 80002788 <_ZN3TCB5yieldEv>
}
    800027f4:	01813083          	ld	ra,24(sp)
    800027f8:	01013403          	ld	s0,16(sp)
    800027fc:	00813483          	ld	s1,8(sp)
    80002800:	00013903          	ld	s2,0(sp)
    80002804:	02010113          	addi	sp,sp,32
    80002808:	00008067          	ret

000000008000280c <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    8000280c:	fe010113          	addi	sp,sp,-32
    80002810:	00113c23          	sd	ra,24(sp)
    80002814:	00813823          	sd	s0,16(sp)
    80002818:	00913423          	sd	s1,8(sp)
    8000281c:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80002820:	00005497          	auipc	s1,0x5
    80002824:	db84b483          	ld	s1,-584(s1) # 800075d8 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    80002828:	0304c783          	lbu	a5,48(s1)
    if (!old->isFinished() && !old->isSuspended()) { Scheduler::put(old); }
    8000282c:	00079663          	bnez	a5,80002838 <_ZN3TCB8dispatchEv+0x2c>
    bool isSuspended() const { return suspended; }
    80002830:	0314c703          	lbu	a4,49(s1)
    80002834:	04070e63          	beqz	a4,80002890 <_ZN3TCB8dispatchEv+0x84>
    else if(old->isFinished()) {
    80002838:	02078263          	beqz	a5,8000285c <_ZN3TCB8dispatchEv+0x50>
        delete old;
    8000283c:	02048063          	beqz	s1,8000285c <_ZN3TCB8dispatchEv+0x50>
    ~TCB() { delete[] stack;
    80002840:	0104b503          	ld	a0,16(s1)
    80002844:	00050663          	beqz	a0,80002850 <_ZN3TCB8dispatchEv+0x44>
    80002848:	00000097          	auipc	ra,0x0
    8000284c:	c84080e7          	jalr	-892(ra) # 800024cc <_ZdaPv>
    80002850:	00048513          	mv	a0,s1
    80002854:	00000097          	auipc	ra,0x0
    80002858:	c50080e7          	jalr	-944(ra) # 800024a4 <_ZdlPv>
    running = Scheduler::get();
    8000285c:	00001097          	auipc	ra,0x1
    80002860:	d00080e7          	jalr	-768(ra) # 8000355c <_ZN9Scheduler3getEv>
    80002864:	00005797          	auipc	a5,0x5
    80002868:	d6a7ba23          	sd	a0,-652(a5) # 800075d8 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    8000286c:	01850593          	addi	a1,a0,24
    80002870:	01848513          	addi	a0,s1,24
    80002874:	fffff097          	auipc	ra,0xfffff
    80002878:	8bc080e7          	jalr	-1860(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    8000287c:	01813083          	ld	ra,24(sp)
    80002880:	01013403          	ld	s0,16(sp)
    80002884:	00813483          	ld	s1,8(sp)
    80002888:	02010113          	addi	sp,sp,32
    8000288c:	00008067          	ret
    if (!old->isFinished() && !old->isSuspended()) { Scheduler::put(old); }
    80002890:	00048513          	mv	a0,s1
    80002894:	00001097          	auipc	ra,0x1
    80002898:	d30080e7          	jalr	-720(ra) # 800035c4 <_ZN9Scheduler3putEP3TCB>
    8000289c:	fc1ff06f          	j	8000285c <_ZN3TCB8dispatchEv+0x50>

00000000800028a0 <_ZN15MemoryAllocator5splitEPNS_8metaDataEm>:
        return result;
    }

}

void MemoryAllocator::split(struct metaData *fitting_slot,size_t size){
    800028a0:	ff010113          	addi	sp,sp,-16
    800028a4:	00813423          	sd	s0,8(sp)
    800028a8:	01010413          	addi	s0,sp,16

    struct metaData *newBlock = (struct metaData*)((char *)fitting_slot + size + sizeof(struct metaData));
    800028ac:	01860793          	addi	a5,a2,24 # 8018 <_entry-0x7fff7fe8>
    800028b0:	00f587b3          	add	a5,a1,a5
    newBlock->size = (fitting_slot->size)-size-sizeof(struct metaData);
    800028b4:	0005b703          	ld	a4,0(a1)
    800028b8:	40c70733          	sub	a4,a4,a2
    800028bc:	fe870713          	addi	a4,a4,-24
    800028c0:	00e7b023          	sd	a4,0(a5)
    newBlock->free = 1;
    800028c4:	00100713          	li	a4,1
    800028c8:	00e7a423          	sw	a4,8(a5)
    newBlock->next=fitting_slot->next;
    800028cc:	0105b703          	ld	a4,16(a1)
    800028d0:	00e7b823          	sd	a4,16(a5)
    fitting_slot->size = size;
    800028d4:	00c5b023          	sd	a2,0(a1)
    fitting_slot->free = 0;
    800028d8:	0005a423          	sw	zero,8(a1)
    fitting_slot->next = newBlock;
    800028dc:	00f5b823          	sd	a5,16(a1)
}
    800028e0:	00813403          	ld	s0,8(sp)
    800028e4:	01010113          	addi	sp,sp,16
    800028e8:	00008067          	ret

00000000800028ec <_ZN15MemoryAllocator8myMallocEm>:
void* MemoryAllocator::myMalloc(size_t noOfBlocks){
    800028ec:	fe010113          	addi	sp,sp,-32
    800028f0:	00113c23          	sd	ra,24(sp)
    800028f4:	00813823          	sd	s0,16(sp)
    800028f8:	00913423          	sd	s1,8(sp)
    800028fc:	02010413          	addi	s0,sp,32

class MemoryAllocator {
private:

    int countSizeBytes(int blockNum){
        return blockNum * MEM_BLOCK_SIZE;
    80002900:	0065959b          	slliw	a1,a1,0x6
    curr = freeList;
    80002904:	00053483          	ld	s1,0(a0)
    80002908:	0100006f          	j	80002918 <_ZN15MemoryAllocator8myMallocEm+0x2c>
    while( ( ( (curr->size) < noOfBytes) || ( (curr->free) == 0) ) && (curr->next != 0) ){
    8000290c:	0104b783          	ld	a5,16(s1)
    80002910:	00078e63          	beqz	a5,8000292c <_ZN15MemoryAllocator8myMallocEm+0x40>
        curr=curr->next;
    80002914:	00078493          	mv	s1,a5
    while( ( ( (curr->size) < noOfBytes) || ( (curr->free) == 0) ) && (curr->next != 0) ){
    80002918:	0004b703          	ld	a4,0(s1)
    8000291c:	00058613          	mv	a2,a1
    80002920:	feb766e3          	bltu	a4,a1,8000290c <_ZN15MemoryAllocator8myMallocEm+0x20>
    80002924:	0084a783          	lw	a5,8(s1)
    80002928:	fe0782e3          	beqz	a5,8000290c <_ZN15MemoryAllocator8myMallocEm+0x20>
    if((curr->size)==noOfBytes && curr->free){
    8000292c:	02c70c63          	beq	a4,a2,80002964 <_ZN15MemoryAllocator8myMallocEm+0x78>
    else if((curr->size)>(noOfBytes+sizeof(struct metaData)) && curr->free){
    80002930:	01860793          	addi	a5,a2,24
    80002934:	04e7f263          	bgeu	a5,a4,80002978 <_ZN15MemoryAllocator8myMallocEm+0x8c>
    80002938:	0084a783          	lw	a5,8(s1)
    8000293c:	04078263          	beqz	a5,80002980 <_ZN15MemoryAllocator8myMallocEm+0x94>
        split(curr,noOfBytes);
    80002940:	00048593          	mv	a1,s1
    80002944:	00000097          	auipc	ra,0x0
    80002948:	f5c080e7          	jalr	-164(ra) # 800028a0 <_ZN15MemoryAllocator5splitEPNS_8metaDataEm>
        result=(void*)(++curr);
    8000294c:	01848513          	addi	a0,s1,24
}
    80002950:	01813083          	ld	ra,24(sp)
    80002954:	01013403          	ld	s0,16(sp)
    80002958:	00813483          	ld	s1,8(sp)
    8000295c:	02010113          	addi	sp,sp,32
    80002960:	00008067          	ret
    if((curr->size)==noOfBytes && curr->free){
    80002964:	0084a783          	lw	a5,8(s1)
    80002968:	fc0784e3          	beqz	a5,80002930 <_ZN15MemoryAllocator8myMallocEm+0x44>
        curr->free=0;
    8000296c:	0004a423          	sw	zero,8(s1)
        result=(void*)(++curr);
    80002970:	01848513          	addi	a0,s1,24
        return result;
    80002974:	fddff06f          	j	80002950 <_ZN15MemoryAllocator8myMallocEm+0x64>
        return result;
    80002978:	00000513          	li	a0,0
    8000297c:	fd5ff06f          	j	80002950 <_ZN15MemoryAllocator8myMallocEm+0x64>
    80002980:	00000513          	li	a0,0
    80002984:	fcdff06f          	j	80002950 <_ZN15MemoryAllocator8myMallocEm+0x64>

0000000080002988 <_ZN15MemoryAllocator5mergeEv>:
       // printString("\nAdresa nije u validnom opsegu");
        return -1;
    }
}

void MemoryAllocator::merge() {
    80002988:	ff010113          	addi	sp,sp,-16
    8000298c:	00813423          	sd	s0,8(sp)
    80002990:	01010413          	addi	s0,sp,16
    struct metaData* temp = freeList;
    80002994:	00053783          	ld	a5,0(a0)
    80002998:	0080006f          	j	800029a0 <_ZN15MemoryAllocator5mergeEv+0x18>
    while(temp && temp->next) {
        if(temp->free && temp->next->free){
            temp->size = temp->size + sizeof(struct metaData) + temp->next->size;
            temp->next = temp->next->next; // prevezani
        }
        temp = temp->next;
    8000299c:	0107b783          	ld	a5,16(a5)
    while(temp && temp->next) {
    800029a0:	02078e63          	beqz	a5,800029dc <_ZN15MemoryAllocator5mergeEv+0x54>
    800029a4:	0107b703          	ld	a4,16(a5)
    800029a8:	02070a63          	beqz	a4,800029dc <_ZN15MemoryAllocator5mergeEv+0x54>
        if(temp->free && temp->next->free){
    800029ac:	0087a683          	lw	a3,8(a5)
    800029b0:	fe0686e3          	beqz	a3,8000299c <_ZN15MemoryAllocator5mergeEv+0x14>
    800029b4:	00872683          	lw	a3,8(a4)
    800029b8:	fe0682e3          	beqz	a3,8000299c <_ZN15MemoryAllocator5mergeEv+0x14>
            temp->size = temp->size + sizeof(struct metaData) + temp->next->size;
    800029bc:	0007b683          	ld	a3,0(a5)
    800029c0:	00073603          	ld	a2,0(a4)
    800029c4:	00c686b3          	add	a3,a3,a2
    800029c8:	01868693          	addi	a3,a3,24
    800029cc:	00d7b023          	sd	a3,0(a5)
            temp->next = temp->next->next; // prevezani
    800029d0:	01073703          	ld	a4,16(a4)
    800029d4:	00e7b823          	sd	a4,16(a5)
    800029d8:	fc5ff06f          	j	8000299c <_ZN15MemoryAllocator5mergeEv+0x14>
    }
    800029dc:	00813403          	ld	s0,8(sp)
    800029e0:	01010113          	addi	sp,sp,16
    800029e4:	00008067          	ret

00000000800029e8 <_ZN15MemoryAllocator6myFreeEPv>:
    if((char*)ptr >= (char*)HEAP_START_ADDR && ptr < (char*)HEAP_END_ADDR){
    800029e8:	00005797          	auipc	a5,0x5
    800029ec:	b407b783          	ld	a5,-1216(a5) # 80007528 <_GLOBAL_OFFSET_TABLE_+0x8>
    800029f0:	0007b783          	ld	a5,0(a5)
    800029f4:	04f5e463          	bltu	a1,a5,80002a3c <_ZN15MemoryAllocator6myFreeEPv+0x54>
    800029f8:	00005797          	auipc	a5,0x5
    800029fc:	b587b783          	ld	a5,-1192(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002a00:	0007b783          	ld	a5,0(a5)
    80002a04:	04f5f063          	bgeu	a1,a5,80002a44 <_ZN15MemoryAllocator6myFreeEPv+0x5c>
int MemoryAllocator::myFree(void *ptr) {
    80002a08:	ff010113          	addi	sp,sp,-16
    80002a0c:	00113423          	sd	ra,8(sp)
    80002a10:	00813023          	sd	s0,0(sp)
    80002a14:	01010413          	addi	s0,sp,16
        curr->free = 1;
    80002a18:	00100793          	li	a5,1
    80002a1c:	fef5a823          	sw	a5,-16(a1)
        merge();
    80002a20:	00000097          	auipc	ra,0x0
    80002a24:	f68080e7          	jalr	-152(ra) # 80002988 <_ZN15MemoryAllocator5mergeEv>
        return 0;
    80002a28:	00000513          	li	a0,0
}
    80002a2c:	00813083          	ld	ra,8(sp)
    80002a30:	00013403          	ld	s0,0(sp)
    80002a34:	01010113          	addi	sp,sp,16
    80002a38:	00008067          	ret
        return -1;
    80002a3c:	fff00513          	li	a0,-1
    80002a40:	00008067          	ret
    80002a44:	fff00513          	li	a0,-1
}
    80002a48:	00008067          	ret

0000000080002a4c <_ZN6Thread7starterEPv>:
Thread::Thread() : myHandle(nullptr) {}

void Thread::starter(void* toStart) {
    //printString("\nSTARTER\n");
    Thread* t = (Thread*)toStart;
    if(t) t->run();
    80002a4c:	02050863          	beqz	a0,80002a7c <_ZN6Thread7starterEPv+0x30>
void Thread::starter(void* toStart) {
    80002a50:	ff010113          	addi	sp,sp,-16
    80002a54:	00113423          	sd	ra,8(sp)
    80002a58:	00813023          	sd	s0,0(sp)
    80002a5c:	01010413          	addi	s0,sp,16
    if(t) t->run();
    80002a60:	00053783          	ld	a5,0(a0)
    80002a64:	0107b783          	ld	a5,16(a5)
    80002a68:	000780e7          	jalr	a5
    80002a6c:	00813083          	ld	ra,8(sp)
    80002a70:	00013403          	ld	s0,0(sp)
    80002a74:	01010113          	addi	sp,sp,16
    80002a78:	00008067          	ret
    80002a7c:	00008067          	ret

0000000080002a80 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80002a80:	fe010113          	addi	sp,sp,-32
    80002a84:	00113c23          	sd	ra,24(sp)
    80002a88:	00813823          	sd	s0,16(sp)
    80002a8c:	00913423          	sd	s1,8(sp)
    80002a90:	02010413          	addi	s0,sp,32
    80002a94:	00005797          	auipc	a5,0x5
    80002a98:	a7478793          	addi	a5,a5,-1420 # 80007508 <_ZTV6Thread+0x10>
    80002a9c:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    80002aa0:	00853483          	ld	s1,8(a0)
    80002aa4:	02048063          	beqz	s1,80002ac4 <_ZN6ThreadD1Ev+0x44>



    static void dispatch();

    ~TCB() { delete[] stack;
    80002aa8:	0104b503          	ld	a0,16(s1)
    80002aac:	00050663          	beqz	a0,80002ab8 <_ZN6ThreadD1Ev+0x38>
    80002ab0:	00000097          	auipc	ra,0x0
    80002ab4:	a1c080e7          	jalr	-1508(ra) # 800024cc <_ZdaPv>
    80002ab8:	00048513          	mv	a0,s1
    80002abc:	00000097          	auipc	ra,0x0
    80002ac0:	9e8080e7          	jalr	-1560(ra) # 800024a4 <_ZdlPv>
}
    80002ac4:	01813083          	ld	ra,24(sp)
    80002ac8:	01013403          	ld	s0,16(sp)
    80002acc:	00813483          	ld	s1,8(sp)
    80002ad0:	02010113          	addi	sp,sp,32
    80002ad4:	00008067          	ret

0000000080002ad8 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002ad8:	fe010113          	addi	sp,sp,-32
    80002adc:	00113c23          	sd	ra,24(sp)
    80002ae0:	00813823          	sd	s0,16(sp)
    80002ae4:	00913423          	sd	s1,8(sp)
    80002ae8:	02010413          	addi	s0,sp,32
    80002aec:	00050493          	mv	s1,a0
}
    80002af0:	00000097          	auipc	ra,0x0
    80002af4:	f90080e7          	jalr	-112(ra) # 80002a80 <_ZN6ThreadD1Ev>
    80002af8:	00048513          	mv	a0,s1
    80002afc:	00000097          	auipc	ra,0x0
    80002b00:	9a8080e7          	jalr	-1624(ra) # 800024a4 <_ZdlPv>
    80002b04:	01813083          	ld	ra,24(sp)
    80002b08:	01013403          	ld	s0,16(sp)
    80002b0c:	00813483          	ld	s1,8(sp)
    80002b10:	02010113          	addi	sp,sp,32
    80002b14:	00008067          	ret

0000000080002b18 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002b18:	fc010113          	addi	sp,sp,-64
    80002b1c:	02113c23          	sd	ra,56(sp)
    80002b20:	02813823          	sd	s0,48(sp)
    80002b24:	02913423          	sd	s1,40(sp)
    80002b28:	03213023          	sd	s2,32(sp)
    80002b2c:	01313c23          	sd	s3,24(sp)
    80002b30:	01413823          	sd	s4,16(sp)
    80002b34:	04010413          	addi	s0,sp,64
    80002b38:	00050913          	mv	s2,a0
    80002b3c:	00058993          	mv	s3,a1
    80002b40:	00060a13          	mv	s4,a2
    80002b44:	00005797          	auipc	a5,0x5
    80002b48:	9c478793          	addi	a5,a5,-1596 # 80007508 <_ZTV6Thread+0x10>
    80002b4c:	00f53023          	sd	a5,0(a0)
    __asm__ volatile ("csrw stval, %[stval]" : : [stval] "r" (stval));
}

inline uint64 Riscv::r_sstatus()  {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002b50:	100027f3          	csrr	a5,sstatus
    80002b54:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002b58:	fc843483          	ld	s1,-56(s0)
inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80002b5c:	00200793          	li	a5,2
    80002b60:	1007b073          	csrc	sstatus,a5
    void *stack_space = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    80002b64:	00008537          	lui	a0,0x8
    80002b68:	ffffe097          	auipc	ra,0xffffe
    80002b6c:	5dc080e7          	jalr	1500(ra) # 80001144 <_Z9mem_allocm>
    80002b70:	00050613          	mv	a2,a0
    myHandle = TCB::createTCB(body, arg, stack_space);
    80002b74:	000a0593          	mv	a1,s4
    80002b78:	00098513          	mv	a0,s3
    80002b7c:	00000097          	auipc	ra,0x0
    80002b80:	a74080e7          	jalr	-1420(ra) # 800025f0 <_ZN3TCB9createTCBEPFvPvES0_S0_>
    80002b84:	00a93423          	sd	a0,8(s2)
    UMASK_INTR
    80002b88:	0004849b          	sext.w	s1,s1
    80002b8c:	0024f493          	andi	s1,s1,2
    80002b90:	0004849b          	sext.w	s1,s1
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
    80002b94:	1004a073          	csrs	sstatus,s1
}
    80002b98:	03813083          	ld	ra,56(sp)
    80002b9c:	03013403          	ld	s0,48(sp)
    80002ba0:	02813483          	ld	s1,40(sp)
    80002ba4:	02013903          	ld	s2,32(sp)
    80002ba8:	01813983          	ld	s3,24(sp)
    80002bac:	01013a03          	ld	s4,16(sp)
    80002bb0:	04010113          	addi	sp,sp,64
    80002bb4:	00008067          	ret

0000000080002bb8 <_ZN6Thread5startEv>:
int Thread::start() {
    80002bb8:	fe010113          	addi	sp,sp,-32
    80002bbc:	00113c23          	sd	ra,24(sp)
    80002bc0:	00813823          	sd	s0,16(sp)
    80002bc4:	00913423          	sd	s1,8(sp)
    80002bc8:	02010413          	addi	s0,sp,32
    80002bcc:	00050493          	mv	s1,a0
        if(myHandle == nullptr) {
    80002bd0:	00853503          	ld	a0,8(a0) # 8008 <_entry-0x7fff7ff8>
    80002bd4:	02050263          	beqz	a0,80002bf8 <_ZN6Thread5startEv+0x40>
        } else putThread(myHandle);
    80002bd8:	ffffe097          	auipc	ra,0xffffe
    80002bdc:	754080e7          	jalr	1876(ra) # 8000132c <_Z9putThreadP3TCB>
}
    80002be0:	00000513          	li	a0,0
    80002be4:	01813083          	ld	ra,24(sp)
    80002be8:	01013403          	ld	s0,16(sp)
    80002bec:	00813483          	ld	s1,8(sp)
    80002bf0:	02010113          	addi	sp,sp,32
    80002bf4:	00008067          	ret
            printString("Usao u start");
    80002bf8:	00003517          	auipc	a0,0x3
    80002bfc:	61850513          	addi	a0,a0,1560 # 80006210 <CONSOLE_STATUS+0x200>
    80002c00:	fffff097          	auipc	ra,0xfffff
    80002c04:	82c080e7          	jalr	-2004(ra) # 8000142c <_Z11printStringPKc>
            void *stack_space = mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    80002c08:	00008537          	lui	a0,0x8
    80002c0c:	ffffe097          	auipc	ra,0xffffe
    80002c10:	538080e7          	jalr	1336(ra) # 80001144 <_Z9mem_allocm>
    80002c14:	00050613          	mv	a2,a0
            myHandle = TCB::createTCB(starter, this, stack_space);
    80002c18:	00048593          	mv	a1,s1
    80002c1c:	00000517          	auipc	a0,0x0
    80002c20:	e3050513          	addi	a0,a0,-464 # 80002a4c <_ZN6Thread7starterEPv>
    80002c24:	00000097          	auipc	ra,0x0
    80002c28:	9cc080e7          	jalr	-1588(ra) # 800025f0 <_ZN3TCB9createTCBEPFvPvES0_S0_>
    80002c2c:	00050593          	mv	a1,a0
    80002c30:	00a4b423          	sd	a0,8(s1)
            myHandle->TCB::putTCBinQueue(myHandle);
    80002c34:	00000097          	auipc	ra,0x0
    80002c38:	a5c080e7          	jalr	-1444(ra) # 80002690 <_ZN3TCB13putTCBinQueueEPS_>
    80002c3c:	fa5ff06f          	j	80002be0 <_ZN6Thread5startEv+0x28>

0000000080002c40 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002c40:	ff010113          	addi	sp,sp,-16
    80002c44:	00113423          	sd	ra,8(sp)
    80002c48:	00813023          	sd	s0,0(sp)
    80002c4c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002c50:	ffffe097          	auipc	ra,0xffffe
    80002c54:	6b8080e7          	jalr	1720(ra) # 80001308 <_Z15thread_dispatchv>
}
    80002c58:	00813083          	ld	ra,8(sp)
    80002c5c:	00013403          	ld	s0,0(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret

0000000080002c68 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002c68:	ff010113          	addi	sp,sp,-16
    80002c6c:	00813423          	sd	s0,8(sp)
    80002c70:	01010413          	addi	s0,sp,16
}
    80002c74:	00000513          	li	a0,0
    80002c78:	00813403          	ld	s0,8(sp)
    80002c7c:	01010113          	addi	sp,sp,16
    80002c80:	00008067          	ret

0000000080002c84 <_ZN6ThreadC1Ev>:
Thread::Thread() : myHandle(nullptr) {}
    80002c84:	ff010113          	addi	sp,sp,-16
    80002c88:	00813423          	sd	s0,8(sp)
    80002c8c:	01010413          	addi	s0,sp,16
    80002c90:	00005797          	auipc	a5,0x5
    80002c94:	87878793          	addi	a5,a5,-1928 # 80007508 <_ZTV6Thread+0x10>
    80002c98:	00f53023          	sd	a5,0(a0)
    80002c9c:	00053423          	sd	zero,8(a0)
    80002ca0:	00813403          	ld	s0,8(sp)
    80002ca4:	01010113          	addi	sp,sp,16
    80002ca8:	00008067          	ret

0000000080002cac <_ZN6Thread3runEv>:

    static void starter (void*);
protected:
    Thread ();

    virtual void run () {}
    80002cac:	ff010113          	addi	sp,sp,-16
    80002cb0:	00813423          	sd	s0,8(sp)
    80002cb4:	01010413          	addi	s0,sp,16
    80002cb8:	00813403          	ld	s0,8(sp)
    80002cbc:	01010113          	addi	sp,sp,16
    80002cc0:	00008067          	ret

0000000080002cc4 <_ZN5Riscv10popSppSpieEv>:
#include "../h/memoryAllocator.hpp"
#include "../h/tcb.hpp"

//uint64  timerCounter = 0;

void Riscv::popSppSpie() {
    80002cc4:	ff010113          	addi	sp,sp,-16
    80002cc8:	00813423          	sd	s0,8(sp)
    80002ccc:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra"); // ne treba da se vrati u prekidnu posle dispatcha,
    80002cd0:	14109073          	csrw	sepc,ra
                                        // vec odmah posle poziva ove f-je u tgreadWrapper
    __asm__ volatile ("sret"); // sret sig je popovati spp, tj upisati..
    80002cd4:	10200073          	sret
}
    80002cd8:	00813403          	ld	s0,8(sp)
    80002cdc:	01010113          	addi	sp,sp,16
    80002ce0:	00008067          	ret

0000000080002ce4 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    80002ce4:	ee010113          	addi	sp,sp,-288
    80002ce8:	10113c23          	sd	ra,280(sp)
    80002cec:	10813823          	sd	s0,272(sp)
    80002cf0:	10913423          	sd	s1,264(sp)
    80002cf4:	11213023          	sd	s2,256(sp)
    80002cf8:	12010413          	addi	s0,sp,288
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r" (scause));
    80002cfc:	142027f3          	csrr	a5,scause
    80002d00:	eef43023          	sd	a5,-288(s0)
    return scause;
    80002d04:	ee043703          	ld	a4,-288(s0)
    80002d08:	00005797          	auipc	a5,0x5
    80002d0c:	8987c783          	lbu	a5,-1896(a5) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80002d10:	04079663          	bnez	a5,80002d5c <_ZN5Riscv20handleSupervisorTrapEv+0x78>
        freeList=(struct metaData*)HEAP_START_ADDR;
    80002d14:	00005797          	auipc	a5,0x5
    80002d18:	8147b783          	ld	a5,-2028(a5) # 80007528 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002d1c:	0007b683          	ld	a3,0(a5)
    80002d20:	00005617          	auipc	a2,0x5
    80002d24:	88860613          	addi	a2,a2,-1912 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002d28:	00d63023          	sd	a3,0(a2)
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
    80002d2c:	00005797          	auipc	a5,0x5
    80002d30:	8247b783          	ld	a5,-2012(a5) # 80007550 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002d34:	0007b783          	ld	a5,0(a5)
    80002d38:	40d787b3          	sub	a5,a5,a3
    80002d3c:	fe878793          	addi	a5,a5,-24
    80002d40:	00f6b023          	sd	a5,0(a3)
        freeList->free = 1;
    80002d44:	00063683          	ld	a3,0(a2)
    80002d48:	00100793          	li	a5,1
    80002d4c:	00f6a423          	sw	a5,8(a3)
        freeList->next = 0;
    80002d50:	0006b823          	sd	zero,16(a3)
        static MemoryAllocator instance;
    80002d54:	00005697          	auipc	a3,0x5
    80002d58:	84f68623          	sb	a5,-1972(a3) # 800075a0 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>

    uint64 code, par1, ret;
    void* ptr, *pr;
    MemoryAllocator* mem = MemoryAllocator::getInstance();

    switch (scause) {
    80002d5c:	fff00793          	li	a5,-1
    80002d60:	03f79793          	slli	a5,a5,0x3f
    80002d64:	00178793          	addi	a5,a5,1
    80002d68:	06f70463          	beq	a4,a5,80002dd0 <_ZN5Riscv20handleSupervisorTrapEv+0xec>
    80002d6c:	fff00793          	li	a5,-1
    80002d70:	03f79793          	slli	a5,a5,0x3f
    80002d74:	00178793          	addi	a5,a5,1
    80002d78:	02e7ee63          	bltu	a5,a4,80002db4 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
    80002d7c:	00800793          	li	a5,8
    80002d80:	0cf70663          	beq	a4,a5,80002e4c <_ZN5Riscv20handleSupervisorTrapEv+0x168>
    80002d84:	00900793          	li	a5,9
    80002d88:	4ef71663          	bne	a4,a5,80003274 <_ZN5Riscv20handleSupervisorTrapEv+0x590>
            break;

        case ECALL_SYST: // ecall iz sistemskog rezima ** ulazice se ovde zbog sys_calla i yielda
//            printString("\nUsao u ecall syst\n");
        //   __asm__ volatile ("mv %[code], a0" : [code] "=r" (code) );
           __asm__ volatile ("ld %[code], 10 * 8(fp)" : [code] "=r" (code)); // procita code iz a0 sa steka
    80002d8c:	05043783          	ld	a5,80(s0)

            switch (code) {
    80002d90:	04300713          	li	a4,67
    80002d94:	48f76663          	bltu	a4,a5,80003220 <_ZN5Riscv20handleSupervisorTrapEv+0x53c>
    80002d98:	00279793          	slli	a5,a5,0x2
    80002d9c:	00003717          	auipc	a4,0x3
    80002da0:	54470713          	addi	a4,a4,1348 # 800062e0 <CONSOLE_STATUS+0x2d0>
    80002da4:	00e787b3          	add	a5,a5,a4
    80002da8:	0007a783          	lw	a5,0(a5)
    80002dac:	00e787b3          	add	a5,a5,a4
    80002db0:	00078067          	jr	a5
    switch (scause) {
    80002db4:	fff00793          	li	a5,-1
    80002db8:	03f79793          	slli	a5,a5,0x3f
    80002dbc:	00978793          	addi	a5,a5,9
    80002dc0:	4af71a63          	bne	a4,a5,80003274 <_ZN5Riscv20handleSupervisorTrapEv+0x590>
            console_handler();
    80002dc4:	00003097          	auipc	ra,0x3
    80002dc8:	cfc080e7          	jalr	-772(ra) # 80005ac0 <console_handler>
            break;
    80002dcc:	0300006f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
             TCB::timeSliceCounter++;
    80002dd0:	00004717          	auipc	a4,0x4
    80002dd4:	76873703          	ld	a4,1896(a4) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002dd8:	00073783          	ld	a5,0(a4)
    80002ddc:	00178793          	addi	a5,a5,1
    80002de0:	00f73023          	sd	a5,0(a4)
            if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80002de4:	00004717          	auipc	a4,0x4
    80002de8:	76473703          	ld	a4,1892(a4) # 80007548 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002dec:	00073703          	ld	a4,0(a4)

    void setFinished(bool value) { finished = value; }

    void setSuspended(bool value) { suspended = value; }

    uint64 getTimeSlice() const { return timeSlice; }
    80002df0:	02873703          	ld	a4,40(a4)
    80002df4:	02e7f063          	bgeu	a5,a4,80002e14 <_ZN5Riscv20handleSupervisorTrapEv+0x130>
            __asm__ volatile ("csrc sip, 0x02"); // prekid obradjen
    80002df8:	14417073          	csrci	sip,2
            printInt(r_stval());
            break;

    }

}
    80002dfc:	11813083          	ld	ra,280(sp)
    80002e00:	11013403          	ld	s0,272(sp)
    80002e04:	10813483          	ld	s1,264(sp)
    80002e08:	10013903          	ld	s2,256(sp)
    80002e0c:	12010113          	addi	sp,sp,288
    80002e10:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002e14:	141027f3          	csrr	a5,sepc
    80002e18:	eef43823          	sd	a5,-272(s0)
    return sepc;
    80002e1c:	ef043483          	ld	s1,-272(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002e20:	100027f3          	csrr	a5,sstatus
    80002e24:	eef43423          	sd	a5,-280(s0)
    return sstatus;
    80002e28:	ee843903          	ld	s2,-280(s0)
                TCB::timeSliceCounter = 0; // nit krece da se izvrsava iz pocetka
    80002e2c:	00004797          	auipc	a5,0x4
    80002e30:	70c7b783          	ld	a5,1804(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002e34:	0007b023          	sd	zero,0(a5)
                TCB::dispatch();
    80002e38:	00000097          	auipc	ra,0x0
    80002e3c:	9d4080e7          	jalr	-1580(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002e40:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002e44:	14149073          	csrw	sepc,s1
}
    80002e48:	fb1ff06f          	j	80002df8 <_ZN5Riscv20handleSupervisorTrapEv+0x114>
            __asm__ volatile ("ld %[code], 10 * 8(fp)" : [code] "=r" (code)); // procita code iz a0 sa steka
    80002e4c:	05043783          	ld	a5,80(s0)
            switch (code) {
    80002e50:	04300713          	li	a4,67
    80002e54:	1cf76c63          	bltu	a4,a5,8000302c <_ZN5Riscv20handleSupervisorTrapEv+0x348>
    80002e58:	00279793          	slli	a5,a5,0x2
    80002e5c:	00003717          	auipc	a4,0x3
    80002e60:	59470713          	addi	a4,a4,1428 # 800063f0 <CONSOLE_STATUS+0x3e0>
    80002e64:	00e787b3          	add	a5,a5,a4
    80002e68:	0007a783          	lw	a5,0(a5)
    80002e6c:	00e787b3          	add	a5,a5,a4
    80002e70:	00078067          	jr	a5
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (par1) ); // pop a1 from stack
    80002e74:	05843583          	ld	a1,88(s0)
                    ptr = (void*)mem->myMalloc(par1);
    80002e78:	00004517          	auipc	a0,0x4
    80002e7c:	73050513          	addi	a0,a0,1840 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002e80:	00000097          	auipc	ra,0x0
    80002e84:	a6c080e7          	jalr	-1428(ra) # 800028ec <_ZN15MemoryAllocator8myMallocEm>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ptr) ); // store a0 on stack
    80002e88:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002e8c:	141027f3          	csrr	a5,sepc
    80002e90:	eef43c23          	sd	a5,-264(s0)
    return sepc;
    80002e94:	ef843783          	ld	a5,-264(s0)
                    w_sepc(r_sepc() + 4UL);
    80002e98:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002e9c:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002ea0:	14417073          	csrci	sip,2
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002ea4:	141027f3          	csrr	a5,sepc
    80002ea8:	f4f43c23          	sd	a5,-168(s0)
    return sepc;
    80002eac:	f5843783          	ld	a5,-168(s0)
            w_sepc(r_sepc() + 4UL);
    80002eb0:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002eb4:	14179073          	csrw	sepc,a5
            __asm__ volatile ("csrc sip, 0x02");
    80002eb8:	14417073          	csrci	sip,2
            break;
    80002ebc:	f41ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (pr) ); // pop a1 from stack
    80002ec0:	05843583          	ld	a1,88(s0)
                    ret = mem->myFree(pr);
    80002ec4:	00004517          	auipc	a0,0x4
    80002ec8:	6e450513          	addi	a0,a0,1764 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002ecc:	00000097          	auipc	ra,0x0
    80002ed0:	b1c080e7          	jalr	-1252(ra) # 800029e8 <_ZN15MemoryAllocator6myFreeEPv>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    80002ed4:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002ed8:	141027f3          	csrr	a5,sepc
    80002edc:	f0f43023          	sd	a5,-256(s0)
    return sepc;
    80002ee0:	f0043783          	ld	a5,-256(s0)
                    w_sepc(r_sepc() + 4UL);
    80002ee4:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002ee8:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002eec:	14417073          	csrci	sip,2
                    break;
    80002ef0:	fb5ff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (handle) ); // pop a1 from stack
    80002ef4:	05843483          	ld	s1,88(s0)
                    __asm__ volatile ("ld %[par1], 12 * 8(fp)" : [par1] "=r" (body) ); // pop a2 from stack
    80002ef8:	06043503          	ld	a0,96(s0)
                    __asm__ volatile ("ld %[par1], 13 * 8(fp)" : [par1] "=r" (arg) ); // pop a3 from stack
    80002efc:	06843583          	ld	a1,104(s0)
                    __asm__ volatile ("ld %[stack_space], 14 * 8(fp)" : [stack_space] "=r" (stack_space) ); // pop a4 from stack
    80002f00:	07043603          	ld	a2,112(s0)
                    *handle = TCB::createThread(body, arg, stack_space);
    80002f04:	fffff097          	auipc	ra,0xfffff
    80002f08:	7c4080e7          	jalr	1988(ra) # 800026c8 <_ZN3TCB12createThreadEPFvPvES0_S0_>
    80002f0c:	00a4b023          	sd	a0,0(s1)
                    if(*handle) ret =  0;
    80002f10:	02050463          	beqz	a0,80002f38 <_ZN5Riscv20handleSupervisorTrapEv+0x254>
    80002f14:	00000793          	li	a5,0
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    80002f18:	04f43823          	sd	a5,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002f1c:	141027f3          	csrr	a5,sepc
    80002f20:	f0f43423          	sd	a5,-248(s0)
    return sepc;
    80002f24:	f0843783          	ld	a5,-248(s0)
                    w_sepc(r_sepc() + 4UL);
    80002f28:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002f2c:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002f30:	14417073          	csrci	sip,2
                    break;
    80002f34:	f71ff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    else ret = -3;
    80002f38:	ffd00793          	li	a5,-3
    80002f3c:	fddff06f          	j	80002f18 <_ZN5Riscv20handleSupervisorTrapEv+0x234>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002f40:	141027f3          	csrr	a5,sepc
    80002f44:	f0f43c23          	sd	a5,-232(s0)
    return sepc;
    80002f48:	f1843483          	ld	s1,-232(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus(); // ovo ne treba?
    80002f4c:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002f50:	100027f3          	csrr	a5,sstatus
    80002f54:	f0f43823          	sd	a5,-240(s0)
    return sstatus;
    80002f58:	f1043903          	ld	s2,-240(s0)
                    TCB::timeSliceCounter = 0;
    80002f5c:	00004797          	auipc	a5,0x4
    80002f60:	5dc7b783          	ld	a5,1500(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002f64:	0007b023          	sd	zero,0(a5)
                    TCB::running->setFinished(true);
    80002f68:	00004797          	auipc	a5,0x4
    80002f6c:	5e07b783          	ld	a5,1504(a5) # 80007548 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002f70:	0007b783          	ld	a5,0(a5)
    void setFinished(bool value) { finished = value; }
    80002f74:	00100713          	li	a4,1
    80002f78:	02e78823          	sb	a4,48(a5)
                    TCB::dispatch();
    80002f7c:	00000097          	auipc	ra,0x0
    80002f80:	890080e7          	jalr	-1904(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002f84:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002f88:	14149073          	csrw	sepc,s1
}
    80002f8c:	f19ff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002f90:	141027f3          	csrr	a5,sepc
    80002f94:	f2f43423          	sd	a5,-216(s0)
    return sepc;
    80002f98:	f2843483          	ld	s1,-216(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus();
    80002f9c:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002fa0:	100027f3          	csrr	a5,sstatus
    80002fa4:	f2f43023          	sd	a5,-224(s0)
    return sstatus;
    80002fa8:	f2043903          	ld	s2,-224(s0)
                    TCB::timeSliceCounter = 0;
    80002fac:	00004797          	auipc	a5,0x4
    80002fb0:	58c7b783          	ld	a5,1420(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002fb4:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    80002fb8:	00000097          	auipc	ra,0x0
    80002fbc:	854080e7          	jalr	-1964(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002fc0:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002fc4:	14149073          	csrw	sepc,s1
}
    80002fc8:	eddff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (tcb) ); // pop a1 from stack
    80002fcc:	05843503          	ld	a0,88(s0)
                    tcb->putTCBinQueue(tcb);
    80002fd0:	00050593          	mv	a1,a0
    80002fd4:	fffff097          	auipc	ra,0xfffff
    80002fd8:	6bc080e7          	jalr	1724(ra) # 80002690 <_ZN3TCB13putTCBinQueueEPS_>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002fdc:	141027f3          	csrr	a5,sepc
    80002fe0:	f2f43823          	sd	a5,-208(s0)
    return sepc;
    80002fe4:	f3043783          	ld	a5,-208(s0)
                    w_sepc(r_sepc() + 4UL);
    80002fe8:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002fec:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002ff0:	14417073          	csrci	sip,2
                    break;
    80002ff4:	eb1ff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    printString("\nUSAO U CHANGE MOD IZ USER\n");
    80002ff8:	00003517          	auipc	a0,0x3
    80002ffc:	22850513          	addi	a0,a0,552 # 80006220 <CONSOLE_STATUS+0x210>
    80003000:	ffffe097          	auipc	ra,0xffffe
    80003004:	42c080e7          	jalr	1068(ra) # 8000142c <_Z11printStringPKc>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80003008:	10000793          	li	a5,256
    8000300c:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003010:	141027f3          	csrr	a5,sepc
    80003014:	f2f43c23          	sd	a5,-200(s0)
    return sepc;
    80003018:	f3843783          	ld	a5,-200(s0)
                        w_sepc(r_sepc() + 4UL);
    8000301c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003020:	14179073          	csrw	sepc,a5
                        __asm__ volatile ("csrc sip, 0x02");
    80003024:	14417073          	csrci	sip,2
                    break;
    80003028:	e7dff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    8000302c:	141027f3          	csrr	a5,sepc
    80003030:	f4f43823          	sd	a5,-176(s0)
    return sepc;
    80003034:	f5043483          	ld	s1,-176(s0)
                    uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80003038:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    8000303c:	100027f3          	csrr	a5,sstatus
    80003040:	f4f43423          	sd	a5,-184(s0)
    return sstatus;
    80003044:	f4843903          	ld	s2,-184(s0)
                    TCB::timeSliceCounter = 0;
    80003048:	00004797          	auipc	a5,0x4
    8000304c:	4f07b783          	ld	a5,1264(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003050:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    80003054:	fffff097          	auipc	ra,0xfffff
    80003058:	7b8080e7          	jalr	1976(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    8000305c:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003060:	14149073          	csrw	sepc,s1
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003064:	141027f3          	csrr	a5,sepc
    80003068:	f4f43023          	sd	a5,-192(s0)
    return sepc;
    8000306c:	f4043783          	ld	a5,-192(s0)
                    w_sepc(r_sepc() + 4UL);
    80003070:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003074:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80003078:	14417073          	csrci	sip,2
                    break;
    8000307c:	e29ff06f          	j	80002ea4 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (par1) ); // pop a1 from stack
    80003080:	05843583          	ld	a1,88(s0)
                    ptr = (void*)mem->myMalloc(par1);
    80003084:	00004517          	auipc	a0,0x4
    80003088:	52450513          	addi	a0,a0,1316 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    8000308c:	00000097          	auipc	ra,0x0
    80003090:	860080e7          	jalr	-1952(ra) # 800028ec <_ZN15MemoryAllocator8myMallocEm>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ptr) ); // store a0 on stack
    80003094:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003098:	141027f3          	csrr	a5,sepc
    8000309c:	f6f43023          	sd	a5,-160(s0)
    return sepc;
    800030a0:	f6043783          	ld	a5,-160(s0)
                    w_sepc(r_sepc() + 4UL);
    800030a4:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800030a8:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    800030ac:	14417073          	csrci	sip,2
                    break;
    800030b0:	d4dff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (pr) ); // pop a1 from stack
    800030b4:	05843583          	ld	a1,88(s0)
                    ret = mem->myFree(pr);
    800030b8:	00004517          	auipc	a0,0x4
    800030bc:	4f050513          	addi	a0,a0,1264 # 800075a8 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800030c0:	00000097          	auipc	ra,0x0
    800030c4:	928080e7          	jalr	-1752(ra) # 800029e8 <_ZN15MemoryAllocator6myFreeEPv>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    800030c8:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    800030cc:	141027f3          	csrr	a5,sepc
    800030d0:	f6f43423          	sd	a5,-152(s0)
    return sepc;
    800030d4:	f6843783          	ld	a5,-152(s0)
                    w_sepc(r_sepc() + 4UL);
    800030d8:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800030dc:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    800030e0:	14417073          	csrci	sip,2
                    break;
    800030e4:	d19ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (handle) ); // pop a1 from stack
    800030e8:	05843483          	ld	s1,88(s0)
                    __asm__ volatile ("ld %[par1], 12 * 8(fp)" : [par1] "=r" (body) ); // pop a2 from stack
    800030ec:	06043503          	ld	a0,96(s0)
                    __asm__ volatile ("ld %[par1], 13 * 8(fp)" : [par1] "=r" (arg) ); // pop a3 from stack
    800030f0:	06843583          	ld	a1,104(s0)
                    __asm__ volatile ("ld %[stack_space], 14 * 8(fp)" : [stack_space] "=r" (stack_space) ); // pop a4 from stack
    800030f4:	07043603          	ld	a2,112(s0)
                    *handle = TCB::createThread(body, arg, stack_space);
    800030f8:	fffff097          	auipc	ra,0xfffff
    800030fc:	5d0080e7          	jalr	1488(ra) # 800026c8 <_ZN3TCB12createThreadEPFvPvES0_S0_>
    80003100:	00a4b023          	sd	a0,0(s1)
                    if(*handle) ret =  0;
    80003104:	02050463          	beqz	a0,8000312c <_ZN5Riscv20handleSupervisorTrapEv+0x448>
    80003108:	00000793          	li	a5,0
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    8000310c:	04f43823          	sd	a5,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003110:	141027f3          	csrr	a5,sepc
    80003114:	f6f43823          	sd	a5,-144(s0)
    return sepc;
    80003118:	f7043783          	ld	a5,-144(s0)
                    w_sepc(r_sepc() + 4UL);
    8000311c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003120:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80003124:	14417073          	csrci	sip,2
                    break;
    80003128:	cd5ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    else ret = -3;
    8000312c:	ffd00793          	li	a5,-3
    80003130:	fddff06f          	j	8000310c <_ZN5Riscv20handleSupervisorTrapEv+0x428>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003134:	141027f3          	csrr	a5,sepc
    80003138:	f8f43023          	sd	a5,-128(s0)
    return sepc;
    8000313c:	f8043483          	ld	s1,-128(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus(); // ovo ne treba?
    80003140:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80003144:	100027f3          	csrr	a5,sstatus
    80003148:	f6f43c23          	sd	a5,-136(s0)
    return sstatus;
    8000314c:	f7843903          	ld	s2,-136(s0)
                    TCB::timeSliceCounter = 0;
    80003150:	00004797          	auipc	a5,0x4
    80003154:	3e87b783          	ld	a5,1000(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003158:	0007b023          	sd	zero,0(a5)
                    TCB::running->setFinished(true);
    8000315c:	00004797          	auipc	a5,0x4
    80003160:	3ec7b783          	ld	a5,1004(a5) # 80007548 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003164:	0007b783          	ld	a5,0(a5)
    80003168:	00100713          	li	a4,1
    8000316c:	02e78823          	sb	a4,48(a5)
                    TCB::dispatch();
    80003170:	fffff097          	auipc	ra,0xfffff
    80003174:	69c080e7          	jalr	1692(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80003178:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    8000317c:	14149073          	csrw	sepc,s1
}
    80003180:	c7dff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003184:	141027f3          	csrr	a5,sepc
    80003188:	f8f43823          	sd	a5,-112(s0)
    return sepc;
    8000318c:	f9043483          	ld	s1,-112(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus();
    80003190:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80003194:	100027f3          	csrr	a5,sstatus
    80003198:	f8f43423          	sd	a5,-120(s0)
    return sstatus;
    8000319c:	f8843903          	ld	s2,-120(s0)
                    TCB::timeSliceCounter = 0;
    800031a0:	00004797          	auipc	a5,0x4
    800031a4:	3987b783          	ld	a5,920(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    800031a8:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    800031ac:	fffff097          	auipc	ra,0xfffff
    800031b0:	660080e7          	jalr	1632(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    800031b4:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800031b8:	14149073          	csrw	sepc,s1
}
    800031bc:	c41ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (tcb) ); // pop a1 from stack
    800031c0:	05843503          	ld	a0,88(s0)
                    tcb->putTCBinQueue(tcb);
    800031c4:	00050593          	mv	a1,a0
    800031c8:	fffff097          	auipc	ra,0xfffff
    800031cc:	4c8080e7          	jalr	1224(ra) # 80002690 <_ZN3TCB13putTCBinQueueEPS_>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    800031d0:	141027f3          	csrr	a5,sepc
    800031d4:	f8f43c23          	sd	a5,-104(s0)
    return sepc;
    800031d8:	f9843783          	ld	a5,-104(s0)
                    w_sepc(r_sepc() + 4UL);
    800031dc:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800031e0:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    800031e4:	14417073          	csrci	sip,2
                    break;
    800031e8:	c15ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    800031ec:	10000793          	li	a5,256
    800031f0:	1007b073          	csrc	sstatus,a5
                    printString("\nUSAO U CHANGE MOD IZ SISTEMSKOG\n");
    800031f4:	00003517          	auipc	a0,0x3
    800031f8:	04c50513          	addi	a0,a0,76 # 80006240 <CONSOLE_STATUS+0x230>
    800031fc:	ffffe097          	auipc	ra,0xffffe
    80003200:	230080e7          	jalr	560(ra) # 8000142c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003204:	141027f3          	csrr	a5,sepc
    80003208:	faf43023          	sd	a5,-96(s0)
    return sepc;
    8000320c:	fa043783          	ld	a5,-96(s0)
                    w_sepc(r_sepc() + 4UL);
    80003210:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003214:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80003218:	14417073          	csrci	sip,2
                    break;
    8000321c:	be1ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003220:	141027f3          	csrr	a5,sepc
    80003224:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80003228:	fb843483          	ld	s1,-72(s0)
                    uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    8000322c:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80003230:	100027f3          	csrr	a5,sstatus
    80003234:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80003238:	fb043903          	ld	s2,-80(s0)
                    TCB::timeSliceCounter = 0;
    8000323c:	00004797          	auipc	a5,0x4
    80003240:	2fc7b783          	ld	a5,764(a5) # 80007538 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003244:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    80003248:	fffff097          	auipc	ra,0xfffff
    8000324c:	5c4080e7          	jalr	1476(ra) # 8000280c <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80003250:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003254:	14149073          	csrw	sepc,s1
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003258:	141027f3          	csrr	a5,sepc
    8000325c:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80003260:	fa843783          	ld	a5,-88(s0)
                    w_sepc(r_sepc() + 4UL);
    80003264:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80003268:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    8000326c:	14417073          	csrci	sip,2
                    break;
    80003270:	b8dff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80003274:	141027f3          	csrr	a5,sepc
    80003278:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    8000327c:	fd843483          	ld	s1,-40(s0)
            printString("\nUnexpected trap cause; value of scause = ");
    80003280:	00003517          	auipc	a0,0x3
    80003284:	fe850513          	addi	a0,a0,-24 # 80006268 <CONSOLE_STATUS+0x258>
    80003288:	ffffe097          	auipc	ra,0xffffe
    8000328c:	1a4080e7          	jalr	420(ra) # 8000142c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r" (scause));
    80003290:	142027f3          	csrr	a5,scause
    80003294:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80003298:	fd043503          	ld	a0,-48(s0)
            printInt(r_scause());
    8000329c:	00000613          	li	a2,0
    800032a0:	00a00593          	li	a1,10
    800032a4:	0005051b          	sext.w	a0,a0
    800032a8:	ffffe097          	auipc	ra,0xffffe
    800032ac:	31c080e7          	jalr	796(ra) # 800015c4 <_Z8printIntiii>
            printString("; \nvalue of sepc(pc) = ");
    800032b0:	00003517          	auipc	a0,0x3
    800032b4:	fe850513          	addi	a0,a0,-24 # 80006298 <CONSOLE_STATUS+0x288>
    800032b8:	ffffe097          	auipc	ra,0xffffe
    800032bc:	174080e7          	jalr	372(ra) # 8000142c <_Z11printStringPKc>
            printInt(pc);
    800032c0:	00000613          	li	a2,0
    800032c4:	00a00593          	li	a1,10
    800032c8:	0004851b          	sext.w	a0,s1
    800032cc:	ffffe097          	auipc	ra,0xffffe
    800032d0:	2f8080e7          	jalr	760(ra) # 800015c4 <_Z8printIntiii>
            printString("; value of sstatus = ");
    800032d4:	00003517          	auipc	a0,0x3
    800032d8:	fdc50513          	addi	a0,a0,-36 # 800062b0 <CONSOLE_STATUS+0x2a0>
    800032dc:	ffffe097          	auipc	ra,0xffffe
    800032e0:	150080e7          	jalr	336(ra) # 8000142c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    800032e4:	100027f3          	csrr	a5,sstatus
    800032e8:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800032ec:	fc843503          	ld	a0,-56(s0)
            printInt(r_sstatus());
    800032f0:	00000613          	li	a2,0
    800032f4:	00a00593          	li	a1,10
    800032f8:	0005051b          	sext.w	a0,a0
    800032fc:	ffffe097          	auipc	ra,0xffffe
    80003300:	2c8080e7          	jalr	712(ra) # 800015c4 <_Z8printIntiii>
            printString("; \nvalue of stval = ");
    80003304:	00003517          	auipc	a0,0x3
    80003308:	fc450513          	addi	a0,a0,-60 # 800062c8 <CONSOLE_STATUS+0x2b8>
    8000330c:	ffffe097          	auipc	ra,0xffffe
    80003310:	120080e7          	jalr	288(ra) # 8000142c <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r" (stval));
    80003314:	143027f3          	csrr	a5,stval
    80003318:	fcf43023          	sd	a5,-64(s0)
    return stval;
    8000331c:	fc043503          	ld	a0,-64(s0)
            printInt(r_stval());
    80003320:	00000613          	li	a2,0
    80003324:	00a00593          	li	a1,10
    80003328:	0005051b          	sext.w	a0,a0
    8000332c:	ffffe097          	auipc	ra,0xffffe
    80003330:	298080e7          	jalr	664(ra) # 800015c4 <_Z8printIntiii>
}
    80003334:	ac9ff06f          	j	80002dfc <_ZN5Riscv20handleSupervisorTrapEv+0x118>

0000000080003338 <_ZN4KSemC1Ej>:

KSem *KSem::createSem(unsigned int val) {
    return new KSem(val);
}

KSem::KSem(unsigned int valInit) {
    80003338:	ff010113          	addi	sp,sp,-16
    8000333c:	00813423          	sd	s0,8(sp)
    80003340:	01010413          	addi	s0,sp,16
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80003344:	00053023          	sd	zero,0(a0)
    80003348:	00053423          	sd	zero,8(a0)
    this->val = valInit;
    8000334c:	00b52823          	sw	a1,16(a0)
}
    80003350:	00813403          	ld	s0,8(sp)
    80003354:	01010113          	addi	sp,sp,16
    80003358:	00008067          	ret

000000008000335c <_ZN4KSem9createSemEj>:
KSem *KSem::createSem(unsigned int val) {
    8000335c:	fe010113          	addi	sp,sp,-32
    80003360:	00113c23          	sd	ra,24(sp)
    80003364:	00813823          	sd	s0,16(sp)
    80003368:	00913423          	sd	s1,8(sp)
    8000336c:	01213023          	sd	s2,0(sp)
    80003370:	02010413          	addi	s0,sp,32
    80003374:	00050913          	mv	s2,a0
    return new KSem(val);
    80003378:	01800513          	li	a0,24
    8000337c:	fffff097          	auipc	ra,0xfffff
    80003380:	0d8080e7          	jalr	216(ra) # 80002454 <_Znwm>
    80003384:	00050493          	mv	s1,a0
    80003388:	00090593          	mv	a1,s2
    8000338c:	00000097          	auipc	ra,0x0
    80003390:	fac080e7          	jalr	-84(ra) # 80003338 <_ZN4KSemC1Ej>
}
    80003394:	00048513          	mv	a0,s1
    80003398:	01813083          	ld	ra,24(sp)
    8000339c:	01013403          	ld	s0,16(sp)
    800033a0:	00813483          	ld	s1,8(sp)
    800033a4:	00013903          	ld	s2,0(sp)
    800033a8:	02010113          	addi	sp,sp,32
    800033ac:	00008067          	ret

00000000800033b0 <_ZN4KSem12putSuspendedEP3TCB>:
            Scheduler::put(temp);
        }
    }
}

void KSem::putSuspended(TCB *tcb) {
    800033b0:	fe010113          	addi	sp,sp,-32
    800033b4:	00113c23          	sd	ra,24(sp)
    800033b8:	00813823          	sd	s0,16(sp)
    800033bc:	00913423          	sd	s1,8(sp)
    800033c0:	01213023          	sd	s2,0(sp)
    800033c4:	02010413          	addi	s0,sp,32
    800033c8:	00050493          	mv	s1,a0
    800033cc:	00058913          	mv	s2,a1
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    800033d0:	01000513          	li	a0,16
    800033d4:	fffff097          	auipc	ra,0xfffff
    800033d8:	080080e7          	jalr	128(ra) # 80002454 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800033dc:	01253023          	sd	s2,0(a0)
    800033e0:	00053423          	sd	zero,8(a0)
        if (tail)
    800033e4:	0084b783          	ld	a5,8(s1)
    800033e8:	02078263          	beqz	a5,8000340c <_ZN4KSem12putSuspendedEP3TCB+0x5c>
        {
            tail->next = elem;
    800033ec:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    800033f0:	00a4b423          	sd	a0,8(s1)
    suspendThreadsQueue.addLast(tcb);
}
    800033f4:	01813083          	ld	ra,24(sp)
    800033f8:	01013403          	ld	s0,16(sp)
    800033fc:	00813483          	ld	s1,8(sp)
    80003400:	00013903          	ld	s2,0(sp)
    80003404:	02010113          	addi	sp,sp,32
    80003408:	00008067          	ret
        } else {
            head = tail = elem;
    8000340c:	00a4b423          	sd	a0,8(s1)
    80003410:	00a4b023          	sd	a0,0(s1)
    80003414:	fe1ff06f          	j	800033f4 <_ZN4KSem12putSuspendedEP3TCB+0x44>

0000000080003418 <_ZN4KSem4waitEv>:
     if (--val < 0) { // block
    80003418:	01052783          	lw	a5,16(a0)
    8000341c:	fff7879b          	addiw	a5,a5,-1
    80003420:	00f52823          	sw	a5,16(a0)
    80003424:	02079713          	slli	a4,a5,0x20
    80003428:	00074463          	bltz	a4,80003430 <_ZN4KSem4waitEv+0x18>
    8000342c:	00008067          	ret
void KSem::wait() {
    80003430:	ff010113          	addi	sp,sp,-16
    80003434:	00113423          	sd	ra,8(sp)
    80003438:	00813023          	sd	s0,0(sp)
    8000343c:	01010413          	addi	s0,sp,16
         TCB::running->setSuspended(true);
    80003440:	00004797          	auipc	a5,0x4
    80003444:	1087b783          	ld	a5,264(a5) # 80007548 <_GLOBAL_OFFSET_TABLE_+0x28>
    80003448:	0007b583          	ld	a1,0(a5)
    void setSuspended(bool value) { suspended = value; }
    8000344c:	00100793          	li	a5,1
    80003450:	02f588a3          	sb	a5,49(a1)
         putSuspended(TCB::running);
    80003454:	00000097          	auipc	ra,0x0
    80003458:	f5c080e7          	jalr	-164(ra) # 800033b0 <_ZN4KSem12putSuspendedEP3TCB>
         TCB::dispatch(); // MOZDA ove treba poziv yielda???
    8000345c:	fffff097          	auipc	ra,0xfffff
    80003460:	3b0080e7          	jalr	944(ra) # 8000280c <_ZN3TCB8dispatchEv>
}
    80003464:	00813083          	ld	ra,8(sp)
    80003468:	00013403          	ld	s0,0(sp)
    8000346c:	01010113          	addi	sp,sp,16
    80003470:	00008067          	ret

0000000080003474 <_ZN4KSem12getSuspendedEv>:

TCB *KSem::getSuspended() {
    80003474:	fe010113          	addi	sp,sp,-32
    80003478:	00113c23          	sd	ra,24(sp)
    8000347c:	00813823          	sd	s0,16(sp)
    80003480:	00913423          	sd	s1,8(sp)
    80003484:	02010413          	addi	s0,sp,32
    80003488:	00050793          	mv	a5,a0
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    8000348c:	00053503          	ld	a0,0(a0)
    80003490:	02050e63          	beqz	a0,800034cc <_ZN4KSem12getSuspendedEv+0x58>

        Elem *elem = head;
        head = head->next;
    80003494:	00853703          	ld	a4,8(a0)
    80003498:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    8000349c:	02070463          	beqz	a4,800034c4 <_ZN4KSem12getSuspendedEv+0x50>

        T *ret = elem->data;
    800034a0:	00053483          	ld	s1,0(a0)
        delete elem;
    800034a4:	fffff097          	auipc	ra,0xfffff
    800034a8:	000080e7          	jalr	ra # 800024a4 <_ZdlPv>
    return suspendThreadsQueue.removeFirst();
}
    800034ac:	00048513          	mv	a0,s1
    800034b0:	01813083          	ld	ra,24(sp)
    800034b4:	01013403          	ld	s0,16(sp)
    800034b8:	00813483          	ld	s1,8(sp)
    800034bc:	02010113          	addi	sp,sp,32
    800034c0:	00008067          	ret
        if (!head) { tail = 0; }
    800034c4:	0007b423          	sd	zero,8(a5)
    800034c8:	fd9ff06f          	j	800034a0 <_ZN4KSem12getSuspendedEv+0x2c>
        if (!head) { return 0; }
    800034cc:	00050493          	mv	s1,a0
    return suspendThreadsQueue.removeFirst();
    800034d0:	fddff06f          	j	800034ac <_ZN4KSem12getSuspendedEv+0x38>

00000000800034d4 <_ZN4KSem6signalEv>:
    if (val++<0) { // deblock
    800034d4:	01052783          	lw	a5,16(a0)
    800034d8:	0017871b          	addiw	a4,a5,1
    800034dc:	00e52823          	sw	a4,16(a0)
    800034e0:	0007c463          	bltz	a5,800034e8 <_ZN4KSem6signalEv+0x14>
    800034e4:	00008067          	ret
void KSem::signal() {
    800034e8:	ff010113          	addi	sp,sp,-16
    800034ec:	00113423          	sd	ra,8(sp)
    800034f0:	00813023          	sd	s0,0(sp)
    800034f4:	01010413          	addi	s0,sp,16
        thread_t temp = getSuspended();
    800034f8:	00000097          	auipc	ra,0x0
    800034fc:	f7c080e7          	jalr	-132(ra) # 80003474 <_ZN4KSem12getSuspendedEv>
        if(temp) {
    80003500:	00050663          	beqz	a0,8000350c <_ZN4KSem6signalEv+0x38>
            Scheduler::put(temp);
    80003504:	00000097          	auipc	ra,0x0
    80003508:	0c0080e7          	jalr	192(ra) # 800035c4 <_ZN9Scheduler3putEP3TCB>
}
    8000350c:	00813083          	ld	ra,8(sp)
    80003510:	00013403          	ld	s0,0(sp)
    80003514:	01010113          	addi	sp,sp,16
    80003518:	00008067          	ret

000000008000351c <_Z41__static_initialization_and_destruction_0ii>:
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyThreadQueue.addLast(tcb);
    8000351c:	ff010113          	addi	sp,sp,-16
    80003520:	00813423          	sd	s0,8(sp)
    80003524:	01010413          	addi	s0,sp,16
    80003528:	00100793          	li	a5,1
    8000352c:	00f50863          	beq	a0,a5,8000353c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003530:	00813403          	ld	s0,8(sp)
    80003534:	01010113          	addi	sp,sp,16
    80003538:	00008067          	ret
    8000353c:	000107b7          	lui	a5,0x10
    80003540:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003544:	fef596e3          	bne	a1,a5,80003530 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80003548:	00004797          	auipc	a5,0x4
    8000354c:	0a078793          	addi	a5,a5,160 # 800075e8 <_ZN9Scheduler16readyThreadQueueE>
    80003550:	0007b023          	sd	zero,0(a5)
    80003554:	0007b423          	sd	zero,8(a5)
    80003558:	fd9ff06f          	j	80003530 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000355c <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    8000355c:	fe010113          	addi	sp,sp,-32
    80003560:	00113c23          	sd	ra,24(sp)
    80003564:	00813823          	sd	s0,16(sp)
    80003568:	00913423          	sd	s1,8(sp)
    8000356c:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80003570:	00004517          	auipc	a0,0x4
    80003574:	07853503          	ld	a0,120(a0) # 800075e8 <_ZN9Scheduler16readyThreadQueueE>
    80003578:	04050263          	beqz	a0,800035bc <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    8000357c:	00853783          	ld	a5,8(a0)
    80003580:	00004717          	auipc	a4,0x4
    80003584:	06f73423          	sd	a5,104(a4) # 800075e8 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80003588:	02078463          	beqz	a5,800035b0 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    8000358c:	00053483          	ld	s1,0(a0)
        delete elem;
    80003590:	fffff097          	auipc	ra,0xfffff
    80003594:	f14080e7          	jalr	-236(ra) # 800024a4 <_ZdlPv>
}
    80003598:	00048513          	mv	a0,s1
    8000359c:	01813083          	ld	ra,24(sp)
    800035a0:	01013403          	ld	s0,16(sp)
    800035a4:	00813483          	ld	s1,8(sp)
    800035a8:	02010113          	addi	sp,sp,32
    800035ac:	00008067          	ret
        if (!head) { tail = 0; }
    800035b0:	00004797          	auipc	a5,0x4
    800035b4:	0407b023          	sd	zero,64(a5) # 800075f0 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800035b8:	fd5ff06f          	j	8000358c <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    800035bc:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    800035c0:	fd9ff06f          	j	80003598 <_ZN9Scheduler3getEv+0x3c>

00000000800035c4 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    800035c4:	fe010113          	addi	sp,sp,-32
    800035c8:	00113c23          	sd	ra,24(sp)
    800035cc:	00813823          	sd	s0,16(sp)
    800035d0:	00913423          	sd	s1,8(sp)
    800035d4:	02010413          	addi	s0,sp,32
    800035d8:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    800035dc:	01000513          	li	a0,16
    800035e0:	fffff097          	auipc	ra,0xfffff
    800035e4:	e74080e7          	jalr	-396(ra) # 80002454 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    800035e8:	00953023          	sd	s1,0(a0)
    800035ec:	00053423          	sd	zero,8(a0)
        if (tail)
    800035f0:	00004797          	auipc	a5,0x4
    800035f4:	0007b783          	ld	a5,0(a5) # 800075f0 <_ZN9Scheduler16readyThreadQueueE+0x8>
    800035f8:	02078263          	beqz	a5,8000361c <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    800035fc:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80003600:	00004797          	auipc	a5,0x4
    80003604:	fea7b823          	sd	a0,-16(a5) # 800075f0 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80003608:	01813083          	ld	ra,24(sp)
    8000360c:	01013403          	ld	s0,16(sp)
    80003610:	00813483          	ld	s1,8(sp)
    80003614:	02010113          	addi	sp,sp,32
    80003618:	00008067          	ret
            head = tail = elem;
    8000361c:	00004797          	auipc	a5,0x4
    80003620:	fcc78793          	addi	a5,a5,-52 # 800075e8 <_ZN9Scheduler16readyThreadQueueE>
    80003624:	00a7b423          	sd	a0,8(a5)
    80003628:	00a7b023          	sd	a0,0(a5)
    8000362c:	fddff06f          	j	80003608 <_ZN9Scheduler3putEP3TCB+0x44>

0000000080003630 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80003630:	ff010113          	addi	sp,sp,-16
    80003634:	00113423          	sd	ra,8(sp)
    80003638:	00813023          	sd	s0,0(sp)
    8000363c:	01010413          	addi	s0,sp,16
    80003640:	000105b7          	lui	a1,0x10
    80003644:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80003648:	00100513          	li	a0,1
    8000364c:	00000097          	auipc	ra,0x0
    80003650:	ed0080e7          	jalr	-304(ra) # 8000351c <_Z41__static_initialization_and_destruction_0ii>
    80003654:	00813083          	ld	ra,8(sp)
    80003658:	00013403          	ld	s0,0(sp)
    8000365c:	01010113          	addi	sp,sp,16
    80003660:	00008067          	ret

0000000080003664 <_ZN6BufferC1Ei>:
#include "buffer.hpp"
#include "../lib/console.h"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003664:	fe010113          	addi	sp,sp,-32
    80003668:	00113c23          	sd	ra,24(sp)
    8000366c:	00813823          	sd	s0,16(sp)
    80003670:	00913423          	sd	s1,8(sp)
    80003674:	01213023          	sd	s2,0(sp)
    80003678:	02010413          	addi	s0,sp,32
    8000367c:	00050493          	mv	s1,a0
    80003680:	00058913          	mv	s2,a1
    80003684:	0015879b          	addiw	a5,a1,1
    80003688:	0007851b          	sext.w	a0,a5
    8000368c:	00f4a023          	sw	a5,0(s1)
    80003690:	0004a823          	sw	zero,16(s1)
    80003694:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003698:	00251513          	slli	a0,a0,0x2
    8000369c:	ffffe097          	auipc	ra,0xffffe
    800036a0:	aa8080e7          	jalr	-1368(ra) # 80001144 <_Z9mem_allocm>
    800036a4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800036a8:	00000593          	li	a1,0
    800036ac:	02048513          	addi	a0,s1,32
    800036b0:	ffffe097          	auipc	ra,0xffffe
    800036b4:	ca4080e7          	jalr	-860(ra) # 80001354 <_Z8sem_openPP4KSemj>
    sem_open(&spaceAvailable, _cap);
    800036b8:	00090593          	mv	a1,s2
    800036bc:	01848513          	addi	a0,s1,24
    800036c0:	ffffe097          	auipc	ra,0xffffe
    800036c4:	c94080e7          	jalr	-876(ra) # 80001354 <_Z8sem_openPP4KSemj>
    sem_open(&mutexHead, 1);
    800036c8:	00100593          	li	a1,1
    800036cc:	02848513          	addi	a0,s1,40
    800036d0:	ffffe097          	auipc	ra,0xffffe
    800036d4:	c84080e7          	jalr	-892(ra) # 80001354 <_Z8sem_openPP4KSemj>
    sem_open(&mutexTail, 1);
    800036d8:	00100593          	li	a1,1
    800036dc:	03048513          	addi	a0,s1,48
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	c74080e7          	jalr	-908(ra) # 80001354 <_Z8sem_openPP4KSemj>
}
    800036e8:	01813083          	ld	ra,24(sp)
    800036ec:	01013403          	ld	s0,16(sp)
    800036f0:	00813483          	ld	s1,8(sp)
    800036f4:	00013903          	ld	s2,0(sp)
    800036f8:	02010113          	addi	sp,sp,32
    800036fc:	00008067          	ret

0000000080003700 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80003700:	fe010113          	addi	sp,sp,-32
    80003704:	00113c23          	sd	ra,24(sp)
    80003708:	00813823          	sd	s0,16(sp)
    8000370c:	00913423          	sd	s1,8(sp)
    80003710:	01213023          	sd	s2,0(sp)
    80003714:	02010413          	addi	s0,sp,32
    80003718:	00050493          	mv	s1,a0
    8000371c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003720:	01853503          	ld	a0,24(a0)
    80003724:	ffffe097          	auipc	ra,0xffffe
    80003728:	c8c080e7          	jalr	-884(ra) # 800013b0 <_Z8sem_waitP4KSem>

    sem_wait(mutexTail);
    8000372c:	0304b503          	ld	a0,48(s1)
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	c80080e7          	jalr	-896(ra) # 800013b0 <_Z8sem_waitP4KSem>
    buffer[tail] = val;
    80003738:	0084b783          	ld	a5,8(s1)
    8000373c:	0144a703          	lw	a4,20(s1)
    80003740:	00271713          	slli	a4,a4,0x2
    80003744:	00e787b3          	add	a5,a5,a4
    80003748:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000374c:	0144a783          	lw	a5,20(s1)
    80003750:	0017879b          	addiw	a5,a5,1
    80003754:	0004a703          	lw	a4,0(s1)
    80003758:	02e7e7bb          	remw	a5,a5,a4
    8000375c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003760:	0304b503          	ld	a0,48(s1)
    80003764:	ffffe097          	auipc	ra,0xffffe
    80003768:	c78080e7          	jalr	-904(ra) # 800013dc <_Z10sem_signalP4KSem>

    sem_signal(itemAvailable);
    8000376c:	0204b503          	ld	a0,32(s1)
    80003770:	ffffe097          	auipc	ra,0xffffe
    80003774:	c6c080e7          	jalr	-916(ra) # 800013dc <_Z10sem_signalP4KSem>

}
    80003778:	01813083          	ld	ra,24(sp)
    8000377c:	01013403          	ld	s0,16(sp)
    80003780:	00813483          	ld	s1,8(sp)
    80003784:	00013903          	ld	s2,0(sp)
    80003788:	02010113          	addi	sp,sp,32
    8000378c:	00008067          	ret

0000000080003790 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003790:	fe010113          	addi	sp,sp,-32
    80003794:	00113c23          	sd	ra,24(sp)
    80003798:	00813823          	sd	s0,16(sp)
    8000379c:	00913423          	sd	s1,8(sp)
    800037a0:	01213023          	sd	s2,0(sp)
    800037a4:	02010413          	addi	s0,sp,32
    800037a8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800037ac:	02053503          	ld	a0,32(a0)
    800037b0:	ffffe097          	auipc	ra,0xffffe
    800037b4:	c00080e7          	jalr	-1024(ra) # 800013b0 <_Z8sem_waitP4KSem>

    sem_wait(mutexHead);
    800037b8:	0284b503          	ld	a0,40(s1)
    800037bc:	ffffe097          	auipc	ra,0xffffe
    800037c0:	bf4080e7          	jalr	-1036(ra) # 800013b0 <_Z8sem_waitP4KSem>

    int ret = buffer[head];
    800037c4:	0084b703          	ld	a4,8(s1)
    800037c8:	0104a783          	lw	a5,16(s1)
    800037cc:	00279693          	slli	a3,a5,0x2
    800037d0:	00d70733          	add	a4,a4,a3
    800037d4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800037d8:	0017879b          	addiw	a5,a5,1
    800037dc:	0004a703          	lw	a4,0(s1)
    800037e0:	02e7e7bb          	remw	a5,a5,a4
    800037e4:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800037e8:	0284b503          	ld	a0,40(s1)
    800037ec:	ffffe097          	auipc	ra,0xffffe
    800037f0:	bf0080e7          	jalr	-1040(ra) # 800013dc <_Z10sem_signalP4KSem>

    sem_signal(spaceAvailable);
    800037f4:	0184b503          	ld	a0,24(s1)
    800037f8:	ffffe097          	auipc	ra,0xffffe
    800037fc:	be4080e7          	jalr	-1052(ra) # 800013dc <_Z10sem_signalP4KSem>

    return ret;
}
    80003800:	00090513          	mv	a0,s2
    80003804:	01813083          	ld	ra,24(sp)
    80003808:	01013403          	ld	s0,16(sp)
    8000380c:	00813483          	ld	s1,8(sp)
    80003810:	00013903          	ld	s2,0(sp)
    80003814:	02010113          	addi	sp,sp,32
    80003818:	00008067          	ret

000000008000381c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000381c:	fe010113          	addi	sp,sp,-32
    80003820:	00113c23          	sd	ra,24(sp)
    80003824:	00813823          	sd	s0,16(sp)
    80003828:	00913423          	sd	s1,8(sp)
    8000382c:	01213023          	sd	s2,0(sp)
    80003830:	02010413          	addi	s0,sp,32
    80003834:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003838:	02853503          	ld	a0,40(a0)
    8000383c:	ffffe097          	auipc	ra,0xffffe
    80003840:	b74080e7          	jalr	-1164(ra) # 800013b0 <_Z8sem_waitP4KSem>
    sem_wait(mutexTail);
    80003844:	0304b503          	ld	a0,48(s1)
    80003848:	ffffe097          	auipc	ra,0xffffe
    8000384c:	b68080e7          	jalr	-1176(ra) # 800013b0 <_Z8sem_waitP4KSem>

    if (tail >= head) {
    80003850:	0144a783          	lw	a5,20(s1)
    80003854:	0104a903          	lw	s2,16(s1)
    80003858:	0327ce63          	blt	a5,s2,80003894 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000385c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003860:	0304b503          	ld	a0,48(s1)
    80003864:	ffffe097          	auipc	ra,0xffffe
    80003868:	b78080e7          	jalr	-1160(ra) # 800013dc <_Z10sem_signalP4KSem>
    sem_signal(mutexHead);
    8000386c:	0284b503          	ld	a0,40(s1)
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	b6c080e7          	jalr	-1172(ra) # 800013dc <_Z10sem_signalP4KSem>

    return ret;
}
    80003878:	00090513          	mv	a0,s2
    8000387c:	01813083          	ld	ra,24(sp)
    80003880:	01013403          	ld	s0,16(sp)
    80003884:	00813483          	ld	s1,8(sp)
    80003888:	00013903          	ld	s2,0(sp)
    8000388c:	02010113          	addi	sp,sp,32
    80003890:	00008067          	ret
        ret = cap - head + tail;
    80003894:	0004a703          	lw	a4,0(s1)
    80003898:	4127093b          	subw	s2,a4,s2
    8000389c:	00f9093b          	addw	s2,s2,a5
    800038a0:	fc1ff06f          	j	80003860 <_ZN6Buffer6getCntEv+0x44>

00000000800038a4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800038a4:	fe010113          	addi	sp,sp,-32
    800038a8:	00113c23          	sd	ra,24(sp)
    800038ac:	00813823          	sd	s0,16(sp)
    800038b0:	00913423          	sd	s1,8(sp)
    800038b4:	02010413          	addi	s0,sp,32
    800038b8:	00050493          	mv	s1,a0
    __putc('\n');
    800038bc:	00a00513          	li	a0,10
    800038c0:	00002097          	auipc	ra,0x2
    800038c4:	18c080e7          	jalr	396(ra) # 80005a4c <__putc>
    printString("Buffer deleted!\n");
    800038c8:	00003517          	auipc	a0,0x3
    800038cc:	c3850513          	addi	a0,a0,-968 # 80006500 <CONSOLE_STATUS+0x4f0>
    800038d0:	ffffe097          	auipc	ra,0xffffe
    800038d4:	b5c080e7          	jalr	-1188(ra) # 8000142c <_Z11printStringPKc>
    while (getCnt() > 0) {
    800038d8:	00048513          	mv	a0,s1
    800038dc:	00000097          	auipc	ra,0x0
    800038e0:	f40080e7          	jalr	-192(ra) # 8000381c <_ZN6Buffer6getCntEv>
    800038e4:	02a05c63          	blez	a0,8000391c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800038e8:	0084b783          	ld	a5,8(s1)
    800038ec:	0104a703          	lw	a4,16(s1)
    800038f0:	00271713          	slli	a4,a4,0x2
    800038f4:	00e787b3          	add	a5,a5,a4
        __putc(ch);
    800038f8:	0007c503          	lbu	a0,0(a5)
    800038fc:	00002097          	auipc	ra,0x2
    80003900:	150080e7          	jalr	336(ra) # 80005a4c <__putc>
        head = (head + 1) % cap;
    80003904:	0104a783          	lw	a5,16(s1)
    80003908:	0017879b          	addiw	a5,a5,1
    8000390c:	0004a703          	lw	a4,0(s1)
    80003910:	02e7e7bb          	remw	a5,a5,a4
    80003914:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80003918:	fc1ff06f          	j	800038d8 <_ZN6BufferD1Ev+0x34>
    __putc('!');
    8000391c:	02100513          	li	a0,33
    80003920:	00002097          	auipc	ra,0x2
    80003924:	12c080e7          	jalr	300(ra) # 80005a4c <__putc>
    __putc('\n');
    80003928:	00a00513          	li	a0,10
    8000392c:	00002097          	auipc	ra,0x2
    80003930:	120080e7          	jalr	288(ra) # 80005a4c <__putc>
    mem_free(buffer);
    80003934:	0084b503          	ld	a0,8(s1)
    80003938:	ffffe097          	auipc	ra,0xffffe
    8000393c:	8a4080e7          	jalr	-1884(ra) # 800011dc <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003940:	0204b503          	ld	a0,32(s1)
    80003944:	ffffe097          	auipc	ra,0xffffe
    80003948:	a50080e7          	jalr	-1456(ra) # 80001394 <_Z9sem_closeP4KSem>
    sem_close(spaceAvailable);
    8000394c:	0184b503          	ld	a0,24(s1)
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	a44080e7          	jalr	-1468(ra) # 80001394 <_Z9sem_closeP4KSem>
    sem_close(mutexTail);
    80003958:	0304b503          	ld	a0,48(s1)
    8000395c:	ffffe097          	auipc	ra,0xffffe
    80003960:	a38080e7          	jalr	-1480(ra) # 80001394 <_Z9sem_closeP4KSem>
    sem_close(mutexHead);
    80003964:	0284b503          	ld	a0,40(s1)
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	a2c080e7          	jalr	-1492(ra) # 80001394 <_Z9sem_closeP4KSem>
}
    80003970:	01813083          	ld	ra,24(sp)
    80003974:	01013403          	ld	s0,16(sp)
    80003978:	00813483          	ld	s1,8(sp)
    8000397c:	02010113          	addi	sp,sp,32
    80003980:	00008067          	ret

0000000080003984 <start>:
    80003984:	ff010113          	addi	sp,sp,-16
    80003988:	00813423          	sd	s0,8(sp)
    8000398c:	01010413          	addi	s0,sp,16
    80003990:	300027f3          	csrr	a5,mstatus
    80003994:	ffffe737          	lui	a4,0xffffe
    80003998:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff5f9f>
    8000399c:	00e7f7b3          	and	a5,a5,a4
    800039a0:	00001737          	lui	a4,0x1
    800039a4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800039a8:	00e7e7b3          	or	a5,a5,a4
    800039ac:	30079073          	csrw	mstatus,a5
    800039b0:	00000797          	auipc	a5,0x0
    800039b4:	16078793          	addi	a5,a5,352 # 80003b10 <system_main>
    800039b8:	34179073          	csrw	mepc,a5
    800039bc:	00000793          	li	a5,0
    800039c0:	18079073          	csrw	satp,a5
    800039c4:	000107b7          	lui	a5,0x10
    800039c8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800039cc:	30279073          	csrw	medeleg,a5
    800039d0:	30379073          	csrw	mideleg,a5
    800039d4:	104027f3          	csrr	a5,sie
    800039d8:	2227e793          	ori	a5,a5,546
    800039dc:	10479073          	csrw	sie,a5
    800039e0:	fff00793          	li	a5,-1
    800039e4:	00a7d793          	srli	a5,a5,0xa
    800039e8:	3b079073          	csrw	pmpaddr0,a5
    800039ec:	00f00793          	li	a5,15
    800039f0:	3a079073          	csrw	pmpcfg0,a5
    800039f4:	f14027f3          	csrr	a5,mhartid
    800039f8:	0200c737          	lui	a4,0x200c
    800039fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003a00:	0007869b          	sext.w	a3,a5
    80003a04:	00269713          	slli	a4,a3,0x2
    80003a08:	000f4637          	lui	a2,0xf4
    80003a0c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003a10:	00d70733          	add	a4,a4,a3
    80003a14:	0037979b          	slliw	a5,a5,0x3
    80003a18:	020046b7          	lui	a3,0x2004
    80003a1c:	00d787b3          	add	a5,a5,a3
    80003a20:	00c585b3          	add	a1,a1,a2
    80003a24:	00371693          	slli	a3,a4,0x3
    80003a28:	00004717          	auipc	a4,0x4
    80003a2c:	bd870713          	addi	a4,a4,-1064 # 80007600 <timer_scratch>
    80003a30:	00b7b023          	sd	a1,0(a5)
    80003a34:	00d70733          	add	a4,a4,a3
    80003a38:	00f73c23          	sd	a5,24(a4)
    80003a3c:	02c73023          	sd	a2,32(a4)
    80003a40:	34071073          	csrw	mscratch,a4
    80003a44:	00000797          	auipc	a5,0x0
    80003a48:	6ec78793          	addi	a5,a5,1772 # 80004130 <timervec>
    80003a4c:	30579073          	csrw	mtvec,a5
    80003a50:	300027f3          	csrr	a5,mstatus
    80003a54:	0087e793          	ori	a5,a5,8
    80003a58:	30079073          	csrw	mstatus,a5
    80003a5c:	304027f3          	csrr	a5,mie
    80003a60:	0807e793          	ori	a5,a5,128
    80003a64:	30479073          	csrw	mie,a5
    80003a68:	f14027f3          	csrr	a5,mhartid
    80003a6c:	0007879b          	sext.w	a5,a5
    80003a70:	00078213          	mv	tp,a5
    80003a74:	30200073          	mret
    80003a78:	00813403          	ld	s0,8(sp)
    80003a7c:	01010113          	addi	sp,sp,16
    80003a80:	00008067          	ret

0000000080003a84 <timerinit>:
    80003a84:	ff010113          	addi	sp,sp,-16
    80003a88:	00813423          	sd	s0,8(sp)
    80003a8c:	01010413          	addi	s0,sp,16
    80003a90:	f14027f3          	csrr	a5,mhartid
    80003a94:	0200c737          	lui	a4,0x200c
    80003a98:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003a9c:	0007869b          	sext.w	a3,a5
    80003aa0:	00269713          	slli	a4,a3,0x2
    80003aa4:	000f4637          	lui	a2,0xf4
    80003aa8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003aac:	00d70733          	add	a4,a4,a3
    80003ab0:	0037979b          	slliw	a5,a5,0x3
    80003ab4:	020046b7          	lui	a3,0x2004
    80003ab8:	00d787b3          	add	a5,a5,a3
    80003abc:	00c585b3          	add	a1,a1,a2
    80003ac0:	00371693          	slli	a3,a4,0x3
    80003ac4:	00004717          	auipc	a4,0x4
    80003ac8:	b3c70713          	addi	a4,a4,-1220 # 80007600 <timer_scratch>
    80003acc:	00b7b023          	sd	a1,0(a5)
    80003ad0:	00d70733          	add	a4,a4,a3
    80003ad4:	00f73c23          	sd	a5,24(a4)
    80003ad8:	02c73023          	sd	a2,32(a4)
    80003adc:	34071073          	csrw	mscratch,a4
    80003ae0:	00000797          	auipc	a5,0x0
    80003ae4:	65078793          	addi	a5,a5,1616 # 80004130 <timervec>
    80003ae8:	30579073          	csrw	mtvec,a5
    80003aec:	300027f3          	csrr	a5,mstatus
    80003af0:	0087e793          	ori	a5,a5,8
    80003af4:	30079073          	csrw	mstatus,a5
    80003af8:	304027f3          	csrr	a5,mie
    80003afc:	0807e793          	ori	a5,a5,128
    80003b00:	30479073          	csrw	mie,a5
    80003b04:	00813403          	ld	s0,8(sp)
    80003b08:	01010113          	addi	sp,sp,16
    80003b0c:	00008067          	ret

0000000080003b10 <system_main>:
    80003b10:	fe010113          	addi	sp,sp,-32
    80003b14:	00813823          	sd	s0,16(sp)
    80003b18:	00913423          	sd	s1,8(sp)
    80003b1c:	00113c23          	sd	ra,24(sp)
    80003b20:	02010413          	addi	s0,sp,32
    80003b24:	00000097          	auipc	ra,0x0
    80003b28:	0c4080e7          	jalr	196(ra) # 80003be8 <cpuid>
    80003b2c:	00004497          	auipc	s1,0x4
    80003b30:	a4448493          	addi	s1,s1,-1468 # 80007570 <started>
    80003b34:	02050263          	beqz	a0,80003b58 <system_main+0x48>
    80003b38:	0004a783          	lw	a5,0(s1)
    80003b3c:	0007879b          	sext.w	a5,a5
    80003b40:	fe078ce3          	beqz	a5,80003b38 <system_main+0x28>
    80003b44:	0ff0000f          	fence
    80003b48:	00003517          	auipc	a0,0x3
    80003b4c:	a0050513          	addi	a0,a0,-1536 # 80006548 <CONSOLE_STATUS+0x538>
    80003b50:	00001097          	auipc	ra,0x1
    80003b54:	a7c080e7          	jalr	-1412(ra) # 800045cc <panic>
    80003b58:	00001097          	auipc	ra,0x1
    80003b5c:	9d0080e7          	jalr	-1584(ra) # 80004528 <consoleinit>
    80003b60:	00001097          	auipc	ra,0x1
    80003b64:	15c080e7          	jalr	348(ra) # 80004cbc <printfinit>
    80003b68:	00002517          	auipc	a0,0x2
    80003b6c:	5f850513          	addi	a0,a0,1528 # 80006160 <CONSOLE_STATUS+0x150>
    80003b70:	00001097          	auipc	ra,0x1
    80003b74:	ab8080e7          	jalr	-1352(ra) # 80004628 <__printf>
    80003b78:	00003517          	auipc	a0,0x3
    80003b7c:	9a050513          	addi	a0,a0,-1632 # 80006518 <CONSOLE_STATUS+0x508>
    80003b80:	00001097          	auipc	ra,0x1
    80003b84:	aa8080e7          	jalr	-1368(ra) # 80004628 <__printf>
    80003b88:	00002517          	auipc	a0,0x2
    80003b8c:	5d850513          	addi	a0,a0,1496 # 80006160 <CONSOLE_STATUS+0x150>
    80003b90:	00001097          	auipc	ra,0x1
    80003b94:	a98080e7          	jalr	-1384(ra) # 80004628 <__printf>
    80003b98:	00001097          	auipc	ra,0x1
    80003b9c:	4b0080e7          	jalr	1200(ra) # 80005048 <kinit>
    80003ba0:	00000097          	auipc	ra,0x0
    80003ba4:	148080e7          	jalr	328(ra) # 80003ce8 <trapinit>
    80003ba8:	00000097          	auipc	ra,0x0
    80003bac:	16c080e7          	jalr	364(ra) # 80003d14 <trapinithart>
    80003bb0:	00000097          	auipc	ra,0x0
    80003bb4:	5c0080e7          	jalr	1472(ra) # 80004170 <plicinit>
    80003bb8:	00000097          	auipc	ra,0x0
    80003bbc:	5e0080e7          	jalr	1504(ra) # 80004198 <plicinithart>
    80003bc0:	00000097          	auipc	ra,0x0
    80003bc4:	078080e7          	jalr	120(ra) # 80003c38 <userinit>
    80003bc8:	0ff0000f          	fence
    80003bcc:	00100793          	li	a5,1
    80003bd0:	00003517          	auipc	a0,0x3
    80003bd4:	96050513          	addi	a0,a0,-1696 # 80006530 <CONSOLE_STATUS+0x520>
    80003bd8:	00f4a023          	sw	a5,0(s1)
    80003bdc:	00001097          	auipc	ra,0x1
    80003be0:	a4c080e7          	jalr	-1460(ra) # 80004628 <__printf>
    80003be4:	0000006f          	j	80003be4 <system_main+0xd4>

0000000080003be8 <cpuid>:
    80003be8:	ff010113          	addi	sp,sp,-16
    80003bec:	00813423          	sd	s0,8(sp)
    80003bf0:	01010413          	addi	s0,sp,16
    80003bf4:	00020513          	mv	a0,tp
    80003bf8:	00813403          	ld	s0,8(sp)
    80003bfc:	0005051b          	sext.w	a0,a0
    80003c00:	01010113          	addi	sp,sp,16
    80003c04:	00008067          	ret

0000000080003c08 <mycpu>:
    80003c08:	ff010113          	addi	sp,sp,-16
    80003c0c:	00813423          	sd	s0,8(sp)
    80003c10:	01010413          	addi	s0,sp,16
    80003c14:	00020793          	mv	a5,tp
    80003c18:	00813403          	ld	s0,8(sp)
    80003c1c:	0007879b          	sext.w	a5,a5
    80003c20:	00779793          	slli	a5,a5,0x7
    80003c24:	00005517          	auipc	a0,0x5
    80003c28:	a0c50513          	addi	a0,a0,-1524 # 80008630 <cpus>
    80003c2c:	00f50533          	add	a0,a0,a5
    80003c30:	01010113          	addi	sp,sp,16
    80003c34:	00008067          	ret

0000000080003c38 <userinit>:
    80003c38:	ff010113          	addi	sp,sp,-16
    80003c3c:	00813423          	sd	s0,8(sp)
    80003c40:	01010413          	addi	s0,sp,16
    80003c44:	00813403          	ld	s0,8(sp)
    80003c48:	01010113          	addi	sp,sp,16
    80003c4c:	ffffe317          	auipc	t1,0xffffe
    80003c50:	69830067          	jr	1688(t1) # 800022e4 <main>

0000000080003c54 <either_copyout>:
    80003c54:	ff010113          	addi	sp,sp,-16
    80003c58:	00813023          	sd	s0,0(sp)
    80003c5c:	00113423          	sd	ra,8(sp)
    80003c60:	01010413          	addi	s0,sp,16
    80003c64:	02051663          	bnez	a0,80003c90 <either_copyout+0x3c>
    80003c68:	00058513          	mv	a0,a1
    80003c6c:	00060593          	mv	a1,a2
    80003c70:	0006861b          	sext.w	a2,a3
    80003c74:	00002097          	auipc	ra,0x2
    80003c78:	c60080e7          	jalr	-928(ra) # 800058d4 <__memmove>
    80003c7c:	00813083          	ld	ra,8(sp)
    80003c80:	00013403          	ld	s0,0(sp)
    80003c84:	00000513          	li	a0,0
    80003c88:	01010113          	addi	sp,sp,16
    80003c8c:	00008067          	ret
    80003c90:	00003517          	auipc	a0,0x3
    80003c94:	8e050513          	addi	a0,a0,-1824 # 80006570 <CONSOLE_STATUS+0x560>
    80003c98:	00001097          	auipc	ra,0x1
    80003c9c:	934080e7          	jalr	-1740(ra) # 800045cc <panic>

0000000080003ca0 <either_copyin>:
    80003ca0:	ff010113          	addi	sp,sp,-16
    80003ca4:	00813023          	sd	s0,0(sp)
    80003ca8:	00113423          	sd	ra,8(sp)
    80003cac:	01010413          	addi	s0,sp,16
    80003cb0:	02059463          	bnez	a1,80003cd8 <either_copyin+0x38>
    80003cb4:	00060593          	mv	a1,a2
    80003cb8:	0006861b          	sext.w	a2,a3
    80003cbc:	00002097          	auipc	ra,0x2
    80003cc0:	c18080e7          	jalr	-1000(ra) # 800058d4 <__memmove>
    80003cc4:	00813083          	ld	ra,8(sp)
    80003cc8:	00013403          	ld	s0,0(sp)
    80003ccc:	00000513          	li	a0,0
    80003cd0:	01010113          	addi	sp,sp,16
    80003cd4:	00008067          	ret
    80003cd8:	00003517          	auipc	a0,0x3
    80003cdc:	8c050513          	addi	a0,a0,-1856 # 80006598 <CONSOLE_STATUS+0x588>
    80003ce0:	00001097          	auipc	ra,0x1
    80003ce4:	8ec080e7          	jalr	-1812(ra) # 800045cc <panic>

0000000080003ce8 <trapinit>:
    80003ce8:	ff010113          	addi	sp,sp,-16
    80003cec:	00813423          	sd	s0,8(sp)
    80003cf0:	01010413          	addi	s0,sp,16
    80003cf4:	00813403          	ld	s0,8(sp)
    80003cf8:	00003597          	auipc	a1,0x3
    80003cfc:	8c858593          	addi	a1,a1,-1848 # 800065c0 <CONSOLE_STATUS+0x5b0>
    80003d00:	00005517          	auipc	a0,0x5
    80003d04:	9b050513          	addi	a0,a0,-1616 # 800086b0 <tickslock>
    80003d08:	01010113          	addi	sp,sp,16
    80003d0c:	00001317          	auipc	t1,0x1
    80003d10:	5cc30067          	jr	1484(t1) # 800052d8 <initlock>

0000000080003d14 <trapinithart>:
    80003d14:	ff010113          	addi	sp,sp,-16
    80003d18:	00813423          	sd	s0,8(sp)
    80003d1c:	01010413          	addi	s0,sp,16
    80003d20:	00000797          	auipc	a5,0x0
    80003d24:	30078793          	addi	a5,a5,768 # 80004020 <kernelvec>
    80003d28:	10579073          	csrw	stvec,a5
    80003d2c:	00813403          	ld	s0,8(sp)
    80003d30:	01010113          	addi	sp,sp,16
    80003d34:	00008067          	ret

0000000080003d38 <usertrap>:
    80003d38:	ff010113          	addi	sp,sp,-16
    80003d3c:	00813423          	sd	s0,8(sp)
    80003d40:	01010413          	addi	s0,sp,16
    80003d44:	00813403          	ld	s0,8(sp)
    80003d48:	01010113          	addi	sp,sp,16
    80003d4c:	00008067          	ret

0000000080003d50 <usertrapret>:
    80003d50:	ff010113          	addi	sp,sp,-16
    80003d54:	00813423          	sd	s0,8(sp)
    80003d58:	01010413          	addi	s0,sp,16
    80003d5c:	00813403          	ld	s0,8(sp)
    80003d60:	01010113          	addi	sp,sp,16
    80003d64:	00008067          	ret

0000000080003d68 <kerneltrap>:
    80003d68:	fe010113          	addi	sp,sp,-32
    80003d6c:	00813823          	sd	s0,16(sp)
    80003d70:	00113c23          	sd	ra,24(sp)
    80003d74:	00913423          	sd	s1,8(sp)
    80003d78:	02010413          	addi	s0,sp,32
    80003d7c:	142025f3          	csrr	a1,scause
    80003d80:	100027f3          	csrr	a5,sstatus
    80003d84:	0027f793          	andi	a5,a5,2
    80003d88:	10079c63          	bnez	a5,80003ea0 <kerneltrap+0x138>
    80003d8c:	142027f3          	csrr	a5,scause
    80003d90:	0207ce63          	bltz	a5,80003dcc <kerneltrap+0x64>
    80003d94:	00003517          	auipc	a0,0x3
    80003d98:	87450513          	addi	a0,a0,-1932 # 80006608 <CONSOLE_STATUS+0x5f8>
    80003d9c:	00001097          	auipc	ra,0x1
    80003da0:	88c080e7          	jalr	-1908(ra) # 80004628 <__printf>
    80003da4:	141025f3          	csrr	a1,sepc
    80003da8:	14302673          	csrr	a2,stval
    80003dac:	00003517          	auipc	a0,0x3
    80003db0:	86c50513          	addi	a0,a0,-1940 # 80006618 <CONSOLE_STATUS+0x608>
    80003db4:	00001097          	auipc	ra,0x1
    80003db8:	874080e7          	jalr	-1932(ra) # 80004628 <__printf>
    80003dbc:	00003517          	auipc	a0,0x3
    80003dc0:	87450513          	addi	a0,a0,-1932 # 80006630 <CONSOLE_STATUS+0x620>
    80003dc4:	00001097          	auipc	ra,0x1
    80003dc8:	808080e7          	jalr	-2040(ra) # 800045cc <panic>
    80003dcc:	0ff7f713          	andi	a4,a5,255
    80003dd0:	00900693          	li	a3,9
    80003dd4:	04d70063          	beq	a4,a3,80003e14 <kerneltrap+0xac>
    80003dd8:	fff00713          	li	a4,-1
    80003ddc:	03f71713          	slli	a4,a4,0x3f
    80003de0:	00170713          	addi	a4,a4,1
    80003de4:	fae798e3          	bne	a5,a4,80003d94 <kerneltrap+0x2c>
    80003de8:	00000097          	auipc	ra,0x0
    80003dec:	e00080e7          	jalr	-512(ra) # 80003be8 <cpuid>
    80003df0:	06050663          	beqz	a0,80003e5c <kerneltrap+0xf4>
    80003df4:	144027f3          	csrr	a5,sip
    80003df8:	ffd7f793          	andi	a5,a5,-3
    80003dfc:	14479073          	csrw	sip,a5
    80003e00:	01813083          	ld	ra,24(sp)
    80003e04:	01013403          	ld	s0,16(sp)
    80003e08:	00813483          	ld	s1,8(sp)
    80003e0c:	02010113          	addi	sp,sp,32
    80003e10:	00008067          	ret
    80003e14:	00000097          	auipc	ra,0x0
    80003e18:	3d0080e7          	jalr	976(ra) # 800041e4 <plic_claim>
    80003e1c:	00a00793          	li	a5,10
    80003e20:	00050493          	mv	s1,a0
    80003e24:	06f50863          	beq	a0,a5,80003e94 <kerneltrap+0x12c>
    80003e28:	fc050ce3          	beqz	a0,80003e00 <kerneltrap+0x98>
    80003e2c:	00050593          	mv	a1,a0
    80003e30:	00002517          	auipc	a0,0x2
    80003e34:	7b850513          	addi	a0,a0,1976 # 800065e8 <CONSOLE_STATUS+0x5d8>
    80003e38:	00000097          	auipc	ra,0x0
    80003e3c:	7f0080e7          	jalr	2032(ra) # 80004628 <__printf>
    80003e40:	01013403          	ld	s0,16(sp)
    80003e44:	01813083          	ld	ra,24(sp)
    80003e48:	00048513          	mv	a0,s1
    80003e4c:	00813483          	ld	s1,8(sp)
    80003e50:	02010113          	addi	sp,sp,32
    80003e54:	00000317          	auipc	t1,0x0
    80003e58:	3c830067          	jr	968(t1) # 8000421c <plic_complete>
    80003e5c:	00005517          	auipc	a0,0x5
    80003e60:	85450513          	addi	a0,a0,-1964 # 800086b0 <tickslock>
    80003e64:	00001097          	auipc	ra,0x1
    80003e68:	498080e7          	jalr	1176(ra) # 800052fc <acquire>
    80003e6c:	00003717          	auipc	a4,0x3
    80003e70:	70870713          	addi	a4,a4,1800 # 80007574 <ticks>
    80003e74:	00072783          	lw	a5,0(a4)
    80003e78:	00005517          	auipc	a0,0x5
    80003e7c:	83850513          	addi	a0,a0,-1992 # 800086b0 <tickslock>
    80003e80:	0017879b          	addiw	a5,a5,1
    80003e84:	00f72023          	sw	a5,0(a4)
    80003e88:	00001097          	auipc	ra,0x1
    80003e8c:	540080e7          	jalr	1344(ra) # 800053c8 <release>
    80003e90:	f65ff06f          	j	80003df4 <kerneltrap+0x8c>
    80003e94:	00001097          	auipc	ra,0x1
    80003e98:	09c080e7          	jalr	156(ra) # 80004f30 <uartintr>
    80003e9c:	fa5ff06f          	j	80003e40 <kerneltrap+0xd8>
    80003ea0:	00002517          	auipc	a0,0x2
    80003ea4:	72850513          	addi	a0,a0,1832 # 800065c8 <CONSOLE_STATUS+0x5b8>
    80003ea8:	00000097          	auipc	ra,0x0
    80003eac:	724080e7          	jalr	1828(ra) # 800045cc <panic>

0000000080003eb0 <clockintr>:
    80003eb0:	fe010113          	addi	sp,sp,-32
    80003eb4:	00813823          	sd	s0,16(sp)
    80003eb8:	00913423          	sd	s1,8(sp)
    80003ebc:	00113c23          	sd	ra,24(sp)
    80003ec0:	02010413          	addi	s0,sp,32
    80003ec4:	00004497          	auipc	s1,0x4
    80003ec8:	7ec48493          	addi	s1,s1,2028 # 800086b0 <tickslock>
    80003ecc:	00048513          	mv	a0,s1
    80003ed0:	00001097          	auipc	ra,0x1
    80003ed4:	42c080e7          	jalr	1068(ra) # 800052fc <acquire>
    80003ed8:	00003717          	auipc	a4,0x3
    80003edc:	69c70713          	addi	a4,a4,1692 # 80007574 <ticks>
    80003ee0:	00072783          	lw	a5,0(a4)
    80003ee4:	01013403          	ld	s0,16(sp)
    80003ee8:	01813083          	ld	ra,24(sp)
    80003eec:	00048513          	mv	a0,s1
    80003ef0:	0017879b          	addiw	a5,a5,1
    80003ef4:	00813483          	ld	s1,8(sp)
    80003ef8:	00f72023          	sw	a5,0(a4)
    80003efc:	02010113          	addi	sp,sp,32
    80003f00:	00001317          	auipc	t1,0x1
    80003f04:	4c830067          	jr	1224(t1) # 800053c8 <release>

0000000080003f08 <devintr>:
    80003f08:	142027f3          	csrr	a5,scause
    80003f0c:	00000513          	li	a0,0
    80003f10:	0007c463          	bltz	a5,80003f18 <devintr+0x10>
    80003f14:	00008067          	ret
    80003f18:	fe010113          	addi	sp,sp,-32
    80003f1c:	00813823          	sd	s0,16(sp)
    80003f20:	00113c23          	sd	ra,24(sp)
    80003f24:	00913423          	sd	s1,8(sp)
    80003f28:	02010413          	addi	s0,sp,32
    80003f2c:	0ff7f713          	andi	a4,a5,255
    80003f30:	00900693          	li	a3,9
    80003f34:	04d70c63          	beq	a4,a3,80003f8c <devintr+0x84>
    80003f38:	fff00713          	li	a4,-1
    80003f3c:	03f71713          	slli	a4,a4,0x3f
    80003f40:	00170713          	addi	a4,a4,1
    80003f44:	00e78c63          	beq	a5,a4,80003f5c <devintr+0x54>
    80003f48:	01813083          	ld	ra,24(sp)
    80003f4c:	01013403          	ld	s0,16(sp)
    80003f50:	00813483          	ld	s1,8(sp)
    80003f54:	02010113          	addi	sp,sp,32
    80003f58:	00008067          	ret
    80003f5c:	00000097          	auipc	ra,0x0
    80003f60:	c8c080e7          	jalr	-884(ra) # 80003be8 <cpuid>
    80003f64:	06050663          	beqz	a0,80003fd0 <devintr+0xc8>
    80003f68:	144027f3          	csrr	a5,sip
    80003f6c:	ffd7f793          	andi	a5,a5,-3
    80003f70:	14479073          	csrw	sip,a5
    80003f74:	01813083          	ld	ra,24(sp)
    80003f78:	01013403          	ld	s0,16(sp)
    80003f7c:	00813483          	ld	s1,8(sp)
    80003f80:	00200513          	li	a0,2
    80003f84:	02010113          	addi	sp,sp,32
    80003f88:	00008067          	ret
    80003f8c:	00000097          	auipc	ra,0x0
    80003f90:	258080e7          	jalr	600(ra) # 800041e4 <plic_claim>
    80003f94:	00a00793          	li	a5,10
    80003f98:	00050493          	mv	s1,a0
    80003f9c:	06f50663          	beq	a0,a5,80004008 <devintr+0x100>
    80003fa0:	00100513          	li	a0,1
    80003fa4:	fa0482e3          	beqz	s1,80003f48 <devintr+0x40>
    80003fa8:	00048593          	mv	a1,s1
    80003fac:	00002517          	auipc	a0,0x2
    80003fb0:	63c50513          	addi	a0,a0,1596 # 800065e8 <CONSOLE_STATUS+0x5d8>
    80003fb4:	00000097          	auipc	ra,0x0
    80003fb8:	674080e7          	jalr	1652(ra) # 80004628 <__printf>
    80003fbc:	00048513          	mv	a0,s1
    80003fc0:	00000097          	auipc	ra,0x0
    80003fc4:	25c080e7          	jalr	604(ra) # 8000421c <plic_complete>
    80003fc8:	00100513          	li	a0,1
    80003fcc:	f7dff06f          	j	80003f48 <devintr+0x40>
    80003fd0:	00004517          	auipc	a0,0x4
    80003fd4:	6e050513          	addi	a0,a0,1760 # 800086b0 <tickslock>
    80003fd8:	00001097          	auipc	ra,0x1
    80003fdc:	324080e7          	jalr	804(ra) # 800052fc <acquire>
    80003fe0:	00003717          	auipc	a4,0x3
    80003fe4:	59470713          	addi	a4,a4,1428 # 80007574 <ticks>
    80003fe8:	00072783          	lw	a5,0(a4)
    80003fec:	00004517          	auipc	a0,0x4
    80003ff0:	6c450513          	addi	a0,a0,1732 # 800086b0 <tickslock>
    80003ff4:	0017879b          	addiw	a5,a5,1
    80003ff8:	00f72023          	sw	a5,0(a4)
    80003ffc:	00001097          	auipc	ra,0x1
    80004000:	3cc080e7          	jalr	972(ra) # 800053c8 <release>
    80004004:	f65ff06f          	j	80003f68 <devintr+0x60>
    80004008:	00001097          	auipc	ra,0x1
    8000400c:	f28080e7          	jalr	-216(ra) # 80004f30 <uartintr>
    80004010:	fadff06f          	j	80003fbc <devintr+0xb4>
	...

0000000080004020 <kernelvec>:
    80004020:	f0010113          	addi	sp,sp,-256
    80004024:	00113023          	sd	ra,0(sp)
    80004028:	00213423          	sd	sp,8(sp)
    8000402c:	00313823          	sd	gp,16(sp)
    80004030:	00413c23          	sd	tp,24(sp)
    80004034:	02513023          	sd	t0,32(sp)
    80004038:	02613423          	sd	t1,40(sp)
    8000403c:	02713823          	sd	t2,48(sp)
    80004040:	02813c23          	sd	s0,56(sp)
    80004044:	04913023          	sd	s1,64(sp)
    80004048:	04a13423          	sd	a0,72(sp)
    8000404c:	04b13823          	sd	a1,80(sp)
    80004050:	04c13c23          	sd	a2,88(sp)
    80004054:	06d13023          	sd	a3,96(sp)
    80004058:	06e13423          	sd	a4,104(sp)
    8000405c:	06f13823          	sd	a5,112(sp)
    80004060:	07013c23          	sd	a6,120(sp)
    80004064:	09113023          	sd	a7,128(sp)
    80004068:	09213423          	sd	s2,136(sp)
    8000406c:	09313823          	sd	s3,144(sp)
    80004070:	09413c23          	sd	s4,152(sp)
    80004074:	0b513023          	sd	s5,160(sp)
    80004078:	0b613423          	sd	s6,168(sp)
    8000407c:	0b713823          	sd	s7,176(sp)
    80004080:	0b813c23          	sd	s8,184(sp)
    80004084:	0d913023          	sd	s9,192(sp)
    80004088:	0da13423          	sd	s10,200(sp)
    8000408c:	0db13823          	sd	s11,208(sp)
    80004090:	0dc13c23          	sd	t3,216(sp)
    80004094:	0fd13023          	sd	t4,224(sp)
    80004098:	0fe13423          	sd	t5,232(sp)
    8000409c:	0ff13823          	sd	t6,240(sp)
    800040a0:	cc9ff0ef          	jal	ra,80003d68 <kerneltrap>
    800040a4:	00013083          	ld	ra,0(sp)
    800040a8:	00813103          	ld	sp,8(sp)
    800040ac:	01013183          	ld	gp,16(sp)
    800040b0:	02013283          	ld	t0,32(sp)
    800040b4:	02813303          	ld	t1,40(sp)
    800040b8:	03013383          	ld	t2,48(sp)
    800040bc:	03813403          	ld	s0,56(sp)
    800040c0:	04013483          	ld	s1,64(sp)
    800040c4:	04813503          	ld	a0,72(sp)
    800040c8:	05013583          	ld	a1,80(sp)
    800040cc:	05813603          	ld	a2,88(sp)
    800040d0:	06013683          	ld	a3,96(sp)
    800040d4:	06813703          	ld	a4,104(sp)
    800040d8:	07013783          	ld	a5,112(sp)
    800040dc:	07813803          	ld	a6,120(sp)
    800040e0:	08013883          	ld	a7,128(sp)
    800040e4:	08813903          	ld	s2,136(sp)
    800040e8:	09013983          	ld	s3,144(sp)
    800040ec:	09813a03          	ld	s4,152(sp)
    800040f0:	0a013a83          	ld	s5,160(sp)
    800040f4:	0a813b03          	ld	s6,168(sp)
    800040f8:	0b013b83          	ld	s7,176(sp)
    800040fc:	0b813c03          	ld	s8,184(sp)
    80004100:	0c013c83          	ld	s9,192(sp)
    80004104:	0c813d03          	ld	s10,200(sp)
    80004108:	0d013d83          	ld	s11,208(sp)
    8000410c:	0d813e03          	ld	t3,216(sp)
    80004110:	0e013e83          	ld	t4,224(sp)
    80004114:	0e813f03          	ld	t5,232(sp)
    80004118:	0f013f83          	ld	t6,240(sp)
    8000411c:	10010113          	addi	sp,sp,256
    80004120:	10200073          	sret
    80004124:	00000013          	nop
    80004128:	00000013          	nop
    8000412c:	00000013          	nop

0000000080004130 <timervec>:
    80004130:	34051573          	csrrw	a0,mscratch,a0
    80004134:	00b53023          	sd	a1,0(a0)
    80004138:	00c53423          	sd	a2,8(a0)
    8000413c:	00d53823          	sd	a3,16(a0)
    80004140:	01853583          	ld	a1,24(a0)
    80004144:	02053603          	ld	a2,32(a0)
    80004148:	0005b683          	ld	a3,0(a1)
    8000414c:	00c686b3          	add	a3,a3,a2
    80004150:	00d5b023          	sd	a3,0(a1)
    80004154:	00200593          	li	a1,2
    80004158:	14459073          	csrw	sip,a1
    8000415c:	01053683          	ld	a3,16(a0)
    80004160:	00853603          	ld	a2,8(a0)
    80004164:	00053583          	ld	a1,0(a0)
    80004168:	34051573          	csrrw	a0,mscratch,a0
    8000416c:	30200073          	mret

0000000080004170 <plicinit>:
    80004170:	ff010113          	addi	sp,sp,-16
    80004174:	00813423          	sd	s0,8(sp)
    80004178:	01010413          	addi	s0,sp,16
    8000417c:	00813403          	ld	s0,8(sp)
    80004180:	0c0007b7          	lui	a5,0xc000
    80004184:	00100713          	li	a4,1
    80004188:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000418c:	00e7a223          	sw	a4,4(a5)
    80004190:	01010113          	addi	sp,sp,16
    80004194:	00008067          	ret

0000000080004198 <plicinithart>:
    80004198:	ff010113          	addi	sp,sp,-16
    8000419c:	00813023          	sd	s0,0(sp)
    800041a0:	00113423          	sd	ra,8(sp)
    800041a4:	01010413          	addi	s0,sp,16
    800041a8:	00000097          	auipc	ra,0x0
    800041ac:	a40080e7          	jalr	-1472(ra) # 80003be8 <cpuid>
    800041b0:	0085171b          	slliw	a4,a0,0x8
    800041b4:	0c0027b7          	lui	a5,0xc002
    800041b8:	00e787b3          	add	a5,a5,a4
    800041bc:	40200713          	li	a4,1026
    800041c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800041c4:	00813083          	ld	ra,8(sp)
    800041c8:	00013403          	ld	s0,0(sp)
    800041cc:	00d5151b          	slliw	a0,a0,0xd
    800041d0:	0c2017b7          	lui	a5,0xc201
    800041d4:	00a78533          	add	a0,a5,a0
    800041d8:	00052023          	sw	zero,0(a0)
    800041dc:	01010113          	addi	sp,sp,16
    800041e0:	00008067          	ret

00000000800041e4 <plic_claim>:
    800041e4:	ff010113          	addi	sp,sp,-16
    800041e8:	00813023          	sd	s0,0(sp)
    800041ec:	00113423          	sd	ra,8(sp)
    800041f0:	01010413          	addi	s0,sp,16
    800041f4:	00000097          	auipc	ra,0x0
    800041f8:	9f4080e7          	jalr	-1548(ra) # 80003be8 <cpuid>
    800041fc:	00813083          	ld	ra,8(sp)
    80004200:	00013403          	ld	s0,0(sp)
    80004204:	00d5151b          	slliw	a0,a0,0xd
    80004208:	0c2017b7          	lui	a5,0xc201
    8000420c:	00a78533          	add	a0,a5,a0
    80004210:	00452503          	lw	a0,4(a0)
    80004214:	01010113          	addi	sp,sp,16
    80004218:	00008067          	ret

000000008000421c <plic_complete>:
    8000421c:	fe010113          	addi	sp,sp,-32
    80004220:	00813823          	sd	s0,16(sp)
    80004224:	00913423          	sd	s1,8(sp)
    80004228:	00113c23          	sd	ra,24(sp)
    8000422c:	02010413          	addi	s0,sp,32
    80004230:	00050493          	mv	s1,a0
    80004234:	00000097          	auipc	ra,0x0
    80004238:	9b4080e7          	jalr	-1612(ra) # 80003be8 <cpuid>
    8000423c:	01813083          	ld	ra,24(sp)
    80004240:	01013403          	ld	s0,16(sp)
    80004244:	00d5179b          	slliw	a5,a0,0xd
    80004248:	0c201737          	lui	a4,0xc201
    8000424c:	00f707b3          	add	a5,a4,a5
    80004250:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004254:	00813483          	ld	s1,8(sp)
    80004258:	02010113          	addi	sp,sp,32
    8000425c:	00008067          	ret

0000000080004260 <consolewrite>:
    80004260:	fb010113          	addi	sp,sp,-80
    80004264:	04813023          	sd	s0,64(sp)
    80004268:	04113423          	sd	ra,72(sp)
    8000426c:	02913c23          	sd	s1,56(sp)
    80004270:	03213823          	sd	s2,48(sp)
    80004274:	03313423          	sd	s3,40(sp)
    80004278:	03413023          	sd	s4,32(sp)
    8000427c:	01513c23          	sd	s5,24(sp)
    80004280:	05010413          	addi	s0,sp,80
    80004284:	06c05c63          	blez	a2,800042fc <consolewrite+0x9c>
    80004288:	00060993          	mv	s3,a2
    8000428c:	00050a13          	mv	s4,a0
    80004290:	00058493          	mv	s1,a1
    80004294:	00000913          	li	s2,0
    80004298:	fff00a93          	li	s5,-1
    8000429c:	01c0006f          	j	800042b8 <consolewrite+0x58>
    800042a0:	fbf44503          	lbu	a0,-65(s0)
    800042a4:	0019091b          	addiw	s2,s2,1
    800042a8:	00148493          	addi	s1,s1,1
    800042ac:	00001097          	auipc	ra,0x1
    800042b0:	a9c080e7          	jalr	-1380(ra) # 80004d48 <uartputc>
    800042b4:	03298063          	beq	s3,s2,800042d4 <consolewrite+0x74>
    800042b8:	00048613          	mv	a2,s1
    800042bc:	00100693          	li	a3,1
    800042c0:	000a0593          	mv	a1,s4
    800042c4:	fbf40513          	addi	a0,s0,-65
    800042c8:	00000097          	auipc	ra,0x0
    800042cc:	9d8080e7          	jalr	-1576(ra) # 80003ca0 <either_copyin>
    800042d0:	fd5518e3          	bne	a0,s5,800042a0 <consolewrite+0x40>
    800042d4:	04813083          	ld	ra,72(sp)
    800042d8:	04013403          	ld	s0,64(sp)
    800042dc:	03813483          	ld	s1,56(sp)
    800042e0:	02813983          	ld	s3,40(sp)
    800042e4:	02013a03          	ld	s4,32(sp)
    800042e8:	01813a83          	ld	s5,24(sp)
    800042ec:	00090513          	mv	a0,s2
    800042f0:	03013903          	ld	s2,48(sp)
    800042f4:	05010113          	addi	sp,sp,80
    800042f8:	00008067          	ret
    800042fc:	00000913          	li	s2,0
    80004300:	fd5ff06f          	j	800042d4 <consolewrite+0x74>

0000000080004304 <consoleread>:
    80004304:	f9010113          	addi	sp,sp,-112
    80004308:	06813023          	sd	s0,96(sp)
    8000430c:	04913c23          	sd	s1,88(sp)
    80004310:	05213823          	sd	s2,80(sp)
    80004314:	05313423          	sd	s3,72(sp)
    80004318:	05413023          	sd	s4,64(sp)
    8000431c:	03513c23          	sd	s5,56(sp)
    80004320:	03613823          	sd	s6,48(sp)
    80004324:	03713423          	sd	s7,40(sp)
    80004328:	03813023          	sd	s8,32(sp)
    8000432c:	06113423          	sd	ra,104(sp)
    80004330:	01913c23          	sd	s9,24(sp)
    80004334:	07010413          	addi	s0,sp,112
    80004338:	00060b93          	mv	s7,a2
    8000433c:	00050913          	mv	s2,a0
    80004340:	00058c13          	mv	s8,a1
    80004344:	00060b1b          	sext.w	s6,a2
    80004348:	00004497          	auipc	s1,0x4
    8000434c:	39048493          	addi	s1,s1,912 # 800086d8 <cons>
    80004350:	00400993          	li	s3,4
    80004354:	fff00a13          	li	s4,-1
    80004358:	00a00a93          	li	s5,10
    8000435c:	05705e63          	blez	s7,800043b8 <consoleread+0xb4>
    80004360:	09c4a703          	lw	a4,156(s1)
    80004364:	0984a783          	lw	a5,152(s1)
    80004368:	0007071b          	sext.w	a4,a4
    8000436c:	08e78463          	beq	a5,a4,800043f4 <consoleread+0xf0>
    80004370:	07f7f713          	andi	a4,a5,127
    80004374:	00e48733          	add	a4,s1,a4
    80004378:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000437c:	0017869b          	addiw	a3,a5,1
    80004380:	08d4ac23          	sw	a3,152(s1)
    80004384:	00070c9b          	sext.w	s9,a4
    80004388:	0b370663          	beq	a4,s3,80004434 <consoleread+0x130>
    8000438c:	00100693          	li	a3,1
    80004390:	f9f40613          	addi	a2,s0,-97
    80004394:	000c0593          	mv	a1,s8
    80004398:	00090513          	mv	a0,s2
    8000439c:	f8e40fa3          	sb	a4,-97(s0)
    800043a0:	00000097          	auipc	ra,0x0
    800043a4:	8b4080e7          	jalr	-1868(ra) # 80003c54 <either_copyout>
    800043a8:	01450863          	beq	a0,s4,800043b8 <consoleread+0xb4>
    800043ac:	001c0c13          	addi	s8,s8,1
    800043b0:	fffb8b9b          	addiw	s7,s7,-1
    800043b4:	fb5c94e3          	bne	s9,s5,8000435c <consoleread+0x58>
    800043b8:	000b851b          	sext.w	a0,s7
    800043bc:	06813083          	ld	ra,104(sp)
    800043c0:	06013403          	ld	s0,96(sp)
    800043c4:	05813483          	ld	s1,88(sp)
    800043c8:	05013903          	ld	s2,80(sp)
    800043cc:	04813983          	ld	s3,72(sp)
    800043d0:	04013a03          	ld	s4,64(sp)
    800043d4:	03813a83          	ld	s5,56(sp)
    800043d8:	02813b83          	ld	s7,40(sp)
    800043dc:	02013c03          	ld	s8,32(sp)
    800043e0:	01813c83          	ld	s9,24(sp)
    800043e4:	40ab053b          	subw	a0,s6,a0
    800043e8:	03013b03          	ld	s6,48(sp)
    800043ec:	07010113          	addi	sp,sp,112
    800043f0:	00008067          	ret
    800043f4:	00001097          	auipc	ra,0x1
    800043f8:	1d8080e7          	jalr	472(ra) # 800055cc <push_on>
    800043fc:	0984a703          	lw	a4,152(s1)
    80004400:	09c4a783          	lw	a5,156(s1)
    80004404:	0007879b          	sext.w	a5,a5
    80004408:	fef70ce3          	beq	a4,a5,80004400 <consoleread+0xfc>
    8000440c:	00001097          	auipc	ra,0x1
    80004410:	234080e7          	jalr	564(ra) # 80005640 <pop_on>
    80004414:	0984a783          	lw	a5,152(s1)
    80004418:	07f7f713          	andi	a4,a5,127
    8000441c:	00e48733          	add	a4,s1,a4
    80004420:	01874703          	lbu	a4,24(a4)
    80004424:	0017869b          	addiw	a3,a5,1
    80004428:	08d4ac23          	sw	a3,152(s1)
    8000442c:	00070c9b          	sext.w	s9,a4
    80004430:	f5371ee3          	bne	a4,s3,8000438c <consoleread+0x88>
    80004434:	000b851b          	sext.w	a0,s7
    80004438:	f96bf2e3          	bgeu	s7,s6,800043bc <consoleread+0xb8>
    8000443c:	08f4ac23          	sw	a5,152(s1)
    80004440:	f7dff06f          	j	800043bc <consoleread+0xb8>

0000000080004444 <consputc>:
    80004444:	10000793          	li	a5,256
    80004448:	00f50663          	beq	a0,a5,80004454 <consputc+0x10>
    8000444c:	00001317          	auipc	t1,0x1
    80004450:	9f430067          	jr	-1548(t1) # 80004e40 <uartputc_sync>
    80004454:	ff010113          	addi	sp,sp,-16
    80004458:	00113423          	sd	ra,8(sp)
    8000445c:	00813023          	sd	s0,0(sp)
    80004460:	01010413          	addi	s0,sp,16
    80004464:	00800513          	li	a0,8
    80004468:	00001097          	auipc	ra,0x1
    8000446c:	9d8080e7          	jalr	-1576(ra) # 80004e40 <uartputc_sync>
    80004470:	02000513          	li	a0,32
    80004474:	00001097          	auipc	ra,0x1
    80004478:	9cc080e7          	jalr	-1588(ra) # 80004e40 <uartputc_sync>
    8000447c:	00013403          	ld	s0,0(sp)
    80004480:	00813083          	ld	ra,8(sp)
    80004484:	00800513          	li	a0,8
    80004488:	01010113          	addi	sp,sp,16
    8000448c:	00001317          	auipc	t1,0x1
    80004490:	9b430067          	jr	-1612(t1) # 80004e40 <uartputc_sync>

0000000080004494 <consoleintr>:
    80004494:	fe010113          	addi	sp,sp,-32
    80004498:	00813823          	sd	s0,16(sp)
    8000449c:	00913423          	sd	s1,8(sp)
    800044a0:	01213023          	sd	s2,0(sp)
    800044a4:	00113c23          	sd	ra,24(sp)
    800044a8:	02010413          	addi	s0,sp,32
    800044ac:	00004917          	auipc	s2,0x4
    800044b0:	22c90913          	addi	s2,s2,556 # 800086d8 <cons>
    800044b4:	00050493          	mv	s1,a0
    800044b8:	00090513          	mv	a0,s2
    800044bc:	00001097          	auipc	ra,0x1
    800044c0:	e40080e7          	jalr	-448(ra) # 800052fc <acquire>
    800044c4:	02048c63          	beqz	s1,800044fc <consoleintr+0x68>
    800044c8:	0a092783          	lw	a5,160(s2)
    800044cc:	09892703          	lw	a4,152(s2)
    800044d0:	07f00693          	li	a3,127
    800044d4:	40e7873b          	subw	a4,a5,a4
    800044d8:	02e6e263          	bltu	a3,a4,800044fc <consoleintr+0x68>
    800044dc:	00d00713          	li	a4,13
    800044e0:	04e48063          	beq	s1,a4,80004520 <consoleintr+0x8c>
    800044e4:	07f7f713          	andi	a4,a5,127
    800044e8:	00e90733          	add	a4,s2,a4
    800044ec:	0017879b          	addiw	a5,a5,1
    800044f0:	0af92023          	sw	a5,160(s2)
    800044f4:	00970c23          	sb	s1,24(a4)
    800044f8:	08f92e23          	sw	a5,156(s2)
    800044fc:	01013403          	ld	s0,16(sp)
    80004500:	01813083          	ld	ra,24(sp)
    80004504:	00813483          	ld	s1,8(sp)
    80004508:	00013903          	ld	s2,0(sp)
    8000450c:	00004517          	auipc	a0,0x4
    80004510:	1cc50513          	addi	a0,a0,460 # 800086d8 <cons>
    80004514:	02010113          	addi	sp,sp,32
    80004518:	00001317          	auipc	t1,0x1
    8000451c:	eb030067          	jr	-336(t1) # 800053c8 <release>
    80004520:	00a00493          	li	s1,10
    80004524:	fc1ff06f          	j	800044e4 <consoleintr+0x50>

0000000080004528 <consoleinit>:
    80004528:	fe010113          	addi	sp,sp,-32
    8000452c:	00113c23          	sd	ra,24(sp)
    80004530:	00813823          	sd	s0,16(sp)
    80004534:	00913423          	sd	s1,8(sp)
    80004538:	02010413          	addi	s0,sp,32
    8000453c:	00004497          	auipc	s1,0x4
    80004540:	19c48493          	addi	s1,s1,412 # 800086d8 <cons>
    80004544:	00048513          	mv	a0,s1
    80004548:	00002597          	auipc	a1,0x2
    8000454c:	0f858593          	addi	a1,a1,248 # 80006640 <CONSOLE_STATUS+0x630>
    80004550:	00001097          	auipc	ra,0x1
    80004554:	d88080e7          	jalr	-632(ra) # 800052d8 <initlock>
    80004558:	00000097          	auipc	ra,0x0
    8000455c:	7ac080e7          	jalr	1964(ra) # 80004d04 <uartinit>
    80004560:	01813083          	ld	ra,24(sp)
    80004564:	01013403          	ld	s0,16(sp)
    80004568:	00000797          	auipc	a5,0x0
    8000456c:	d9c78793          	addi	a5,a5,-612 # 80004304 <consoleread>
    80004570:	0af4bc23          	sd	a5,184(s1)
    80004574:	00000797          	auipc	a5,0x0
    80004578:	cec78793          	addi	a5,a5,-788 # 80004260 <consolewrite>
    8000457c:	0cf4b023          	sd	a5,192(s1)
    80004580:	00813483          	ld	s1,8(sp)
    80004584:	02010113          	addi	sp,sp,32
    80004588:	00008067          	ret

000000008000458c <console_read>:
    8000458c:	ff010113          	addi	sp,sp,-16
    80004590:	00813423          	sd	s0,8(sp)
    80004594:	01010413          	addi	s0,sp,16
    80004598:	00813403          	ld	s0,8(sp)
    8000459c:	00004317          	auipc	t1,0x4
    800045a0:	1f433303          	ld	t1,500(t1) # 80008790 <devsw+0x10>
    800045a4:	01010113          	addi	sp,sp,16
    800045a8:	00030067          	jr	t1

00000000800045ac <console_write>:
    800045ac:	ff010113          	addi	sp,sp,-16
    800045b0:	00813423          	sd	s0,8(sp)
    800045b4:	01010413          	addi	s0,sp,16
    800045b8:	00813403          	ld	s0,8(sp)
    800045bc:	00004317          	auipc	t1,0x4
    800045c0:	1dc33303          	ld	t1,476(t1) # 80008798 <devsw+0x18>
    800045c4:	01010113          	addi	sp,sp,16
    800045c8:	00030067          	jr	t1

00000000800045cc <panic>:
    800045cc:	fe010113          	addi	sp,sp,-32
    800045d0:	00113c23          	sd	ra,24(sp)
    800045d4:	00813823          	sd	s0,16(sp)
    800045d8:	00913423          	sd	s1,8(sp)
    800045dc:	02010413          	addi	s0,sp,32
    800045e0:	00050493          	mv	s1,a0
    800045e4:	00002517          	auipc	a0,0x2
    800045e8:	06450513          	addi	a0,a0,100 # 80006648 <CONSOLE_STATUS+0x638>
    800045ec:	00004797          	auipc	a5,0x4
    800045f0:	2407a623          	sw	zero,588(a5) # 80008838 <pr+0x18>
    800045f4:	00000097          	auipc	ra,0x0
    800045f8:	034080e7          	jalr	52(ra) # 80004628 <__printf>
    800045fc:	00048513          	mv	a0,s1
    80004600:	00000097          	auipc	ra,0x0
    80004604:	028080e7          	jalr	40(ra) # 80004628 <__printf>
    80004608:	00002517          	auipc	a0,0x2
    8000460c:	b5850513          	addi	a0,a0,-1192 # 80006160 <CONSOLE_STATUS+0x150>
    80004610:	00000097          	auipc	ra,0x0
    80004614:	018080e7          	jalr	24(ra) # 80004628 <__printf>
    80004618:	00100793          	li	a5,1
    8000461c:	00003717          	auipc	a4,0x3
    80004620:	f4f72e23          	sw	a5,-164(a4) # 80007578 <panicked>
    80004624:	0000006f          	j	80004624 <panic+0x58>

0000000080004628 <__printf>:
    80004628:	f3010113          	addi	sp,sp,-208
    8000462c:	08813023          	sd	s0,128(sp)
    80004630:	07313423          	sd	s3,104(sp)
    80004634:	09010413          	addi	s0,sp,144
    80004638:	05813023          	sd	s8,64(sp)
    8000463c:	08113423          	sd	ra,136(sp)
    80004640:	06913c23          	sd	s1,120(sp)
    80004644:	07213823          	sd	s2,112(sp)
    80004648:	07413023          	sd	s4,96(sp)
    8000464c:	05513c23          	sd	s5,88(sp)
    80004650:	05613823          	sd	s6,80(sp)
    80004654:	05713423          	sd	s7,72(sp)
    80004658:	03913c23          	sd	s9,56(sp)
    8000465c:	03a13823          	sd	s10,48(sp)
    80004660:	03b13423          	sd	s11,40(sp)
    80004664:	00004317          	auipc	t1,0x4
    80004668:	1bc30313          	addi	t1,t1,444 # 80008820 <pr>
    8000466c:	01832c03          	lw	s8,24(t1)
    80004670:	00b43423          	sd	a1,8(s0)
    80004674:	00c43823          	sd	a2,16(s0)
    80004678:	00d43c23          	sd	a3,24(s0)
    8000467c:	02e43023          	sd	a4,32(s0)
    80004680:	02f43423          	sd	a5,40(s0)
    80004684:	03043823          	sd	a6,48(s0)
    80004688:	03143c23          	sd	a7,56(s0)
    8000468c:	00050993          	mv	s3,a0
    80004690:	4a0c1663          	bnez	s8,80004b3c <__printf+0x514>
    80004694:	60098c63          	beqz	s3,80004cac <__printf+0x684>
    80004698:	0009c503          	lbu	a0,0(s3)
    8000469c:	00840793          	addi	a5,s0,8
    800046a0:	f6f43c23          	sd	a5,-136(s0)
    800046a4:	00000493          	li	s1,0
    800046a8:	22050063          	beqz	a0,800048c8 <__printf+0x2a0>
    800046ac:	00002a37          	lui	s4,0x2
    800046b0:	00018ab7          	lui	s5,0x18
    800046b4:	000f4b37          	lui	s6,0xf4
    800046b8:	00989bb7          	lui	s7,0x989
    800046bc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800046c0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800046c4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800046c8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800046cc:	00148c9b          	addiw	s9,s1,1
    800046d0:	02500793          	li	a5,37
    800046d4:	01998933          	add	s2,s3,s9
    800046d8:	38f51263          	bne	a0,a5,80004a5c <__printf+0x434>
    800046dc:	00094783          	lbu	a5,0(s2)
    800046e0:	00078c9b          	sext.w	s9,a5
    800046e4:	1e078263          	beqz	a5,800048c8 <__printf+0x2a0>
    800046e8:	0024849b          	addiw	s1,s1,2
    800046ec:	07000713          	li	a4,112
    800046f0:	00998933          	add	s2,s3,s1
    800046f4:	38e78a63          	beq	a5,a4,80004a88 <__printf+0x460>
    800046f8:	20f76863          	bltu	a4,a5,80004908 <__printf+0x2e0>
    800046fc:	42a78863          	beq	a5,a0,80004b2c <__printf+0x504>
    80004700:	06400713          	li	a4,100
    80004704:	40e79663          	bne	a5,a4,80004b10 <__printf+0x4e8>
    80004708:	f7843783          	ld	a5,-136(s0)
    8000470c:	0007a603          	lw	a2,0(a5)
    80004710:	00878793          	addi	a5,a5,8
    80004714:	f6f43c23          	sd	a5,-136(s0)
    80004718:	42064a63          	bltz	a2,80004b4c <__printf+0x524>
    8000471c:	00a00713          	li	a4,10
    80004720:	02e677bb          	remuw	a5,a2,a4
    80004724:	00002d97          	auipc	s11,0x2
    80004728:	f4cd8d93          	addi	s11,s11,-180 # 80006670 <digits>
    8000472c:	00900593          	li	a1,9
    80004730:	0006051b          	sext.w	a0,a2
    80004734:	00000c93          	li	s9,0
    80004738:	02079793          	slli	a5,a5,0x20
    8000473c:	0207d793          	srli	a5,a5,0x20
    80004740:	00fd87b3          	add	a5,s11,a5
    80004744:	0007c783          	lbu	a5,0(a5)
    80004748:	02e656bb          	divuw	a3,a2,a4
    8000474c:	f8f40023          	sb	a5,-128(s0)
    80004750:	14c5d863          	bge	a1,a2,800048a0 <__printf+0x278>
    80004754:	06300593          	li	a1,99
    80004758:	00100c93          	li	s9,1
    8000475c:	02e6f7bb          	remuw	a5,a3,a4
    80004760:	02079793          	slli	a5,a5,0x20
    80004764:	0207d793          	srli	a5,a5,0x20
    80004768:	00fd87b3          	add	a5,s11,a5
    8000476c:	0007c783          	lbu	a5,0(a5)
    80004770:	02e6d73b          	divuw	a4,a3,a4
    80004774:	f8f400a3          	sb	a5,-127(s0)
    80004778:	12a5f463          	bgeu	a1,a0,800048a0 <__printf+0x278>
    8000477c:	00a00693          	li	a3,10
    80004780:	00900593          	li	a1,9
    80004784:	02d777bb          	remuw	a5,a4,a3
    80004788:	02079793          	slli	a5,a5,0x20
    8000478c:	0207d793          	srli	a5,a5,0x20
    80004790:	00fd87b3          	add	a5,s11,a5
    80004794:	0007c503          	lbu	a0,0(a5)
    80004798:	02d757bb          	divuw	a5,a4,a3
    8000479c:	f8a40123          	sb	a0,-126(s0)
    800047a0:	48e5f263          	bgeu	a1,a4,80004c24 <__printf+0x5fc>
    800047a4:	06300513          	li	a0,99
    800047a8:	02d7f5bb          	remuw	a1,a5,a3
    800047ac:	02059593          	slli	a1,a1,0x20
    800047b0:	0205d593          	srli	a1,a1,0x20
    800047b4:	00bd85b3          	add	a1,s11,a1
    800047b8:	0005c583          	lbu	a1,0(a1)
    800047bc:	02d7d7bb          	divuw	a5,a5,a3
    800047c0:	f8b401a3          	sb	a1,-125(s0)
    800047c4:	48e57263          	bgeu	a0,a4,80004c48 <__printf+0x620>
    800047c8:	3e700513          	li	a0,999
    800047cc:	02d7f5bb          	remuw	a1,a5,a3
    800047d0:	02059593          	slli	a1,a1,0x20
    800047d4:	0205d593          	srli	a1,a1,0x20
    800047d8:	00bd85b3          	add	a1,s11,a1
    800047dc:	0005c583          	lbu	a1,0(a1)
    800047e0:	02d7d7bb          	divuw	a5,a5,a3
    800047e4:	f8b40223          	sb	a1,-124(s0)
    800047e8:	46e57663          	bgeu	a0,a4,80004c54 <__printf+0x62c>
    800047ec:	02d7f5bb          	remuw	a1,a5,a3
    800047f0:	02059593          	slli	a1,a1,0x20
    800047f4:	0205d593          	srli	a1,a1,0x20
    800047f8:	00bd85b3          	add	a1,s11,a1
    800047fc:	0005c583          	lbu	a1,0(a1)
    80004800:	02d7d7bb          	divuw	a5,a5,a3
    80004804:	f8b402a3          	sb	a1,-123(s0)
    80004808:	46ea7863          	bgeu	s4,a4,80004c78 <__printf+0x650>
    8000480c:	02d7f5bb          	remuw	a1,a5,a3
    80004810:	02059593          	slli	a1,a1,0x20
    80004814:	0205d593          	srli	a1,a1,0x20
    80004818:	00bd85b3          	add	a1,s11,a1
    8000481c:	0005c583          	lbu	a1,0(a1)
    80004820:	02d7d7bb          	divuw	a5,a5,a3
    80004824:	f8b40323          	sb	a1,-122(s0)
    80004828:	3eeaf863          	bgeu	s5,a4,80004c18 <__printf+0x5f0>
    8000482c:	02d7f5bb          	remuw	a1,a5,a3
    80004830:	02059593          	slli	a1,a1,0x20
    80004834:	0205d593          	srli	a1,a1,0x20
    80004838:	00bd85b3          	add	a1,s11,a1
    8000483c:	0005c583          	lbu	a1,0(a1)
    80004840:	02d7d7bb          	divuw	a5,a5,a3
    80004844:	f8b403a3          	sb	a1,-121(s0)
    80004848:	42eb7e63          	bgeu	s6,a4,80004c84 <__printf+0x65c>
    8000484c:	02d7f5bb          	remuw	a1,a5,a3
    80004850:	02059593          	slli	a1,a1,0x20
    80004854:	0205d593          	srli	a1,a1,0x20
    80004858:	00bd85b3          	add	a1,s11,a1
    8000485c:	0005c583          	lbu	a1,0(a1)
    80004860:	02d7d7bb          	divuw	a5,a5,a3
    80004864:	f8b40423          	sb	a1,-120(s0)
    80004868:	42ebfc63          	bgeu	s7,a4,80004ca0 <__printf+0x678>
    8000486c:	02079793          	slli	a5,a5,0x20
    80004870:	0207d793          	srli	a5,a5,0x20
    80004874:	00fd8db3          	add	s11,s11,a5
    80004878:	000dc703          	lbu	a4,0(s11)
    8000487c:	00a00793          	li	a5,10
    80004880:	00900c93          	li	s9,9
    80004884:	f8e404a3          	sb	a4,-119(s0)
    80004888:	00065c63          	bgez	a2,800048a0 <__printf+0x278>
    8000488c:	f9040713          	addi	a4,s0,-112
    80004890:	00f70733          	add	a4,a4,a5
    80004894:	02d00693          	li	a3,45
    80004898:	fed70823          	sb	a3,-16(a4)
    8000489c:	00078c93          	mv	s9,a5
    800048a0:	f8040793          	addi	a5,s0,-128
    800048a4:	01978cb3          	add	s9,a5,s9
    800048a8:	f7f40d13          	addi	s10,s0,-129
    800048ac:	000cc503          	lbu	a0,0(s9)
    800048b0:	fffc8c93          	addi	s9,s9,-1
    800048b4:	00000097          	auipc	ra,0x0
    800048b8:	b90080e7          	jalr	-1136(ra) # 80004444 <consputc>
    800048bc:	ffac98e3          	bne	s9,s10,800048ac <__printf+0x284>
    800048c0:	00094503          	lbu	a0,0(s2)
    800048c4:	e00514e3          	bnez	a0,800046cc <__printf+0xa4>
    800048c8:	1a0c1663          	bnez	s8,80004a74 <__printf+0x44c>
    800048cc:	08813083          	ld	ra,136(sp)
    800048d0:	08013403          	ld	s0,128(sp)
    800048d4:	07813483          	ld	s1,120(sp)
    800048d8:	07013903          	ld	s2,112(sp)
    800048dc:	06813983          	ld	s3,104(sp)
    800048e0:	06013a03          	ld	s4,96(sp)
    800048e4:	05813a83          	ld	s5,88(sp)
    800048e8:	05013b03          	ld	s6,80(sp)
    800048ec:	04813b83          	ld	s7,72(sp)
    800048f0:	04013c03          	ld	s8,64(sp)
    800048f4:	03813c83          	ld	s9,56(sp)
    800048f8:	03013d03          	ld	s10,48(sp)
    800048fc:	02813d83          	ld	s11,40(sp)
    80004900:	0d010113          	addi	sp,sp,208
    80004904:	00008067          	ret
    80004908:	07300713          	li	a4,115
    8000490c:	1ce78a63          	beq	a5,a4,80004ae0 <__printf+0x4b8>
    80004910:	07800713          	li	a4,120
    80004914:	1ee79e63          	bne	a5,a4,80004b10 <__printf+0x4e8>
    80004918:	f7843783          	ld	a5,-136(s0)
    8000491c:	0007a703          	lw	a4,0(a5)
    80004920:	00878793          	addi	a5,a5,8
    80004924:	f6f43c23          	sd	a5,-136(s0)
    80004928:	28074263          	bltz	a4,80004bac <__printf+0x584>
    8000492c:	00002d97          	auipc	s11,0x2
    80004930:	d44d8d93          	addi	s11,s11,-700 # 80006670 <digits>
    80004934:	00f77793          	andi	a5,a4,15
    80004938:	00fd87b3          	add	a5,s11,a5
    8000493c:	0007c683          	lbu	a3,0(a5)
    80004940:	00f00613          	li	a2,15
    80004944:	0007079b          	sext.w	a5,a4
    80004948:	f8d40023          	sb	a3,-128(s0)
    8000494c:	0047559b          	srliw	a1,a4,0x4
    80004950:	0047569b          	srliw	a3,a4,0x4
    80004954:	00000c93          	li	s9,0
    80004958:	0ee65063          	bge	a2,a4,80004a38 <__printf+0x410>
    8000495c:	00f6f693          	andi	a3,a3,15
    80004960:	00dd86b3          	add	a3,s11,a3
    80004964:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004968:	0087d79b          	srliw	a5,a5,0x8
    8000496c:	00100c93          	li	s9,1
    80004970:	f8d400a3          	sb	a3,-127(s0)
    80004974:	0cb67263          	bgeu	a2,a1,80004a38 <__printf+0x410>
    80004978:	00f7f693          	andi	a3,a5,15
    8000497c:	00dd86b3          	add	a3,s11,a3
    80004980:	0006c583          	lbu	a1,0(a3)
    80004984:	00f00613          	li	a2,15
    80004988:	0047d69b          	srliw	a3,a5,0x4
    8000498c:	f8b40123          	sb	a1,-126(s0)
    80004990:	0047d593          	srli	a1,a5,0x4
    80004994:	28f67e63          	bgeu	a2,a5,80004c30 <__printf+0x608>
    80004998:	00f6f693          	andi	a3,a3,15
    8000499c:	00dd86b3          	add	a3,s11,a3
    800049a0:	0006c503          	lbu	a0,0(a3)
    800049a4:	0087d813          	srli	a6,a5,0x8
    800049a8:	0087d69b          	srliw	a3,a5,0x8
    800049ac:	f8a401a3          	sb	a0,-125(s0)
    800049b0:	28b67663          	bgeu	a2,a1,80004c3c <__printf+0x614>
    800049b4:	00f6f693          	andi	a3,a3,15
    800049b8:	00dd86b3          	add	a3,s11,a3
    800049bc:	0006c583          	lbu	a1,0(a3)
    800049c0:	00c7d513          	srli	a0,a5,0xc
    800049c4:	00c7d69b          	srliw	a3,a5,0xc
    800049c8:	f8b40223          	sb	a1,-124(s0)
    800049cc:	29067a63          	bgeu	a2,a6,80004c60 <__printf+0x638>
    800049d0:	00f6f693          	andi	a3,a3,15
    800049d4:	00dd86b3          	add	a3,s11,a3
    800049d8:	0006c583          	lbu	a1,0(a3)
    800049dc:	0107d813          	srli	a6,a5,0x10
    800049e0:	0107d69b          	srliw	a3,a5,0x10
    800049e4:	f8b402a3          	sb	a1,-123(s0)
    800049e8:	28a67263          	bgeu	a2,a0,80004c6c <__printf+0x644>
    800049ec:	00f6f693          	andi	a3,a3,15
    800049f0:	00dd86b3          	add	a3,s11,a3
    800049f4:	0006c683          	lbu	a3,0(a3)
    800049f8:	0147d79b          	srliw	a5,a5,0x14
    800049fc:	f8d40323          	sb	a3,-122(s0)
    80004a00:	21067663          	bgeu	a2,a6,80004c0c <__printf+0x5e4>
    80004a04:	02079793          	slli	a5,a5,0x20
    80004a08:	0207d793          	srli	a5,a5,0x20
    80004a0c:	00fd8db3          	add	s11,s11,a5
    80004a10:	000dc683          	lbu	a3,0(s11)
    80004a14:	00800793          	li	a5,8
    80004a18:	00700c93          	li	s9,7
    80004a1c:	f8d403a3          	sb	a3,-121(s0)
    80004a20:	00075c63          	bgez	a4,80004a38 <__printf+0x410>
    80004a24:	f9040713          	addi	a4,s0,-112
    80004a28:	00f70733          	add	a4,a4,a5
    80004a2c:	02d00693          	li	a3,45
    80004a30:	fed70823          	sb	a3,-16(a4)
    80004a34:	00078c93          	mv	s9,a5
    80004a38:	f8040793          	addi	a5,s0,-128
    80004a3c:	01978cb3          	add	s9,a5,s9
    80004a40:	f7f40d13          	addi	s10,s0,-129
    80004a44:	000cc503          	lbu	a0,0(s9)
    80004a48:	fffc8c93          	addi	s9,s9,-1
    80004a4c:	00000097          	auipc	ra,0x0
    80004a50:	9f8080e7          	jalr	-1544(ra) # 80004444 <consputc>
    80004a54:	ff9d18e3          	bne	s10,s9,80004a44 <__printf+0x41c>
    80004a58:	0100006f          	j	80004a68 <__printf+0x440>
    80004a5c:	00000097          	auipc	ra,0x0
    80004a60:	9e8080e7          	jalr	-1560(ra) # 80004444 <consputc>
    80004a64:	000c8493          	mv	s1,s9
    80004a68:	00094503          	lbu	a0,0(s2)
    80004a6c:	c60510e3          	bnez	a0,800046cc <__printf+0xa4>
    80004a70:	e40c0ee3          	beqz	s8,800048cc <__printf+0x2a4>
    80004a74:	00004517          	auipc	a0,0x4
    80004a78:	dac50513          	addi	a0,a0,-596 # 80008820 <pr>
    80004a7c:	00001097          	auipc	ra,0x1
    80004a80:	94c080e7          	jalr	-1716(ra) # 800053c8 <release>
    80004a84:	e49ff06f          	j	800048cc <__printf+0x2a4>
    80004a88:	f7843783          	ld	a5,-136(s0)
    80004a8c:	03000513          	li	a0,48
    80004a90:	01000d13          	li	s10,16
    80004a94:	00878713          	addi	a4,a5,8
    80004a98:	0007bc83          	ld	s9,0(a5)
    80004a9c:	f6e43c23          	sd	a4,-136(s0)
    80004aa0:	00000097          	auipc	ra,0x0
    80004aa4:	9a4080e7          	jalr	-1628(ra) # 80004444 <consputc>
    80004aa8:	07800513          	li	a0,120
    80004aac:	00000097          	auipc	ra,0x0
    80004ab0:	998080e7          	jalr	-1640(ra) # 80004444 <consputc>
    80004ab4:	00002d97          	auipc	s11,0x2
    80004ab8:	bbcd8d93          	addi	s11,s11,-1092 # 80006670 <digits>
    80004abc:	03ccd793          	srli	a5,s9,0x3c
    80004ac0:	00fd87b3          	add	a5,s11,a5
    80004ac4:	0007c503          	lbu	a0,0(a5)
    80004ac8:	fffd0d1b          	addiw	s10,s10,-1
    80004acc:	004c9c93          	slli	s9,s9,0x4
    80004ad0:	00000097          	auipc	ra,0x0
    80004ad4:	974080e7          	jalr	-1676(ra) # 80004444 <consputc>
    80004ad8:	fe0d12e3          	bnez	s10,80004abc <__printf+0x494>
    80004adc:	f8dff06f          	j	80004a68 <__printf+0x440>
    80004ae0:	f7843783          	ld	a5,-136(s0)
    80004ae4:	0007bc83          	ld	s9,0(a5)
    80004ae8:	00878793          	addi	a5,a5,8
    80004aec:	f6f43c23          	sd	a5,-136(s0)
    80004af0:	000c9a63          	bnez	s9,80004b04 <__printf+0x4dc>
    80004af4:	1080006f          	j	80004bfc <__printf+0x5d4>
    80004af8:	001c8c93          	addi	s9,s9,1
    80004afc:	00000097          	auipc	ra,0x0
    80004b00:	948080e7          	jalr	-1720(ra) # 80004444 <consputc>
    80004b04:	000cc503          	lbu	a0,0(s9)
    80004b08:	fe0518e3          	bnez	a0,80004af8 <__printf+0x4d0>
    80004b0c:	f5dff06f          	j	80004a68 <__printf+0x440>
    80004b10:	02500513          	li	a0,37
    80004b14:	00000097          	auipc	ra,0x0
    80004b18:	930080e7          	jalr	-1744(ra) # 80004444 <consputc>
    80004b1c:	000c8513          	mv	a0,s9
    80004b20:	00000097          	auipc	ra,0x0
    80004b24:	924080e7          	jalr	-1756(ra) # 80004444 <consputc>
    80004b28:	f41ff06f          	j	80004a68 <__printf+0x440>
    80004b2c:	02500513          	li	a0,37
    80004b30:	00000097          	auipc	ra,0x0
    80004b34:	914080e7          	jalr	-1772(ra) # 80004444 <consputc>
    80004b38:	f31ff06f          	j	80004a68 <__printf+0x440>
    80004b3c:	00030513          	mv	a0,t1
    80004b40:	00000097          	auipc	ra,0x0
    80004b44:	7bc080e7          	jalr	1980(ra) # 800052fc <acquire>
    80004b48:	b4dff06f          	j	80004694 <__printf+0x6c>
    80004b4c:	40c0053b          	negw	a0,a2
    80004b50:	00a00713          	li	a4,10
    80004b54:	02e576bb          	remuw	a3,a0,a4
    80004b58:	00002d97          	auipc	s11,0x2
    80004b5c:	b18d8d93          	addi	s11,s11,-1256 # 80006670 <digits>
    80004b60:	ff700593          	li	a1,-9
    80004b64:	02069693          	slli	a3,a3,0x20
    80004b68:	0206d693          	srli	a3,a3,0x20
    80004b6c:	00dd86b3          	add	a3,s11,a3
    80004b70:	0006c683          	lbu	a3,0(a3)
    80004b74:	02e557bb          	divuw	a5,a0,a4
    80004b78:	f8d40023          	sb	a3,-128(s0)
    80004b7c:	10b65e63          	bge	a2,a1,80004c98 <__printf+0x670>
    80004b80:	06300593          	li	a1,99
    80004b84:	02e7f6bb          	remuw	a3,a5,a4
    80004b88:	02069693          	slli	a3,a3,0x20
    80004b8c:	0206d693          	srli	a3,a3,0x20
    80004b90:	00dd86b3          	add	a3,s11,a3
    80004b94:	0006c683          	lbu	a3,0(a3)
    80004b98:	02e7d73b          	divuw	a4,a5,a4
    80004b9c:	00200793          	li	a5,2
    80004ba0:	f8d400a3          	sb	a3,-127(s0)
    80004ba4:	bca5ece3          	bltu	a1,a0,8000477c <__printf+0x154>
    80004ba8:	ce5ff06f          	j	8000488c <__printf+0x264>
    80004bac:	40e007bb          	negw	a5,a4
    80004bb0:	00002d97          	auipc	s11,0x2
    80004bb4:	ac0d8d93          	addi	s11,s11,-1344 # 80006670 <digits>
    80004bb8:	00f7f693          	andi	a3,a5,15
    80004bbc:	00dd86b3          	add	a3,s11,a3
    80004bc0:	0006c583          	lbu	a1,0(a3)
    80004bc4:	ff100613          	li	a2,-15
    80004bc8:	0047d69b          	srliw	a3,a5,0x4
    80004bcc:	f8b40023          	sb	a1,-128(s0)
    80004bd0:	0047d59b          	srliw	a1,a5,0x4
    80004bd4:	0ac75e63          	bge	a4,a2,80004c90 <__printf+0x668>
    80004bd8:	00f6f693          	andi	a3,a3,15
    80004bdc:	00dd86b3          	add	a3,s11,a3
    80004be0:	0006c603          	lbu	a2,0(a3)
    80004be4:	00f00693          	li	a3,15
    80004be8:	0087d79b          	srliw	a5,a5,0x8
    80004bec:	f8c400a3          	sb	a2,-127(s0)
    80004bf0:	d8b6e4e3          	bltu	a3,a1,80004978 <__printf+0x350>
    80004bf4:	00200793          	li	a5,2
    80004bf8:	e2dff06f          	j	80004a24 <__printf+0x3fc>
    80004bfc:	00002c97          	auipc	s9,0x2
    80004c00:	a54c8c93          	addi	s9,s9,-1452 # 80006650 <CONSOLE_STATUS+0x640>
    80004c04:	02800513          	li	a0,40
    80004c08:	ef1ff06f          	j	80004af8 <__printf+0x4d0>
    80004c0c:	00700793          	li	a5,7
    80004c10:	00600c93          	li	s9,6
    80004c14:	e0dff06f          	j	80004a20 <__printf+0x3f8>
    80004c18:	00700793          	li	a5,7
    80004c1c:	00600c93          	li	s9,6
    80004c20:	c69ff06f          	j	80004888 <__printf+0x260>
    80004c24:	00300793          	li	a5,3
    80004c28:	00200c93          	li	s9,2
    80004c2c:	c5dff06f          	j	80004888 <__printf+0x260>
    80004c30:	00300793          	li	a5,3
    80004c34:	00200c93          	li	s9,2
    80004c38:	de9ff06f          	j	80004a20 <__printf+0x3f8>
    80004c3c:	00400793          	li	a5,4
    80004c40:	00300c93          	li	s9,3
    80004c44:	dddff06f          	j	80004a20 <__printf+0x3f8>
    80004c48:	00400793          	li	a5,4
    80004c4c:	00300c93          	li	s9,3
    80004c50:	c39ff06f          	j	80004888 <__printf+0x260>
    80004c54:	00500793          	li	a5,5
    80004c58:	00400c93          	li	s9,4
    80004c5c:	c2dff06f          	j	80004888 <__printf+0x260>
    80004c60:	00500793          	li	a5,5
    80004c64:	00400c93          	li	s9,4
    80004c68:	db9ff06f          	j	80004a20 <__printf+0x3f8>
    80004c6c:	00600793          	li	a5,6
    80004c70:	00500c93          	li	s9,5
    80004c74:	dadff06f          	j	80004a20 <__printf+0x3f8>
    80004c78:	00600793          	li	a5,6
    80004c7c:	00500c93          	li	s9,5
    80004c80:	c09ff06f          	j	80004888 <__printf+0x260>
    80004c84:	00800793          	li	a5,8
    80004c88:	00700c93          	li	s9,7
    80004c8c:	bfdff06f          	j	80004888 <__printf+0x260>
    80004c90:	00100793          	li	a5,1
    80004c94:	d91ff06f          	j	80004a24 <__printf+0x3fc>
    80004c98:	00100793          	li	a5,1
    80004c9c:	bf1ff06f          	j	8000488c <__printf+0x264>
    80004ca0:	00900793          	li	a5,9
    80004ca4:	00800c93          	li	s9,8
    80004ca8:	be1ff06f          	j	80004888 <__printf+0x260>
    80004cac:	00002517          	auipc	a0,0x2
    80004cb0:	9ac50513          	addi	a0,a0,-1620 # 80006658 <CONSOLE_STATUS+0x648>
    80004cb4:	00000097          	auipc	ra,0x0
    80004cb8:	918080e7          	jalr	-1768(ra) # 800045cc <panic>

0000000080004cbc <printfinit>:
    80004cbc:	fe010113          	addi	sp,sp,-32
    80004cc0:	00813823          	sd	s0,16(sp)
    80004cc4:	00913423          	sd	s1,8(sp)
    80004cc8:	00113c23          	sd	ra,24(sp)
    80004ccc:	02010413          	addi	s0,sp,32
    80004cd0:	00004497          	auipc	s1,0x4
    80004cd4:	b5048493          	addi	s1,s1,-1200 # 80008820 <pr>
    80004cd8:	00048513          	mv	a0,s1
    80004cdc:	00002597          	auipc	a1,0x2
    80004ce0:	98c58593          	addi	a1,a1,-1652 # 80006668 <CONSOLE_STATUS+0x658>
    80004ce4:	00000097          	auipc	ra,0x0
    80004ce8:	5f4080e7          	jalr	1524(ra) # 800052d8 <initlock>
    80004cec:	01813083          	ld	ra,24(sp)
    80004cf0:	01013403          	ld	s0,16(sp)
    80004cf4:	0004ac23          	sw	zero,24(s1)
    80004cf8:	00813483          	ld	s1,8(sp)
    80004cfc:	02010113          	addi	sp,sp,32
    80004d00:	00008067          	ret

0000000080004d04 <uartinit>:
    80004d04:	ff010113          	addi	sp,sp,-16
    80004d08:	00813423          	sd	s0,8(sp)
    80004d0c:	01010413          	addi	s0,sp,16
    80004d10:	100007b7          	lui	a5,0x10000
    80004d14:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004d18:	f8000713          	li	a4,-128
    80004d1c:	00e781a3          	sb	a4,3(a5)
    80004d20:	00300713          	li	a4,3
    80004d24:	00e78023          	sb	a4,0(a5)
    80004d28:	000780a3          	sb	zero,1(a5)
    80004d2c:	00e781a3          	sb	a4,3(a5)
    80004d30:	00700693          	li	a3,7
    80004d34:	00d78123          	sb	a3,2(a5)
    80004d38:	00e780a3          	sb	a4,1(a5)
    80004d3c:	00813403          	ld	s0,8(sp)
    80004d40:	01010113          	addi	sp,sp,16
    80004d44:	00008067          	ret

0000000080004d48 <uartputc>:
    80004d48:	00003797          	auipc	a5,0x3
    80004d4c:	8307a783          	lw	a5,-2000(a5) # 80007578 <panicked>
    80004d50:	00078463          	beqz	a5,80004d58 <uartputc+0x10>
    80004d54:	0000006f          	j	80004d54 <uartputc+0xc>
    80004d58:	fd010113          	addi	sp,sp,-48
    80004d5c:	02813023          	sd	s0,32(sp)
    80004d60:	00913c23          	sd	s1,24(sp)
    80004d64:	01213823          	sd	s2,16(sp)
    80004d68:	01313423          	sd	s3,8(sp)
    80004d6c:	02113423          	sd	ra,40(sp)
    80004d70:	03010413          	addi	s0,sp,48
    80004d74:	00003917          	auipc	s2,0x3
    80004d78:	80c90913          	addi	s2,s2,-2036 # 80007580 <uart_tx_r>
    80004d7c:	00093783          	ld	a5,0(s2)
    80004d80:	00003497          	auipc	s1,0x3
    80004d84:	80848493          	addi	s1,s1,-2040 # 80007588 <uart_tx_w>
    80004d88:	0004b703          	ld	a4,0(s1)
    80004d8c:	02078693          	addi	a3,a5,32
    80004d90:	00050993          	mv	s3,a0
    80004d94:	02e69c63          	bne	a3,a4,80004dcc <uartputc+0x84>
    80004d98:	00001097          	auipc	ra,0x1
    80004d9c:	834080e7          	jalr	-1996(ra) # 800055cc <push_on>
    80004da0:	00093783          	ld	a5,0(s2)
    80004da4:	0004b703          	ld	a4,0(s1)
    80004da8:	02078793          	addi	a5,a5,32
    80004dac:	00e79463          	bne	a5,a4,80004db4 <uartputc+0x6c>
    80004db0:	0000006f          	j	80004db0 <uartputc+0x68>
    80004db4:	00001097          	auipc	ra,0x1
    80004db8:	88c080e7          	jalr	-1908(ra) # 80005640 <pop_on>
    80004dbc:	00093783          	ld	a5,0(s2)
    80004dc0:	0004b703          	ld	a4,0(s1)
    80004dc4:	02078693          	addi	a3,a5,32
    80004dc8:	fce688e3          	beq	a3,a4,80004d98 <uartputc+0x50>
    80004dcc:	01f77693          	andi	a3,a4,31
    80004dd0:	00004597          	auipc	a1,0x4
    80004dd4:	a7058593          	addi	a1,a1,-1424 # 80008840 <uart_tx_buf>
    80004dd8:	00d586b3          	add	a3,a1,a3
    80004ddc:	00170713          	addi	a4,a4,1
    80004de0:	01368023          	sb	s3,0(a3)
    80004de4:	00e4b023          	sd	a4,0(s1)
    80004de8:	10000637          	lui	a2,0x10000
    80004dec:	02f71063          	bne	a4,a5,80004e0c <uartputc+0xc4>
    80004df0:	0340006f          	j	80004e24 <uartputc+0xdc>
    80004df4:	00074703          	lbu	a4,0(a4)
    80004df8:	00f93023          	sd	a5,0(s2)
    80004dfc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004e00:	00093783          	ld	a5,0(s2)
    80004e04:	0004b703          	ld	a4,0(s1)
    80004e08:	00f70e63          	beq	a4,a5,80004e24 <uartputc+0xdc>
    80004e0c:	00564683          	lbu	a3,5(a2)
    80004e10:	01f7f713          	andi	a4,a5,31
    80004e14:	00e58733          	add	a4,a1,a4
    80004e18:	0206f693          	andi	a3,a3,32
    80004e1c:	00178793          	addi	a5,a5,1
    80004e20:	fc069ae3          	bnez	a3,80004df4 <uartputc+0xac>
    80004e24:	02813083          	ld	ra,40(sp)
    80004e28:	02013403          	ld	s0,32(sp)
    80004e2c:	01813483          	ld	s1,24(sp)
    80004e30:	01013903          	ld	s2,16(sp)
    80004e34:	00813983          	ld	s3,8(sp)
    80004e38:	03010113          	addi	sp,sp,48
    80004e3c:	00008067          	ret

0000000080004e40 <uartputc_sync>:
    80004e40:	ff010113          	addi	sp,sp,-16
    80004e44:	00813423          	sd	s0,8(sp)
    80004e48:	01010413          	addi	s0,sp,16
    80004e4c:	00002717          	auipc	a4,0x2
    80004e50:	72c72703          	lw	a4,1836(a4) # 80007578 <panicked>
    80004e54:	02071663          	bnez	a4,80004e80 <uartputc_sync+0x40>
    80004e58:	00050793          	mv	a5,a0
    80004e5c:	100006b7          	lui	a3,0x10000
    80004e60:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004e64:	02077713          	andi	a4,a4,32
    80004e68:	fe070ce3          	beqz	a4,80004e60 <uartputc_sync+0x20>
    80004e6c:	0ff7f793          	andi	a5,a5,255
    80004e70:	00f68023          	sb	a5,0(a3)
    80004e74:	00813403          	ld	s0,8(sp)
    80004e78:	01010113          	addi	sp,sp,16
    80004e7c:	00008067          	ret
    80004e80:	0000006f          	j	80004e80 <uartputc_sync+0x40>

0000000080004e84 <uartstart>:
    80004e84:	ff010113          	addi	sp,sp,-16
    80004e88:	00813423          	sd	s0,8(sp)
    80004e8c:	01010413          	addi	s0,sp,16
    80004e90:	00002617          	auipc	a2,0x2
    80004e94:	6f060613          	addi	a2,a2,1776 # 80007580 <uart_tx_r>
    80004e98:	00002517          	auipc	a0,0x2
    80004e9c:	6f050513          	addi	a0,a0,1776 # 80007588 <uart_tx_w>
    80004ea0:	00063783          	ld	a5,0(a2)
    80004ea4:	00053703          	ld	a4,0(a0)
    80004ea8:	04f70263          	beq	a4,a5,80004eec <uartstart+0x68>
    80004eac:	100005b7          	lui	a1,0x10000
    80004eb0:	00004817          	auipc	a6,0x4
    80004eb4:	99080813          	addi	a6,a6,-1648 # 80008840 <uart_tx_buf>
    80004eb8:	01c0006f          	j	80004ed4 <uartstart+0x50>
    80004ebc:	0006c703          	lbu	a4,0(a3)
    80004ec0:	00f63023          	sd	a5,0(a2)
    80004ec4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004ec8:	00063783          	ld	a5,0(a2)
    80004ecc:	00053703          	ld	a4,0(a0)
    80004ed0:	00f70e63          	beq	a4,a5,80004eec <uartstart+0x68>
    80004ed4:	01f7f713          	andi	a4,a5,31
    80004ed8:	00e806b3          	add	a3,a6,a4
    80004edc:	0055c703          	lbu	a4,5(a1)
    80004ee0:	00178793          	addi	a5,a5,1
    80004ee4:	02077713          	andi	a4,a4,32
    80004ee8:	fc071ae3          	bnez	a4,80004ebc <uartstart+0x38>
    80004eec:	00813403          	ld	s0,8(sp)
    80004ef0:	01010113          	addi	sp,sp,16
    80004ef4:	00008067          	ret

0000000080004ef8 <uartgetc>:
    80004ef8:	ff010113          	addi	sp,sp,-16
    80004efc:	00813423          	sd	s0,8(sp)
    80004f00:	01010413          	addi	s0,sp,16
    80004f04:	10000737          	lui	a4,0x10000
    80004f08:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004f0c:	0017f793          	andi	a5,a5,1
    80004f10:	00078c63          	beqz	a5,80004f28 <uartgetc+0x30>
    80004f14:	00074503          	lbu	a0,0(a4)
    80004f18:	0ff57513          	andi	a0,a0,255
    80004f1c:	00813403          	ld	s0,8(sp)
    80004f20:	01010113          	addi	sp,sp,16
    80004f24:	00008067          	ret
    80004f28:	fff00513          	li	a0,-1
    80004f2c:	ff1ff06f          	j	80004f1c <uartgetc+0x24>

0000000080004f30 <uartintr>:
    80004f30:	100007b7          	lui	a5,0x10000
    80004f34:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004f38:	0017f793          	andi	a5,a5,1
    80004f3c:	0a078463          	beqz	a5,80004fe4 <uartintr+0xb4>
    80004f40:	fe010113          	addi	sp,sp,-32
    80004f44:	00813823          	sd	s0,16(sp)
    80004f48:	00913423          	sd	s1,8(sp)
    80004f4c:	00113c23          	sd	ra,24(sp)
    80004f50:	02010413          	addi	s0,sp,32
    80004f54:	100004b7          	lui	s1,0x10000
    80004f58:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004f5c:	0ff57513          	andi	a0,a0,255
    80004f60:	fffff097          	auipc	ra,0xfffff
    80004f64:	534080e7          	jalr	1332(ra) # 80004494 <consoleintr>
    80004f68:	0054c783          	lbu	a5,5(s1)
    80004f6c:	0017f793          	andi	a5,a5,1
    80004f70:	fe0794e3          	bnez	a5,80004f58 <uartintr+0x28>
    80004f74:	00002617          	auipc	a2,0x2
    80004f78:	60c60613          	addi	a2,a2,1548 # 80007580 <uart_tx_r>
    80004f7c:	00002517          	auipc	a0,0x2
    80004f80:	60c50513          	addi	a0,a0,1548 # 80007588 <uart_tx_w>
    80004f84:	00063783          	ld	a5,0(a2)
    80004f88:	00053703          	ld	a4,0(a0)
    80004f8c:	04f70263          	beq	a4,a5,80004fd0 <uartintr+0xa0>
    80004f90:	100005b7          	lui	a1,0x10000
    80004f94:	00004817          	auipc	a6,0x4
    80004f98:	8ac80813          	addi	a6,a6,-1876 # 80008840 <uart_tx_buf>
    80004f9c:	01c0006f          	j	80004fb8 <uartintr+0x88>
    80004fa0:	0006c703          	lbu	a4,0(a3)
    80004fa4:	00f63023          	sd	a5,0(a2)
    80004fa8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004fac:	00063783          	ld	a5,0(a2)
    80004fb0:	00053703          	ld	a4,0(a0)
    80004fb4:	00f70e63          	beq	a4,a5,80004fd0 <uartintr+0xa0>
    80004fb8:	01f7f713          	andi	a4,a5,31
    80004fbc:	00e806b3          	add	a3,a6,a4
    80004fc0:	0055c703          	lbu	a4,5(a1)
    80004fc4:	00178793          	addi	a5,a5,1
    80004fc8:	02077713          	andi	a4,a4,32
    80004fcc:	fc071ae3          	bnez	a4,80004fa0 <uartintr+0x70>
    80004fd0:	01813083          	ld	ra,24(sp)
    80004fd4:	01013403          	ld	s0,16(sp)
    80004fd8:	00813483          	ld	s1,8(sp)
    80004fdc:	02010113          	addi	sp,sp,32
    80004fe0:	00008067          	ret
    80004fe4:	00002617          	auipc	a2,0x2
    80004fe8:	59c60613          	addi	a2,a2,1436 # 80007580 <uart_tx_r>
    80004fec:	00002517          	auipc	a0,0x2
    80004ff0:	59c50513          	addi	a0,a0,1436 # 80007588 <uart_tx_w>
    80004ff4:	00063783          	ld	a5,0(a2)
    80004ff8:	00053703          	ld	a4,0(a0)
    80004ffc:	04f70263          	beq	a4,a5,80005040 <uartintr+0x110>
    80005000:	100005b7          	lui	a1,0x10000
    80005004:	00004817          	auipc	a6,0x4
    80005008:	83c80813          	addi	a6,a6,-1988 # 80008840 <uart_tx_buf>
    8000500c:	01c0006f          	j	80005028 <uartintr+0xf8>
    80005010:	0006c703          	lbu	a4,0(a3)
    80005014:	00f63023          	sd	a5,0(a2)
    80005018:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000501c:	00063783          	ld	a5,0(a2)
    80005020:	00053703          	ld	a4,0(a0)
    80005024:	02f70063          	beq	a4,a5,80005044 <uartintr+0x114>
    80005028:	01f7f713          	andi	a4,a5,31
    8000502c:	00e806b3          	add	a3,a6,a4
    80005030:	0055c703          	lbu	a4,5(a1)
    80005034:	00178793          	addi	a5,a5,1
    80005038:	02077713          	andi	a4,a4,32
    8000503c:	fc071ae3          	bnez	a4,80005010 <uartintr+0xe0>
    80005040:	00008067          	ret
    80005044:	00008067          	ret

0000000080005048 <kinit>:
    80005048:	fc010113          	addi	sp,sp,-64
    8000504c:	02913423          	sd	s1,40(sp)
    80005050:	fffff7b7          	lui	a5,0xfffff
    80005054:	00005497          	auipc	s1,0x5
    80005058:	80b48493          	addi	s1,s1,-2037 # 8000985f <end+0xfff>
    8000505c:	02813823          	sd	s0,48(sp)
    80005060:	01313c23          	sd	s3,24(sp)
    80005064:	00f4f4b3          	and	s1,s1,a5
    80005068:	02113c23          	sd	ra,56(sp)
    8000506c:	03213023          	sd	s2,32(sp)
    80005070:	01413823          	sd	s4,16(sp)
    80005074:	01513423          	sd	s5,8(sp)
    80005078:	04010413          	addi	s0,sp,64
    8000507c:	000017b7          	lui	a5,0x1
    80005080:	01100993          	li	s3,17
    80005084:	00f487b3          	add	a5,s1,a5
    80005088:	01b99993          	slli	s3,s3,0x1b
    8000508c:	06f9e063          	bltu	s3,a5,800050ec <kinit+0xa4>
    80005090:	00003a97          	auipc	s5,0x3
    80005094:	7d0a8a93          	addi	s5,s5,2000 # 80008860 <end>
    80005098:	0754ec63          	bltu	s1,s5,80005110 <kinit+0xc8>
    8000509c:	0734fa63          	bgeu	s1,s3,80005110 <kinit+0xc8>
    800050a0:	00088a37          	lui	s4,0x88
    800050a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800050a8:	00002917          	auipc	s2,0x2
    800050ac:	4e890913          	addi	s2,s2,1256 # 80007590 <kmem>
    800050b0:	00ca1a13          	slli	s4,s4,0xc
    800050b4:	0140006f          	j	800050c8 <kinit+0x80>
    800050b8:	000017b7          	lui	a5,0x1
    800050bc:	00f484b3          	add	s1,s1,a5
    800050c0:	0554e863          	bltu	s1,s5,80005110 <kinit+0xc8>
    800050c4:	0534f663          	bgeu	s1,s3,80005110 <kinit+0xc8>
    800050c8:	00001637          	lui	a2,0x1
    800050cc:	00100593          	li	a1,1
    800050d0:	00048513          	mv	a0,s1
    800050d4:	00000097          	auipc	ra,0x0
    800050d8:	5e4080e7          	jalr	1508(ra) # 800056b8 <__memset>
    800050dc:	00093783          	ld	a5,0(s2)
    800050e0:	00f4b023          	sd	a5,0(s1)
    800050e4:	00993023          	sd	s1,0(s2)
    800050e8:	fd4498e3          	bne	s1,s4,800050b8 <kinit+0x70>
    800050ec:	03813083          	ld	ra,56(sp)
    800050f0:	03013403          	ld	s0,48(sp)
    800050f4:	02813483          	ld	s1,40(sp)
    800050f8:	02013903          	ld	s2,32(sp)
    800050fc:	01813983          	ld	s3,24(sp)
    80005100:	01013a03          	ld	s4,16(sp)
    80005104:	00813a83          	ld	s5,8(sp)
    80005108:	04010113          	addi	sp,sp,64
    8000510c:	00008067          	ret
    80005110:	00001517          	auipc	a0,0x1
    80005114:	57850513          	addi	a0,a0,1400 # 80006688 <digits+0x18>
    80005118:	fffff097          	auipc	ra,0xfffff
    8000511c:	4b4080e7          	jalr	1204(ra) # 800045cc <panic>

0000000080005120 <freerange>:
    80005120:	fc010113          	addi	sp,sp,-64
    80005124:	000017b7          	lui	a5,0x1
    80005128:	02913423          	sd	s1,40(sp)
    8000512c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005130:	009504b3          	add	s1,a0,s1
    80005134:	fffff537          	lui	a0,0xfffff
    80005138:	02813823          	sd	s0,48(sp)
    8000513c:	02113c23          	sd	ra,56(sp)
    80005140:	03213023          	sd	s2,32(sp)
    80005144:	01313c23          	sd	s3,24(sp)
    80005148:	01413823          	sd	s4,16(sp)
    8000514c:	01513423          	sd	s5,8(sp)
    80005150:	01613023          	sd	s6,0(sp)
    80005154:	04010413          	addi	s0,sp,64
    80005158:	00a4f4b3          	and	s1,s1,a0
    8000515c:	00f487b3          	add	a5,s1,a5
    80005160:	06f5e463          	bltu	a1,a5,800051c8 <freerange+0xa8>
    80005164:	00003a97          	auipc	s5,0x3
    80005168:	6fca8a93          	addi	s5,s5,1788 # 80008860 <end>
    8000516c:	0954e263          	bltu	s1,s5,800051f0 <freerange+0xd0>
    80005170:	01100993          	li	s3,17
    80005174:	01b99993          	slli	s3,s3,0x1b
    80005178:	0734fc63          	bgeu	s1,s3,800051f0 <freerange+0xd0>
    8000517c:	00058a13          	mv	s4,a1
    80005180:	00002917          	auipc	s2,0x2
    80005184:	41090913          	addi	s2,s2,1040 # 80007590 <kmem>
    80005188:	00002b37          	lui	s6,0x2
    8000518c:	0140006f          	j	800051a0 <freerange+0x80>
    80005190:	000017b7          	lui	a5,0x1
    80005194:	00f484b3          	add	s1,s1,a5
    80005198:	0554ec63          	bltu	s1,s5,800051f0 <freerange+0xd0>
    8000519c:	0534fa63          	bgeu	s1,s3,800051f0 <freerange+0xd0>
    800051a0:	00001637          	lui	a2,0x1
    800051a4:	00100593          	li	a1,1
    800051a8:	00048513          	mv	a0,s1
    800051ac:	00000097          	auipc	ra,0x0
    800051b0:	50c080e7          	jalr	1292(ra) # 800056b8 <__memset>
    800051b4:	00093703          	ld	a4,0(s2)
    800051b8:	016487b3          	add	a5,s1,s6
    800051bc:	00e4b023          	sd	a4,0(s1)
    800051c0:	00993023          	sd	s1,0(s2)
    800051c4:	fcfa76e3          	bgeu	s4,a5,80005190 <freerange+0x70>
    800051c8:	03813083          	ld	ra,56(sp)
    800051cc:	03013403          	ld	s0,48(sp)
    800051d0:	02813483          	ld	s1,40(sp)
    800051d4:	02013903          	ld	s2,32(sp)
    800051d8:	01813983          	ld	s3,24(sp)
    800051dc:	01013a03          	ld	s4,16(sp)
    800051e0:	00813a83          	ld	s5,8(sp)
    800051e4:	00013b03          	ld	s6,0(sp)
    800051e8:	04010113          	addi	sp,sp,64
    800051ec:	00008067          	ret
    800051f0:	00001517          	auipc	a0,0x1
    800051f4:	49850513          	addi	a0,a0,1176 # 80006688 <digits+0x18>
    800051f8:	fffff097          	auipc	ra,0xfffff
    800051fc:	3d4080e7          	jalr	980(ra) # 800045cc <panic>

0000000080005200 <kfree>:
    80005200:	fe010113          	addi	sp,sp,-32
    80005204:	00813823          	sd	s0,16(sp)
    80005208:	00113c23          	sd	ra,24(sp)
    8000520c:	00913423          	sd	s1,8(sp)
    80005210:	02010413          	addi	s0,sp,32
    80005214:	03451793          	slli	a5,a0,0x34
    80005218:	04079c63          	bnez	a5,80005270 <kfree+0x70>
    8000521c:	00003797          	auipc	a5,0x3
    80005220:	64478793          	addi	a5,a5,1604 # 80008860 <end>
    80005224:	00050493          	mv	s1,a0
    80005228:	04f56463          	bltu	a0,a5,80005270 <kfree+0x70>
    8000522c:	01100793          	li	a5,17
    80005230:	01b79793          	slli	a5,a5,0x1b
    80005234:	02f57e63          	bgeu	a0,a5,80005270 <kfree+0x70>
    80005238:	00001637          	lui	a2,0x1
    8000523c:	00100593          	li	a1,1
    80005240:	00000097          	auipc	ra,0x0
    80005244:	478080e7          	jalr	1144(ra) # 800056b8 <__memset>
    80005248:	00002797          	auipc	a5,0x2
    8000524c:	34878793          	addi	a5,a5,840 # 80007590 <kmem>
    80005250:	0007b703          	ld	a4,0(a5)
    80005254:	01813083          	ld	ra,24(sp)
    80005258:	01013403          	ld	s0,16(sp)
    8000525c:	00e4b023          	sd	a4,0(s1)
    80005260:	0097b023          	sd	s1,0(a5)
    80005264:	00813483          	ld	s1,8(sp)
    80005268:	02010113          	addi	sp,sp,32
    8000526c:	00008067          	ret
    80005270:	00001517          	auipc	a0,0x1
    80005274:	41850513          	addi	a0,a0,1048 # 80006688 <digits+0x18>
    80005278:	fffff097          	auipc	ra,0xfffff
    8000527c:	354080e7          	jalr	852(ra) # 800045cc <panic>

0000000080005280 <kalloc>:
    80005280:	fe010113          	addi	sp,sp,-32
    80005284:	00813823          	sd	s0,16(sp)
    80005288:	00913423          	sd	s1,8(sp)
    8000528c:	00113c23          	sd	ra,24(sp)
    80005290:	02010413          	addi	s0,sp,32
    80005294:	00002797          	auipc	a5,0x2
    80005298:	2fc78793          	addi	a5,a5,764 # 80007590 <kmem>
    8000529c:	0007b483          	ld	s1,0(a5)
    800052a0:	02048063          	beqz	s1,800052c0 <kalloc+0x40>
    800052a4:	0004b703          	ld	a4,0(s1)
    800052a8:	00001637          	lui	a2,0x1
    800052ac:	00500593          	li	a1,5
    800052b0:	00048513          	mv	a0,s1
    800052b4:	00e7b023          	sd	a4,0(a5)
    800052b8:	00000097          	auipc	ra,0x0
    800052bc:	400080e7          	jalr	1024(ra) # 800056b8 <__memset>
    800052c0:	01813083          	ld	ra,24(sp)
    800052c4:	01013403          	ld	s0,16(sp)
    800052c8:	00048513          	mv	a0,s1
    800052cc:	00813483          	ld	s1,8(sp)
    800052d0:	02010113          	addi	sp,sp,32
    800052d4:	00008067          	ret

00000000800052d8 <initlock>:
    800052d8:	ff010113          	addi	sp,sp,-16
    800052dc:	00813423          	sd	s0,8(sp)
    800052e0:	01010413          	addi	s0,sp,16
    800052e4:	00813403          	ld	s0,8(sp)
    800052e8:	00b53423          	sd	a1,8(a0)
    800052ec:	00052023          	sw	zero,0(a0)
    800052f0:	00053823          	sd	zero,16(a0)
    800052f4:	01010113          	addi	sp,sp,16
    800052f8:	00008067          	ret

00000000800052fc <acquire>:
    800052fc:	fe010113          	addi	sp,sp,-32
    80005300:	00813823          	sd	s0,16(sp)
    80005304:	00913423          	sd	s1,8(sp)
    80005308:	00113c23          	sd	ra,24(sp)
    8000530c:	01213023          	sd	s2,0(sp)
    80005310:	02010413          	addi	s0,sp,32
    80005314:	00050493          	mv	s1,a0
    80005318:	10002973          	csrr	s2,sstatus
    8000531c:	100027f3          	csrr	a5,sstatus
    80005320:	ffd7f793          	andi	a5,a5,-3
    80005324:	10079073          	csrw	sstatus,a5
    80005328:	fffff097          	auipc	ra,0xfffff
    8000532c:	8e0080e7          	jalr	-1824(ra) # 80003c08 <mycpu>
    80005330:	07852783          	lw	a5,120(a0)
    80005334:	06078e63          	beqz	a5,800053b0 <acquire+0xb4>
    80005338:	fffff097          	auipc	ra,0xfffff
    8000533c:	8d0080e7          	jalr	-1840(ra) # 80003c08 <mycpu>
    80005340:	07852783          	lw	a5,120(a0)
    80005344:	0004a703          	lw	a4,0(s1)
    80005348:	0017879b          	addiw	a5,a5,1
    8000534c:	06f52c23          	sw	a5,120(a0)
    80005350:	04071063          	bnez	a4,80005390 <acquire+0x94>
    80005354:	00100713          	li	a4,1
    80005358:	00070793          	mv	a5,a4
    8000535c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005360:	0007879b          	sext.w	a5,a5
    80005364:	fe079ae3          	bnez	a5,80005358 <acquire+0x5c>
    80005368:	0ff0000f          	fence
    8000536c:	fffff097          	auipc	ra,0xfffff
    80005370:	89c080e7          	jalr	-1892(ra) # 80003c08 <mycpu>
    80005374:	01813083          	ld	ra,24(sp)
    80005378:	01013403          	ld	s0,16(sp)
    8000537c:	00a4b823          	sd	a0,16(s1)
    80005380:	00013903          	ld	s2,0(sp)
    80005384:	00813483          	ld	s1,8(sp)
    80005388:	02010113          	addi	sp,sp,32
    8000538c:	00008067          	ret
    80005390:	0104b903          	ld	s2,16(s1)
    80005394:	fffff097          	auipc	ra,0xfffff
    80005398:	874080e7          	jalr	-1932(ra) # 80003c08 <mycpu>
    8000539c:	faa91ce3          	bne	s2,a0,80005354 <acquire+0x58>
    800053a0:	00001517          	auipc	a0,0x1
    800053a4:	2f050513          	addi	a0,a0,752 # 80006690 <digits+0x20>
    800053a8:	fffff097          	auipc	ra,0xfffff
    800053ac:	224080e7          	jalr	548(ra) # 800045cc <panic>
    800053b0:	00195913          	srli	s2,s2,0x1
    800053b4:	fffff097          	auipc	ra,0xfffff
    800053b8:	854080e7          	jalr	-1964(ra) # 80003c08 <mycpu>
    800053bc:	00197913          	andi	s2,s2,1
    800053c0:	07252e23          	sw	s2,124(a0)
    800053c4:	f75ff06f          	j	80005338 <acquire+0x3c>

00000000800053c8 <release>:
    800053c8:	fe010113          	addi	sp,sp,-32
    800053cc:	00813823          	sd	s0,16(sp)
    800053d0:	00113c23          	sd	ra,24(sp)
    800053d4:	00913423          	sd	s1,8(sp)
    800053d8:	01213023          	sd	s2,0(sp)
    800053dc:	02010413          	addi	s0,sp,32
    800053e0:	00052783          	lw	a5,0(a0)
    800053e4:	00079a63          	bnez	a5,800053f8 <release+0x30>
    800053e8:	00001517          	auipc	a0,0x1
    800053ec:	2b050513          	addi	a0,a0,688 # 80006698 <digits+0x28>
    800053f0:	fffff097          	auipc	ra,0xfffff
    800053f4:	1dc080e7          	jalr	476(ra) # 800045cc <panic>
    800053f8:	01053903          	ld	s2,16(a0)
    800053fc:	00050493          	mv	s1,a0
    80005400:	fffff097          	auipc	ra,0xfffff
    80005404:	808080e7          	jalr	-2040(ra) # 80003c08 <mycpu>
    80005408:	fea910e3          	bne	s2,a0,800053e8 <release+0x20>
    8000540c:	0004b823          	sd	zero,16(s1)
    80005410:	0ff0000f          	fence
    80005414:	0f50000f          	fence	iorw,ow
    80005418:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000541c:	ffffe097          	auipc	ra,0xffffe
    80005420:	7ec080e7          	jalr	2028(ra) # 80003c08 <mycpu>
    80005424:	100027f3          	csrr	a5,sstatus
    80005428:	0027f793          	andi	a5,a5,2
    8000542c:	04079a63          	bnez	a5,80005480 <release+0xb8>
    80005430:	07852783          	lw	a5,120(a0)
    80005434:	02f05e63          	blez	a5,80005470 <release+0xa8>
    80005438:	fff7871b          	addiw	a4,a5,-1
    8000543c:	06e52c23          	sw	a4,120(a0)
    80005440:	00071c63          	bnez	a4,80005458 <release+0x90>
    80005444:	07c52783          	lw	a5,124(a0)
    80005448:	00078863          	beqz	a5,80005458 <release+0x90>
    8000544c:	100027f3          	csrr	a5,sstatus
    80005450:	0027e793          	ori	a5,a5,2
    80005454:	10079073          	csrw	sstatus,a5
    80005458:	01813083          	ld	ra,24(sp)
    8000545c:	01013403          	ld	s0,16(sp)
    80005460:	00813483          	ld	s1,8(sp)
    80005464:	00013903          	ld	s2,0(sp)
    80005468:	02010113          	addi	sp,sp,32
    8000546c:	00008067          	ret
    80005470:	00001517          	auipc	a0,0x1
    80005474:	24850513          	addi	a0,a0,584 # 800066b8 <digits+0x48>
    80005478:	fffff097          	auipc	ra,0xfffff
    8000547c:	154080e7          	jalr	340(ra) # 800045cc <panic>
    80005480:	00001517          	auipc	a0,0x1
    80005484:	22050513          	addi	a0,a0,544 # 800066a0 <digits+0x30>
    80005488:	fffff097          	auipc	ra,0xfffff
    8000548c:	144080e7          	jalr	324(ra) # 800045cc <panic>

0000000080005490 <holding>:
    80005490:	00052783          	lw	a5,0(a0)
    80005494:	00079663          	bnez	a5,800054a0 <holding+0x10>
    80005498:	00000513          	li	a0,0
    8000549c:	00008067          	ret
    800054a0:	fe010113          	addi	sp,sp,-32
    800054a4:	00813823          	sd	s0,16(sp)
    800054a8:	00913423          	sd	s1,8(sp)
    800054ac:	00113c23          	sd	ra,24(sp)
    800054b0:	02010413          	addi	s0,sp,32
    800054b4:	01053483          	ld	s1,16(a0)
    800054b8:	ffffe097          	auipc	ra,0xffffe
    800054bc:	750080e7          	jalr	1872(ra) # 80003c08 <mycpu>
    800054c0:	01813083          	ld	ra,24(sp)
    800054c4:	01013403          	ld	s0,16(sp)
    800054c8:	40a48533          	sub	a0,s1,a0
    800054cc:	00153513          	seqz	a0,a0
    800054d0:	00813483          	ld	s1,8(sp)
    800054d4:	02010113          	addi	sp,sp,32
    800054d8:	00008067          	ret

00000000800054dc <push_off>:
    800054dc:	fe010113          	addi	sp,sp,-32
    800054e0:	00813823          	sd	s0,16(sp)
    800054e4:	00113c23          	sd	ra,24(sp)
    800054e8:	00913423          	sd	s1,8(sp)
    800054ec:	02010413          	addi	s0,sp,32
    800054f0:	100024f3          	csrr	s1,sstatus
    800054f4:	100027f3          	csrr	a5,sstatus
    800054f8:	ffd7f793          	andi	a5,a5,-3
    800054fc:	10079073          	csrw	sstatus,a5
    80005500:	ffffe097          	auipc	ra,0xffffe
    80005504:	708080e7          	jalr	1800(ra) # 80003c08 <mycpu>
    80005508:	07852783          	lw	a5,120(a0)
    8000550c:	02078663          	beqz	a5,80005538 <push_off+0x5c>
    80005510:	ffffe097          	auipc	ra,0xffffe
    80005514:	6f8080e7          	jalr	1784(ra) # 80003c08 <mycpu>
    80005518:	07852783          	lw	a5,120(a0)
    8000551c:	01813083          	ld	ra,24(sp)
    80005520:	01013403          	ld	s0,16(sp)
    80005524:	0017879b          	addiw	a5,a5,1
    80005528:	06f52c23          	sw	a5,120(a0)
    8000552c:	00813483          	ld	s1,8(sp)
    80005530:	02010113          	addi	sp,sp,32
    80005534:	00008067          	ret
    80005538:	0014d493          	srli	s1,s1,0x1
    8000553c:	ffffe097          	auipc	ra,0xffffe
    80005540:	6cc080e7          	jalr	1740(ra) # 80003c08 <mycpu>
    80005544:	0014f493          	andi	s1,s1,1
    80005548:	06952e23          	sw	s1,124(a0)
    8000554c:	fc5ff06f          	j	80005510 <push_off+0x34>

0000000080005550 <pop_off>:
    80005550:	ff010113          	addi	sp,sp,-16
    80005554:	00813023          	sd	s0,0(sp)
    80005558:	00113423          	sd	ra,8(sp)
    8000555c:	01010413          	addi	s0,sp,16
    80005560:	ffffe097          	auipc	ra,0xffffe
    80005564:	6a8080e7          	jalr	1704(ra) # 80003c08 <mycpu>
    80005568:	100027f3          	csrr	a5,sstatus
    8000556c:	0027f793          	andi	a5,a5,2
    80005570:	04079663          	bnez	a5,800055bc <pop_off+0x6c>
    80005574:	07852783          	lw	a5,120(a0)
    80005578:	02f05a63          	blez	a5,800055ac <pop_off+0x5c>
    8000557c:	fff7871b          	addiw	a4,a5,-1
    80005580:	06e52c23          	sw	a4,120(a0)
    80005584:	00071c63          	bnez	a4,8000559c <pop_off+0x4c>
    80005588:	07c52783          	lw	a5,124(a0)
    8000558c:	00078863          	beqz	a5,8000559c <pop_off+0x4c>
    80005590:	100027f3          	csrr	a5,sstatus
    80005594:	0027e793          	ori	a5,a5,2
    80005598:	10079073          	csrw	sstatus,a5
    8000559c:	00813083          	ld	ra,8(sp)
    800055a0:	00013403          	ld	s0,0(sp)
    800055a4:	01010113          	addi	sp,sp,16
    800055a8:	00008067          	ret
    800055ac:	00001517          	auipc	a0,0x1
    800055b0:	10c50513          	addi	a0,a0,268 # 800066b8 <digits+0x48>
    800055b4:	fffff097          	auipc	ra,0xfffff
    800055b8:	018080e7          	jalr	24(ra) # 800045cc <panic>
    800055bc:	00001517          	auipc	a0,0x1
    800055c0:	0e450513          	addi	a0,a0,228 # 800066a0 <digits+0x30>
    800055c4:	fffff097          	auipc	ra,0xfffff
    800055c8:	008080e7          	jalr	8(ra) # 800045cc <panic>

00000000800055cc <push_on>:
    800055cc:	fe010113          	addi	sp,sp,-32
    800055d0:	00813823          	sd	s0,16(sp)
    800055d4:	00113c23          	sd	ra,24(sp)
    800055d8:	00913423          	sd	s1,8(sp)
    800055dc:	02010413          	addi	s0,sp,32
    800055e0:	100024f3          	csrr	s1,sstatus
    800055e4:	100027f3          	csrr	a5,sstatus
    800055e8:	0027e793          	ori	a5,a5,2
    800055ec:	10079073          	csrw	sstatus,a5
    800055f0:	ffffe097          	auipc	ra,0xffffe
    800055f4:	618080e7          	jalr	1560(ra) # 80003c08 <mycpu>
    800055f8:	07852783          	lw	a5,120(a0)
    800055fc:	02078663          	beqz	a5,80005628 <push_on+0x5c>
    80005600:	ffffe097          	auipc	ra,0xffffe
    80005604:	608080e7          	jalr	1544(ra) # 80003c08 <mycpu>
    80005608:	07852783          	lw	a5,120(a0)
    8000560c:	01813083          	ld	ra,24(sp)
    80005610:	01013403          	ld	s0,16(sp)
    80005614:	0017879b          	addiw	a5,a5,1
    80005618:	06f52c23          	sw	a5,120(a0)
    8000561c:	00813483          	ld	s1,8(sp)
    80005620:	02010113          	addi	sp,sp,32
    80005624:	00008067          	ret
    80005628:	0014d493          	srli	s1,s1,0x1
    8000562c:	ffffe097          	auipc	ra,0xffffe
    80005630:	5dc080e7          	jalr	1500(ra) # 80003c08 <mycpu>
    80005634:	0014f493          	andi	s1,s1,1
    80005638:	06952e23          	sw	s1,124(a0)
    8000563c:	fc5ff06f          	j	80005600 <push_on+0x34>

0000000080005640 <pop_on>:
    80005640:	ff010113          	addi	sp,sp,-16
    80005644:	00813023          	sd	s0,0(sp)
    80005648:	00113423          	sd	ra,8(sp)
    8000564c:	01010413          	addi	s0,sp,16
    80005650:	ffffe097          	auipc	ra,0xffffe
    80005654:	5b8080e7          	jalr	1464(ra) # 80003c08 <mycpu>
    80005658:	100027f3          	csrr	a5,sstatus
    8000565c:	0027f793          	andi	a5,a5,2
    80005660:	04078463          	beqz	a5,800056a8 <pop_on+0x68>
    80005664:	07852783          	lw	a5,120(a0)
    80005668:	02f05863          	blez	a5,80005698 <pop_on+0x58>
    8000566c:	fff7879b          	addiw	a5,a5,-1
    80005670:	06f52c23          	sw	a5,120(a0)
    80005674:	07853783          	ld	a5,120(a0)
    80005678:	00079863          	bnez	a5,80005688 <pop_on+0x48>
    8000567c:	100027f3          	csrr	a5,sstatus
    80005680:	ffd7f793          	andi	a5,a5,-3
    80005684:	10079073          	csrw	sstatus,a5
    80005688:	00813083          	ld	ra,8(sp)
    8000568c:	00013403          	ld	s0,0(sp)
    80005690:	01010113          	addi	sp,sp,16
    80005694:	00008067          	ret
    80005698:	00001517          	auipc	a0,0x1
    8000569c:	04850513          	addi	a0,a0,72 # 800066e0 <digits+0x70>
    800056a0:	fffff097          	auipc	ra,0xfffff
    800056a4:	f2c080e7          	jalr	-212(ra) # 800045cc <panic>
    800056a8:	00001517          	auipc	a0,0x1
    800056ac:	01850513          	addi	a0,a0,24 # 800066c0 <digits+0x50>
    800056b0:	fffff097          	auipc	ra,0xfffff
    800056b4:	f1c080e7          	jalr	-228(ra) # 800045cc <panic>

00000000800056b8 <__memset>:
    800056b8:	ff010113          	addi	sp,sp,-16
    800056bc:	00813423          	sd	s0,8(sp)
    800056c0:	01010413          	addi	s0,sp,16
    800056c4:	1a060e63          	beqz	a2,80005880 <__memset+0x1c8>
    800056c8:	40a007b3          	neg	a5,a0
    800056cc:	0077f793          	andi	a5,a5,7
    800056d0:	00778693          	addi	a3,a5,7
    800056d4:	00b00813          	li	a6,11
    800056d8:	0ff5f593          	andi	a1,a1,255
    800056dc:	fff6071b          	addiw	a4,a2,-1
    800056e0:	1b06e663          	bltu	a3,a6,8000588c <__memset+0x1d4>
    800056e4:	1cd76463          	bltu	a4,a3,800058ac <__memset+0x1f4>
    800056e8:	1a078e63          	beqz	a5,800058a4 <__memset+0x1ec>
    800056ec:	00b50023          	sb	a1,0(a0)
    800056f0:	00100713          	li	a4,1
    800056f4:	1ae78463          	beq	a5,a4,8000589c <__memset+0x1e4>
    800056f8:	00b500a3          	sb	a1,1(a0)
    800056fc:	00200713          	li	a4,2
    80005700:	1ae78a63          	beq	a5,a4,800058b4 <__memset+0x1fc>
    80005704:	00b50123          	sb	a1,2(a0)
    80005708:	00300713          	li	a4,3
    8000570c:	18e78463          	beq	a5,a4,80005894 <__memset+0x1dc>
    80005710:	00b501a3          	sb	a1,3(a0)
    80005714:	00400713          	li	a4,4
    80005718:	1ae78263          	beq	a5,a4,800058bc <__memset+0x204>
    8000571c:	00b50223          	sb	a1,4(a0)
    80005720:	00500713          	li	a4,5
    80005724:	1ae78063          	beq	a5,a4,800058c4 <__memset+0x20c>
    80005728:	00b502a3          	sb	a1,5(a0)
    8000572c:	00700713          	li	a4,7
    80005730:	18e79e63          	bne	a5,a4,800058cc <__memset+0x214>
    80005734:	00b50323          	sb	a1,6(a0)
    80005738:	00700e93          	li	t4,7
    8000573c:	00859713          	slli	a4,a1,0x8
    80005740:	00e5e733          	or	a4,a1,a4
    80005744:	01059e13          	slli	t3,a1,0x10
    80005748:	01c76e33          	or	t3,a4,t3
    8000574c:	01859313          	slli	t1,a1,0x18
    80005750:	006e6333          	or	t1,t3,t1
    80005754:	02059893          	slli	a7,a1,0x20
    80005758:	40f60e3b          	subw	t3,a2,a5
    8000575c:	011368b3          	or	a7,t1,a7
    80005760:	02859813          	slli	a6,a1,0x28
    80005764:	0108e833          	or	a6,a7,a6
    80005768:	03059693          	slli	a3,a1,0x30
    8000576c:	003e589b          	srliw	a7,t3,0x3
    80005770:	00d866b3          	or	a3,a6,a3
    80005774:	03859713          	slli	a4,a1,0x38
    80005778:	00389813          	slli	a6,a7,0x3
    8000577c:	00f507b3          	add	a5,a0,a5
    80005780:	00e6e733          	or	a4,a3,a4
    80005784:	000e089b          	sext.w	a7,t3
    80005788:	00f806b3          	add	a3,a6,a5
    8000578c:	00e7b023          	sd	a4,0(a5)
    80005790:	00878793          	addi	a5,a5,8
    80005794:	fed79ce3          	bne	a5,a3,8000578c <__memset+0xd4>
    80005798:	ff8e7793          	andi	a5,t3,-8
    8000579c:	0007871b          	sext.w	a4,a5
    800057a0:	01d787bb          	addw	a5,a5,t4
    800057a4:	0ce88e63          	beq	a7,a4,80005880 <__memset+0x1c8>
    800057a8:	00f50733          	add	a4,a0,a5
    800057ac:	00b70023          	sb	a1,0(a4)
    800057b0:	0017871b          	addiw	a4,a5,1
    800057b4:	0cc77663          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    800057b8:	00e50733          	add	a4,a0,a4
    800057bc:	00b70023          	sb	a1,0(a4)
    800057c0:	0027871b          	addiw	a4,a5,2
    800057c4:	0ac77e63          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    800057c8:	00e50733          	add	a4,a0,a4
    800057cc:	00b70023          	sb	a1,0(a4)
    800057d0:	0037871b          	addiw	a4,a5,3
    800057d4:	0ac77663          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    800057d8:	00e50733          	add	a4,a0,a4
    800057dc:	00b70023          	sb	a1,0(a4)
    800057e0:	0047871b          	addiw	a4,a5,4
    800057e4:	08c77e63          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    800057e8:	00e50733          	add	a4,a0,a4
    800057ec:	00b70023          	sb	a1,0(a4)
    800057f0:	0057871b          	addiw	a4,a5,5
    800057f4:	08c77663          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    800057f8:	00e50733          	add	a4,a0,a4
    800057fc:	00b70023          	sb	a1,0(a4)
    80005800:	0067871b          	addiw	a4,a5,6
    80005804:	06c77e63          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005808:	00e50733          	add	a4,a0,a4
    8000580c:	00b70023          	sb	a1,0(a4)
    80005810:	0077871b          	addiw	a4,a5,7
    80005814:	06c77663          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005818:	00e50733          	add	a4,a0,a4
    8000581c:	00b70023          	sb	a1,0(a4)
    80005820:	0087871b          	addiw	a4,a5,8
    80005824:	04c77e63          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005828:	00e50733          	add	a4,a0,a4
    8000582c:	00b70023          	sb	a1,0(a4)
    80005830:	0097871b          	addiw	a4,a5,9
    80005834:	04c77663          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005838:	00e50733          	add	a4,a0,a4
    8000583c:	00b70023          	sb	a1,0(a4)
    80005840:	00a7871b          	addiw	a4,a5,10
    80005844:	02c77e63          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005848:	00e50733          	add	a4,a0,a4
    8000584c:	00b70023          	sb	a1,0(a4)
    80005850:	00b7871b          	addiw	a4,a5,11
    80005854:	02c77663          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005858:	00e50733          	add	a4,a0,a4
    8000585c:	00b70023          	sb	a1,0(a4)
    80005860:	00c7871b          	addiw	a4,a5,12
    80005864:	00c77e63          	bgeu	a4,a2,80005880 <__memset+0x1c8>
    80005868:	00e50733          	add	a4,a0,a4
    8000586c:	00b70023          	sb	a1,0(a4)
    80005870:	00d7879b          	addiw	a5,a5,13
    80005874:	00c7f663          	bgeu	a5,a2,80005880 <__memset+0x1c8>
    80005878:	00f507b3          	add	a5,a0,a5
    8000587c:	00b78023          	sb	a1,0(a5)
    80005880:	00813403          	ld	s0,8(sp)
    80005884:	01010113          	addi	sp,sp,16
    80005888:	00008067          	ret
    8000588c:	00b00693          	li	a3,11
    80005890:	e55ff06f          	j	800056e4 <__memset+0x2c>
    80005894:	00300e93          	li	t4,3
    80005898:	ea5ff06f          	j	8000573c <__memset+0x84>
    8000589c:	00100e93          	li	t4,1
    800058a0:	e9dff06f          	j	8000573c <__memset+0x84>
    800058a4:	00000e93          	li	t4,0
    800058a8:	e95ff06f          	j	8000573c <__memset+0x84>
    800058ac:	00000793          	li	a5,0
    800058b0:	ef9ff06f          	j	800057a8 <__memset+0xf0>
    800058b4:	00200e93          	li	t4,2
    800058b8:	e85ff06f          	j	8000573c <__memset+0x84>
    800058bc:	00400e93          	li	t4,4
    800058c0:	e7dff06f          	j	8000573c <__memset+0x84>
    800058c4:	00500e93          	li	t4,5
    800058c8:	e75ff06f          	j	8000573c <__memset+0x84>
    800058cc:	00600e93          	li	t4,6
    800058d0:	e6dff06f          	j	8000573c <__memset+0x84>

00000000800058d4 <__memmove>:
    800058d4:	ff010113          	addi	sp,sp,-16
    800058d8:	00813423          	sd	s0,8(sp)
    800058dc:	01010413          	addi	s0,sp,16
    800058e0:	0e060863          	beqz	a2,800059d0 <__memmove+0xfc>
    800058e4:	fff6069b          	addiw	a3,a2,-1
    800058e8:	0006881b          	sext.w	a6,a3
    800058ec:	0ea5e863          	bltu	a1,a0,800059dc <__memmove+0x108>
    800058f0:	00758713          	addi	a4,a1,7
    800058f4:	00a5e7b3          	or	a5,a1,a0
    800058f8:	40a70733          	sub	a4,a4,a0
    800058fc:	0077f793          	andi	a5,a5,7
    80005900:	00f73713          	sltiu	a4,a4,15
    80005904:	00174713          	xori	a4,a4,1
    80005908:	0017b793          	seqz	a5,a5
    8000590c:	00e7f7b3          	and	a5,a5,a4
    80005910:	10078863          	beqz	a5,80005a20 <__memmove+0x14c>
    80005914:	00900793          	li	a5,9
    80005918:	1107f463          	bgeu	a5,a6,80005a20 <__memmove+0x14c>
    8000591c:	0036581b          	srliw	a6,a2,0x3
    80005920:	fff8081b          	addiw	a6,a6,-1
    80005924:	02081813          	slli	a6,a6,0x20
    80005928:	01d85893          	srli	a7,a6,0x1d
    8000592c:	00858813          	addi	a6,a1,8
    80005930:	00058793          	mv	a5,a1
    80005934:	00050713          	mv	a4,a0
    80005938:	01088833          	add	a6,a7,a6
    8000593c:	0007b883          	ld	a7,0(a5)
    80005940:	00878793          	addi	a5,a5,8
    80005944:	00870713          	addi	a4,a4,8
    80005948:	ff173c23          	sd	a7,-8(a4)
    8000594c:	ff0798e3          	bne	a5,a6,8000593c <__memmove+0x68>
    80005950:	ff867713          	andi	a4,a2,-8
    80005954:	02071793          	slli	a5,a4,0x20
    80005958:	0207d793          	srli	a5,a5,0x20
    8000595c:	00f585b3          	add	a1,a1,a5
    80005960:	40e686bb          	subw	a3,a3,a4
    80005964:	00f507b3          	add	a5,a0,a5
    80005968:	06e60463          	beq	a2,a4,800059d0 <__memmove+0xfc>
    8000596c:	0005c703          	lbu	a4,0(a1)
    80005970:	00e78023          	sb	a4,0(a5)
    80005974:	04068e63          	beqz	a3,800059d0 <__memmove+0xfc>
    80005978:	0015c603          	lbu	a2,1(a1)
    8000597c:	00100713          	li	a4,1
    80005980:	00c780a3          	sb	a2,1(a5)
    80005984:	04e68663          	beq	a3,a4,800059d0 <__memmove+0xfc>
    80005988:	0025c603          	lbu	a2,2(a1)
    8000598c:	00200713          	li	a4,2
    80005990:	00c78123          	sb	a2,2(a5)
    80005994:	02e68e63          	beq	a3,a4,800059d0 <__memmove+0xfc>
    80005998:	0035c603          	lbu	a2,3(a1)
    8000599c:	00300713          	li	a4,3
    800059a0:	00c781a3          	sb	a2,3(a5)
    800059a4:	02e68663          	beq	a3,a4,800059d0 <__memmove+0xfc>
    800059a8:	0045c603          	lbu	a2,4(a1)
    800059ac:	00400713          	li	a4,4
    800059b0:	00c78223          	sb	a2,4(a5)
    800059b4:	00e68e63          	beq	a3,a4,800059d0 <__memmove+0xfc>
    800059b8:	0055c603          	lbu	a2,5(a1)
    800059bc:	00500713          	li	a4,5
    800059c0:	00c782a3          	sb	a2,5(a5)
    800059c4:	00e68663          	beq	a3,a4,800059d0 <__memmove+0xfc>
    800059c8:	0065c703          	lbu	a4,6(a1)
    800059cc:	00e78323          	sb	a4,6(a5)
    800059d0:	00813403          	ld	s0,8(sp)
    800059d4:	01010113          	addi	sp,sp,16
    800059d8:	00008067          	ret
    800059dc:	02061713          	slli	a4,a2,0x20
    800059e0:	02075713          	srli	a4,a4,0x20
    800059e4:	00e587b3          	add	a5,a1,a4
    800059e8:	f0f574e3          	bgeu	a0,a5,800058f0 <__memmove+0x1c>
    800059ec:	02069613          	slli	a2,a3,0x20
    800059f0:	02065613          	srli	a2,a2,0x20
    800059f4:	fff64613          	not	a2,a2
    800059f8:	00e50733          	add	a4,a0,a4
    800059fc:	00c78633          	add	a2,a5,a2
    80005a00:	fff7c683          	lbu	a3,-1(a5)
    80005a04:	fff78793          	addi	a5,a5,-1
    80005a08:	fff70713          	addi	a4,a4,-1
    80005a0c:	00d70023          	sb	a3,0(a4)
    80005a10:	fec798e3          	bne	a5,a2,80005a00 <__memmove+0x12c>
    80005a14:	00813403          	ld	s0,8(sp)
    80005a18:	01010113          	addi	sp,sp,16
    80005a1c:	00008067          	ret
    80005a20:	02069713          	slli	a4,a3,0x20
    80005a24:	02075713          	srli	a4,a4,0x20
    80005a28:	00170713          	addi	a4,a4,1
    80005a2c:	00e50733          	add	a4,a0,a4
    80005a30:	00050793          	mv	a5,a0
    80005a34:	0005c683          	lbu	a3,0(a1)
    80005a38:	00178793          	addi	a5,a5,1
    80005a3c:	00158593          	addi	a1,a1,1
    80005a40:	fed78fa3          	sb	a3,-1(a5)
    80005a44:	fee798e3          	bne	a5,a4,80005a34 <__memmove+0x160>
    80005a48:	f89ff06f          	j	800059d0 <__memmove+0xfc>

0000000080005a4c <__putc>:
    80005a4c:	fe010113          	addi	sp,sp,-32
    80005a50:	00813823          	sd	s0,16(sp)
    80005a54:	00113c23          	sd	ra,24(sp)
    80005a58:	02010413          	addi	s0,sp,32
    80005a5c:	00050793          	mv	a5,a0
    80005a60:	fef40593          	addi	a1,s0,-17
    80005a64:	00100613          	li	a2,1
    80005a68:	00000513          	li	a0,0
    80005a6c:	fef407a3          	sb	a5,-17(s0)
    80005a70:	fffff097          	auipc	ra,0xfffff
    80005a74:	b3c080e7          	jalr	-1220(ra) # 800045ac <console_write>
    80005a78:	01813083          	ld	ra,24(sp)
    80005a7c:	01013403          	ld	s0,16(sp)
    80005a80:	02010113          	addi	sp,sp,32
    80005a84:	00008067          	ret

0000000080005a88 <__getc>:
    80005a88:	fe010113          	addi	sp,sp,-32
    80005a8c:	00813823          	sd	s0,16(sp)
    80005a90:	00113c23          	sd	ra,24(sp)
    80005a94:	02010413          	addi	s0,sp,32
    80005a98:	fe840593          	addi	a1,s0,-24
    80005a9c:	00100613          	li	a2,1
    80005aa0:	00000513          	li	a0,0
    80005aa4:	fffff097          	auipc	ra,0xfffff
    80005aa8:	ae8080e7          	jalr	-1304(ra) # 8000458c <console_read>
    80005aac:	fe844503          	lbu	a0,-24(s0)
    80005ab0:	01813083          	ld	ra,24(sp)
    80005ab4:	01013403          	ld	s0,16(sp)
    80005ab8:	02010113          	addi	sp,sp,32
    80005abc:	00008067          	ret

0000000080005ac0 <console_handler>:
    80005ac0:	fe010113          	addi	sp,sp,-32
    80005ac4:	00813823          	sd	s0,16(sp)
    80005ac8:	00113c23          	sd	ra,24(sp)
    80005acc:	00913423          	sd	s1,8(sp)
    80005ad0:	02010413          	addi	s0,sp,32
    80005ad4:	14202773          	csrr	a4,scause
    80005ad8:	100027f3          	csrr	a5,sstatus
    80005adc:	0027f793          	andi	a5,a5,2
    80005ae0:	06079e63          	bnez	a5,80005b5c <console_handler+0x9c>
    80005ae4:	00074c63          	bltz	a4,80005afc <console_handler+0x3c>
    80005ae8:	01813083          	ld	ra,24(sp)
    80005aec:	01013403          	ld	s0,16(sp)
    80005af0:	00813483          	ld	s1,8(sp)
    80005af4:	02010113          	addi	sp,sp,32
    80005af8:	00008067          	ret
    80005afc:	0ff77713          	andi	a4,a4,255
    80005b00:	00900793          	li	a5,9
    80005b04:	fef712e3          	bne	a4,a5,80005ae8 <console_handler+0x28>
    80005b08:	ffffe097          	auipc	ra,0xffffe
    80005b0c:	6dc080e7          	jalr	1756(ra) # 800041e4 <plic_claim>
    80005b10:	00a00793          	li	a5,10
    80005b14:	00050493          	mv	s1,a0
    80005b18:	02f50c63          	beq	a0,a5,80005b50 <console_handler+0x90>
    80005b1c:	fc0506e3          	beqz	a0,80005ae8 <console_handler+0x28>
    80005b20:	00050593          	mv	a1,a0
    80005b24:	00001517          	auipc	a0,0x1
    80005b28:	ac450513          	addi	a0,a0,-1340 # 800065e8 <CONSOLE_STATUS+0x5d8>
    80005b2c:	fffff097          	auipc	ra,0xfffff
    80005b30:	afc080e7          	jalr	-1284(ra) # 80004628 <__printf>
    80005b34:	01013403          	ld	s0,16(sp)
    80005b38:	01813083          	ld	ra,24(sp)
    80005b3c:	00048513          	mv	a0,s1
    80005b40:	00813483          	ld	s1,8(sp)
    80005b44:	02010113          	addi	sp,sp,32
    80005b48:	ffffe317          	auipc	t1,0xffffe
    80005b4c:	6d430067          	jr	1748(t1) # 8000421c <plic_complete>
    80005b50:	fffff097          	auipc	ra,0xfffff
    80005b54:	3e0080e7          	jalr	992(ra) # 80004f30 <uartintr>
    80005b58:	fddff06f          	j	80005b34 <console_handler+0x74>
    80005b5c:	00001517          	auipc	a0,0x1
    80005b60:	b8c50513          	addi	a0,a0,-1140 # 800066e8 <digits+0x78>
    80005b64:	fffff097          	auipc	ra,0xfffff
    80005b68:	a68080e7          	jalr	-1432(ra) # 800045cc <panic>
	...
