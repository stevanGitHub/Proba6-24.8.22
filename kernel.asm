
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	11813103          	ld	sp,280(sp) # 80007118 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	6dd020ef          	jal	ra,80002ef8 <start>

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
    80001084:	544010ef          	jal	ra,800025c8 <_ZN5Riscv20handleSupervisorTrapEv>


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
    8000116c:	0187c783          	lbu	a5,24(a5) # 80007180 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80001170:	04079663          	bnez	a5,800011bc <_Z9mem_allocm+0x78>
        freeList=(struct metaData*)HEAP_START_ADDR;
    80001174:	00006797          	auipc	a5,0x6
    80001178:	f8c7b783          	ld	a5,-116(a5) # 80007100 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000117c:	0007b703          	ld	a4,0(a5)
    80001180:	00006697          	auipc	a3,0x6
    80001184:	00868693          	addi	a3,a3,8 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80001188:	00e6b023          	sd	a4,0(a3)
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
    8000118c:	00006797          	auipc	a5,0x6
    80001190:	f9c7b783          	ld	a5,-100(a5) # 80007128 <_GLOBAL_OFFSET_TABLE_+0x30>
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
    800011b8:	fcf70623          	sb	a5,-52(a4) # 80007180 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>

    MemoryAllocator* mem = MemoryAllocator::getInstance();

    void *ret;

    ret = mem->myMalloc(numOfBlock);
    800011bc:	00006517          	auipc	a0,0x6
    800011c0:	fcc50513          	addi	a0,a0,-52 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800011c4:	00001097          	auipc	ra,0x1
    800011c8:	034080e7          	jalr	52(ra) # 800021f8 <_ZN15MemoryAllocator8myMallocEm>
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
    80001224:	01413023          	sd	s4,0(sp)
    80001228:	03010413          	addi	s0,sp,48
    8000122c:	00050493          	mv	s1,a0
    80001230:	00058913          	mv	s2,a1
    80001234:	00060993          	mv	s3,a2
    uint64 code = THREAD_CREATE;
    void *stack_space = __mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    80001238:	00008537          	lui	a0,0x8
    8000123c:	00004097          	auipc	ra,0x4
    80001240:	e4c080e7          	jalr	-436(ra) # 80005088 <__mem_alloc>
    80001244:	00050a13          	mv	s4,a0

    printString("\nhandle u thread_create: ");
    80001248:	00005517          	auipc	a0,0x5
    8000124c:	dd850513          	addi	a0,a0,-552 # 80006020 <CONSOLE_STATUS+0x10>
    80001250:	00000097          	auipc	ra,0x0
    80001254:	18c080e7          	jalr	396(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)handle, 16, 0);
    80001258:	00000613          	li	a2,0
    8000125c:	01000593          	li	a1,16
    80001260:	0004851b          	sext.w	a0,s1
    80001264:	00000097          	auipc	ra,0x0
    80001268:	310080e7          	jalr	784(ra) # 80001574 <_Z8printIntiii>

    __asm__ volatile ("mv a4, %[stack_space]" : : [stack_space] "r" (stack_space));
    8000126c:	000a0713          	mv	a4,s4
    __asm__ volatile ("mv a3, %[arg]" : : [arg] "r" (arg));
    80001270:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a2, %[body]" : : [body] "r" (start_routine));
    80001274:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a1, %[handle]" : : [handle] "r" (handle));
    80001278:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    8000127c:	01100793          	li	a5,17
    80001280:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    80001284:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    80001288:	00050513          	mv	a0,a0
    /*
    *handle = TCB::createThread(start_routine, arg, stack_space);
    if(*handle) return 0;
    else return -3;
    */
}
    8000128c:	0005051b          	sext.w	a0,a0
    80001290:	02813083          	ld	ra,40(sp)
    80001294:	02013403          	ld	s0,32(sp)
    80001298:	01813483          	ld	s1,24(sp)
    8000129c:	01013903          	ld	s2,16(sp)
    800012a0:	00813983          	ld	s3,8(sp)
    800012a4:	00013a03          	ld	s4,0(sp)
    800012a8:	03010113          	addi	sp,sp,48
    800012ac:	00008067          	ret

00000000800012b0 <_Z11thread_exitv>:

int thread_exit () {
    800012b0:	ff010113          	addi	sp,sp,-16
    800012b4:	00813423          	sd	s0,8(sp)
    800012b8:	01010413          	addi	s0,sp,16
    uint64 code = THREAD_EXIT;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    800012bc:	01200793          	li	a5,18
    800012c0:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    800012c4:	00000073          	ecall

    int ret;
    __asm__ volatile ("mv %[ret], a0" : [ret] "=r" (ret));
    800012c8:	00050513          	mv	a0,a0
    return ret;
}
    800012cc:	0005051b          	sext.w	a0,a0
    800012d0:	00813403          	ld	s0,8(sp)
    800012d4:	01010113          	addi	sp,sp,16
    800012d8:	00008067          	ret

00000000800012dc <_Z15thread_dispatchv>:


void thread_dispatch (){
    800012dc:	ff010113          	addi	sp,sp,-16
    800012e0:	00813423          	sd	s0,8(sp)
    800012e4:	01010413          	addi	s0,sp,16
    uint64 code = THREAD_DISPATCH;
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    800012e8:	01300793          	li	a5,19
    800012ec:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    800012f0:	00000073          	ecall
    //TCB::yield();
}
    800012f4:	00813403          	ld	s0,8(sp)
    800012f8:	01010113          	addi	sp,sp,16
    800012fc:	00008067          	ret

0000000080001300 <_Z9putThreadP3TCB>:

void putThread(TCB* tcb){
    80001300:	ff010113          	addi	sp,sp,-16
    80001304:	00813423          	sd	s0,8(sp)
    80001308:	01010413          	addi	s0,sp,16
    uint64 code = PUT_THREAD;
    __asm__ volatile ("mv a1, %[tcb]" : : [tcb] "r" (tcb));
    8000130c:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %[code]" : : [code] "r" (code));
    80001310:	01400793          	li	a5,20
    80001314:	00078513          	mv	a0,a5

    __asm__ volatile ("ecall");
    80001318:	00000073          	ecall
}
    8000131c:	00813403          	ld	s0,8(sp)
    80001320:	01010113          	addi	sp,sp,16
    80001324:	00008067          	ret

0000000080001328 <_Z8sem_openPP4KSemj>:

int sem_open (sem_t* handle, unsigned init){
    80001328:	fe010113          	addi	sp,sp,-32
    8000132c:	00113c23          	sd	ra,24(sp)
    80001330:	00813823          	sd	s0,16(sp)
    80001334:	00913423          	sd	s1,8(sp)
    80001338:	02010413          	addi	s0,sp,32
    8000133c:	00050493          	mv	s1,a0

    *handle = KSem::createSem(init);
    80001340:	00058513          	mv	a0,a1
    80001344:	00002097          	auipc	ra,0x2
    80001348:	8ac080e7          	jalr	-1876(ra) # 80002bf0 <_ZN4KSem9createSemEj>
    8000134c:	00a4b023          	sd	a0,0(s1)

    return 0;
}
    80001350:	00000513          	li	a0,0
    80001354:	01813083          	ld	ra,24(sp)
    80001358:	01013403          	ld	s0,16(sp)
    8000135c:	00813483          	ld	s1,8(sp)
    80001360:	02010113          	addi	sp,sp,32
    80001364:	00008067          	ret

0000000080001368 <_Z9sem_closeP4KSem>:


int sem_close (sem_t handle){
    80001368:	ff010113          	addi	sp,sp,-16
    8000136c:	00813423          	sd	s0,8(sp)
    80001370:	01010413          	addi	s0,sp,16

    return 0;
}
    80001374:	00000513          	li	a0,0
    80001378:	00813403          	ld	s0,8(sp)
    8000137c:	01010113          	addi	sp,sp,16
    80001380:	00008067          	ret

0000000080001384 <_Z8sem_waitP4KSem>:

int sem_wait (sem_t id){
    80001384:	ff010113          	addi	sp,sp,-16
    80001388:	00113423          	sd	ra,8(sp)
    8000138c:	00813023          	sd	s0,0(sp)
    80001390:	01010413          	addi	s0,sp,16

    id->wait();
    80001394:	00002097          	auipc	ra,0x2
    80001398:	918080e7          	jalr	-1768(ra) # 80002cac <_ZN4KSem4waitEv>

    return 0;
}
    8000139c:	00000513          	li	a0,0
    800013a0:	00813083          	ld	ra,8(sp)
    800013a4:	00013403          	ld	s0,0(sp)
    800013a8:	01010113          	addi	sp,sp,16
    800013ac:	00008067          	ret

00000000800013b0 <_Z10sem_signalP4KSem>:

int sem_signal (sem_t id){
    800013b0:	ff010113          	addi	sp,sp,-16
    800013b4:	00113423          	sd	ra,8(sp)
    800013b8:	00813023          	sd	s0,0(sp)
    800013bc:	01010413          	addi	s0,sp,16

    id->signal();
    800013c0:	00002097          	auipc	ra,0x2
    800013c4:	9a8080e7          	jalr	-1624(ra) # 80002d68 <_ZN4KSem6signalEv>

    return 0;
    800013c8:	00000513          	li	a0,0
    800013cc:	00813083          	ld	ra,8(sp)
    800013d0:	00013403          	ld	s0,0(sp)
    800013d4:	01010113          	addi	sp,sp,16
    800013d8:	00008067          	ret

00000000800013dc <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800013dc:	fe010113          	addi	sp,sp,-32
    800013e0:	00113c23          	sd	ra,24(sp)
    800013e4:	00813823          	sd	s0,16(sp)
    800013e8:	00913423          	sd	s1,8(sp)
    800013ec:	02010413          	addi	s0,sp,32
    800013f0:	00050493          	mv	s1,a0
    LOCK();
    800013f4:	00100613          	li	a2,1
    800013f8:	00000593          	li	a1,0
    800013fc:	00006517          	auipc	a0,0x6
    80001400:	d9450513          	addi	a0,a0,-620 # 80007190 <lockPrint>
    80001404:	00000097          	auipc	ra,0x0
    80001408:	d0c080e7          	jalr	-756(ra) # 80001110 <copy_and_swap>
    8000140c:	fe0514e3          	bnez	a0,800013f4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001410:	0004c503          	lbu	a0,0(s1)
    80001414:	00050a63          	beqz	a0,80001428 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001418:	00004097          	auipc	ra,0x4
    8000141c:	dc8080e7          	jalr	-568(ra) # 800051e0 <__putc>
        string++;
    80001420:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001424:	fedff06f          	j	80001410 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001428:	00000613          	li	a2,0
    8000142c:	00100593          	li	a1,1
    80001430:	00006517          	auipc	a0,0x6
    80001434:	d6050513          	addi	a0,a0,-672 # 80007190 <lockPrint>
    80001438:	00000097          	auipc	ra,0x0
    8000143c:	cd8080e7          	jalr	-808(ra) # 80001110 <copy_and_swap>
    80001440:	fe0514e3          	bnez	a0,80001428 <_Z11printStringPKc+0x4c>
}
    80001444:	01813083          	ld	ra,24(sp)
    80001448:	01013403          	ld	s0,16(sp)
    8000144c:	00813483          	ld	s1,8(sp)
    80001450:	02010113          	addi	sp,sp,32
    80001454:	00008067          	ret

0000000080001458 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001458:	fd010113          	addi	sp,sp,-48
    8000145c:	02113423          	sd	ra,40(sp)
    80001460:	02813023          	sd	s0,32(sp)
    80001464:	00913c23          	sd	s1,24(sp)
    80001468:	01213823          	sd	s2,16(sp)
    8000146c:	01313423          	sd	s3,8(sp)
    80001470:	01413023          	sd	s4,0(sp)
    80001474:	03010413          	addi	s0,sp,48
    80001478:	00050993          	mv	s3,a0
    8000147c:	00058a13          	mv	s4,a1
    LOCK();
    80001480:	00100613          	li	a2,1
    80001484:	00000593          	li	a1,0
    80001488:	00006517          	auipc	a0,0x6
    8000148c:	d0850513          	addi	a0,a0,-760 # 80007190 <lockPrint>
    80001490:	00000097          	auipc	ra,0x0
    80001494:	c80080e7          	jalr	-896(ra) # 80001110 <copy_and_swap>
    80001498:	fe0514e3          	bnez	a0,80001480 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    8000149c:	00000913          	li	s2,0
    800014a0:	00090493          	mv	s1,s2
    800014a4:	0019091b          	addiw	s2,s2,1
    800014a8:	03495a63          	bge	s2,s4,800014dc <_Z9getStringPci+0x84>
        cc = __getc();
    800014ac:	00004097          	auipc	ra,0x4
    800014b0:	d70080e7          	jalr	-656(ra) # 8000521c <__getc>
        if(cc < 1)
    800014b4:	02050463          	beqz	a0,800014dc <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800014b8:	009984b3          	add	s1,s3,s1
    800014bc:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800014c0:	00a00793          	li	a5,10
    800014c4:	00f50a63          	beq	a0,a5,800014d8 <_Z9getStringPci+0x80>
    800014c8:	00d00793          	li	a5,13
    800014cc:	fcf51ae3          	bne	a0,a5,800014a0 <_Z9getStringPci+0x48>
        buf[i++] = c;
    800014d0:	00090493          	mv	s1,s2
    800014d4:	0080006f          	j	800014dc <_Z9getStringPci+0x84>
    800014d8:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800014dc:	009984b3          	add	s1,s3,s1
    800014e0:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800014e4:	00000613          	li	a2,0
    800014e8:	00100593          	li	a1,1
    800014ec:	00006517          	auipc	a0,0x6
    800014f0:	ca450513          	addi	a0,a0,-860 # 80007190 <lockPrint>
    800014f4:	00000097          	auipc	ra,0x0
    800014f8:	c1c080e7          	jalr	-996(ra) # 80001110 <copy_and_swap>
    800014fc:	fe0514e3          	bnez	a0,800014e4 <_Z9getStringPci+0x8c>
    return buf;
}
    80001500:	00098513          	mv	a0,s3
    80001504:	02813083          	ld	ra,40(sp)
    80001508:	02013403          	ld	s0,32(sp)
    8000150c:	01813483          	ld	s1,24(sp)
    80001510:	01013903          	ld	s2,16(sp)
    80001514:	00813983          	ld	s3,8(sp)
    80001518:	00013a03          	ld	s4,0(sp)
    8000151c:	03010113          	addi	sp,sp,48
    80001520:	00008067          	ret

0000000080001524 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001524:	ff010113          	addi	sp,sp,-16
    80001528:	00813423          	sd	s0,8(sp)
    8000152c:	01010413          	addi	s0,sp,16
    80001530:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001534:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001538:	0006c603          	lbu	a2,0(a3)
    8000153c:	fd06071b          	addiw	a4,a2,-48
    80001540:	0ff77713          	andi	a4,a4,255
    80001544:	00900793          	li	a5,9
    80001548:	02e7e063          	bltu	a5,a4,80001568 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    8000154c:	0025179b          	slliw	a5,a0,0x2
    80001550:	00a787bb          	addw	a5,a5,a0
    80001554:	0017979b          	slliw	a5,a5,0x1
    80001558:	00168693          	addi	a3,a3,1
    8000155c:	00c787bb          	addw	a5,a5,a2
    80001560:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001564:	fd5ff06f          	j	80001538 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001568:	00813403          	ld	s0,8(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001574:	fc010113          	addi	sp,sp,-64
    80001578:	02113c23          	sd	ra,56(sp)
    8000157c:	02813823          	sd	s0,48(sp)
    80001580:	02913423          	sd	s1,40(sp)
    80001584:	03213023          	sd	s2,32(sp)
    80001588:	01313c23          	sd	s3,24(sp)
    8000158c:	04010413          	addi	s0,sp,64
    80001590:	00050493          	mv	s1,a0
    80001594:	00058913          	mv	s2,a1
    80001598:	00060993          	mv	s3,a2
    LOCK();
    8000159c:	00100613          	li	a2,1
    800015a0:	00000593          	li	a1,0
    800015a4:	00006517          	auipc	a0,0x6
    800015a8:	bec50513          	addi	a0,a0,-1044 # 80007190 <lockPrint>
    800015ac:	00000097          	auipc	ra,0x0
    800015b0:	b64080e7          	jalr	-1180(ra) # 80001110 <copy_and_swap>
    800015b4:	fe0514e3          	bnez	a0,8000159c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800015b8:	00098463          	beqz	s3,800015c0 <_Z8printIntiii+0x4c>
    800015bc:	0804c463          	bltz	s1,80001644 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800015c0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800015c4:	00000593          	li	a1,0
    }

    i = 0;
    800015c8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800015cc:	0009079b          	sext.w	a5,s2
    800015d0:	0325773b          	remuw	a4,a0,s2
    800015d4:	00048613          	mv	a2,s1
    800015d8:	0014849b          	addiw	s1,s1,1
    800015dc:	02071693          	slli	a3,a4,0x20
    800015e0:	0206d693          	srli	a3,a3,0x20
    800015e4:	00006717          	auipc	a4,0x6
    800015e8:	acc70713          	addi	a4,a4,-1332 # 800070b0 <digits>
    800015ec:	00d70733          	add	a4,a4,a3
    800015f0:	00074683          	lbu	a3,0(a4)
    800015f4:	fd040713          	addi	a4,s0,-48
    800015f8:	00c70733          	add	a4,a4,a2
    800015fc:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001600:	0005071b          	sext.w	a4,a0
    80001604:	0325553b          	divuw	a0,a0,s2
    80001608:	fcf772e3          	bgeu	a4,a5,800015cc <_Z8printIntiii+0x58>
    if(neg)
    8000160c:	00058c63          	beqz	a1,80001624 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001610:	fd040793          	addi	a5,s0,-48
    80001614:	009784b3          	add	s1,a5,s1
    80001618:	02d00793          	li	a5,45
    8000161c:	fef48823          	sb	a5,-16(s1)
    80001620:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001624:	fff4849b          	addiw	s1,s1,-1
    80001628:	0204c463          	bltz	s1,80001650 <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    8000162c:	fd040793          	addi	a5,s0,-48
    80001630:	009787b3          	add	a5,a5,s1
    80001634:	ff07c503          	lbu	a0,-16(a5)
    80001638:	00004097          	auipc	ra,0x4
    8000163c:	ba8080e7          	jalr	-1112(ra) # 800051e0 <__putc>
    80001640:	fe5ff06f          	j	80001624 <_Z8printIntiii+0xb0>
        x = -xx;
    80001644:	4090053b          	negw	a0,s1
        neg = 1;
    80001648:	00100593          	li	a1,1
        x = -xx;
    8000164c:	f7dff06f          	j	800015c8 <_Z8printIntiii+0x54>

    UNLOCK();
    80001650:	00000613          	li	a2,0
    80001654:	00100593          	li	a1,1
    80001658:	00006517          	auipc	a0,0x6
    8000165c:	b3850513          	addi	a0,a0,-1224 # 80007190 <lockPrint>
    80001660:	00000097          	auipc	ra,0x0
    80001664:	ab0080e7          	jalr	-1360(ra) # 80001110 <copy_and_swap>
    80001668:	fe0514e3          	bnez	a0,80001650 <_Z8printIntiii+0xdc>
    8000166c:	03813083          	ld	ra,56(sp)
    80001670:	03013403          	ld	s0,48(sp)
    80001674:	02813483          	ld	s1,40(sp)
    80001678:	02013903          	ld	s2,32(sp)
    8000167c:	01813983          	ld	s3,24(sp)
    80001680:	04010113          	addi	sp,sp,64
    80001684:	00008067          	ret

0000000080001688 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80001688:	fe010113          	addi	sp,sp,-32
    8000168c:	00113c23          	sd	ra,24(sp)
    80001690:	00813823          	sd	s0,16(sp)
    80001694:	00913423          	sd	s1,8(sp)
    80001698:	01213023          	sd	s2,0(sp)
    8000169c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800016a0:	00000913          	li	s2,0
    800016a4:	0080006f          	j	800016ac <_Z11workerBodyAPv+0x24>
    800016a8:	00190913          	addi	s2,s2,1
    800016ac:	00900793          	li	a5,9
    800016b0:	0527ec63          	bltu	a5,s2,80001708 <_Z11workerBodyAPv+0x80>
        printString("A: i="); printInt(i); printString("\n");
    800016b4:	00005517          	auipc	a0,0x5
    800016b8:	98c50513          	addi	a0,a0,-1652 # 80006040 <CONSOLE_STATUS+0x30>
    800016bc:	00000097          	auipc	ra,0x0
    800016c0:	d20080e7          	jalr	-736(ra) # 800013dc <_Z11printStringPKc>
    800016c4:	00000613          	li	a2,0
    800016c8:	00a00593          	li	a1,10
    800016cc:	0009051b          	sext.w	a0,s2
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	ea4080e7          	jalr	-348(ra) # 80001574 <_Z8printIntiii>
    800016d8:	00005517          	auipc	a0,0x5
    800016dc:	e7850513          	addi	a0,a0,-392 # 80006550 <CONSOLE_STATUS+0x540>
    800016e0:	00000097          	auipc	ra,0x0
    800016e4:	cfc080e7          	jalr	-772(ra) # 800013dc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800016e8:	00000493          	li	s1,0
    800016ec:	000027b7          	lui	a5,0x2
    800016f0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800016f4:	fa97eae3          	bltu	a5,s1,800016a8 <_Z11workerBodyAPv+0x20>
//            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	be4080e7          	jalr	-1052(ra) # 800012dc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001700:	00148493          	addi	s1,s1,1
    80001704:	fe9ff06f          	j	800016ec <_Z11workerBodyAPv+0x64>
        }
    }
    printString("A finished!\n");
    80001708:	00005517          	auipc	a0,0x5
    8000170c:	94050513          	addi	a0,a0,-1728 # 80006048 <CONSOLE_STATUS+0x38>
    80001710:	00000097          	auipc	ra,0x0
    80001714:	ccc080e7          	jalr	-820(ra) # 800013dc <_Z11printStringPKc>
    finishedA = true;
    80001718:	00100793          	li	a5,1
    8000171c:	00006717          	auipc	a4,0x6
    80001720:	a6f70e23          	sb	a5,-1412(a4) # 80007198 <finishedA>
}
    80001724:	01813083          	ld	ra,24(sp)
    80001728:	01013403          	ld	s0,16(sp)
    8000172c:	00813483          	ld	s1,8(sp)
    80001730:	00013903          	ld	s2,0(sp)
    80001734:	02010113          	addi	sp,sp,32
    80001738:	00008067          	ret

000000008000173c <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    8000173c:	fe010113          	addi	sp,sp,-32
    80001740:	00113c23          	sd	ra,24(sp)
    80001744:	00813823          	sd	s0,16(sp)
    80001748:	00913423          	sd	s1,8(sp)
    8000174c:	01213023          	sd	s2,0(sp)
    80001750:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001754:	00000913          	li	s2,0
    80001758:	0080006f          	j	80001760 <_Z11workerBodyBPv+0x24>
    8000175c:	00190913          	addi	s2,s2,1
    80001760:	00f00793          	li	a5,15
    80001764:	0527ec63          	bltu	a5,s2,800017bc <_Z11workerBodyBPv+0x80>
        printString("B: i="); printInt(i); printString("\n");
    80001768:	00005517          	auipc	a0,0x5
    8000176c:	8f050513          	addi	a0,a0,-1808 # 80006058 <CONSOLE_STATUS+0x48>
    80001770:	00000097          	auipc	ra,0x0
    80001774:	c6c080e7          	jalr	-916(ra) # 800013dc <_Z11printStringPKc>
    80001778:	00000613          	li	a2,0
    8000177c:	00a00593          	li	a1,10
    80001780:	0009051b          	sext.w	a0,s2
    80001784:	00000097          	auipc	ra,0x0
    80001788:	df0080e7          	jalr	-528(ra) # 80001574 <_Z8printIntiii>
    8000178c:	00005517          	auipc	a0,0x5
    80001790:	dc450513          	addi	a0,a0,-572 # 80006550 <CONSOLE_STATUS+0x540>
    80001794:	00000097          	auipc	ra,0x0
    80001798:	c48080e7          	jalr	-952(ra) # 800013dc <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000179c:	00000493          	li	s1,0
    800017a0:	000027b7          	lui	a5,0x2
    800017a4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800017a8:	fa97eae3          	bltu	a5,s1,8000175c <_Z11workerBodyBPv+0x20>
//            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800017ac:	00000097          	auipc	ra,0x0
    800017b0:	b30080e7          	jalr	-1232(ra) # 800012dc <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800017b4:	00148493          	addi	s1,s1,1
    800017b8:	fe9ff06f          	j	800017a0 <_Z11workerBodyBPv+0x64>
        }
    }
    printString("B finished!\n");
    800017bc:	00005517          	auipc	a0,0x5
    800017c0:	8a450513          	addi	a0,a0,-1884 # 80006060 <CONSOLE_STATUS+0x50>
    800017c4:	00000097          	auipc	ra,0x0
    800017c8:	c18080e7          	jalr	-1000(ra) # 800013dc <_Z11printStringPKc>
    finishedB = true;
    800017cc:	00100793          	li	a5,1
    800017d0:	00006717          	auipc	a4,0x6
    800017d4:	9cf704a3          	sb	a5,-1591(a4) # 80007199 <finishedB>
    thread_dispatch();
    800017d8:	00000097          	auipc	ra,0x0
    800017dc:	b04080e7          	jalr	-1276(ra) # 800012dc <_Z15thread_dispatchv>
}
    800017e0:	01813083          	ld	ra,24(sp)
    800017e4:	01013403          	ld	s0,16(sp)
    800017e8:	00813483          	ld	s1,8(sp)
    800017ec:	00013903          	ld	s2,0(sp)
    800017f0:	02010113          	addi	sp,sp,32
    800017f4:	00008067          	ret

00000000800017f8 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    800017f8:	fe010113          	addi	sp,sp,-32
    800017fc:	00113c23          	sd	ra,24(sp)
    80001800:	00813823          	sd	s0,16(sp)
    80001804:	00913423          	sd	s1,8(sp)
    80001808:	01213023          	sd	s2,0(sp)
    8000180c:	02010413          	addi	s0,sp,32
    80001810:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001814:	00100793          	li	a5,1
    80001818:	02a7f863          	bgeu	a5,a0,80001848 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000181c:	00a00793          	li	a5,10
    80001820:	02f577b3          	remu	a5,a0,a5
    80001824:	02078e63          	beqz	a5,80001860 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001828:	fff48513          	addi	a0,s1,-1
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	fcc080e7          	jalr	-52(ra) # 800017f8 <_Z9fibonaccim>
    80001834:	00050913          	mv	s2,a0
    80001838:	ffe48513          	addi	a0,s1,-2
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	fbc080e7          	jalr	-68(ra) # 800017f8 <_Z9fibonaccim>
    80001844:	00a90533          	add	a0,s2,a0
}
    80001848:	01813083          	ld	ra,24(sp)
    8000184c:	01013403          	ld	s0,16(sp)
    80001850:	00813483          	ld	s1,8(sp)
    80001854:	00013903          	ld	s2,0(sp)
    80001858:	02010113          	addi	sp,sp,32
    8000185c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001860:	00000097          	auipc	ra,0x0
    80001864:	a7c080e7          	jalr	-1412(ra) # 800012dc <_Z15thread_dispatchv>
    80001868:	fc1ff06f          	j	80001828 <_Z9fibonaccim+0x30>

000000008000186c <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    8000186c:	fe010113          	addi	sp,sp,-32
    80001870:	00113c23          	sd	ra,24(sp)
    80001874:	00813823          	sd	s0,16(sp)
    80001878:	00913423          	sd	s1,8(sp)
    8000187c:	01213023          	sd	s2,0(sp)
    80001880:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001884:	00000493          	li	s1,0
    80001888:	0400006f          	j	800018c8 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000188c:	00004517          	auipc	a0,0x4
    80001890:	7e450513          	addi	a0,a0,2020 # 80006070 <CONSOLE_STATUS+0x60>
    80001894:	00000097          	auipc	ra,0x0
    80001898:	b48080e7          	jalr	-1208(ra) # 800013dc <_Z11printStringPKc>
    8000189c:	00000613          	li	a2,0
    800018a0:	00a00593          	li	a1,10
    800018a4:	00048513          	mv	a0,s1
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	ccc080e7          	jalr	-820(ra) # 80001574 <_Z8printIntiii>
    800018b0:	00005517          	auipc	a0,0x5
    800018b4:	ca050513          	addi	a0,a0,-864 # 80006550 <CONSOLE_STATUS+0x540>
    800018b8:	00000097          	auipc	ra,0x0
    800018bc:	b24080e7          	jalr	-1244(ra) # 800013dc <_Z11printStringPKc>
    for (; i < 3; i++) {
    800018c0:	0014849b          	addiw	s1,s1,1
    800018c4:	0ff4f493          	andi	s1,s1,255
    800018c8:	00200793          	li	a5,2
    800018cc:	fc97f0e3          	bgeu	a5,s1,8000188c <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    800018d0:	00004517          	auipc	a0,0x4
    800018d4:	7a850513          	addi	a0,a0,1960 # 80006078 <CONSOLE_STATUS+0x68>
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	b04080e7          	jalr	-1276(ra) # 800013dc <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800018e0:	00700313          	li	t1,7
    thread_dispatch();
    800018e4:	00000097          	auipc	ra,0x0
    800018e8:	9f8080e7          	jalr	-1544(ra) # 800012dc <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800018ec:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800018f0:	00004517          	auipc	a0,0x4
    800018f4:	79850513          	addi	a0,a0,1944 # 80006088 <CONSOLE_STATUS+0x78>
    800018f8:	00000097          	auipc	ra,0x0
    800018fc:	ae4080e7          	jalr	-1308(ra) # 800013dc <_Z11printStringPKc>
    80001900:	00000613          	li	a2,0
    80001904:	00a00593          	li	a1,10
    80001908:	0009051b          	sext.w	a0,s2
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	c68080e7          	jalr	-920(ra) # 80001574 <_Z8printIntiii>
    80001914:	00005517          	auipc	a0,0x5
    80001918:	c3c50513          	addi	a0,a0,-964 # 80006550 <CONSOLE_STATUS+0x540>
    8000191c:	00000097          	auipc	ra,0x0
    80001920:	ac0080e7          	jalr	-1344(ra) # 800013dc <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001924:	00c00513          	li	a0,12
    80001928:	00000097          	auipc	ra,0x0
    8000192c:	ed0080e7          	jalr	-304(ra) # 800017f8 <_Z9fibonaccim>
    80001930:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80001934:	00004517          	auipc	a0,0x4
    80001938:	75c50513          	addi	a0,a0,1884 # 80006090 <CONSOLE_STATUS+0x80>
    8000193c:	00000097          	auipc	ra,0x0
    80001940:	aa0080e7          	jalr	-1376(ra) # 800013dc <_Z11printStringPKc>
    80001944:	00000613          	li	a2,0
    80001948:	00a00593          	li	a1,10
    8000194c:	0009051b          	sext.w	a0,s2
    80001950:	00000097          	auipc	ra,0x0
    80001954:	c24080e7          	jalr	-988(ra) # 80001574 <_Z8printIntiii>
    80001958:	00005517          	auipc	a0,0x5
    8000195c:	bf850513          	addi	a0,a0,-1032 # 80006550 <CONSOLE_STATUS+0x540>
    80001960:	00000097          	auipc	ra,0x0
    80001964:	a7c080e7          	jalr	-1412(ra) # 800013dc <_Z11printStringPKc>
    80001968:	0400006f          	j	800019a8 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000196c:	00004517          	auipc	a0,0x4
    80001970:	70450513          	addi	a0,a0,1796 # 80006070 <CONSOLE_STATUS+0x60>
    80001974:	00000097          	auipc	ra,0x0
    80001978:	a68080e7          	jalr	-1432(ra) # 800013dc <_Z11printStringPKc>
    8000197c:	00000613          	li	a2,0
    80001980:	00a00593          	li	a1,10
    80001984:	00048513          	mv	a0,s1
    80001988:	00000097          	auipc	ra,0x0
    8000198c:	bec080e7          	jalr	-1044(ra) # 80001574 <_Z8printIntiii>
    80001990:	00005517          	auipc	a0,0x5
    80001994:	bc050513          	addi	a0,a0,-1088 # 80006550 <CONSOLE_STATUS+0x540>
    80001998:	00000097          	auipc	ra,0x0
    8000199c:	a44080e7          	jalr	-1468(ra) # 800013dc <_Z11printStringPKc>
    for (; i < 6; i++) {
    800019a0:	0014849b          	addiw	s1,s1,1
    800019a4:	0ff4f493          	andi	s1,s1,255
    800019a8:	00500793          	li	a5,5
    800019ac:	fc97f0e3          	bgeu	a5,s1,8000196c <_Z11workerBodyCPv+0x100>
    }

    printString("A finished!\n");
    800019b0:	00004517          	auipc	a0,0x4
    800019b4:	69850513          	addi	a0,a0,1688 # 80006048 <CONSOLE_STATUS+0x38>
    800019b8:	00000097          	auipc	ra,0x0
    800019bc:	a24080e7          	jalr	-1500(ra) # 800013dc <_Z11printStringPKc>
    finishedC = true;
    800019c0:	00100793          	li	a5,1
    800019c4:	00005717          	auipc	a4,0x5
    800019c8:	7cf70b23          	sb	a5,2006(a4) # 8000719a <finishedC>
    thread_dispatch();
    800019cc:	00000097          	auipc	ra,0x0
    800019d0:	910080e7          	jalr	-1776(ra) # 800012dc <_Z15thread_dispatchv>
}
    800019d4:	01813083          	ld	ra,24(sp)
    800019d8:	01013403          	ld	s0,16(sp)
    800019dc:	00813483          	ld	s1,8(sp)
    800019e0:	00013903          	ld	s2,0(sp)
    800019e4:	02010113          	addi	sp,sp,32
    800019e8:	00008067          	ret

00000000800019ec <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    800019ec:	fe010113          	addi	sp,sp,-32
    800019f0:	00113c23          	sd	ra,24(sp)
    800019f4:	00813823          	sd	s0,16(sp)
    800019f8:	00913423          	sd	s1,8(sp)
    800019fc:	01213023          	sd	s2,0(sp)
    80001a00:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001a04:	00a00493          	li	s1,10
    80001a08:	0400006f          	j	80001a48 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001a0c:	00004517          	auipc	a0,0x4
    80001a10:	69450513          	addi	a0,a0,1684 # 800060a0 <CONSOLE_STATUS+0x90>
    80001a14:	00000097          	auipc	ra,0x0
    80001a18:	9c8080e7          	jalr	-1592(ra) # 800013dc <_Z11printStringPKc>
    80001a1c:	00000613          	li	a2,0
    80001a20:	00a00593          	li	a1,10
    80001a24:	00048513          	mv	a0,s1
    80001a28:	00000097          	auipc	ra,0x0
    80001a2c:	b4c080e7          	jalr	-1204(ra) # 80001574 <_Z8printIntiii>
    80001a30:	00005517          	auipc	a0,0x5
    80001a34:	b2050513          	addi	a0,a0,-1248 # 80006550 <CONSOLE_STATUS+0x540>
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	9a4080e7          	jalr	-1628(ra) # 800013dc <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001a40:	0014849b          	addiw	s1,s1,1
    80001a44:	0ff4f493          	andi	s1,s1,255
    80001a48:	00c00793          	li	a5,12
    80001a4c:	fc97f0e3          	bgeu	a5,s1,80001a0c <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80001a50:	00004517          	auipc	a0,0x4
    80001a54:	65850513          	addi	a0,a0,1624 # 800060a8 <CONSOLE_STATUS+0x98>
    80001a58:	00000097          	auipc	ra,0x0
    80001a5c:	984080e7          	jalr	-1660(ra) # 800013dc <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001a60:	00500313          	li	t1,5
    thread_dispatch();
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	878080e7          	jalr	-1928(ra) # 800012dc <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80001a6c:	01000513          	li	a0,16
    80001a70:	00000097          	auipc	ra,0x0
    80001a74:	d88080e7          	jalr	-632(ra) # 800017f8 <_Z9fibonaccim>
    80001a78:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80001a7c:	00004517          	auipc	a0,0x4
    80001a80:	63c50513          	addi	a0,a0,1596 # 800060b8 <CONSOLE_STATUS+0xa8>
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	958080e7          	jalr	-1704(ra) # 800013dc <_Z11printStringPKc>
    80001a8c:	00000613          	li	a2,0
    80001a90:	00a00593          	li	a1,10
    80001a94:	0009051b          	sext.w	a0,s2
    80001a98:	00000097          	auipc	ra,0x0
    80001a9c:	adc080e7          	jalr	-1316(ra) # 80001574 <_Z8printIntiii>
    80001aa0:	00005517          	auipc	a0,0x5
    80001aa4:	ab050513          	addi	a0,a0,-1360 # 80006550 <CONSOLE_STATUS+0x540>
    80001aa8:	00000097          	auipc	ra,0x0
    80001aac:	934080e7          	jalr	-1740(ra) # 800013dc <_Z11printStringPKc>
    80001ab0:	0400006f          	j	80001af0 <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001ab4:	00004517          	auipc	a0,0x4
    80001ab8:	5ec50513          	addi	a0,a0,1516 # 800060a0 <CONSOLE_STATUS+0x90>
    80001abc:	00000097          	auipc	ra,0x0
    80001ac0:	920080e7          	jalr	-1760(ra) # 800013dc <_Z11printStringPKc>
    80001ac4:	00000613          	li	a2,0
    80001ac8:	00a00593          	li	a1,10
    80001acc:	00048513          	mv	a0,s1
    80001ad0:	00000097          	auipc	ra,0x0
    80001ad4:	aa4080e7          	jalr	-1372(ra) # 80001574 <_Z8printIntiii>
    80001ad8:	00005517          	auipc	a0,0x5
    80001adc:	a7850513          	addi	a0,a0,-1416 # 80006550 <CONSOLE_STATUS+0x540>
    80001ae0:	00000097          	auipc	ra,0x0
    80001ae4:	8fc080e7          	jalr	-1796(ra) # 800013dc <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001ae8:	0014849b          	addiw	s1,s1,1
    80001aec:	0ff4f493          	andi	s1,s1,255
    80001af0:	00f00793          	li	a5,15
    80001af4:	fc97f0e3          	bgeu	a5,s1,80001ab4 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80001af8:	00004517          	auipc	a0,0x4
    80001afc:	5d050513          	addi	a0,a0,1488 # 800060c8 <CONSOLE_STATUS+0xb8>
    80001b00:	00000097          	auipc	ra,0x0
    80001b04:	8dc080e7          	jalr	-1828(ra) # 800013dc <_Z11printStringPKc>
    finishedD = true;
    80001b08:	00100793          	li	a5,1
    80001b0c:	00005717          	auipc	a4,0x5
    80001b10:	68f707a3          	sb	a5,1679(a4) # 8000719b <finishedD>
    thread_dispatch();
    80001b14:	fffff097          	auipc	ra,0xfffff
    80001b18:	7c8080e7          	jalr	1992(ra) # 800012dc <_Z15thread_dispatchv>
}
    80001b1c:	01813083          	ld	ra,24(sp)
    80001b20:	01013403          	ld	s0,16(sp)
    80001b24:	00813483          	ld	s1,8(sp)
    80001b28:	00013903          	ld	s2,0(sp)
    80001b2c:	02010113          	addi	sp,sp,32
    80001b30:	00008067          	ret

0000000080001b34 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80001b34:	fc010113          	addi	sp,sp,-64
    80001b38:	02113c23          	sd	ra,56(sp)
    80001b3c:	02813823          	sd	s0,48(sp)
    80001b40:	02913423          	sd	s1,40(sp)
    80001b44:	04010413          	addi	s0,sp,64
    thread_t threads[4];
    printString("\nthr0: ");
    80001b48:	00004517          	auipc	a0,0x4
    80001b4c:	59050513          	addi	a0,a0,1424 # 800060d8 <CONSOLE_STATUS+0xc8>
    80001b50:	00000097          	auipc	ra,0x0
    80001b54:	88c080e7          	jalr	-1908(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)&threads[0], 16, 0);
    80001b58:	00000613          	li	a2,0
    80001b5c:	01000593          	li	a1,16
    80001b60:	fc040493          	addi	s1,s0,-64
    80001b64:	0004851b          	sext.w	a0,s1
    80001b68:	00000097          	auipc	ra,0x0
    80001b6c:	a0c080e7          	jalr	-1524(ra) # 80001574 <_Z8printIntiii>
    thread_create(&threads[0], workerBodyA, nullptr);
    80001b70:	00000613          	li	a2,0
    80001b74:	00000597          	auipc	a1,0x0
    80001b78:	b1458593          	addi	a1,a1,-1260 # 80001688 <_Z11workerBodyAPv>
    80001b7c:	00048513          	mv	a0,s1
    80001b80:	fffff097          	auipc	ra,0xfffff
    80001b84:	68c080e7          	jalr	1676(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80001b88:	00004517          	auipc	a0,0x4
    80001b8c:	55850513          	addi	a0,a0,1368 # 800060e0 <CONSOLE_STATUS+0xd0>
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	84c080e7          	jalr	-1972(ra) # 800013dc <_Z11printStringPKc>

    printString("\nthr0: ");
    80001b98:	00004517          	auipc	a0,0x4
    80001b9c:	54050513          	addi	a0,a0,1344 # 800060d8 <CONSOLE_STATUS+0xc8>
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	83c080e7          	jalr	-1988(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)&threads[1], 16, 0);
    80001ba8:	00000613          	li	a2,0
    80001bac:	01000593          	li	a1,16
    80001bb0:	fc840493          	addi	s1,s0,-56
    80001bb4:	0004851b          	sext.w	a0,s1
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	9bc080e7          	jalr	-1604(ra) # 80001574 <_Z8printIntiii>
    thread_create(&threads[1], workerBodyB, nullptr);
    80001bc0:	00000613          	li	a2,0
    80001bc4:	00000597          	auipc	a1,0x0
    80001bc8:	b7858593          	addi	a1,a1,-1160 # 8000173c <_Z11workerBodyBPv>
    80001bcc:	00048513          	mv	a0,s1
    80001bd0:	fffff097          	auipc	ra,0xfffff
    80001bd4:	63c080e7          	jalr	1596(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80001bd8:	00004517          	auipc	a0,0x4
    80001bdc:	52050513          	addi	a0,a0,1312 # 800060f8 <CONSOLE_STATUS+0xe8>
    80001be0:	fffff097          	auipc	ra,0xfffff
    80001be4:	7fc080e7          	jalr	2044(ra) # 800013dc <_Z11printStringPKc>

    printString("\nthr0: ");
    80001be8:	00004517          	auipc	a0,0x4
    80001bec:	4f050513          	addi	a0,a0,1264 # 800060d8 <CONSOLE_STATUS+0xc8>
    80001bf0:	fffff097          	auipc	ra,0xfffff
    80001bf4:	7ec080e7          	jalr	2028(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)&threads[2], 16, 0);
    80001bf8:	00000613          	li	a2,0
    80001bfc:	01000593          	li	a1,16
    80001c00:	fd040493          	addi	s1,s0,-48
    80001c04:	0004851b          	sext.w	a0,s1
    80001c08:	00000097          	auipc	ra,0x0
    80001c0c:	96c080e7          	jalr	-1684(ra) # 80001574 <_Z8printIntiii>
    thread_create(&threads[2], workerBodyC, nullptr);
    80001c10:	00000613          	li	a2,0
    80001c14:	00000597          	auipc	a1,0x0
    80001c18:	c5858593          	addi	a1,a1,-936 # 8000186c <_Z11workerBodyCPv>
    80001c1c:	00048513          	mv	a0,s1
    80001c20:	fffff097          	auipc	ra,0xfffff
    80001c24:	5ec080e7          	jalr	1516(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80001c28:	00004517          	auipc	a0,0x4
    80001c2c:	4e850513          	addi	a0,a0,1256 # 80006110 <CONSOLE_STATUS+0x100>
    80001c30:	fffff097          	auipc	ra,0xfffff
    80001c34:	7ac080e7          	jalr	1964(ra) # 800013dc <_Z11printStringPKc>

    printString("\nthr0: ");
    80001c38:	00004517          	auipc	a0,0x4
    80001c3c:	4a050513          	addi	a0,a0,1184 # 800060d8 <CONSOLE_STATUS+0xc8>
    80001c40:	fffff097          	auipc	ra,0xfffff
    80001c44:	79c080e7          	jalr	1948(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)&threads[3], 16, 0);
    80001c48:	00000613          	li	a2,0
    80001c4c:	01000593          	li	a1,16
    80001c50:	fd840493          	addi	s1,s0,-40
    80001c54:	0004851b          	sext.w	a0,s1
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	91c080e7          	jalr	-1764(ra) # 80001574 <_Z8printIntiii>
    thread_create(&threads[3], workerBodyD, nullptr);
    80001c60:	00000613          	li	a2,0
    80001c64:	00000597          	auipc	a1,0x0
    80001c68:	d8858593          	addi	a1,a1,-632 # 800019ec <_Z11workerBodyDPv>
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	fffff097          	auipc	ra,0xfffff
    80001c74:	59c080e7          	jalr	1436(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80001c78:	00004517          	auipc	a0,0x4
    80001c7c:	4b050513          	addi	a0,a0,1200 # 80006128 <CONSOLE_STATUS+0x118>
    80001c80:	fffff097          	auipc	ra,0xfffff
    80001c84:	75c080e7          	jalr	1884(ra) # 800013dc <_Z11printStringPKc>
    80001c88:	00c0006f          	j	80001c94 <_Z18Threads_C_API_testv+0x160>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80001c8c:	fffff097          	auipc	ra,0xfffff
    80001c90:	650080e7          	jalr	1616(ra) # 800012dc <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80001c94:	00005797          	auipc	a5,0x5
    80001c98:	5047c783          	lbu	a5,1284(a5) # 80007198 <finishedA>
    80001c9c:	fe0788e3          	beqz	a5,80001c8c <_Z18Threads_C_API_testv+0x158>
    80001ca0:	00005797          	auipc	a5,0x5
    80001ca4:	4f97c783          	lbu	a5,1273(a5) # 80007199 <finishedB>
    80001ca8:	fe0782e3          	beqz	a5,80001c8c <_Z18Threads_C_API_testv+0x158>
    80001cac:	00005797          	auipc	a5,0x5
    80001cb0:	4ee7c783          	lbu	a5,1262(a5) # 8000719a <finishedC>
    80001cb4:	fc078ce3          	beqz	a5,80001c8c <_Z18Threads_C_API_testv+0x158>
    80001cb8:	00005797          	auipc	a5,0x5
    80001cbc:	4e37c783          	lbu	a5,1251(a5) # 8000719b <finishedD>
    80001cc0:	fc0786e3          	beqz	a5,80001c8c <_Z18Threads_C_API_testv+0x158>
    }

}
    80001cc4:	03813083          	ld	ra,56(sp)
    80001cc8:	03013403          	ld	s0,48(sp)
    80001ccc:	02813483          	ld	s1,40(sp)
    80001cd0:	04010113          	addi	sp,sp,64
    80001cd4:	00008067          	ret

0000000080001cd8 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    80001cd8:	ff010113          	addi	sp,sp,-16
    80001cdc:	00113423          	sd	ra,8(sp)
    80001ce0:	00813023          	sd	s0,0(sp)
    80001ce4:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    80001ce8:	00000097          	auipc	ra,0x0
    80001cec:	e4c080e7          	jalr	-436(ra) # 80001b34 <_Z18Threads_C_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
   // ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

    80001cf0:	00813083          	ld	ra,8(sp)
    80001cf4:	00013403          	ld	s0,0(sp)
    80001cf8:	01010113          	addi	sp,sp,16
    80001cfc:	00008067          	ret

0000000080001d00 <_Z17userWrapperThreadPv>:

    TCB::yield();
}*/
extern void userMain();

void userWrapperThread(void* arg) {
    80001d00:	ff010113          	addi	sp,sp,-16
    80001d04:	00113423          	sd	ra,8(sp)
    80001d08:	00813023          	sd	s0,0(sp)
    80001d0c:	01010413          	addi	s0,sp,16
    userMain();
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	fc8080e7          	jalr	-56(ra) # 80001cd8 <_Z8userMainv>
}
    80001d18:	00813083          	ld	ra,8(sp)
    80001d1c:	00013403          	ld	s0,0(sp)
    80001d20:	01010113          	addi	sp,sp,16
    80001d24:	00008067          	ret

0000000080001d28 <main>:

void main() {
    80001d28:	fd010113          	addi	sp,sp,-48
    80001d2c:	02113423          	sd	ra,40(sp)
    80001d30:	02813023          	sd	s0,32(sp)
    80001d34:	00913c23          	sd	s1,24(sp)
    80001d38:	03010413          	addi	s0,sp,48
    // postavljena adresa prekidne rutine u stvec
    __asm__ volatile ("csrw stvec, %[vector]" : : [vector] "r" (&Riscv::supervisorTrap) );
    80001d3c:	00005797          	auipc	a5,0x5
    80001d40:	3cc7b783          	ld	a5,972(a5) # 80007108 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001d44:	10579073          	csrw	stvec,a5
//    printInt((uint64)Riscv::r_sstatus());
//    printString("Sstatus = ");

    // Obavezno postaviti prvo fju main kao pocetnu nit
    thread_t mainThread;
    thread_create(&mainThread, nullptr, nullptr);
    80001d48:	00000613          	li	a2,0
    80001d4c:	00000593          	li	a1,0
    80001d50:	fd840513          	addi	a0,s0,-40
    80001d54:	fffff097          	auipc	ra,0xfffff
    80001d58:	4b8080e7          	jalr	1208(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = mainThread;
    80001d5c:	00005797          	auipc	a5,0x5
    80001d60:	3c47b783          	ld	a5,964(a5) # 80007120 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001d64:	fd843703          	ld	a4,-40(s0)
    80001d68:	00e7b023          	sd	a4,0(a5)


    volatile thread_t userThread;
    printString("\nuserThread: ");
    80001d6c:	00004517          	auipc	a0,0x4
    80001d70:	3d450513          	addi	a0,a0,980 # 80006140 <CONSOLE_STATUS+0x130>
    80001d74:	fffff097          	auipc	ra,0xfffff
    80001d78:	668080e7          	jalr	1640(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)&userThread, 16, 0);
    80001d7c:	00000613          	li	a2,0
    80001d80:	01000593          	li	a1,16
    80001d84:	fd040493          	addi	s1,s0,-48
    80001d88:	0004851b          	sext.w	a0,s1
    80001d8c:	fffff097          	auipc	ra,0xfffff
    80001d90:	7e8080e7          	jalr	2024(ra) # 80001574 <_Z8printIntiii>
    if(thread_create((thread_t*)&userThread, userWrapperThread, nullptr) < 0) {
    80001d94:	00000613          	li	a2,0
    80001d98:	00000597          	auipc	a1,0x0
    80001d9c:	f6858593          	addi	a1,a1,-152 # 80001d00 <_Z17userWrapperThreadPv>
    80001da0:	00048513          	mv	a0,s1
    80001da4:	fffff097          	auipc	ra,0xfffff
    80001da8:	468080e7          	jalr	1128(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    80001dac:	00054e63          	bltz	a0,80001dc8 <main+0xa0>
        printString("Greska");
    }


    while(!userThread->isFinished()) {
    80001db0:	fd043783          	ld	a5,-48(s0)

    ~TCB() { delete[] stack;
        printString("\nDestructor is executed\n");
    }

    bool isFinished() const { return finished; }
    80001db4:	0307c783          	lbu	a5,48(a5)
    80001db8:	02079263          	bnez	a5,80001ddc <main+0xb4>
        thread_dispatch();
    80001dbc:	fffff097          	auipc	ra,0xfffff
    80001dc0:	520080e7          	jalr	1312(ra) # 800012dc <_Z15thread_dispatchv>
    80001dc4:	fedff06f          	j	80001db0 <main+0x88>
        printString("Greska");
    80001dc8:	00004517          	auipc	a0,0x4
    80001dcc:	38850513          	addi	a0,a0,904 # 80006150 <CONSOLE_STATUS+0x140>
    80001dd0:	fffff097          	auipc	ra,0xfffff
    80001dd4:	60c080e7          	jalr	1548(ra) # 800013dc <_Z11printStringPKc>
    80001dd8:	fd9ff06f          	j	80001db0 <main+0x88>
    testThreadsC();
    */

   // testThreadsCPP();
    // testThreadsC();
    printString("\n Vratio se u main"); // Treba da se vrati u main! Na console treba da pise "Kernel finished"
    80001ddc:	00004517          	auipc	a0,0x4
    80001de0:	37c50513          	addi	a0,a0,892 # 80006158 <CONSOLE_STATUS+0x148>
    80001de4:	fffff097          	auipc	ra,0xfffff
    80001de8:	5f8080e7          	jalr	1528(ra) # 800013dc <_Z11printStringPKc>
        thread_dispatch();
    }*/



}
    80001dec:	02813083          	ld	ra,40(sp)
    80001df0:	02013403          	ld	s0,32(sp)
    80001df4:	01813483          	ld	s1,24(sp)
    80001df8:	03010113          	addi	sp,sp,48
    80001dfc:	00008067          	ret

0000000080001e00 <_Znwm>:
#include "../h/riscv.hpp"
#include "../h/memoryAllocator.hpp"

#include "printing.hpp"

void *operator new(uint64 n) { return __mem_alloc(n); }
    80001e00:	ff010113          	addi	sp,sp,-16
    80001e04:	00113423          	sd	ra,8(sp)
    80001e08:	00813023          	sd	s0,0(sp)
    80001e0c:	01010413          	addi	s0,sp,16
    80001e10:	00003097          	auipc	ra,0x3
    80001e14:	278080e7          	jalr	632(ra) # 80005088 <__mem_alloc>
    80001e18:	00813083          	ld	ra,8(sp)
    80001e1c:	00013403          	ld	s0,0(sp)
    80001e20:	01010113          	addi	sp,sp,16
    80001e24:	00008067          	ret

0000000080001e28 <_Znam>:
void *operator new[](uint64 n) { return __mem_alloc(n); }
    80001e28:	ff010113          	addi	sp,sp,-16
    80001e2c:	00113423          	sd	ra,8(sp)
    80001e30:	00813023          	sd	s0,0(sp)
    80001e34:	01010413          	addi	s0,sp,16
    80001e38:	00003097          	auipc	ra,0x3
    80001e3c:	250080e7          	jalr	592(ra) # 80005088 <__mem_alloc>
    80001e40:	00813083          	ld	ra,8(sp)
    80001e44:	00013403          	ld	s0,0(sp)
    80001e48:	01010113          	addi	sp,sp,16
    80001e4c:	00008067          	ret

0000000080001e50 <_ZdlPv>:

void operator delete(void *p) noexcept { __mem_free(p); }
    80001e50:	ff010113          	addi	sp,sp,-16
    80001e54:	00113423          	sd	ra,8(sp)
    80001e58:	00813023          	sd	s0,0(sp)
    80001e5c:	01010413          	addi	s0,sp,16
    80001e60:	00003097          	auipc	ra,0x3
    80001e64:	15c080e7          	jalr	348(ra) # 80004fbc <__mem_free>
    80001e68:	00813083          	ld	ra,8(sp)
    80001e6c:	00013403          	ld	s0,0(sp)
    80001e70:	01010113          	addi	sp,sp,16
    80001e74:	00008067          	ret

0000000080001e78 <_ZdaPv>:
void operator delete[](void *p) noexcept { __mem_free(p); }
    80001e78:	ff010113          	addi	sp,sp,-16
    80001e7c:	00113423          	sd	ra,8(sp)
    80001e80:	00813023          	sd	s0,0(sp)
    80001e84:	01010413          	addi	s0,sp,16
    80001e88:	00003097          	auipc	ra,0x3
    80001e8c:	134080e7          	jalr	308(ra) # 80004fbc <__mem_free>
    80001e90:	00813083          	ld	ra,8(sp)
    80001e94:	00013403          	ld	s0,0(sp)
    80001e98:	01010113          	addi	sp,sp,16
    80001e9c:	00008067          	ret

0000000080001ea0 <_ZN3TCB9createTCBEPFvPvES0_S0_>:
TCB *TCB::running = nullptr;


uint64 TCB::timeSliceCounter = 0;

TCB *TCB::createTCB(TCB::Body body, void *arg, void *stack_space) {
    80001ea0:	fd010113          	addi	sp,sp,-48
    80001ea4:	02113423          	sd	ra,40(sp)
    80001ea8:	02813023          	sd	s0,32(sp)
    80001eac:	00913c23          	sd	s1,24(sp)
    80001eb0:	01213823          	sd	s2,16(sp)
    80001eb4:	01313423          	sd	s3,8(sp)
    80001eb8:	03010413          	addi	s0,sp,48
    80001ebc:	00050913          	mv	s2,a0
    80001ec0:	00058993          	mv	s3,a1
    80001ec4:	00060493          	mv	s1,a2
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    80001ec8:	03800513          	li	a0,56
    80001ecc:	00000097          	auipc	ra,0x0
    80001ed0:	f34080e7          	jalr	-204(ra) # 80001e00 <_Znwm>
    static TCB *running;

private:
   // TCB(Body body, uint64 timeSlice);
     TCB(Body body, uint64 timeSlice, void *arg, void* stack_space) :
        body(body)
    80001ed4:	01253423          	sd	s2,8(a0)
    {
       this->arg = arg;
    80001ed8:	01353023          	sd	s3,0(a0)
       // UMESTO new uint64[STACK_SIZE] -> (uint64*)MemoryAllocator::getInstance()->myMalloc(STACK_SIZE*sizeof(uint64)) RADI
       //stack = body != nullptr ? new uint64[STACK_SIZE] : nullptr;

       //stack = body != nullptr ? (uint64*)__mem_alloc(STACK_SIZE) : nullptr;
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    80001edc:	04090863          	beqz	s2,80001f2c <_ZN3TCB9createTCBEPFvPvES0_S0_+0x8c>
    80001ee0:	00953823          	sd	s1,16(a0)

        //******* new?

        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80001ee4:	04048a63          	beqz	s1,80001f38 <_ZN3TCB9createTCBEPFvPvES0_S0_+0x98>
    80001ee8:	00008637          	lui	a2,0x8
    80001eec:	00c484b3          	add	s1,s1,a2
    80001ef0:	00000797          	auipc	a5,0x0
    80001ef4:	16478793          	addi	a5,a5,356 # 80002054 <_ZN3TCB13threadWrapperEPv>
    80001ef8:	00f53c23          	sd	a5,24(a0)
    80001efc:	02953023          	sd	s1,32(a0)

        this->timeSlice = DEFAULT_TIME_SLICE;
    80001f00:	00200793          	li	a5,2
    80001f04:	02f53423          	sd	a5,40(a0)
        finished = false;
    80001f08:	02050823          	sb	zero,48(a0)
        suspended = false;
    80001f0c:	020508a3          	sb	zero,49(a0)
    return ret;
}
    80001f10:	02813083          	ld	ra,40(sp)
    80001f14:	02013403          	ld	s0,32(sp)
    80001f18:	01813483          	ld	s1,24(sp)
    80001f1c:	01013903          	ld	s2,16(sp)
    80001f20:	00813983          	ld	s3,8(sp)
    80001f24:	03010113          	addi	sp,sp,48
    80001f28:	00008067          	ret
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    80001f2c:	00053823          	sd	zero,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80001f30:	00000493          	li	s1,0
    80001f34:	fbdff06f          	j	80001ef0 <_ZN3TCB9createTCBEPFvPvES0_S0_+0x50>
    80001f38:	00000493          	li	s1,0
    80001f3c:	fb5ff06f          	j	80001ef0 <_ZN3TCB9createTCBEPFvPvES0_S0_+0x50>

0000000080001f40 <_ZN3TCB13putTCBinQueueEPS_>:
       // if (body != nullptr) { Scheduler::put(this); }
    }


    void putInQueue(TCB *tcb){
        if (body != nullptr) { Scheduler::put(this); }
    80001f40:	0085b783          	ld	a5,8(a1)
    80001f44:	02078863          	beqz	a5,80001f74 <_ZN3TCB13putTCBinQueueEPS_+0x34>

void TCB::putTCBinQueue(TCB *tcb) {
    80001f48:	ff010113          	addi	sp,sp,-16
    80001f4c:	00113423          	sd	ra,8(sp)
    80001f50:	00813023          	sd	s0,0(sp)
    80001f54:	01010413          	addi	s0,sp,16
    80001f58:	00058513          	mv	a0,a1
    80001f5c:	00001097          	auipc	ra,0x1
    80001f60:	efc080e7          	jalr	-260(ra) # 80002e58 <_ZN9Scheduler3putEP3TCB>
    tcb->putInQueue(tcb);
}
    80001f64:	00813083          	ld	ra,8(sp)
    80001f68:	00013403          	ld	s0,0(sp)
    80001f6c:	01010113          	addi	sp,sp,16
    80001f70:	00008067          	ret
    80001f74:	00008067          	ret

0000000080001f78 <_ZN3TCB12createThreadEPFvPvES0_S0_>:

TCB *TCB::createThread(Body body, void *arg, void* stack_space) {
    80001f78:	fd010113          	addi	sp,sp,-48
    80001f7c:	02113423          	sd	ra,40(sp)
    80001f80:	02813023          	sd	s0,32(sp)
    80001f84:	00913c23          	sd	s1,24(sp)
    80001f88:	01213823          	sd	s2,16(sp)
    80001f8c:	01313423          	sd	s3,8(sp)
    80001f90:	01413023          	sd	s4,0(sp)
    80001f94:	03010413          	addi	s0,sp,48
    80001f98:	00050993          	mv	s3,a0
    80001f9c:	00058a13          	mv	s4,a1
    80001fa0:	00060913          	mv	s2,a2
//    return (TCB*)MemoryAllocator::getInstance()->myMalloc(sizeof)
    TCB* ret = new TCB(body, TIME_SLICE, arg, stack_space);
    80001fa4:	03800513          	li	a0,56
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	e58080e7          	jalr	-424(ra) # 80001e00 <_Znwm>
    80001fb0:	00050493          	mv	s1,a0
        body(body)
    80001fb4:	01353423          	sd	s3,8(a0)
       this->arg = arg;
    80001fb8:	01453023          	sd	s4,0(a0)
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    80001fbc:	06098463          	beqz	s3,80002024 <_ZN3TCB12createThreadEPFvPvES0_S0_+0xac>
    80001fc0:	01253823          	sd	s2,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80001fc4:	06090663          	beqz	s2,80002030 <_ZN3TCB12createThreadEPFvPvES0_S0_+0xb8>
    80001fc8:	00008637          	lui	a2,0x8
    80001fcc:	00c90933          	add	s2,s2,a2
    80001fd0:	00000797          	auipc	a5,0x0
    80001fd4:	08478793          	addi	a5,a5,132 # 80002054 <_ZN3TCB13threadWrapperEPv>
    80001fd8:	00f4bc23          	sd	a5,24(s1)
    80001fdc:	0324b023          	sd	s2,32(s1)
        this->timeSlice = DEFAULT_TIME_SLICE;
    80001fe0:	00200793          	li	a5,2
    80001fe4:	02f4b423          	sd	a5,40(s1)
        finished = false;
    80001fe8:	02048823          	sb	zero,48(s1)
        suspended = false;
    80001fec:	020488a3          	sb	zero,49(s1)
        if (body != nullptr) { Scheduler::put(this); }
    80001ff0:	00098863          	beqz	s3,80002000 <_ZN3TCB12createThreadEPFvPvES0_S0_+0x88>
    80001ff4:	00048513          	mv	a0,s1
    80001ff8:	00001097          	auipc	ra,0x1
    80001ffc:	e60080e7          	jalr	-416(ra) # 80002e58 <_ZN9Scheduler3putEP3TCB>
    ret->putInQueue(ret);
    return ret;
}
    80002000:	00048513          	mv	a0,s1
    80002004:	02813083          	ld	ra,40(sp)
    80002008:	02013403          	ld	s0,32(sp)
    8000200c:	01813483          	ld	s1,24(sp)
    80002010:	01013903          	ld	s2,16(sp)
    80002014:	00813983          	ld	s3,8(sp)
    80002018:	00013a03          	ld	s4,0(sp)
    8000201c:	03010113          	addi	sp,sp,48
    80002020:	00008067          	ret
       stack = body != nullptr ? (uint64*)stack_space : nullptr;
    80002024:	00053823          	sd	zero,16(a0)
        context = {(uint64) &threadWrapper, stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0};
    80002028:	00000913          	li	s2,0
    8000202c:	fa5ff06f          	j	80001fd0 <_ZN3TCB12createThreadEPFvPvES0_S0_+0x58>
    80002030:	00000913          	li	s2,0
    80002034:	f9dff06f          	j	80001fd0 <_ZN3TCB12createThreadEPFvPvES0_S0_+0x58>

0000000080002038 <_ZN3TCB5yieldEv>:

void TCB::yield() { __asm__ volatile ("ecall"); }
    80002038:	ff010113          	addi	sp,sp,-16
    8000203c:	00813423          	sd	s0,8(sp)
    80002040:	01010413          	addi	s0,sp,16
    80002044:	00000073          	ecall
    80002048:	00813403          	ld	s0,8(sp)
    8000204c:	01010113          	addi	sp,sp,16
    80002050:	00008067          	ret

0000000080002054 <_ZN3TCB13threadWrapperEPv>:
    printString("\n");

    TCB::contextSwitch(&old->context, &running->context);
}

void TCB::threadWrapper(void *arg) {
    80002054:	fe010113          	addi	sp,sp,-32
    80002058:	00113c23          	sd	ra,24(sp)
    8000205c:	00813823          	sd	s0,16(sp)
    80002060:	00913423          	sd	s1,8(sp)
    80002064:	01213023          	sd	s2,0(sp)
    80002068:	02010413          	addi	s0,sp,32
    8000206c:	00050493          	mv	s1,a0
inline void Riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
}

inline void Riscv::mc_sstatus(uint64 mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80002070:	10000793          	li	a5,256
    80002074:	1007b073          	csrc	sstatus,a5
    // Mozda ovde treba ubaciti run, vrv ne
    // Ovo clear-uje SPP registar (SPP = 0 -> korisnicki rezim)
    Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
    Riscv::popSppSpie();
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	530080e7          	jalr	1328(ra) # 800025a8 <_ZN5Riscv10popSppSpieEv>
    running->body(arg);
    80002080:	00005917          	auipc	s2,0x5
    80002084:	12090913          	addi	s2,s2,288 # 800071a0 <_ZN3TCB7runningE>
    80002088:	00093783          	ld	a5,0(s2)
    8000208c:	0087b783          	ld	a5,8(a5)
    80002090:	00048513          	mv	a0,s1
    80002094:	000780e7          	jalr	a5
    running->setFinished(true);
    80002098:	00093783          	ld	a5,0(s2)
    void setFinished(bool value) { finished = value; }
    8000209c:	00100713          	li	a4,1
    800020a0:	02e78823          	sb	a4,48(a5)
    TCB::yield();
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	f94080e7          	jalr	-108(ra) # 80002038 <_ZN3TCB5yieldEv>
}
    800020ac:	01813083          	ld	ra,24(sp)
    800020b0:	01013403          	ld	s0,16(sp)
    800020b4:	00813483          	ld	s1,8(sp)
    800020b8:	00013903          	ld	s2,0(sp)
    800020bc:	02010113          	addi	sp,sp,32
    800020c0:	00008067          	ret

00000000800020c4 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    800020c4:	fe010113          	addi	sp,sp,-32
    800020c8:	00113c23          	sd	ra,24(sp)
    800020cc:	00813823          	sd	s0,16(sp)
    800020d0:	00913423          	sd	s1,8(sp)
    800020d4:	01213023          	sd	s2,0(sp)
    800020d8:	02010413          	addi	s0,sp,32
    TCB *old = running;
    800020dc:	00005497          	auipc	s1,0x5
    800020e0:	0c44b483          	ld	s1,196(s1) # 800071a0 <_ZN3TCB7runningE>
    bool isFinished() const { return finished; }
    800020e4:	0304c783          	lbu	a5,48(s1)
    if (!old->isFinished() && !old->isSuspended()) { Scheduler::put(old); }
    800020e8:	00079663          	bnez	a5,800020f4 <_ZN3TCB8dispatchEv+0x30>
    bool isSuspended() const { return suspended; }
    800020ec:	0314c703          	lbu	a4,49(s1)
    800020f0:	0a070663          	beqz	a4,8000219c <_ZN3TCB8dispatchEv+0xd8>
    else if(old->isFinished()) {
    800020f4:	02078a63          	beqz	a5,80002128 <_ZN3TCB8dispatchEv+0x64>
        delete old;
    800020f8:	02048863          	beqz	s1,80002128 <_ZN3TCB8dispatchEv+0x64>
    ~TCB() { delete[] stack;
    800020fc:	0104b503          	ld	a0,16(s1)
    80002100:	00050663          	beqz	a0,8000210c <_ZN3TCB8dispatchEv+0x48>
    80002104:	00000097          	auipc	ra,0x0
    80002108:	d74080e7          	jalr	-652(ra) # 80001e78 <_ZdaPv>
        printString("\nDestructor is executed\n");
    8000210c:	00004517          	auipc	a0,0x4
    80002110:	06450513          	addi	a0,a0,100 # 80006170 <CONSOLE_STATUS+0x160>
    80002114:	fffff097          	auipc	ra,0xfffff
    80002118:	2c8080e7          	jalr	712(ra) # 800013dc <_Z11printStringPKc>
    8000211c:	00048513          	mv	a0,s1
    80002120:	00000097          	auipc	ra,0x0
    80002124:	d30080e7          	jalr	-720(ra) # 80001e50 <_ZdlPv>
    running = Scheduler::get();
    80002128:	00001097          	auipc	ra,0x1
    8000212c:	cc8080e7          	jalr	-824(ra) # 80002df0 <_ZN9Scheduler3getEv>
    80002130:	00005917          	auipc	s2,0x5
    80002134:	07090913          	addi	s2,s2,112 # 800071a0 <_ZN3TCB7runningE>
    80002138:	00a93023          	sd	a0,0(s2)
    printString("isFinished(): ");
    8000213c:	00004517          	auipc	a0,0x4
    80002140:	05450513          	addi	a0,a0,84 # 80006190 <CONSOLE_STATUS+0x180>
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	298080e7          	jalr	664(ra) # 800013dc <_Z11printStringPKc>
    printInt((uint64)old->isFinished(), 10, 0);
    8000214c:	00000613          	li	a2,0
    80002150:	00a00593          	li	a1,10
    80002154:	0304c503          	lbu	a0,48(s1)
    80002158:	fffff097          	auipc	ra,0xfffff
    8000215c:	41c080e7          	jalr	1052(ra) # 80001574 <_Z8printIntiii>
    printString("\n");
    80002160:	00004517          	auipc	a0,0x4
    80002164:	3f050513          	addi	a0,a0,1008 # 80006550 <CONSOLE_STATUS+0x540>
    80002168:	fffff097          	auipc	ra,0xfffff
    8000216c:	274080e7          	jalr	628(ra) # 800013dc <_Z11printStringPKc>
    TCB::contextSwitch(&old->context, &running->context);
    80002170:	00093583          	ld	a1,0(s2)
    80002174:	01858593          	addi	a1,a1,24
    80002178:	01848513          	addi	a0,s1,24
    8000217c:	fffff097          	auipc	ra,0xfffff
    80002180:	fb4080e7          	jalr	-76(ra) # 80001130 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80002184:	01813083          	ld	ra,24(sp)
    80002188:	01013403          	ld	s0,16(sp)
    8000218c:	00813483          	ld	s1,8(sp)
    80002190:	00013903          	ld	s2,0(sp)
    80002194:	02010113          	addi	sp,sp,32
    80002198:	00008067          	ret
    if (!old->isFinished() && !old->isSuspended()) { Scheduler::put(old); }
    8000219c:	00048513          	mv	a0,s1
    800021a0:	00001097          	auipc	ra,0x1
    800021a4:	cb8080e7          	jalr	-840(ra) # 80002e58 <_ZN9Scheduler3putEP3TCB>
    800021a8:	f81ff06f          	j	80002128 <_ZN3TCB8dispatchEv+0x64>

00000000800021ac <_ZN15MemoryAllocator5splitEPNS_8metaDataEm>:
        return result;
    }

}

void MemoryAllocator::split(struct metaData *fitting_slot,size_t size){
    800021ac:	ff010113          	addi	sp,sp,-16
    800021b0:	00813423          	sd	s0,8(sp)
    800021b4:	01010413          	addi	s0,sp,16

    struct metaData *newBlock = (struct metaData*)((char *)fitting_slot + size + sizeof(struct metaData));
    800021b8:	01860793          	addi	a5,a2,24 # 8018 <_entry-0x7fff7fe8>
    800021bc:	00f587b3          	add	a5,a1,a5
    newBlock->size = (fitting_slot->size)-size-sizeof(struct metaData);
    800021c0:	0005b703          	ld	a4,0(a1)
    800021c4:	40c70733          	sub	a4,a4,a2
    800021c8:	fe870713          	addi	a4,a4,-24
    800021cc:	00e7b023          	sd	a4,0(a5)
    newBlock->free = 1;
    800021d0:	00100713          	li	a4,1
    800021d4:	00e7a423          	sw	a4,8(a5)
    newBlock->next=fitting_slot->next;
    800021d8:	0105b703          	ld	a4,16(a1)
    800021dc:	00e7b823          	sd	a4,16(a5)
    fitting_slot->size = size;
    800021e0:	00c5b023          	sd	a2,0(a1)
    fitting_slot->free = 0;
    800021e4:	0005a423          	sw	zero,8(a1)
    fitting_slot->next = newBlock;
    800021e8:	00f5b823          	sd	a5,16(a1)
}
    800021ec:	00813403          	ld	s0,8(sp)
    800021f0:	01010113          	addi	sp,sp,16
    800021f4:	00008067          	ret

00000000800021f8 <_ZN15MemoryAllocator8myMallocEm>:
void* MemoryAllocator::myMalloc(size_t noOfBlocks){
    800021f8:	fe010113          	addi	sp,sp,-32
    800021fc:	00113c23          	sd	ra,24(sp)
    80002200:	00813823          	sd	s0,16(sp)
    80002204:	00913423          	sd	s1,8(sp)
    80002208:	02010413          	addi	s0,sp,32

class MemoryAllocator {
private:

    int countSizeBytes(int blockNum){
        return blockNum * MEM_BLOCK_SIZE;
    8000220c:	0065959b          	slliw	a1,a1,0x6
    curr = freeList;
    80002210:	00053483          	ld	s1,0(a0)
    80002214:	0100006f          	j	80002224 <_ZN15MemoryAllocator8myMallocEm+0x2c>
    while( ( ( (curr->size) < noOfBytes) || ( (curr->free) == 0) ) && (curr->next != 0) ){
    80002218:	0104b783          	ld	a5,16(s1)
    8000221c:	00078e63          	beqz	a5,80002238 <_ZN15MemoryAllocator8myMallocEm+0x40>
        curr=curr->next;
    80002220:	00078493          	mv	s1,a5
    while( ( ( (curr->size) < noOfBytes) || ( (curr->free) == 0) ) && (curr->next != 0) ){
    80002224:	0004b703          	ld	a4,0(s1)
    80002228:	00058613          	mv	a2,a1
    8000222c:	feb766e3          	bltu	a4,a1,80002218 <_ZN15MemoryAllocator8myMallocEm+0x20>
    80002230:	0084a783          	lw	a5,8(s1)
    80002234:	fe0782e3          	beqz	a5,80002218 <_ZN15MemoryAllocator8myMallocEm+0x20>
    if((curr->size)==noOfBytes && curr->free){
    80002238:	02c70c63          	beq	a4,a2,80002270 <_ZN15MemoryAllocator8myMallocEm+0x78>
    else if((curr->size)>(noOfBytes+sizeof(struct metaData)) && curr->free){
    8000223c:	01860793          	addi	a5,a2,24
    80002240:	04e7f263          	bgeu	a5,a4,80002284 <_ZN15MemoryAllocator8myMallocEm+0x8c>
    80002244:	0084a783          	lw	a5,8(s1)
    80002248:	04078263          	beqz	a5,8000228c <_ZN15MemoryAllocator8myMallocEm+0x94>
        split(curr,noOfBytes);
    8000224c:	00048593          	mv	a1,s1
    80002250:	00000097          	auipc	ra,0x0
    80002254:	f5c080e7          	jalr	-164(ra) # 800021ac <_ZN15MemoryAllocator5splitEPNS_8metaDataEm>
        result=(void*)(++curr);
    80002258:	01848513          	addi	a0,s1,24
}
    8000225c:	01813083          	ld	ra,24(sp)
    80002260:	01013403          	ld	s0,16(sp)
    80002264:	00813483          	ld	s1,8(sp)
    80002268:	02010113          	addi	sp,sp,32
    8000226c:	00008067          	ret
    if((curr->size)==noOfBytes && curr->free){
    80002270:	0084a783          	lw	a5,8(s1)
    80002274:	fc0784e3          	beqz	a5,8000223c <_ZN15MemoryAllocator8myMallocEm+0x44>
        curr->free=0;
    80002278:	0004a423          	sw	zero,8(s1)
        result=(void*)(++curr);
    8000227c:	01848513          	addi	a0,s1,24
        return result;
    80002280:	fddff06f          	j	8000225c <_ZN15MemoryAllocator8myMallocEm+0x64>
        return result;
    80002284:	00000513          	li	a0,0
    80002288:	fd5ff06f          	j	8000225c <_ZN15MemoryAllocator8myMallocEm+0x64>
    8000228c:	00000513          	li	a0,0
    80002290:	fcdff06f          	j	8000225c <_ZN15MemoryAllocator8myMallocEm+0x64>

0000000080002294 <_ZN15MemoryAllocator5mergeEv>:
       // printString("\nAdresa nije u validnom opsegu");
        return -1;
    }
}

void MemoryAllocator::merge() {
    80002294:	ff010113          	addi	sp,sp,-16
    80002298:	00813423          	sd	s0,8(sp)
    8000229c:	01010413          	addi	s0,sp,16
    struct metaData* temp = freeList;
    800022a0:	00053783          	ld	a5,0(a0)
    800022a4:	0080006f          	j	800022ac <_ZN15MemoryAllocator5mergeEv+0x18>
    while(temp && temp->next) {
        if(temp->free && temp->next->free){
            temp->size = temp->size + sizeof(struct metaData) + temp->next->size;
            temp->next = temp->next->next; // prevezani
        }
        temp = temp->next;
    800022a8:	0107b783          	ld	a5,16(a5)
    while(temp && temp->next) {
    800022ac:	02078e63          	beqz	a5,800022e8 <_ZN15MemoryAllocator5mergeEv+0x54>
    800022b0:	0107b703          	ld	a4,16(a5)
    800022b4:	02070a63          	beqz	a4,800022e8 <_ZN15MemoryAllocator5mergeEv+0x54>
        if(temp->free && temp->next->free){
    800022b8:	0087a683          	lw	a3,8(a5)
    800022bc:	fe0686e3          	beqz	a3,800022a8 <_ZN15MemoryAllocator5mergeEv+0x14>
    800022c0:	00872683          	lw	a3,8(a4)
    800022c4:	fe0682e3          	beqz	a3,800022a8 <_ZN15MemoryAllocator5mergeEv+0x14>
            temp->size = temp->size + sizeof(struct metaData) + temp->next->size;
    800022c8:	0007b683          	ld	a3,0(a5)
    800022cc:	00073603          	ld	a2,0(a4)
    800022d0:	00c686b3          	add	a3,a3,a2
    800022d4:	01868693          	addi	a3,a3,24
    800022d8:	00d7b023          	sd	a3,0(a5)
            temp->next = temp->next->next; // prevezani
    800022dc:	01073703          	ld	a4,16(a4)
    800022e0:	00e7b823          	sd	a4,16(a5)
    800022e4:	fc5ff06f          	j	800022a8 <_ZN15MemoryAllocator5mergeEv+0x14>
    }
    800022e8:	00813403          	ld	s0,8(sp)
    800022ec:	01010113          	addi	sp,sp,16
    800022f0:	00008067          	ret

00000000800022f4 <_ZN15MemoryAllocator6myFreeEPv>:
    if((char*)ptr >= (char*)HEAP_START_ADDR && ptr < (char*)HEAP_END_ADDR){
    800022f4:	00005797          	auipc	a5,0x5
    800022f8:	e0c7b783          	ld	a5,-500(a5) # 80007100 <_GLOBAL_OFFSET_TABLE_+0x8>
    800022fc:	0007b783          	ld	a5,0(a5)
    80002300:	04f5e463          	bltu	a1,a5,80002348 <_ZN15MemoryAllocator6myFreeEPv+0x54>
    80002304:	00005797          	auipc	a5,0x5
    80002308:	e247b783          	ld	a5,-476(a5) # 80007128 <_GLOBAL_OFFSET_TABLE_+0x30>
    8000230c:	0007b783          	ld	a5,0(a5)
    80002310:	04f5f063          	bgeu	a1,a5,80002350 <_ZN15MemoryAllocator6myFreeEPv+0x5c>
int MemoryAllocator::myFree(void *ptr) {
    80002314:	ff010113          	addi	sp,sp,-16
    80002318:	00113423          	sd	ra,8(sp)
    8000231c:	00813023          	sd	s0,0(sp)
    80002320:	01010413          	addi	s0,sp,16
        curr->free = 1;
    80002324:	00100793          	li	a5,1
    80002328:	fef5a823          	sw	a5,-16(a1)
        merge();
    8000232c:	00000097          	auipc	ra,0x0
    80002330:	f68080e7          	jalr	-152(ra) # 80002294 <_ZN15MemoryAllocator5mergeEv>
        return 0;
    80002334:	00000513          	li	a0,0
}
    80002338:	00813083          	ld	ra,8(sp)
    8000233c:	00013403          	ld	s0,0(sp)
    80002340:	01010113          	addi	sp,sp,16
    80002344:	00008067          	ret
        return -1;
    80002348:	fff00513          	li	a0,-1
    8000234c:	00008067          	ret
    80002350:	fff00513          	li	a0,-1
}
    80002354:	00008067          	ret

0000000080002358 <_ZN6Thread7starterEPv>:

Thread::Thread() : myHandle(0) {}

void Thread::starter(void* toStart) {
    Thread* t = (Thread*)toStart;
    if(t) t->run();
    80002358:	02050863          	beqz	a0,80002388 <_ZN6Thread7starterEPv+0x30>
void Thread::starter(void* toStart) {
    8000235c:	ff010113          	addi	sp,sp,-16
    80002360:	00113423          	sd	ra,8(sp)
    80002364:	00813023          	sd	s0,0(sp)
    80002368:	01010413          	addi	s0,sp,16
    if(t) t->run();
    8000236c:	00053783          	ld	a5,0(a0)
    80002370:	0107b783          	ld	a5,16(a5)
    80002374:	000780e7          	jalr	a5
    80002378:	00813083          	ld	ra,8(sp)
    8000237c:	00013403          	ld	s0,0(sp)
    80002380:	01010113          	addi	sp,sp,16
    80002384:	00008067          	ret
    80002388:	00008067          	ret

000000008000238c <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    8000238c:	fe010113          	addi	sp,sp,-32
    80002390:	00113c23          	sd	ra,24(sp)
    80002394:	00813823          	sd	s0,16(sp)
    80002398:	00913423          	sd	s1,8(sp)
    8000239c:	02010413          	addi	s0,sp,32
    800023a0:	00005797          	auipc	a5,0x5
    800023a4:	d4078793          	addi	a5,a5,-704 # 800070e0 <_ZTV6Thread+0x10>
    800023a8:	00f53023          	sd	a5,0(a0)
    delete myHandle;
    800023ac:	00853483          	ld	s1,8(a0)
    800023b0:	02048863          	beqz	s1,800023e0 <_ZN6ThreadD1Ev+0x54>
    ~TCB() { delete[] stack;
    800023b4:	0104b503          	ld	a0,16(s1)
    800023b8:	00050663          	beqz	a0,800023c4 <_ZN6ThreadD1Ev+0x38>
    800023bc:	00000097          	auipc	ra,0x0
    800023c0:	abc080e7          	jalr	-1348(ra) # 80001e78 <_ZdaPv>
        printString("\nDestructor is executed\n");
    800023c4:	00004517          	auipc	a0,0x4
    800023c8:	dac50513          	addi	a0,a0,-596 # 80006170 <CONSOLE_STATUS+0x160>
    800023cc:	fffff097          	auipc	ra,0xfffff
    800023d0:	010080e7          	jalr	16(ra) # 800013dc <_Z11printStringPKc>
    800023d4:	00048513          	mv	a0,s1
    800023d8:	00000097          	auipc	ra,0x0
    800023dc:	a78080e7          	jalr	-1416(ra) # 80001e50 <_ZdlPv>
}
    800023e0:	01813083          	ld	ra,24(sp)
    800023e4:	01013403          	ld	s0,16(sp)
    800023e8:	00813483          	ld	s1,8(sp)
    800023ec:	02010113          	addi	sp,sp,32
    800023f0:	00008067          	ret

00000000800023f4 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800023f4:	fe010113          	addi	sp,sp,-32
    800023f8:	00113c23          	sd	ra,24(sp)
    800023fc:	00813823          	sd	s0,16(sp)
    80002400:	00913423          	sd	s1,8(sp)
    80002404:	02010413          	addi	s0,sp,32
    80002408:	00050493          	mv	s1,a0
}
    8000240c:	00000097          	auipc	ra,0x0
    80002410:	f80080e7          	jalr	-128(ra) # 8000238c <_ZN6ThreadD1Ev>
    80002414:	00048513          	mv	a0,s1
    80002418:	00000097          	auipc	ra,0x0
    8000241c:	a38080e7          	jalr	-1480(ra) # 80001e50 <_ZdlPv>
    80002420:	01813083          	ld	ra,24(sp)
    80002424:	01013403          	ld	s0,16(sp)
    80002428:	00813483          	ld	s1,8(sp)
    8000242c:	02010113          	addi	sp,sp,32
    80002430:	00008067          	ret

0000000080002434 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002434:	fc010113          	addi	sp,sp,-64
    80002438:	02113c23          	sd	ra,56(sp)
    8000243c:	02813823          	sd	s0,48(sp)
    80002440:	02913423          	sd	s1,40(sp)
    80002444:	03213023          	sd	s2,32(sp)
    80002448:	01313c23          	sd	s3,24(sp)
    8000244c:	01413823          	sd	s4,16(sp)
    80002450:	04010413          	addi	s0,sp,64
    80002454:	00050913          	mv	s2,a0
    80002458:	00058993          	mv	s3,a1
    8000245c:	00060a13          	mv	s4,a2
    80002460:	00005797          	auipc	a5,0x5
    80002464:	c8078793          	addi	a5,a5,-896 # 800070e0 <_ZTV6Thread+0x10>
    80002468:	00f53023          	sd	a5,0(a0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    8000246c:	100027f3          	csrr	a5,sstatus
    80002470:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002474:	fc843483          	ld	s1,-56(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r" (mask));
    80002478:	00200793          	li	a5,2
    8000247c:	1007b073          	csrc	sstatus,a5
    void *stack_space = __mem_alloc(sizeof(uint64) * DEFAULT_STACK_SIZE);
    80002480:	00008537          	lui	a0,0x8
    80002484:	00003097          	auipc	ra,0x3
    80002488:	c04080e7          	jalr	-1020(ra) # 80005088 <__mem_alloc>
    8000248c:	00050613          	mv	a2,a0
    myHandle = TCB::createTCB(body, arg, stack_space);
    80002490:	000a0593          	mv	a1,s4
    80002494:	00098513          	mv	a0,s3
    80002498:	00000097          	auipc	ra,0x0
    8000249c:	a08080e7          	jalr	-1528(ra) # 80001ea0 <_ZN3TCB9createTCBEPFvPvES0_S0_>
    800024a0:	00a93423          	sd	a0,8(s2)
    UMASK_INTR
    800024a4:	0004849b          	sext.w	s1,s1
    800024a8:	0024f493          	andi	s1,s1,2
    800024ac:	0004849b          	sext.w	s1,s1
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r" (mask));
    800024b0:	1004a073          	csrs	sstatus,s1
}
    800024b4:	03813083          	ld	ra,56(sp)
    800024b8:	03013403          	ld	s0,48(sp)
    800024bc:	02813483          	ld	s1,40(sp)
    800024c0:	02013903          	ld	s2,32(sp)
    800024c4:	01813983          	ld	s3,24(sp)
    800024c8:	01013a03          	ld	s4,16(sp)
    800024cc:	04010113          	addi	sp,sp,64
    800024d0:	00008067          	ret

00000000800024d4 <_ZN6Thread5startEv>:
int Thread::start() {
    800024d4:	ff010113          	addi	sp,sp,-16
    800024d8:	00113423          	sd	ra,8(sp)
    800024dc:	00813023          	sd	s0,0(sp)
    800024e0:	01010413          	addi	s0,sp,16
    800024e4:	00050613          	mv	a2,a0
        if(myHandle == 0){
    800024e8:	00853503          	ld	a0,8(a0) # 8008 <_entry-0x7fff7ff8>
    800024ec:	02050063          	beqz	a0,8000250c <_ZN6Thread5startEv+0x38>
            putThread(myHandle);
    800024f0:	fffff097          	auipc	ra,0xfffff
    800024f4:	e10080e7          	jalr	-496(ra) # 80001300 <_Z9putThreadP3TCB>
}
    800024f8:	00000513          	li	a0,0
    800024fc:	00813083          	ld	ra,8(sp)
    80002500:	00013403          	ld	s0,0(sp)
    80002504:	01010113          	addi	sp,sp,16
    80002508:	00008067          	ret
            thread_create(&myHandle, &starter, this);
    8000250c:	00000597          	auipc	a1,0x0
    80002510:	e4c58593          	addi	a1,a1,-436 # 80002358 <_ZN6Thread7starterEPv>
    80002514:	00860513          	addi	a0,a2,8
    80002518:	fffff097          	auipc	ra,0xfffff
    8000251c:	cf4080e7          	jalr	-780(ra) # 8000120c <_Z13thread_createPP3TCBPFvPvES2_>
    80002520:	fd9ff06f          	j	800024f8 <_ZN6Thread5startEv+0x24>

0000000080002524 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002524:	ff010113          	addi	sp,sp,-16
    80002528:	00113423          	sd	ra,8(sp)
    8000252c:	00813023          	sd	s0,0(sp)
    80002530:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002534:	fffff097          	auipc	ra,0xfffff
    80002538:	da8080e7          	jalr	-600(ra) # 800012dc <_Z15thread_dispatchv>
}
    8000253c:	00813083          	ld	ra,8(sp)
    80002540:	00013403          	ld	s0,0(sp)
    80002544:	01010113          	addi	sp,sp,16
    80002548:	00008067          	ret

000000008000254c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    8000254c:	ff010113          	addi	sp,sp,-16
    80002550:	00813423          	sd	s0,8(sp)
    80002554:	01010413          	addi	s0,sp,16
}
    80002558:	00000513          	li	a0,0
    8000255c:	00813403          	ld	s0,8(sp)
    80002560:	01010113          	addi	sp,sp,16
    80002564:	00008067          	ret

0000000080002568 <_ZN6ThreadC1Ev>:
Thread::Thread() : myHandle(0) {}
    80002568:	ff010113          	addi	sp,sp,-16
    8000256c:	00813423          	sd	s0,8(sp)
    80002570:	01010413          	addi	s0,sp,16
    80002574:	00005797          	auipc	a5,0x5
    80002578:	b6c78793          	addi	a5,a5,-1172 # 800070e0 <_ZTV6Thread+0x10>
    8000257c:	00f53023          	sd	a5,0(a0)
    80002580:	00053423          	sd	zero,8(a0)
    80002584:	00813403          	ld	s0,8(sp)
    80002588:	01010113          	addi	sp,sp,16
    8000258c:	00008067          	ret

0000000080002590 <_ZN6Thread3runEv>:
    static int sleep (time_t);

protected:
    Thread ();

    virtual void run () {}
    80002590:	ff010113          	addi	sp,sp,-16
    80002594:	00813423          	sd	s0,8(sp)
    80002598:	01010413          	addi	s0,sp,16
    8000259c:	00813403          	ld	s0,8(sp)
    800025a0:	01010113          	addi	sp,sp,16
    800025a4:	00008067          	ret

00000000800025a8 <_ZN5Riscv10popSppSpieEv>:
#include "../h/memoryAllocator.hpp"
#include "../h/tcb.hpp"

//uint64  timerCounter = 0;

void Riscv::popSppSpie() {
    800025a8:	ff010113          	addi	sp,sp,-16
    800025ac:	00813423          	sd	s0,8(sp)
    800025b0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra"); // ne treba da se vrati u prekidnu posle dispatcha,
    800025b4:	14109073          	csrw	sepc,ra
                                        // vec odmah posle poziva ove f-je u tgreadWrapper
    __asm__ volatile ("sret"); // sret sig je popovati spp, tj upisati..
    800025b8:	10200073          	sret
}
    800025bc:	00813403          	ld	s0,8(sp)
    800025c0:	01010113          	addi	sp,sp,16
    800025c4:	00008067          	ret

00000000800025c8 <_ZN5Riscv20handleSupervisorTrapEv>:

void Riscv::handleSupervisorTrap() {
    800025c8:	f0010113          	addi	sp,sp,-256
    800025cc:	0e113c23          	sd	ra,248(sp)
    800025d0:	0e813823          	sd	s0,240(sp)
    800025d4:	0e913423          	sd	s1,232(sp)
    800025d8:	0f213023          	sd	s2,224(sp)
    800025dc:	10010413          	addi	s0,sp,256
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r" (scause));
    800025e0:	142027f3          	csrr	a5,scause
    800025e4:	f0f43023          	sd	a5,-256(s0)
    return scause;
    800025e8:	f0043703          	ld	a4,-256(s0)
    800025ec:	00005797          	auipc	a5,0x5
    800025f0:	b947c783          	lbu	a5,-1132(a5) # 80007180 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    800025f4:	04079663          	bnez	a5,80002640 <_ZN5Riscv20handleSupervisorTrapEv+0x78>
        freeList=(struct metaData*)HEAP_START_ADDR;
    800025f8:	00005797          	auipc	a5,0x5
    800025fc:	b087b783          	ld	a5,-1272(a5) # 80007100 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002600:	0007b683          	ld	a3,0(a5)
    80002604:	00005617          	auipc	a2,0x5
    80002608:	b8460613          	addi	a2,a2,-1148 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    8000260c:	00d63023          	sd	a3,0(a2)
        freeList->size = ((char *)HEAP_END_ADDR - (char *)HEAP_START_ADDR) - sizeof(struct metaData);
    80002610:	00005797          	auipc	a5,0x5
    80002614:	b187b783          	ld	a5,-1256(a5) # 80007128 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002618:	0007b783          	ld	a5,0(a5)
    8000261c:	40d787b3          	sub	a5,a5,a3
    80002620:	fe878793          	addi	a5,a5,-24
    80002624:	00f6b023          	sd	a5,0(a3)
        freeList->free = 1;
    80002628:	00063683          	ld	a3,0(a2)
    8000262c:	00100793          	li	a5,1
    80002630:	00f6a423          	sw	a5,8(a3)
        freeList->next = 0;
    80002634:	0006b823          	sd	zero,16(a3)
        static MemoryAllocator instance;
    80002638:	00005697          	auipc	a3,0x5
    8000263c:	b4f68423          	sb	a5,-1208(a3) # 80007180 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>

    uint64 code, par1, ret;
    void* ptr, *pr;
    MemoryAllocator* mem = MemoryAllocator::getInstance();

    switch (scause) {
    80002640:	fff00793          	li	a5,-1
    80002644:	03f79793          	slli	a5,a5,0x3f
    80002648:	00178793          	addi	a5,a5,1
    8000264c:	06f70463          	beq	a4,a5,800026b4 <_ZN5Riscv20handleSupervisorTrapEv+0xec>
    80002650:	fff00793          	li	a5,-1
    80002654:	03f79793          	slli	a5,a5,0x3f
    80002658:	00178793          	addi	a5,a5,1
    8000265c:	02e7ee63          	bltu	a5,a4,80002698 <_ZN5Riscv20handleSupervisorTrapEv+0xd0>
    80002660:	00800793          	li	a5,8
    80002664:	0cf70663          	beq	a4,a5,80002730 <_ZN5Riscv20handleSupervisorTrapEv+0x168>
    80002668:	00900793          	li	a5,9
    8000266c:	48f71e63          	bne	a4,a5,80002b08 <_ZN5Riscv20handleSupervisorTrapEv+0x540>

            break;

        case ECALL_SYST: // ecall iz sistemskog rezima ** ulazice se ovde zbog sys_calla i yielda
        //   __asm__ volatile ("mv %[code], a0" : [code] "=r" (code) );
           __asm__ volatile ("ld %[code], 10 * 8(fp)" : [code] "=r" (code)); // procita code iz a0 sa steka
    80002670:	05043783          	ld	a5,80(s0)

            switch (code) {
    80002674:	04200713          	li	a4,66
    80002678:	44f76a63          	bltu	a4,a5,80002acc <_ZN5Riscv20handleSupervisorTrapEv+0x504>
    8000267c:	00279793          	slli	a5,a5,0x2
    80002680:	00004717          	auipc	a4,0x4
    80002684:	ba870713          	addi	a4,a4,-1112 # 80006228 <CONSOLE_STATUS+0x218>
    80002688:	00e787b3          	add	a5,a5,a4
    8000268c:	0007a783          	lw	a5,0(a5)
    80002690:	00e787b3          	add	a5,a5,a4
    80002694:	00078067          	jr	a5
    switch (scause) {
    80002698:	fff00793          	li	a5,-1
    8000269c:	03f79793          	slli	a5,a5,0x3f
    800026a0:	00978793          	addi	a5,a5,9
    800026a4:	46f71263          	bne	a4,a5,80002b08 <_ZN5Riscv20handleSupervisorTrapEv+0x540>
            console_handler();
    800026a8:	00003097          	auipc	ra,0x3
    800026ac:	bac080e7          	jalr	-1108(ra) # 80005254 <console_handler>
            break;
    800026b0:	0300006f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
             TCB::timeSliceCounter++;
    800026b4:	00005717          	auipc	a4,0x5
    800026b8:	a5c73703          	ld	a4,-1444(a4) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    800026bc:	00073783          	ld	a5,0(a4)
    800026c0:	00178793          	addi	a5,a5,1
    800026c4:	00f73023          	sd	a5,0(a4)
            if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    800026c8:	00005717          	auipc	a4,0x5
    800026cc:	a5873703          	ld	a4,-1448(a4) # 80007120 <_GLOBAL_OFFSET_TABLE_+0x28>
    800026d0:	00073703          	ld	a4,0(a4)

    void setFinished(bool value) { finished = value; }

    void setSuspended(bool value) { suspended = value; }

    uint64 getTimeSlice() const { return timeSlice; }
    800026d4:	02873703          	ld	a4,40(a4)
    800026d8:	02e7f063          	bgeu	a5,a4,800026f8 <_ZN5Riscv20handleSupervisorTrapEv+0x130>
            __asm__ volatile ("csrc sip, 0x02"); // prekid obradjen
    800026dc:	14417073          	csrci	sip,2
            printInt(r_stval());
            break;

    }

}
    800026e0:	0f813083          	ld	ra,248(sp)
    800026e4:	0f013403          	ld	s0,240(sp)
    800026e8:	0e813483          	ld	s1,232(sp)
    800026ec:	0e013903          	ld	s2,224(sp)
    800026f0:	10010113          	addi	sp,sp,256
    800026f4:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    800026f8:	141027f3          	csrr	a5,sepc
    800026fc:	f0f43823          	sd	a5,-240(s0)
    return sepc;
    80002700:	f1043483          	ld	s1,-240(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002704:	100027f3          	csrr	a5,sstatus
    80002708:	f0f43423          	sd	a5,-248(s0)
    return sstatus;
    8000270c:	f0843903          	ld	s2,-248(s0)
                TCB::timeSliceCounter = 0; // nit krece da se izvrsava iz pocetka
    80002710:	00005797          	auipc	a5,0x5
    80002714:	a007b783          	ld	a5,-1536(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002718:	0007b023          	sd	zero,0(a5)
                TCB::dispatch();
    8000271c:	00000097          	auipc	ra,0x0
    80002720:	9a8080e7          	jalr	-1624(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002724:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002728:	14149073          	csrw	sepc,s1
}
    8000272c:	fb1ff06f          	j	800026dc <_ZN5Riscv20handleSupervisorTrapEv+0x114>
            __asm__ volatile ("ld %[code], 10 * 8(fp)" : [code] "=r" (code)); // procita code iz a0 sa steka
    80002730:	05043783          	ld	a5,80(s0)
            switch (code) {
    80002734:	04200713          	li	a4,66
    80002738:	1cf76463          	bltu	a4,a5,80002900 <_ZN5Riscv20handleSupervisorTrapEv+0x338>
    8000273c:	00279793          	slli	a5,a5,0x2
    80002740:	00004717          	auipc	a4,0x4
    80002744:	bf470713          	addi	a4,a4,-1036 # 80006334 <CONSOLE_STATUS+0x324>
    80002748:	00e787b3          	add	a5,a5,a4
    8000274c:	0007a783          	lw	a5,0(a5)
    80002750:	00e787b3          	add	a5,a5,a4
    80002754:	00078067          	jr	a5
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (par1) ); // pop a1 from stack
    80002758:	05843583          	ld	a1,88(s0)
                    ptr = (void*)mem->myMalloc(par1);
    8000275c:	00005517          	auipc	a0,0x5
    80002760:	a2c50513          	addi	a0,a0,-1492 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002764:	00000097          	auipc	ra,0x0
    80002768:	a94080e7          	jalr	-1388(ra) # 800021f8 <_ZN15MemoryAllocator8myMallocEm>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ptr) ); // store a0 on stack
    8000276c:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002770:	141027f3          	csrr	a5,sepc
    80002774:	f0f43c23          	sd	a5,-232(s0)
    return sepc;
    80002778:	f1843783          	ld	a5,-232(s0)
                    w_sepc(r_sepc() + 4UL);
    8000277c:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002780:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002784:	14417073          	csrci	sip,2
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002788:	141027f3          	csrr	a5,sepc
    8000278c:	f6f43423          	sd	a5,-152(s0)
    return sepc;
    80002790:	f6843783          	ld	a5,-152(s0)
            w_sepc(r_sepc() + 4UL);
    80002794:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002798:	14179073          	csrw	sepc,a5
            __asm__ volatile ("csrc sip, 0x02");
    8000279c:	14417073          	csrci	sip,2
            break;
    800027a0:	f41ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (pr) ); // pop a1 from stack
    800027a4:	05843583          	ld	a1,88(s0)
                    ret = mem->myFree(pr);
    800027a8:	00005517          	auipc	a0,0x5
    800027ac:	9e050513          	addi	a0,a0,-1568 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    800027b0:	00000097          	auipc	ra,0x0
    800027b4:	b44080e7          	jalr	-1212(ra) # 800022f4 <_ZN15MemoryAllocator6myFreeEPv>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    800027b8:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    800027bc:	141027f3          	csrr	a5,sepc
    800027c0:	f2f43023          	sd	a5,-224(s0)
    return sepc;
    800027c4:	f2043783          	ld	a5,-224(s0)
                    w_sepc(r_sepc() + 4UL);
    800027c8:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800027cc:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    800027d0:	14417073          	csrci	sip,2
                    break;
    800027d4:	fb5ff06f          	j	80002788 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (handle) ); // pop a1 from stack
    800027d8:	05843483          	ld	s1,88(s0)
                    __asm__ volatile ("ld %[par1], 12 * 8(fp)" : [par1] "=r" (body) ); // pop a2 from stack
    800027dc:	06043503          	ld	a0,96(s0)
                    __asm__ volatile ("ld %[par1], 13 * 8(fp)" : [par1] "=r" (arg) ); // pop a3 from stack
    800027e0:	06843583          	ld	a1,104(s0)
                    __asm__ volatile ("ld %[stack_space], 14 * 8(fp)" : [stack_space] "=r" (stack_space) ); // pop a4 from stack
    800027e4:	07043603          	ld	a2,112(s0)
                    *handle = TCB::createThread(body, arg, stack_space);
    800027e8:	fffff097          	auipc	ra,0xfffff
    800027ec:	790080e7          	jalr	1936(ra) # 80001f78 <_ZN3TCB12createThreadEPFvPvES0_S0_>
    800027f0:	00a4b023          	sd	a0,0(s1)
                    if(*handle) ret =  0;
    800027f4:	04050663          	beqz	a0,80002840 <_ZN5Riscv20handleSupervisorTrapEv+0x278>
    800027f8:	00000913          	li	s2,0
                    printString("\nhandle: ");
    800027fc:	00004517          	auipc	a0,0x4
    80002800:	9a450513          	addi	a0,a0,-1628 # 800061a0 <CONSOLE_STATUS+0x190>
    80002804:	fffff097          	auipc	ra,0xfffff
    80002808:	bd8080e7          	jalr	-1064(ra) # 800013dc <_Z11printStringPKc>
                    printInt((uint64)handle, 16, 0);
    8000280c:	00000613          	li	a2,0
    80002810:	01000593          	li	a1,16
    80002814:	0004851b          	sext.w	a0,s1
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	d5c080e7          	jalr	-676(ra) # 80001574 <_Z8printIntiii>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    80002820:	05243823          	sd	s2,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002824:	141027f3          	csrr	a5,sepc
    80002828:	f2f43423          	sd	a5,-216(s0)
    return sepc;
    8000282c:	f2843783          	ld	a5,-216(s0)
                    w_sepc(r_sepc() + 4UL);
    80002830:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002834:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002838:	14417073          	csrci	sip,2
                    break;
    8000283c:	f4dff06f          	j	80002788 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    else ret = -3;
    80002840:	ffd00913          	li	s2,-3
    80002844:	fb9ff06f          	j	800027fc <_ZN5Riscv20handleSupervisorTrapEv+0x234>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002848:	141027f3          	csrr	a5,sepc
    8000284c:	f2f43c23          	sd	a5,-200(s0)
    return sepc;
    80002850:	f3843483          	ld	s1,-200(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus(); // ovo ne treba?
    80002854:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002858:	100027f3          	csrr	a5,sstatus
    8000285c:	f2f43823          	sd	a5,-208(s0)
    return sstatus;
    80002860:	f3043903          	ld	s2,-208(s0)
                    TCB::timeSliceCounter = 0;
    80002864:	00005797          	auipc	a5,0x5
    80002868:	8ac7b783          	ld	a5,-1876(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000286c:	0007b023          	sd	zero,0(a5)
                    TCB::running->setFinished(true);
    80002870:	00005797          	auipc	a5,0x5
    80002874:	8b07b783          	ld	a5,-1872(a5) # 80007120 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002878:	0007b783          	ld	a5,0(a5)
    void setFinished(bool value) { finished = value; }
    8000287c:	00100713          	li	a4,1
    80002880:	02e78823          	sb	a4,48(a5)
                    TCB::dispatch();
    80002884:	00000097          	auipc	ra,0x0
    80002888:	840080e7          	jalr	-1984(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    8000288c:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002890:	14149073          	csrw	sepc,s1
}
    80002894:	ef5ff06f          	j	80002788 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002898:	141027f3          	csrr	a5,sepc
    8000289c:	f4f43423          	sd	a5,-184(s0)
    return sepc;
    800028a0:	f4843483          	ld	s1,-184(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus();
    800028a4:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    800028a8:	100027f3          	csrr	a5,sstatus
    800028ac:	f4f43023          	sd	a5,-192(s0)
    return sstatus;
    800028b0:	f4043903          	ld	s2,-192(s0)
                    TCB::timeSliceCounter = 0;
    800028b4:	00005797          	auipc	a5,0x5
    800028b8:	85c7b783          	ld	a5,-1956(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    800028bc:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    800028c0:	00000097          	auipc	ra,0x0
    800028c4:	804080e7          	jalr	-2044(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    800028c8:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800028cc:	14149073          	csrw	sepc,s1
}
    800028d0:	eb9ff06f          	j	80002788 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (tcb) ); // pop a1 from stack
    800028d4:	05843503          	ld	a0,88(s0)
                    tcb->putTCBinQueue(tcb);
    800028d8:	00050593          	mv	a1,a0
    800028dc:	fffff097          	auipc	ra,0xfffff
    800028e0:	664080e7          	jalr	1636(ra) # 80001f40 <_ZN3TCB13putTCBinQueueEPS_>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    800028e4:	141027f3          	csrr	a5,sepc
    800028e8:	f4f43823          	sd	a5,-176(s0)
    return sepc;
    800028ec:	f5043783          	ld	a5,-176(s0)
                    w_sepc(r_sepc() + 4UL);
    800028f0:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    800028f4:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    800028f8:	14417073          	csrci	sip,2
                    break;
    800028fc:	e8dff06f          	j	80002788 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002900:	141027f3          	csrr	a5,sepc
    80002904:	f6f43023          	sd	a5,-160(s0)
    return sepc;
    80002908:	f6043483          	ld	s1,-160(s0)
                    uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    8000290c:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002910:	100027f3          	csrr	a5,sstatus
    80002914:	f4f43c23          	sd	a5,-168(s0)
    return sstatus;
    80002918:	f5843903          	ld	s2,-168(s0)
                    TCB::timeSliceCounter = 0;
    8000291c:	00004797          	auipc	a5,0x4
    80002920:	7f47b783          	ld	a5,2036(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002924:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    80002928:	fffff097          	auipc	ra,0xfffff
    8000292c:	79c080e7          	jalr	1948(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002930:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002934:	14149073          	csrw	sepc,s1
}
    80002938:	e51ff06f          	j	80002788 <_ZN5Riscv20handleSupervisorTrapEv+0x1c0>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (par1) ); // pop a1 from stack
    8000293c:	05843583          	ld	a1,88(s0)
                    ptr = (void*)mem->myMalloc(par1);
    80002940:	00005517          	auipc	a0,0x5
    80002944:	84850513          	addi	a0,a0,-1976 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002948:	00000097          	auipc	ra,0x0
    8000294c:	8b0080e7          	jalr	-1872(ra) # 800021f8 <_ZN15MemoryAllocator8myMallocEm>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ptr) ); // store a0 on stack
    80002950:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002954:	141027f3          	csrr	a5,sepc
    80002958:	f6f43823          	sd	a5,-144(s0)
    return sepc;
    8000295c:	f7043783          	ld	a5,-144(s0)
                    w_sepc(r_sepc() + 4UL);
    80002960:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002964:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002968:	14417073          	csrci	sip,2
                    break;
    8000296c:	d75ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (pr) ); // pop a1 from stack
    80002970:	05843583          	ld	a1,88(s0)
                    ret = mem->myFree(pr);
    80002974:	00005517          	auipc	a0,0x5
    80002978:	81450513          	addi	a0,a0,-2028 # 80007188 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    8000297c:	00000097          	auipc	ra,0x0
    80002980:	978080e7          	jalr	-1672(ra) # 800022f4 <_ZN15MemoryAllocator6myFreeEPv>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    80002984:	04a43823          	sd	a0,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002988:	141027f3          	csrr	a5,sepc
    8000298c:	f6f43c23          	sd	a5,-136(s0)
    return sepc;
    80002990:	f7843783          	ld	a5,-136(s0)
                    w_sepc(r_sepc() + 4UL);
    80002994:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002998:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    8000299c:	14417073          	csrci	sip,2
                    break;
    800029a0:	d41ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (handle) ); // pop a1 from stack
    800029a4:	05843483          	ld	s1,88(s0)
                    __asm__ volatile ("ld %[par1], 12 * 8(fp)" : [par1] "=r" (body) ); // pop a2 from stack
    800029a8:	06043503          	ld	a0,96(s0)
                    __asm__ volatile ("ld %[par1], 13 * 8(fp)" : [par1] "=r" (arg) ); // pop a3 from stack
    800029ac:	06843583          	ld	a1,104(s0)
                    __asm__ volatile ("ld %[stack_space], 14 * 8(fp)" : [stack_space] "=r" (stack_space) ); // pop a4 from stack
    800029b0:	07043603          	ld	a2,112(s0)
                    *handle = TCB::createThread(body, arg, stack_space);
    800029b4:	fffff097          	auipc	ra,0xfffff
    800029b8:	5c4080e7          	jalr	1476(ra) # 80001f78 <_ZN3TCB12createThreadEPFvPvES0_S0_>
    800029bc:	00a4b023          	sd	a0,0(s1)
                    if(*handle) ret =  0;
    800029c0:	04050663          	beqz	a0,80002a0c <_ZN5Riscv20handleSupervisorTrapEv+0x444>
    800029c4:	00000913          	li	s2,0
                    printString("\nhandle: ");
    800029c8:	00003517          	auipc	a0,0x3
    800029cc:	7d850513          	addi	a0,a0,2008 # 800061a0 <CONSOLE_STATUS+0x190>
    800029d0:	fffff097          	auipc	ra,0xfffff
    800029d4:	a0c080e7          	jalr	-1524(ra) # 800013dc <_Z11printStringPKc>
                    printInt((uint64)handle, 16, 0);
    800029d8:	00000613          	li	a2,0
    800029dc:	01000593          	li	a1,16
    800029e0:	0004851b          	sext.w	a0,s1
    800029e4:	fffff097          	auipc	ra,0xfffff
    800029e8:	b90080e7          	jalr	-1136(ra) # 80001574 <_Z8printIntiii>
                    __asm__ volatile ("sd %[xx], 10*8(fp)" : : [xx] "r" (ret) ); // store a0 on stack
    800029ec:	05243823          	sd	s2,80(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    800029f0:	141027f3          	csrr	a5,sepc
    800029f4:	f8f43023          	sd	a5,-128(s0)
    return sepc;
    800029f8:	f8043783          	ld	a5,-128(s0)
                    w_sepc(r_sepc() + 4UL);
    800029fc:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002a00:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002a04:	14417073          	csrci	sip,2
                    break;
    80002a08:	cd9ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    else ret = -3;
    80002a0c:	ffd00913          	li	s2,-3
    80002a10:	fb9ff06f          	j	800029c8 <_ZN5Riscv20handleSupervisorTrapEv+0x400>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002a14:	141027f3          	csrr	a5,sepc
    80002a18:	f8f43823          	sd	a5,-112(s0)
    return sepc;
    80002a1c:	f9043483          	ld	s1,-112(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus(); // ovo ne treba?
    80002a20:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002a24:	100027f3          	csrr	a5,sstatus
    80002a28:	f8f43423          	sd	a5,-120(s0)
    return sstatus;
    80002a2c:	f8843903          	ld	s2,-120(s0)
                    TCB::timeSliceCounter = 0;
    80002a30:	00004797          	auipc	a5,0x4
    80002a34:	6e07b783          	ld	a5,1760(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002a38:	0007b023          	sd	zero,0(a5)
                    TCB::running->setFinished(true);
    80002a3c:	00004797          	auipc	a5,0x4
    80002a40:	6e47b783          	ld	a5,1764(a5) # 80007120 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002a44:	0007b783          	ld	a5,0(a5)
    80002a48:	00100713          	li	a4,1
    80002a4c:	02e78823          	sb	a4,48(a5)
                    TCB::dispatch();
    80002a50:	fffff097          	auipc	ra,0xfffff
    80002a54:	674080e7          	jalr	1652(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002a58:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002a5c:	14149073          	csrw	sepc,s1
}
    80002a60:	c81ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002a64:	141027f3          	csrr	a5,sepc
    80002a68:	faf43023          	sd	a5,-96(s0)
    return sepc;
    80002a6c:	fa043483          	ld	s1,-96(s0)
                    sepc = r_sepc() + 4; sstatus = r_sstatus();
    80002a70:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002a74:	100027f3          	csrr	a5,sstatus
    80002a78:	f8f43c23          	sd	a5,-104(s0)
    return sstatus;
    80002a7c:	f9843903          	ld	s2,-104(s0)
                    TCB::timeSliceCounter = 0;
    80002a80:	00004797          	auipc	a5,0x4
    80002a84:	6907b783          	ld	a5,1680(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002a88:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    80002a8c:	fffff097          	auipc	ra,0xfffff
    80002a90:	638080e7          	jalr	1592(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002a94:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002a98:	14149073          	csrw	sepc,s1
}
    80002a9c:	c45ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
                    __asm__ volatile ("ld %[par1], 11 * 8(fp)" : [par1] "=r" (tcb) ); // pop a1 from stack
    80002aa0:	05843503          	ld	a0,88(s0)
                    tcb->putTCBinQueue(tcb);
    80002aa4:	00050593          	mv	a1,a0
    80002aa8:	fffff097          	auipc	ra,0xfffff
    80002aac:	498080e7          	jalr	1176(ra) # 80001f40 <_ZN3TCB13putTCBinQueueEPS_>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002ab0:	141027f3          	csrr	a5,sepc
    80002ab4:	faf43423          	sd	a5,-88(s0)
    return sepc;
    80002ab8:	fa843783          	ld	a5,-88(s0)
                    w_sepc(r_sepc() + 4UL);
    80002abc:	00478793          	addi	a5,a5,4
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002ac0:	14179073          	csrw	sepc,a5
                    __asm__ volatile ("csrc sip, 0x02");
    80002ac4:	14417073          	csrci	sip,2
                    break;
    80002ac8:	c19ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002acc:	141027f3          	csrr	a5,sepc
    80002ad0:	faf43c23          	sd	a5,-72(s0)
    return sepc;
    80002ad4:	fb843483          	ld	s1,-72(s0)
                    uint64 sepc = r_sepc() + 4; uint64 sstatus = r_sstatus();
    80002ad8:	00448493          	addi	s1,s1,4
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002adc:	100027f3          	csrr	a5,sstatus
    80002ae0:	faf43823          	sd	a5,-80(s0)
    return sstatus;
    80002ae4:	fb043903          	ld	s2,-80(s0)
                    TCB::timeSliceCounter = 0;
    80002ae8:	00004797          	auipc	a5,0x4
    80002aec:	6287b783          	ld	a5,1576(a5) # 80007110 <_GLOBAL_OFFSET_TABLE_+0x18>
    80002af0:	0007b023          	sd	zero,0(a5)
                    TCB::dispatch();
    80002af4:	fffff097          	auipc	ra,0xfffff
    80002af8:	5d0080e7          	jalr	1488(ra) # 800020c4 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r" (sstatus));
    80002afc:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r" (sepc));
    80002b00:	14149073          	csrw	sepc,s1
}
    80002b04:	bddff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r" (sepc));
    80002b08:	141027f3          	csrr	a5,sepc
    80002b0c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80002b10:	fd843483          	ld	s1,-40(s0)
            printString("\nUnexpected trap cause; value of scause = ");
    80002b14:	00003517          	auipc	a0,0x3
    80002b18:	69c50513          	addi	a0,a0,1692 # 800061b0 <CONSOLE_STATUS+0x1a0>
    80002b1c:	fffff097          	auipc	ra,0xfffff
    80002b20:	8c0080e7          	jalr	-1856(ra) # 800013dc <_Z11printStringPKc>
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r" (scause));
    80002b24:	142027f3          	csrr	a5,scause
    80002b28:	fcf43823          	sd	a5,-48(s0)
    return scause;
    80002b2c:	fd043503          	ld	a0,-48(s0)
            printInt(r_scause());
    80002b30:	00000613          	li	a2,0
    80002b34:	00a00593          	li	a1,10
    80002b38:	0005051b          	sext.w	a0,a0
    80002b3c:	fffff097          	auipc	ra,0xfffff
    80002b40:	a38080e7          	jalr	-1480(ra) # 80001574 <_Z8printIntiii>
            printString("; \nvalue of sepc(pc) = ");
    80002b44:	00003517          	auipc	a0,0x3
    80002b48:	69c50513          	addi	a0,a0,1692 # 800061e0 <CONSOLE_STATUS+0x1d0>
    80002b4c:	fffff097          	auipc	ra,0xfffff
    80002b50:	890080e7          	jalr	-1904(ra) # 800013dc <_Z11printStringPKc>
            printInt(pc);
    80002b54:	00000613          	li	a2,0
    80002b58:	00a00593          	li	a1,10
    80002b5c:	0004851b          	sext.w	a0,s1
    80002b60:	fffff097          	auipc	ra,0xfffff
    80002b64:	a14080e7          	jalr	-1516(ra) # 80001574 <_Z8printIntiii>
            printString("; value of sstatus = ");
    80002b68:	00003517          	auipc	a0,0x3
    80002b6c:	69050513          	addi	a0,a0,1680 # 800061f8 <CONSOLE_STATUS+0x1e8>
    80002b70:	fffff097          	auipc	ra,0xfffff
    80002b74:	86c080e7          	jalr	-1940(ra) # 800013dc <_Z11printStringPKc>
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r" (sstatus));
    80002b78:	100027f3          	csrr	a5,sstatus
    80002b7c:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002b80:	fc843503          	ld	a0,-56(s0)
            printInt(r_sstatus());
    80002b84:	00000613          	li	a2,0
    80002b88:	00a00593          	li	a1,10
    80002b8c:	0005051b          	sext.w	a0,a0
    80002b90:	fffff097          	auipc	ra,0xfffff
    80002b94:	9e4080e7          	jalr	-1564(ra) # 80001574 <_Z8printIntiii>
            printString("; \nvalue of stval = ");
    80002b98:	00003517          	auipc	a0,0x3
    80002b9c:	67850513          	addi	a0,a0,1656 # 80006210 <CONSOLE_STATUS+0x200>
    80002ba0:	fffff097          	auipc	ra,0xfffff
    80002ba4:	83c080e7          	jalr	-1988(ra) # 800013dc <_Z11printStringPKc>
    __asm__ volatile ("csrr %[stval], stval" : [stval] "=r" (stval));
    80002ba8:	143027f3          	csrr	a5,stval
    80002bac:	fcf43023          	sd	a5,-64(s0)
    return stval;
    80002bb0:	fc043503          	ld	a0,-64(s0)
            printInt(r_stval());
    80002bb4:	00000613          	li	a2,0
    80002bb8:	00a00593          	li	a1,10
    80002bbc:	0005051b          	sext.w	a0,a0
    80002bc0:	fffff097          	auipc	ra,0xfffff
    80002bc4:	9b4080e7          	jalr	-1612(ra) # 80001574 <_Z8printIntiii>
}
    80002bc8:	b19ff06f          	j	800026e0 <_ZN5Riscv20handleSupervisorTrapEv+0x118>

0000000080002bcc <_ZN4KSemC1Ej>:

KSem *KSem::createSem(unsigned int val) {
    return new KSem(val);
}

KSem::KSem(unsigned int valInit) {
    80002bcc:	ff010113          	addi	sp,sp,-16
    80002bd0:	00813423          	sd	s0,8(sp)
    80002bd4:	01010413          	addi	s0,sp,16
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80002bd8:	00053023          	sd	zero,0(a0)
    80002bdc:	00053423          	sd	zero,8(a0)
    this->val = valInit;
    80002be0:	00b52823          	sw	a1,16(a0)
}
    80002be4:	00813403          	ld	s0,8(sp)
    80002be8:	01010113          	addi	sp,sp,16
    80002bec:	00008067          	ret

0000000080002bf0 <_ZN4KSem9createSemEj>:
KSem *KSem::createSem(unsigned int val) {
    80002bf0:	fe010113          	addi	sp,sp,-32
    80002bf4:	00113c23          	sd	ra,24(sp)
    80002bf8:	00813823          	sd	s0,16(sp)
    80002bfc:	00913423          	sd	s1,8(sp)
    80002c00:	01213023          	sd	s2,0(sp)
    80002c04:	02010413          	addi	s0,sp,32
    80002c08:	00050913          	mv	s2,a0
    return new KSem(val);
    80002c0c:	01800513          	li	a0,24
    80002c10:	fffff097          	auipc	ra,0xfffff
    80002c14:	1f0080e7          	jalr	496(ra) # 80001e00 <_Znwm>
    80002c18:	00050493          	mv	s1,a0
    80002c1c:	00090593          	mv	a1,s2
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	fac080e7          	jalr	-84(ra) # 80002bcc <_ZN4KSemC1Ej>
}
    80002c28:	00048513          	mv	a0,s1
    80002c2c:	01813083          	ld	ra,24(sp)
    80002c30:	01013403          	ld	s0,16(sp)
    80002c34:	00813483          	ld	s1,8(sp)
    80002c38:	00013903          	ld	s2,0(sp)
    80002c3c:	02010113          	addi	sp,sp,32
    80002c40:	00008067          	ret

0000000080002c44 <_ZN4KSem12putSuspendedEP3TCB>:
            Scheduler::put(temp);
        }
    }
}

void KSem::putSuspended(TCB *tcb) {
    80002c44:	fe010113          	addi	sp,sp,-32
    80002c48:	00113c23          	sd	ra,24(sp)
    80002c4c:	00813823          	sd	s0,16(sp)
    80002c50:	00913423          	sd	s1,8(sp)
    80002c54:	01213023          	sd	s2,0(sp)
    80002c58:	02010413          	addi	s0,sp,32
    80002c5c:	00050493          	mv	s1,a0
    80002c60:	00058913          	mv	s2,a1
        if (!tail) { tail = head; }
    }

    void addLast(T *data)
    {
        Elem *elem = new Elem(data, 0);
    80002c64:	01000513          	li	a0,16
    80002c68:	fffff097          	auipc	ra,0xfffff
    80002c6c:	198080e7          	jalr	408(ra) # 80001e00 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002c70:	01253023          	sd	s2,0(a0)
    80002c74:	00053423          	sd	zero,8(a0)
        if (tail)
    80002c78:	0084b783          	ld	a5,8(s1)
    80002c7c:	02078263          	beqz	a5,80002ca0 <_ZN4KSem12putSuspendedEP3TCB+0x5c>
        {
            tail->next = elem;
    80002c80:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002c84:	00a4b423          	sd	a0,8(s1)
    suspendThreadsQueue.addLast(tcb);
}
    80002c88:	01813083          	ld	ra,24(sp)
    80002c8c:	01013403          	ld	s0,16(sp)
    80002c90:	00813483          	ld	s1,8(sp)
    80002c94:	00013903          	ld	s2,0(sp)
    80002c98:	02010113          	addi	sp,sp,32
    80002c9c:	00008067          	ret
        } else {
            head = tail = elem;
    80002ca0:	00a4b423          	sd	a0,8(s1)
    80002ca4:	00a4b023          	sd	a0,0(s1)
    80002ca8:	fe1ff06f          	j	80002c88 <_ZN4KSem12putSuspendedEP3TCB+0x44>

0000000080002cac <_ZN4KSem4waitEv>:
     if (--val < 0) { // block
    80002cac:	01052783          	lw	a5,16(a0)
    80002cb0:	fff7879b          	addiw	a5,a5,-1
    80002cb4:	00f52823          	sw	a5,16(a0)
    80002cb8:	02079713          	slli	a4,a5,0x20
    80002cbc:	00074463          	bltz	a4,80002cc4 <_ZN4KSem4waitEv+0x18>
    80002cc0:	00008067          	ret
void KSem::wait() {
    80002cc4:	ff010113          	addi	sp,sp,-16
    80002cc8:	00113423          	sd	ra,8(sp)
    80002ccc:	00813023          	sd	s0,0(sp)
    80002cd0:	01010413          	addi	s0,sp,16
         TCB::running->setSuspended(true);
    80002cd4:	00004797          	auipc	a5,0x4
    80002cd8:	44c7b783          	ld	a5,1100(a5) # 80007120 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002cdc:	0007b583          	ld	a1,0(a5)
    void setSuspended(bool value) { suspended = value; }
    80002ce0:	00100793          	li	a5,1
    80002ce4:	02f588a3          	sb	a5,49(a1)
         putSuspended(TCB::running);
    80002ce8:	00000097          	auipc	ra,0x0
    80002cec:	f5c080e7          	jalr	-164(ra) # 80002c44 <_ZN4KSem12putSuspendedEP3TCB>
         TCB::dispatch(); // MOZDA ove treba poziv yielda???
    80002cf0:	fffff097          	auipc	ra,0xfffff
    80002cf4:	3d4080e7          	jalr	980(ra) # 800020c4 <_ZN3TCB8dispatchEv>
}
    80002cf8:	00813083          	ld	ra,8(sp)
    80002cfc:	00013403          	ld	s0,0(sp)
    80002d00:	01010113          	addi	sp,sp,16
    80002d04:	00008067          	ret

0000000080002d08 <_ZN4KSem12getSuspendedEv>:

TCB *KSem::getSuspended() {
    80002d08:	fe010113          	addi	sp,sp,-32
    80002d0c:	00113c23          	sd	ra,24(sp)
    80002d10:	00813823          	sd	s0,16(sp)
    80002d14:	00913423          	sd	s1,8(sp)
    80002d18:	02010413          	addi	s0,sp,32
    80002d1c:	00050793          	mv	a5,a0
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80002d20:	00053503          	ld	a0,0(a0)
    80002d24:	02050e63          	beqz	a0,80002d60 <_ZN4KSem12getSuspendedEv+0x58>

        Elem *elem = head;
        head = head->next;
    80002d28:	00853703          	ld	a4,8(a0)
    80002d2c:	00e7b023          	sd	a4,0(a5)
        if (!head) { tail = 0; }
    80002d30:	02070463          	beqz	a4,80002d58 <_ZN4KSem12getSuspendedEv+0x50>

        T *ret = elem->data;
    80002d34:	00053483          	ld	s1,0(a0)
        delete elem;
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	118080e7          	jalr	280(ra) # 80001e50 <_ZdlPv>
    return suspendThreadsQueue.removeFirst();
}
    80002d40:	00048513          	mv	a0,s1
    80002d44:	01813083          	ld	ra,24(sp)
    80002d48:	01013403          	ld	s0,16(sp)
    80002d4c:	00813483          	ld	s1,8(sp)
    80002d50:	02010113          	addi	sp,sp,32
    80002d54:	00008067          	ret
        if (!head) { tail = 0; }
    80002d58:	0007b423          	sd	zero,8(a5)
    80002d5c:	fd9ff06f          	j	80002d34 <_ZN4KSem12getSuspendedEv+0x2c>
        if (!head) { return 0; }
    80002d60:	00050493          	mv	s1,a0
    return suspendThreadsQueue.removeFirst();
    80002d64:	fddff06f          	j	80002d40 <_ZN4KSem12getSuspendedEv+0x38>

0000000080002d68 <_ZN4KSem6signalEv>:
    if (val++<0) { // deblock
    80002d68:	01052783          	lw	a5,16(a0)
    80002d6c:	0017871b          	addiw	a4,a5,1
    80002d70:	00e52823          	sw	a4,16(a0)
    80002d74:	0007c463          	bltz	a5,80002d7c <_ZN4KSem6signalEv+0x14>
    80002d78:	00008067          	ret
void KSem::signal() {
    80002d7c:	ff010113          	addi	sp,sp,-16
    80002d80:	00113423          	sd	ra,8(sp)
    80002d84:	00813023          	sd	s0,0(sp)
    80002d88:	01010413          	addi	s0,sp,16
        thread_t temp = getSuspended();
    80002d8c:	00000097          	auipc	ra,0x0
    80002d90:	f7c080e7          	jalr	-132(ra) # 80002d08 <_ZN4KSem12getSuspendedEv>
        if(temp) {
    80002d94:	00050663          	beqz	a0,80002da0 <_ZN4KSem6signalEv+0x38>
            Scheduler::put(temp);
    80002d98:	00000097          	auipc	ra,0x0
    80002d9c:	0c0080e7          	jalr	192(ra) # 80002e58 <_ZN9Scheduler3putEP3TCB>
}
    80002da0:	00813083          	ld	ra,8(sp)
    80002da4:	00013403          	ld	s0,0(sp)
    80002da8:	01010113          	addi	sp,sp,16
    80002dac:	00008067          	ret

0000000080002db0 <_Z41__static_initialization_and_destruction_0ii>:
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB *tcb) {
    readyThreadQueue.addLast(tcb);
    80002db0:	ff010113          	addi	sp,sp,-16
    80002db4:	00813423          	sd	s0,8(sp)
    80002db8:	01010413          	addi	s0,sp,16
    80002dbc:	00100793          	li	a5,1
    80002dc0:	00f50863          	beq	a0,a5,80002dd0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002dc4:	00813403          	ld	s0,8(sp)
    80002dc8:	01010113          	addi	sp,sp,16
    80002dcc:	00008067          	ret
    80002dd0:	000107b7          	lui	a5,0x10
    80002dd4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002dd8:	fef596e3          	bne	a1,a5,80002dc4 <_Z41__static_initialization_and_destruction_0ii+0x14>
    };

    Elem *head, *tail;

public:
    List() : head(0), tail(0) {}
    80002ddc:	00004797          	auipc	a5,0x4
    80002de0:	3d478793          	addi	a5,a5,980 # 800071b0 <_ZN9Scheduler16readyThreadQueueE>
    80002de4:	0007b023          	sd	zero,0(a5)
    80002de8:	0007b423          	sd	zero,8(a5)
    80002dec:	fd9ff06f          	j	80002dc4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002df0 <_ZN9Scheduler3getEv>:
TCB *Scheduler::get() {
    80002df0:	fe010113          	addi	sp,sp,-32
    80002df4:	00113c23          	sd	ra,24(sp)
    80002df8:	00813823          	sd	s0,16(sp)
    80002dfc:	00913423          	sd	s1,8(sp)
    80002e00:	02010413          	addi	s0,sp,32
        }
    }

    T *removeFirst()
    {
        if (!head) { return 0; }
    80002e04:	00004517          	auipc	a0,0x4
    80002e08:	3ac53503          	ld	a0,940(a0) # 800071b0 <_ZN9Scheduler16readyThreadQueueE>
    80002e0c:	04050263          	beqz	a0,80002e50 <_ZN9Scheduler3getEv+0x60>

        Elem *elem = head;
        head = head->next;
    80002e10:	00853783          	ld	a5,8(a0)
    80002e14:	00004717          	auipc	a4,0x4
    80002e18:	38f73e23          	sd	a5,924(a4) # 800071b0 <_ZN9Scheduler16readyThreadQueueE>
        if (!head) { tail = 0; }
    80002e1c:	02078463          	beqz	a5,80002e44 <_ZN9Scheduler3getEv+0x54>

        T *ret = elem->data;
    80002e20:	00053483          	ld	s1,0(a0)
        delete elem;
    80002e24:	fffff097          	auipc	ra,0xfffff
    80002e28:	02c080e7          	jalr	44(ra) # 80001e50 <_ZdlPv>
}
    80002e2c:	00048513          	mv	a0,s1
    80002e30:	01813083          	ld	ra,24(sp)
    80002e34:	01013403          	ld	s0,16(sp)
    80002e38:	00813483          	ld	s1,8(sp)
    80002e3c:	02010113          	addi	sp,sp,32
    80002e40:	00008067          	ret
        if (!head) { tail = 0; }
    80002e44:	00004797          	auipc	a5,0x4
    80002e48:	3607ba23          	sd	zero,884(a5) # 800071b8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002e4c:	fd5ff06f          	j	80002e20 <_ZN9Scheduler3getEv+0x30>
        if (!head) { return 0; }
    80002e50:	00050493          	mv	s1,a0
    return readyThreadQueue.removeFirst();
    80002e54:	fd9ff06f          	j	80002e2c <_ZN9Scheduler3getEv+0x3c>

0000000080002e58 <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB *tcb) {
    80002e58:	fe010113          	addi	sp,sp,-32
    80002e5c:	00113c23          	sd	ra,24(sp)
    80002e60:	00813823          	sd	s0,16(sp)
    80002e64:	00913423          	sd	s1,8(sp)
    80002e68:	02010413          	addi	s0,sp,32
    80002e6c:	00050493          	mv	s1,a0
        Elem *elem = new Elem(data, 0);
    80002e70:	01000513          	li	a0,16
    80002e74:	fffff097          	auipc	ra,0xfffff
    80002e78:	f8c080e7          	jalr	-116(ra) # 80001e00 <_Znwm>
        Elem(T *data, Elem *next) : data(data), next(next) {}
    80002e7c:	00953023          	sd	s1,0(a0)
    80002e80:	00053423          	sd	zero,8(a0)
        if (tail)
    80002e84:	00004797          	auipc	a5,0x4
    80002e88:	3347b783          	ld	a5,820(a5) # 800071b8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002e8c:	02078263          	beqz	a5,80002eb0 <_ZN9Scheduler3putEP3TCB+0x58>
            tail->next = elem;
    80002e90:	00a7b423          	sd	a0,8(a5)
            tail = elem;
    80002e94:	00004797          	auipc	a5,0x4
    80002e98:	32a7b223          	sd	a0,804(a5) # 800071b8 <_ZN9Scheduler16readyThreadQueueE+0x8>
    80002e9c:	01813083          	ld	ra,24(sp)
    80002ea0:	01013403          	ld	s0,16(sp)
    80002ea4:	00813483          	ld	s1,8(sp)
    80002ea8:	02010113          	addi	sp,sp,32
    80002eac:	00008067          	ret
            head = tail = elem;
    80002eb0:	00004797          	auipc	a5,0x4
    80002eb4:	30078793          	addi	a5,a5,768 # 800071b0 <_ZN9Scheduler16readyThreadQueueE>
    80002eb8:	00a7b423          	sd	a0,8(a5)
    80002ebc:	00a7b023          	sd	a0,0(a5)
    80002ec0:	fddff06f          	j	80002e9c <_ZN9Scheduler3putEP3TCB+0x44>

0000000080002ec4 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80002ec4:	ff010113          	addi	sp,sp,-16
    80002ec8:	00113423          	sd	ra,8(sp)
    80002ecc:	00813023          	sd	s0,0(sp)
    80002ed0:	01010413          	addi	s0,sp,16
    80002ed4:	000105b7          	lui	a1,0x10
    80002ed8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002edc:	00100513          	li	a0,1
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	ed0080e7          	jalr	-304(ra) # 80002db0 <_Z41__static_initialization_and_destruction_0ii>
    80002ee8:	00813083          	ld	ra,8(sp)
    80002eec:	00013403          	ld	s0,0(sp)
    80002ef0:	01010113          	addi	sp,sp,16
    80002ef4:	00008067          	ret

0000000080002ef8 <start>:
    80002ef8:	ff010113          	addi	sp,sp,-16
    80002efc:	00813423          	sd	s0,8(sp)
    80002f00:	01010413          	addi	s0,sp,16
    80002f04:	300027f3          	csrr	a5,mstatus
    80002f08:	ffffe737          	lui	a4,0xffffe
    80002f0c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff63cf>
    80002f10:	00e7f7b3          	and	a5,a5,a4
    80002f14:	00001737          	lui	a4,0x1
    80002f18:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002f1c:	00e7e7b3          	or	a5,a5,a4
    80002f20:	30079073          	csrw	mstatus,a5
    80002f24:	00000797          	auipc	a5,0x0
    80002f28:	16078793          	addi	a5,a5,352 # 80003084 <system_main>
    80002f2c:	34179073          	csrw	mepc,a5
    80002f30:	00000793          	li	a5,0
    80002f34:	18079073          	csrw	satp,a5
    80002f38:	000107b7          	lui	a5,0x10
    80002f3c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002f40:	30279073          	csrw	medeleg,a5
    80002f44:	30379073          	csrw	mideleg,a5
    80002f48:	104027f3          	csrr	a5,sie
    80002f4c:	2227e793          	ori	a5,a5,546
    80002f50:	10479073          	csrw	sie,a5
    80002f54:	fff00793          	li	a5,-1
    80002f58:	00a7d793          	srli	a5,a5,0xa
    80002f5c:	3b079073          	csrw	pmpaddr0,a5
    80002f60:	00f00793          	li	a5,15
    80002f64:	3a079073          	csrw	pmpcfg0,a5
    80002f68:	f14027f3          	csrr	a5,mhartid
    80002f6c:	0200c737          	lui	a4,0x200c
    80002f70:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002f74:	0007869b          	sext.w	a3,a5
    80002f78:	00269713          	slli	a4,a3,0x2
    80002f7c:	000f4637          	lui	a2,0xf4
    80002f80:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002f84:	00d70733          	add	a4,a4,a3
    80002f88:	0037979b          	slliw	a5,a5,0x3
    80002f8c:	020046b7          	lui	a3,0x2004
    80002f90:	00d787b3          	add	a5,a5,a3
    80002f94:	00c585b3          	add	a1,a1,a2
    80002f98:	00371693          	slli	a3,a4,0x3
    80002f9c:	00004717          	auipc	a4,0x4
    80002fa0:	22470713          	addi	a4,a4,548 # 800071c0 <timer_scratch>
    80002fa4:	00b7b023          	sd	a1,0(a5)
    80002fa8:	00d70733          	add	a4,a4,a3
    80002fac:	00f73c23          	sd	a5,24(a4)
    80002fb0:	02c73023          	sd	a2,32(a4)
    80002fb4:	34071073          	csrw	mscratch,a4
    80002fb8:	00000797          	auipc	a5,0x0
    80002fbc:	6e878793          	addi	a5,a5,1768 # 800036a0 <timervec>
    80002fc0:	30579073          	csrw	mtvec,a5
    80002fc4:	300027f3          	csrr	a5,mstatus
    80002fc8:	0087e793          	ori	a5,a5,8
    80002fcc:	30079073          	csrw	mstatus,a5
    80002fd0:	304027f3          	csrr	a5,mie
    80002fd4:	0807e793          	ori	a5,a5,128
    80002fd8:	30479073          	csrw	mie,a5
    80002fdc:	f14027f3          	csrr	a5,mhartid
    80002fe0:	0007879b          	sext.w	a5,a5
    80002fe4:	00078213          	mv	tp,a5
    80002fe8:	30200073          	mret
    80002fec:	00813403          	ld	s0,8(sp)
    80002ff0:	01010113          	addi	sp,sp,16
    80002ff4:	00008067          	ret

0000000080002ff8 <timerinit>:
    80002ff8:	ff010113          	addi	sp,sp,-16
    80002ffc:	00813423          	sd	s0,8(sp)
    80003000:	01010413          	addi	s0,sp,16
    80003004:	f14027f3          	csrr	a5,mhartid
    80003008:	0200c737          	lui	a4,0x200c
    8000300c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003010:	0007869b          	sext.w	a3,a5
    80003014:	00269713          	slli	a4,a3,0x2
    80003018:	000f4637          	lui	a2,0xf4
    8000301c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003020:	00d70733          	add	a4,a4,a3
    80003024:	0037979b          	slliw	a5,a5,0x3
    80003028:	020046b7          	lui	a3,0x2004
    8000302c:	00d787b3          	add	a5,a5,a3
    80003030:	00c585b3          	add	a1,a1,a2
    80003034:	00371693          	slli	a3,a4,0x3
    80003038:	00004717          	auipc	a4,0x4
    8000303c:	18870713          	addi	a4,a4,392 # 800071c0 <timer_scratch>
    80003040:	00b7b023          	sd	a1,0(a5)
    80003044:	00d70733          	add	a4,a4,a3
    80003048:	00f73c23          	sd	a5,24(a4)
    8000304c:	02c73023          	sd	a2,32(a4)
    80003050:	34071073          	csrw	mscratch,a4
    80003054:	00000797          	auipc	a5,0x0
    80003058:	64c78793          	addi	a5,a5,1612 # 800036a0 <timervec>
    8000305c:	30579073          	csrw	mtvec,a5
    80003060:	300027f3          	csrr	a5,mstatus
    80003064:	0087e793          	ori	a5,a5,8
    80003068:	30079073          	csrw	mstatus,a5
    8000306c:	304027f3          	csrr	a5,mie
    80003070:	0807e793          	ori	a5,a5,128
    80003074:	30479073          	csrw	mie,a5
    80003078:	00813403          	ld	s0,8(sp)
    8000307c:	01010113          	addi	sp,sp,16
    80003080:	00008067          	ret

0000000080003084 <system_main>:
    80003084:	fe010113          	addi	sp,sp,-32
    80003088:	00813823          	sd	s0,16(sp)
    8000308c:	00913423          	sd	s1,8(sp)
    80003090:	00113c23          	sd	ra,24(sp)
    80003094:	02010413          	addi	s0,sp,32
    80003098:	00000097          	auipc	ra,0x0
    8000309c:	0c4080e7          	jalr	196(ra) # 8000315c <cpuid>
    800030a0:	00004497          	auipc	s1,0x4
    800030a4:	0b048493          	addi	s1,s1,176 # 80007150 <started>
    800030a8:	02050263          	beqz	a0,800030cc <system_main+0x48>
    800030ac:	0004a783          	lw	a5,0(s1)
    800030b0:	0007879b          	sext.w	a5,a5
    800030b4:	fe078ce3          	beqz	a5,800030ac <system_main+0x28>
    800030b8:	0ff0000f          	fence
    800030bc:	00003517          	auipc	a0,0x3
    800030c0:	3b450513          	addi	a0,a0,948 # 80006470 <CONSOLE_STATUS+0x460>
    800030c4:	00001097          	auipc	ra,0x1
    800030c8:	a78080e7          	jalr	-1416(ra) # 80003b3c <panic>
    800030cc:	00001097          	auipc	ra,0x1
    800030d0:	9cc080e7          	jalr	-1588(ra) # 80003a98 <consoleinit>
    800030d4:	00001097          	auipc	ra,0x1
    800030d8:	158080e7          	jalr	344(ra) # 8000422c <printfinit>
    800030dc:	00003517          	auipc	a0,0x3
    800030e0:	47450513          	addi	a0,a0,1140 # 80006550 <CONSOLE_STATUS+0x540>
    800030e4:	00001097          	auipc	ra,0x1
    800030e8:	ab4080e7          	jalr	-1356(ra) # 80003b98 <__printf>
    800030ec:	00003517          	auipc	a0,0x3
    800030f0:	35450513          	addi	a0,a0,852 # 80006440 <CONSOLE_STATUS+0x430>
    800030f4:	00001097          	auipc	ra,0x1
    800030f8:	aa4080e7          	jalr	-1372(ra) # 80003b98 <__printf>
    800030fc:	00003517          	auipc	a0,0x3
    80003100:	45450513          	addi	a0,a0,1108 # 80006550 <CONSOLE_STATUS+0x540>
    80003104:	00001097          	auipc	ra,0x1
    80003108:	a94080e7          	jalr	-1388(ra) # 80003b98 <__printf>
    8000310c:	00001097          	auipc	ra,0x1
    80003110:	4ac080e7          	jalr	1196(ra) # 800045b8 <kinit>
    80003114:	00000097          	auipc	ra,0x0
    80003118:	148080e7          	jalr	328(ra) # 8000325c <trapinit>
    8000311c:	00000097          	auipc	ra,0x0
    80003120:	16c080e7          	jalr	364(ra) # 80003288 <trapinithart>
    80003124:	00000097          	auipc	ra,0x0
    80003128:	5bc080e7          	jalr	1468(ra) # 800036e0 <plicinit>
    8000312c:	00000097          	auipc	ra,0x0
    80003130:	5dc080e7          	jalr	1500(ra) # 80003708 <plicinithart>
    80003134:	00000097          	auipc	ra,0x0
    80003138:	078080e7          	jalr	120(ra) # 800031ac <userinit>
    8000313c:	0ff0000f          	fence
    80003140:	00100793          	li	a5,1
    80003144:	00003517          	auipc	a0,0x3
    80003148:	31450513          	addi	a0,a0,788 # 80006458 <CONSOLE_STATUS+0x448>
    8000314c:	00f4a023          	sw	a5,0(s1)
    80003150:	00001097          	auipc	ra,0x1
    80003154:	a48080e7          	jalr	-1464(ra) # 80003b98 <__printf>
    80003158:	0000006f          	j	80003158 <system_main+0xd4>

000000008000315c <cpuid>:
    8000315c:	ff010113          	addi	sp,sp,-16
    80003160:	00813423          	sd	s0,8(sp)
    80003164:	01010413          	addi	s0,sp,16
    80003168:	00020513          	mv	a0,tp
    8000316c:	00813403          	ld	s0,8(sp)
    80003170:	0005051b          	sext.w	a0,a0
    80003174:	01010113          	addi	sp,sp,16
    80003178:	00008067          	ret

000000008000317c <mycpu>:
    8000317c:	ff010113          	addi	sp,sp,-16
    80003180:	00813423          	sd	s0,8(sp)
    80003184:	01010413          	addi	s0,sp,16
    80003188:	00020793          	mv	a5,tp
    8000318c:	00813403          	ld	s0,8(sp)
    80003190:	0007879b          	sext.w	a5,a5
    80003194:	00779793          	slli	a5,a5,0x7
    80003198:	00005517          	auipc	a0,0x5
    8000319c:	05850513          	addi	a0,a0,88 # 800081f0 <cpus>
    800031a0:	00f50533          	add	a0,a0,a5
    800031a4:	01010113          	addi	sp,sp,16
    800031a8:	00008067          	ret

00000000800031ac <userinit>:
    800031ac:	ff010113          	addi	sp,sp,-16
    800031b0:	00813423          	sd	s0,8(sp)
    800031b4:	01010413          	addi	s0,sp,16
    800031b8:	00813403          	ld	s0,8(sp)
    800031bc:	01010113          	addi	sp,sp,16
    800031c0:	fffff317          	auipc	t1,0xfffff
    800031c4:	b6830067          	jr	-1176(t1) # 80001d28 <main>

00000000800031c8 <either_copyout>:
    800031c8:	ff010113          	addi	sp,sp,-16
    800031cc:	00813023          	sd	s0,0(sp)
    800031d0:	00113423          	sd	ra,8(sp)
    800031d4:	01010413          	addi	s0,sp,16
    800031d8:	02051663          	bnez	a0,80003204 <either_copyout+0x3c>
    800031dc:	00058513          	mv	a0,a1
    800031e0:	00060593          	mv	a1,a2
    800031e4:	0006861b          	sext.w	a2,a3
    800031e8:	00002097          	auipc	ra,0x2
    800031ec:	c5c080e7          	jalr	-932(ra) # 80004e44 <__memmove>
    800031f0:	00813083          	ld	ra,8(sp)
    800031f4:	00013403          	ld	s0,0(sp)
    800031f8:	00000513          	li	a0,0
    800031fc:	01010113          	addi	sp,sp,16
    80003200:	00008067          	ret
    80003204:	00003517          	auipc	a0,0x3
    80003208:	29450513          	addi	a0,a0,660 # 80006498 <CONSOLE_STATUS+0x488>
    8000320c:	00001097          	auipc	ra,0x1
    80003210:	930080e7          	jalr	-1744(ra) # 80003b3c <panic>

0000000080003214 <either_copyin>:
    80003214:	ff010113          	addi	sp,sp,-16
    80003218:	00813023          	sd	s0,0(sp)
    8000321c:	00113423          	sd	ra,8(sp)
    80003220:	01010413          	addi	s0,sp,16
    80003224:	02059463          	bnez	a1,8000324c <either_copyin+0x38>
    80003228:	00060593          	mv	a1,a2
    8000322c:	0006861b          	sext.w	a2,a3
    80003230:	00002097          	auipc	ra,0x2
    80003234:	c14080e7          	jalr	-1004(ra) # 80004e44 <__memmove>
    80003238:	00813083          	ld	ra,8(sp)
    8000323c:	00013403          	ld	s0,0(sp)
    80003240:	00000513          	li	a0,0
    80003244:	01010113          	addi	sp,sp,16
    80003248:	00008067          	ret
    8000324c:	00003517          	auipc	a0,0x3
    80003250:	27450513          	addi	a0,a0,628 # 800064c0 <CONSOLE_STATUS+0x4b0>
    80003254:	00001097          	auipc	ra,0x1
    80003258:	8e8080e7          	jalr	-1816(ra) # 80003b3c <panic>

000000008000325c <trapinit>:
    8000325c:	ff010113          	addi	sp,sp,-16
    80003260:	00813423          	sd	s0,8(sp)
    80003264:	01010413          	addi	s0,sp,16
    80003268:	00813403          	ld	s0,8(sp)
    8000326c:	00003597          	auipc	a1,0x3
    80003270:	27c58593          	addi	a1,a1,636 # 800064e8 <CONSOLE_STATUS+0x4d8>
    80003274:	00005517          	auipc	a0,0x5
    80003278:	ffc50513          	addi	a0,a0,-4 # 80008270 <tickslock>
    8000327c:	01010113          	addi	sp,sp,16
    80003280:	00001317          	auipc	t1,0x1
    80003284:	5c830067          	jr	1480(t1) # 80004848 <initlock>

0000000080003288 <trapinithart>:
    80003288:	ff010113          	addi	sp,sp,-16
    8000328c:	00813423          	sd	s0,8(sp)
    80003290:	01010413          	addi	s0,sp,16
    80003294:	00000797          	auipc	a5,0x0
    80003298:	2fc78793          	addi	a5,a5,764 # 80003590 <kernelvec>
    8000329c:	10579073          	csrw	stvec,a5
    800032a0:	00813403          	ld	s0,8(sp)
    800032a4:	01010113          	addi	sp,sp,16
    800032a8:	00008067          	ret

00000000800032ac <usertrap>:
    800032ac:	ff010113          	addi	sp,sp,-16
    800032b0:	00813423          	sd	s0,8(sp)
    800032b4:	01010413          	addi	s0,sp,16
    800032b8:	00813403          	ld	s0,8(sp)
    800032bc:	01010113          	addi	sp,sp,16
    800032c0:	00008067          	ret

00000000800032c4 <usertrapret>:
    800032c4:	ff010113          	addi	sp,sp,-16
    800032c8:	00813423          	sd	s0,8(sp)
    800032cc:	01010413          	addi	s0,sp,16
    800032d0:	00813403          	ld	s0,8(sp)
    800032d4:	01010113          	addi	sp,sp,16
    800032d8:	00008067          	ret

00000000800032dc <kerneltrap>:
    800032dc:	fe010113          	addi	sp,sp,-32
    800032e0:	00813823          	sd	s0,16(sp)
    800032e4:	00113c23          	sd	ra,24(sp)
    800032e8:	00913423          	sd	s1,8(sp)
    800032ec:	02010413          	addi	s0,sp,32
    800032f0:	142025f3          	csrr	a1,scause
    800032f4:	100027f3          	csrr	a5,sstatus
    800032f8:	0027f793          	andi	a5,a5,2
    800032fc:	10079c63          	bnez	a5,80003414 <kerneltrap+0x138>
    80003300:	142027f3          	csrr	a5,scause
    80003304:	0207ce63          	bltz	a5,80003340 <kerneltrap+0x64>
    80003308:	00003517          	auipc	a0,0x3
    8000330c:	22850513          	addi	a0,a0,552 # 80006530 <CONSOLE_STATUS+0x520>
    80003310:	00001097          	auipc	ra,0x1
    80003314:	888080e7          	jalr	-1912(ra) # 80003b98 <__printf>
    80003318:	141025f3          	csrr	a1,sepc
    8000331c:	14302673          	csrr	a2,stval
    80003320:	00003517          	auipc	a0,0x3
    80003324:	22050513          	addi	a0,a0,544 # 80006540 <CONSOLE_STATUS+0x530>
    80003328:	00001097          	auipc	ra,0x1
    8000332c:	870080e7          	jalr	-1936(ra) # 80003b98 <__printf>
    80003330:	00003517          	auipc	a0,0x3
    80003334:	22850513          	addi	a0,a0,552 # 80006558 <CONSOLE_STATUS+0x548>
    80003338:	00001097          	auipc	ra,0x1
    8000333c:	804080e7          	jalr	-2044(ra) # 80003b3c <panic>
    80003340:	0ff7f713          	andi	a4,a5,255
    80003344:	00900693          	li	a3,9
    80003348:	04d70063          	beq	a4,a3,80003388 <kerneltrap+0xac>
    8000334c:	fff00713          	li	a4,-1
    80003350:	03f71713          	slli	a4,a4,0x3f
    80003354:	00170713          	addi	a4,a4,1
    80003358:	fae798e3          	bne	a5,a4,80003308 <kerneltrap+0x2c>
    8000335c:	00000097          	auipc	ra,0x0
    80003360:	e00080e7          	jalr	-512(ra) # 8000315c <cpuid>
    80003364:	06050663          	beqz	a0,800033d0 <kerneltrap+0xf4>
    80003368:	144027f3          	csrr	a5,sip
    8000336c:	ffd7f793          	andi	a5,a5,-3
    80003370:	14479073          	csrw	sip,a5
    80003374:	01813083          	ld	ra,24(sp)
    80003378:	01013403          	ld	s0,16(sp)
    8000337c:	00813483          	ld	s1,8(sp)
    80003380:	02010113          	addi	sp,sp,32
    80003384:	00008067          	ret
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	3cc080e7          	jalr	972(ra) # 80003754 <plic_claim>
    80003390:	00a00793          	li	a5,10
    80003394:	00050493          	mv	s1,a0
    80003398:	06f50863          	beq	a0,a5,80003408 <kerneltrap+0x12c>
    8000339c:	fc050ce3          	beqz	a0,80003374 <kerneltrap+0x98>
    800033a0:	00050593          	mv	a1,a0
    800033a4:	00003517          	auipc	a0,0x3
    800033a8:	16c50513          	addi	a0,a0,364 # 80006510 <CONSOLE_STATUS+0x500>
    800033ac:	00000097          	auipc	ra,0x0
    800033b0:	7ec080e7          	jalr	2028(ra) # 80003b98 <__printf>
    800033b4:	01013403          	ld	s0,16(sp)
    800033b8:	01813083          	ld	ra,24(sp)
    800033bc:	00048513          	mv	a0,s1
    800033c0:	00813483          	ld	s1,8(sp)
    800033c4:	02010113          	addi	sp,sp,32
    800033c8:	00000317          	auipc	t1,0x0
    800033cc:	3c430067          	jr	964(t1) # 8000378c <plic_complete>
    800033d0:	00005517          	auipc	a0,0x5
    800033d4:	ea050513          	addi	a0,a0,-352 # 80008270 <tickslock>
    800033d8:	00001097          	auipc	ra,0x1
    800033dc:	494080e7          	jalr	1172(ra) # 8000486c <acquire>
    800033e0:	00004717          	auipc	a4,0x4
    800033e4:	d7470713          	addi	a4,a4,-652 # 80007154 <ticks>
    800033e8:	00072783          	lw	a5,0(a4)
    800033ec:	00005517          	auipc	a0,0x5
    800033f0:	e8450513          	addi	a0,a0,-380 # 80008270 <tickslock>
    800033f4:	0017879b          	addiw	a5,a5,1
    800033f8:	00f72023          	sw	a5,0(a4)
    800033fc:	00001097          	auipc	ra,0x1
    80003400:	53c080e7          	jalr	1340(ra) # 80004938 <release>
    80003404:	f65ff06f          	j	80003368 <kerneltrap+0x8c>
    80003408:	00001097          	auipc	ra,0x1
    8000340c:	098080e7          	jalr	152(ra) # 800044a0 <uartintr>
    80003410:	fa5ff06f          	j	800033b4 <kerneltrap+0xd8>
    80003414:	00003517          	auipc	a0,0x3
    80003418:	0dc50513          	addi	a0,a0,220 # 800064f0 <CONSOLE_STATUS+0x4e0>
    8000341c:	00000097          	auipc	ra,0x0
    80003420:	720080e7          	jalr	1824(ra) # 80003b3c <panic>

0000000080003424 <clockintr>:
    80003424:	fe010113          	addi	sp,sp,-32
    80003428:	00813823          	sd	s0,16(sp)
    8000342c:	00913423          	sd	s1,8(sp)
    80003430:	00113c23          	sd	ra,24(sp)
    80003434:	02010413          	addi	s0,sp,32
    80003438:	00005497          	auipc	s1,0x5
    8000343c:	e3848493          	addi	s1,s1,-456 # 80008270 <tickslock>
    80003440:	00048513          	mv	a0,s1
    80003444:	00001097          	auipc	ra,0x1
    80003448:	428080e7          	jalr	1064(ra) # 8000486c <acquire>
    8000344c:	00004717          	auipc	a4,0x4
    80003450:	d0870713          	addi	a4,a4,-760 # 80007154 <ticks>
    80003454:	00072783          	lw	a5,0(a4)
    80003458:	01013403          	ld	s0,16(sp)
    8000345c:	01813083          	ld	ra,24(sp)
    80003460:	00048513          	mv	a0,s1
    80003464:	0017879b          	addiw	a5,a5,1
    80003468:	00813483          	ld	s1,8(sp)
    8000346c:	00f72023          	sw	a5,0(a4)
    80003470:	02010113          	addi	sp,sp,32
    80003474:	00001317          	auipc	t1,0x1
    80003478:	4c430067          	jr	1220(t1) # 80004938 <release>

000000008000347c <devintr>:
    8000347c:	142027f3          	csrr	a5,scause
    80003480:	00000513          	li	a0,0
    80003484:	0007c463          	bltz	a5,8000348c <devintr+0x10>
    80003488:	00008067          	ret
    8000348c:	fe010113          	addi	sp,sp,-32
    80003490:	00813823          	sd	s0,16(sp)
    80003494:	00113c23          	sd	ra,24(sp)
    80003498:	00913423          	sd	s1,8(sp)
    8000349c:	02010413          	addi	s0,sp,32
    800034a0:	0ff7f713          	andi	a4,a5,255
    800034a4:	00900693          	li	a3,9
    800034a8:	04d70c63          	beq	a4,a3,80003500 <devintr+0x84>
    800034ac:	fff00713          	li	a4,-1
    800034b0:	03f71713          	slli	a4,a4,0x3f
    800034b4:	00170713          	addi	a4,a4,1
    800034b8:	00e78c63          	beq	a5,a4,800034d0 <devintr+0x54>
    800034bc:	01813083          	ld	ra,24(sp)
    800034c0:	01013403          	ld	s0,16(sp)
    800034c4:	00813483          	ld	s1,8(sp)
    800034c8:	02010113          	addi	sp,sp,32
    800034cc:	00008067          	ret
    800034d0:	00000097          	auipc	ra,0x0
    800034d4:	c8c080e7          	jalr	-884(ra) # 8000315c <cpuid>
    800034d8:	06050663          	beqz	a0,80003544 <devintr+0xc8>
    800034dc:	144027f3          	csrr	a5,sip
    800034e0:	ffd7f793          	andi	a5,a5,-3
    800034e4:	14479073          	csrw	sip,a5
    800034e8:	01813083          	ld	ra,24(sp)
    800034ec:	01013403          	ld	s0,16(sp)
    800034f0:	00813483          	ld	s1,8(sp)
    800034f4:	00200513          	li	a0,2
    800034f8:	02010113          	addi	sp,sp,32
    800034fc:	00008067          	ret
    80003500:	00000097          	auipc	ra,0x0
    80003504:	254080e7          	jalr	596(ra) # 80003754 <plic_claim>
    80003508:	00a00793          	li	a5,10
    8000350c:	00050493          	mv	s1,a0
    80003510:	06f50663          	beq	a0,a5,8000357c <devintr+0x100>
    80003514:	00100513          	li	a0,1
    80003518:	fa0482e3          	beqz	s1,800034bc <devintr+0x40>
    8000351c:	00048593          	mv	a1,s1
    80003520:	00003517          	auipc	a0,0x3
    80003524:	ff050513          	addi	a0,a0,-16 # 80006510 <CONSOLE_STATUS+0x500>
    80003528:	00000097          	auipc	ra,0x0
    8000352c:	670080e7          	jalr	1648(ra) # 80003b98 <__printf>
    80003530:	00048513          	mv	a0,s1
    80003534:	00000097          	auipc	ra,0x0
    80003538:	258080e7          	jalr	600(ra) # 8000378c <plic_complete>
    8000353c:	00100513          	li	a0,1
    80003540:	f7dff06f          	j	800034bc <devintr+0x40>
    80003544:	00005517          	auipc	a0,0x5
    80003548:	d2c50513          	addi	a0,a0,-724 # 80008270 <tickslock>
    8000354c:	00001097          	auipc	ra,0x1
    80003550:	320080e7          	jalr	800(ra) # 8000486c <acquire>
    80003554:	00004717          	auipc	a4,0x4
    80003558:	c0070713          	addi	a4,a4,-1024 # 80007154 <ticks>
    8000355c:	00072783          	lw	a5,0(a4)
    80003560:	00005517          	auipc	a0,0x5
    80003564:	d1050513          	addi	a0,a0,-752 # 80008270 <tickslock>
    80003568:	0017879b          	addiw	a5,a5,1
    8000356c:	00f72023          	sw	a5,0(a4)
    80003570:	00001097          	auipc	ra,0x1
    80003574:	3c8080e7          	jalr	968(ra) # 80004938 <release>
    80003578:	f65ff06f          	j	800034dc <devintr+0x60>
    8000357c:	00001097          	auipc	ra,0x1
    80003580:	f24080e7          	jalr	-220(ra) # 800044a0 <uartintr>
    80003584:	fadff06f          	j	80003530 <devintr+0xb4>
	...

0000000080003590 <kernelvec>:
    80003590:	f0010113          	addi	sp,sp,-256
    80003594:	00113023          	sd	ra,0(sp)
    80003598:	00213423          	sd	sp,8(sp)
    8000359c:	00313823          	sd	gp,16(sp)
    800035a0:	00413c23          	sd	tp,24(sp)
    800035a4:	02513023          	sd	t0,32(sp)
    800035a8:	02613423          	sd	t1,40(sp)
    800035ac:	02713823          	sd	t2,48(sp)
    800035b0:	02813c23          	sd	s0,56(sp)
    800035b4:	04913023          	sd	s1,64(sp)
    800035b8:	04a13423          	sd	a0,72(sp)
    800035bc:	04b13823          	sd	a1,80(sp)
    800035c0:	04c13c23          	sd	a2,88(sp)
    800035c4:	06d13023          	sd	a3,96(sp)
    800035c8:	06e13423          	sd	a4,104(sp)
    800035cc:	06f13823          	sd	a5,112(sp)
    800035d0:	07013c23          	sd	a6,120(sp)
    800035d4:	09113023          	sd	a7,128(sp)
    800035d8:	09213423          	sd	s2,136(sp)
    800035dc:	09313823          	sd	s3,144(sp)
    800035e0:	09413c23          	sd	s4,152(sp)
    800035e4:	0b513023          	sd	s5,160(sp)
    800035e8:	0b613423          	sd	s6,168(sp)
    800035ec:	0b713823          	sd	s7,176(sp)
    800035f0:	0b813c23          	sd	s8,184(sp)
    800035f4:	0d913023          	sd	s9,192(sp)
    800035f8:	0da13423          	sd	s10,200(sp)
    800035fc:	0db13823          	sd	s11,208(sp)
    80003600:	0dc13c23          	sd	t3,216(sp)
    80003604:	0fd13023          	sd	t4,224(sp)
    80003608:	0fe13423          	sd	t5,232(sp)
    8000360c:	0ff13823          	sd	t6,240(sp)
    80003610:	ccdff0ef          	jal	ra,800032dc <kerneltrap>
    80003614:	00013083          	ld	ra,0(sp)
    80003618:	00813103          	ld	sp,8(sp)
    8000361c:	01013183          	ld	gp,16(sp)
    80003620:	02013283          	ld	t0,32(sp)
    80003624:	02813303          	ld	t1,40(sp)
    80003628:	03013383          	ld	t2,48(sp)
    8000362c:	03813403          	ld	s0,56(sp)
    80003630:	04013483          	ld	s1,64(sp)
    80003634:	04813503          	ld	a0,72(sp)
    80003638:	05013583          	ld	a1,80(sp)
    8000363c:	05813603          	ld	a2,88(sp)
    80003640:	06013683          	ld	a3,96(sp)
    80003644:	06813703          	ld	a4,104(sp)
    80003648:	07013783          	ld	a5,112(sp)
    8000364c:	07813803          	ld	a6,120(sp)
    80003650:	08013883          	ld	a7,128(sp)
    80003654:	08813903          	ld	s2,136(sp)
    80003658:	09013983          	ld	s3,144(sp)
    8000365c:	09813a03          	ld	s4,152(sp)
    80003660:	0a013a83          	ld	s5,160(sp)
    80003664:	0a813b03          	ld	s6,168(sp)
    80003668:	0b013b83          	ld	s7,176(sp)
    8000366c:	0b813c03          	ld	s8,184(sp)
    80003670:	0c013c83          	ld	s9,192(sp)
    80003674:	0c813d03          	ld	s10,200(sp)
    80003678:	0d013d83          	ld	s11,208(sp)
    8000367c:	0d813e03          	ld	t3,216(sp)
    80003680:	0e013e83          	ld	t4,224(sp)
    80003684:	0e813f03          	ld	t5,232(sp)
    80003688:	0f013f83          	ld	t6,240(sp)
    8000368c:	10010113          	addi	sp,sp,256
    80003690:	10200073          	sret
    80003694:	00000013          	nop
    80003698:	00000013          	nop
    8000369c:	00000013          	nop

00000000800036a0 <timervec>:
    800036a0:	34051573          	csrrw	a0,mscratch,a0
    800036a4:	00b53023          	sd	a1,0(a0)
    800036a8:	00c53423          	sd	a2,8(a0)
    800036ac:	00d53823          	sd	a3,16(a0)
    800036b0:	01853583          	ld	a1,24(a0)
    800036b4:	02053603          	ld	a2,32(a0)
    800036b8:	0005b683          	ld	a3,0(a1)
    800036bc:	00c686b3          	add	a3,a3,a2
    800036c0:	00d5b023          	sd	a3,0(a1)
    800036c4:	00200593          	li	a1,2
    800036c8:	14459073          	csrw	sip,a1
    800036cc:	01053683          	ld	a3,16(a0)
    800036d0:	00853603          	ld	a2,8(a0)
    800036d4:	00053583          	ld	a1,0(a0)
    800036d8:	34051573          	csrrw	a0,mscratch,a0
    800036dc:	30200073          	mret

00000000800036e0 <plicinit>:
    800036e0:	ff010113          	addi	sp,sp,-16
    800036e4:	00813423          	sd	s0,8(sp)
    800036e8:	01010413          	addi	s0,sp,16
    800036ec:	00813403          	ld	s0,8(sp)
    800036f0:	0c0007b7          	lui	a5,0xc000
    800036f4:	00100713          	li	a4,1
    800036f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800036fc:	00e7a223          	sw	a4,4(a5)
    80003700:	01010113          	addi	sp,sp,16
    80003704:	00008067          	ret

0000000080003708 <plicinithart>:
    80003708:	ff010113          	addi	sp,sp,-16
    8000370c:	00813023          	sd	s0,0(sp)
    80003710:	00113423          	sd	ra,8(sp)
    80003714:	01010413          	addi	s0,sp,16
    80003718:	00000097          	auipc	ra,0x0
    8000371c:	a44080e7          	jalr	-1468(ra) # 8000315c <cpuid>
    80003720:	0085171b          	slliw	a4,a0,0x8
    80003724:	0c0027b7          	lui	a5,0xc002
    80003728:	00e787b3          	add	a5,a5,a4
    8000372c:	40200713          	li	a4,1026
    80003730:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003734:	00813083          	ld	ra,8(sp)
    80003738:	00013403          	ld	s0,0(sp)
    8000373c:	00d5151b          	slliw	a0,a0,0xd
    80003740:	0c2017b7          	lui	a5,0xc201
    80003744:	00a78533          	add	a0,a5,a0
    80003748:	00052023          	sw	zero,0(a0)
    8000374c:	01010113          	addi	sp,sp,16
    80003750:	00008067          	ret

0000000080003754 <plic_claim>:
    80003754:	ff010113          	addi	sp,sp,-16
    80003758:	00813023          	sd	s0,0(sp)
    8000375c:	00113423          	sd	ra,8(sp)
    80003760:	01010413          	addi	s0,sp,16
    80003764:	00000097          	auipc	ra,0x0
    80003768:	9f8080e7          	jalr	-1544(ra) # 8000315c <cpuid>
    8000376c:	00813083          	ld	ra,8(sp)
    80003770:	00013403          	ld	s0,0(sp)
    80003774:	00d5151b          	slliw	a0,a0,0xd
    80003778:	0c2017b7          	lui	a5,0xc201
    8000377c:	00a78533          	add	a0,a5,a0
    80003780:	00452503          	lw	a0,4(a0)
    80003784:	01010113          	addi	sp,sp,16
    80003788:	00008067          	ret

000000008000378c <plic_complete>:
    8000378c:	fe010113          	addi	sp,sp,-32
    80003790:	00813823          	sd	s0,16(sp)
    80003794:	00913423          	sd	s1,8(sp)
    80003798:	00113c23          	sd	ra,24(sp)
    8000379c:	02010413          	addi	s0,sp,32
    800037a0:	00050493          	mv	s1,a0
    800037a4:	00000097          	auipc	ra,0x0
    800037a8:	9b8080e7          	jalr	-1608(ra) # 8000315c <cpuid>
    800037ac:	01813083          	ld	ra,24(sp)
    800037b0:	01013403          	ld	s0,16(sp)
    800037b4:	00d5179b          	slliw	a5,a0,0xd
    800037b8:	0c201737          	lui	a4,0xc201
    800037bc:	00f707b3          	add	a5,a4,a5
    800037c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800037c4:	00813483          	ld	s1,8(sp)
    800037c8:	02010113          	addi	sp,sp,32
    800037cc:	00008067          	ret

00000000800037d0 <consolewrite>:
    800037d0:	fb010113          	addi	sp,sp,-80
    800037d4:	04813023          	sd	s0,64(sp)
    800037d8:	04113423          	sd	ra,72(sp)
    800037dc:	02913c23          	sd	s1,56(sp)
    800037e0:	03213823          	sd	s2,48(sp)
    800037e4:	03313423          	sd	s3,40(sp)
    800037e8:	03413023          	sd	s4,32(sp)
    800037ec:	01513c23          	sd	s5,24(sp)
    800037f0:	05010413          	addi	s0,sp,80
    800037f4:	06c05c63          	blez	a2,8000386c <consolewrite+0x9c>
    800037f8:	00060993          	mv	s3,a2
    800037fc:	00050a13          	mv	s4,a0
    80003800:	00058493          	mv	s1,a1
    80003804:	00000913          	li	s2,0
    80003808:	fff00a93          	li	s5,-1
    8000380c:	01c0006f          	j	80003828 <consolewrite+0x58>
    80003810:	fbf44503          	lbu	a0,-65(s0)
    80003814:	0019091b          	addiw	s2,s2,1
    80003818:	00148493          	addi	s1,s1,1
    8000381c:	00001097          	auipc	ra,0x1
    80003820:	a9c080e7          	jalr	-1380(ra) # 800042b8 <uartputc>
    80003824:	03298063          	beq	s3,s2,80003844 <consolewrite+0x74>
    80003828:	00048613          	mv	a2,s1
    8000382c:	00100693          	li	a3,1
    80003830:	000a0593          	mv	a1,s4
    80003834:	fbf40513          	addi	a0,s0,-65
    80003838:	00000097          	auipc	ra,0x0
    8000383c:	9dc080e7          	jalr	-1572(ra) # 80003214 <either_copyin>
    80003840:	fd5518e3          	bne	a0,s5,80003810 <consolewrite+0x40>
    80003844:	04813083          	ld	ra,72(sp)
    80003848:	04013403          	ld	s0,64(sp)
    8000384c:	03813483          	ld	s1,56(sp)
    80003850:	02813983          	ld	s3,40(sp)
    80003854:	02013a03          	ld	s4,32(sp)
    80003858:	01813a83          	ld	s5,24(sp)
    8000385c:	00090513          	mv	a0,s2
    80003860:	03013903          	ld	s2,48(sp)
    80003864:	05010113          	addi	sp,sp,80
    80003868:	00008067          	ret
    8000386c:	00000913          	li	s2,0
    80003870:	fd5ff06f          	j	80003844 <consolewrite+0x74>

0000000080003874 <consoleread>:
    80003874:	f9010113          	addi	sp,sp,-112
    80003878:	06813023          	sd	s0,96(sp)
    8000387c:	04913c23          	sd	s1,88(sp)
    80003880:	05213823          	sd	s2,80(sp)
    80003884:	05313423          	sd	s3,72(sp)
    80003888:	05413023          	sd	s4,64(sp)
    8000388c:	03513c23          	sd	s5,56(sp)
    80003890:	03613823          	sd	s6,48(sp)
    80003894:	03713423          	sd	s7,40(sp)
    80003898:	03813023          	sd	s8,32(sp)
    8000389c:	06113423          	sd	ra,104(sp)
    800038a0:	01913c23          	sd	s9,24(sp)
    800038a4:	07010413          	addi	s0,sp,112
    800038a8:	00060b93          	mv	s7,a2
    800038ac:	00050913          	mv	s2,a0
    800038b0:	00058c13          	mv	s8,a1
    800038b4:	00060b1b          	sext.w	s6,a2
    800038b8:	00005497          	auipc	s1,0x5
    800038bc:	9e048493          	addi	s1,s1,-1568 # 80008298 <cons>
    800038c0:	00400993          	li	s3,4
    800038c4:	fff00a13          	li	s4,-1
    800038c8:	00a00a93          	li	s5,10
    800038cc:	05705e63          	blez	s7,80003928 <consoleread+0xb4>
    800038d0:	09c4a703          	lw	a4,156(s1)
    800038d4:	0984a783          	lw	a5,152(s1)
    800038d8:	0007071b          	sext.w	a4,a4
    800038dc:	08e78463          	beq	a5,a4,80003964 <consoleread+0xf0>
    800038e0:	07f7f713          	andi	a4,a5,127
    800038e4:	00e48733          	add	a4,s1,a4
    800038e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800038ec:	0017869b          	addiw	a3,a5,1
    800038f0:	08d4ac23          	sw	a3,152(s1)
    800038f4:	00070c9b          	sext.w	s9,a4
    800038f8:	0b370663          	beq	a4,s3,800039a4 <consoleread+0x130>
    800038fc:	00100693          	li	a3,1
    80003900:	f9f40613          	addi	a2,s0,-97
    80003904:	000c0593          	mv	a1,s8
    80003908:	00090513          	mv	a0,s2
    8000390c:	f8e40fa3          	sb	a4,-97(s0)
    80003910:	00000097          	auipc	ra,0x0
    80003914:	8b8080e7          	jalr	-1864(ra) # 800031c8 <either_copyout>
    80003918:	01450863          	beq	a0,s4,80003928 <consoleread+0xb4>
    8000391c:	001c0c13          	addi	s8,s8,1
    80003920:	fffb8b9b          	addiw	s7,s7,-1
    80003924:	fb5c94e3          	bne	s9,s5,800038cc <consoleread+0x58>
    80003928:	000b851b          	sext.w	a0,s7
    8000392c:	06813083          	ld	ra,104(sp)
    80003930:	06013403          	ld	s0,96(sp)
    80003934:	05813483          	ld	s1,88(sp)
    80003938:	05013903          	ld	s2,80(sp)
    8000393c:	04813983          	ld	s3,72(sp)
    80003940:	04013a03          	ld	s4,64(sp)
    80003944:	03813a83          	ld	s5,56(sp)
    80003948:	02813b83          	ld	s7,40(sp)
    8000394c:	02013c03          	ld	s8,32(sp)
    80003950:	01813c83          	ld	s9,24(sp)
    80003954:	40ab053b          	subw	a0,s6,a0
    80003958:	03013b03          	ld	s6,48(sp)
    8000395c:	07010113          	addi	sp,sp,112
    80003960:	00008067          	ret
    80003964:	00001097          	auipc	ra,0x1
    80003968:	1d8080e7          	jalr	472(ra) # 80004b3c <push_on>
    8000396c:	0984a703          	lw	a4,152(s1)
    80003970:	09c4a783          	lw	a5,156(s1)
    80003974:	0007879b          	sext.w	a5,a5
    80003978:	fef70ce3          	beq	a4,a5,80003970 <consoleread+0xfc>
    8000397c:	00001097          	auipc	ra,0x1
    80003980:	234080e7          	jalr	564(ra) # 80004bb0 <pop_on>
    80003984:	0984a783          	lw	a5,152(s1)
    80003988:	07f7f713          	andi	a4,a5,127
    8000398c:	00e48733          	add	a4,s1,a4
    80003990:	01874703          	lbu	a4,24(a4)
    80003994:	0017869b          	addiw	a3,a5,1
    80003998:	08d4ac23          	sw	a3,152(s1)
    8000399c:	00070c9b          	sext.w	s9,a4
    800039a0:	f5371ee3          	bne	a4,s3,800038fc <consoleread+0x88>
    800039a4:	000b851b          	sext.w	a0,s7
    800039a8:	f96bf2e3          	bgeu	s7,s6,8000392c <consoleread+0xb8>
    800039ac:	08f4ac23          	sw	a5,152(s1)
    800039b0:	f7dff06f          	j	8000392c <consoleread+0xb8>

00000000800039b4 <consputc>:
    800039b4:	10000793          	li	a5,256
    800039b8:	00f50663          	beq	a0,a5,800039c4 <consputc+0x10>
    800039bc:	00001317          	auipc	t1,0x1
    800039c0:	9f430067          	jr	-1548(t1) # 800043b0 <uartputc_sync>
    800039c4:	ff010113          	addi	sp,sp,-16
    800039c8:	00113423          	sd	ra,8(sp)
    800039cc:	00813023          	sd	s0,0(sp)
    800039d0:	01010413          	addi	s0,sp,16
    800039d4:	00800513          	li	a0,8
    800039d8:	00001097          	auipc	ra,0x1
    800039dc:	9d8080e7          	jalr	-1576(ra) # 800043b0 <uartputc_sync>
    800039e0:	02000513          	li	a0,32
    800039e4:	00001097          	auipc	ra,0x1
    800039e8:	9cc080e7          	jalr	-1588(ra) # 800043b0 <uartputc_sync>
    800039ec:	00013403          	ld	s0,0(sp)
    800039f0:	00813083          	ld	ra,8(sp)
    800039f4:	00800513          	li	a0,8
    800039f8:	01010113          	addi	sp,sp,16
    800039fc:	00001317          	auipc	t1,0x1
    80003a00:	9b430067          	jr	-1612(t1) # 800043b0 <uartputc_sync>

0000000080003a04 <consoleintr>:
    80003a04:	fe010113          	addi	sp,sp,-32
    80003a08:	00813823          	sd	s0,16(sp)
    80003a0c:	00913423          	sd	s1,8(sp)
    80003a10:	01213023          	sd	s2,0(sp)
    80003a14:	00113c23          	sd	ra,24(sp)
    80003a18:	02010413          	addi	s0,sp,32
    80003a1c:	00005917          	auipc	s2,0x5
    80003a20:	87c90913          	addi	s2,s2,-1924 # 80008298 <cons>
    80003a24:	00050493          	mv	s1,a0
    80003a28:	00090513          	mv	a0,s2
    80003a2c:	00001097          	auipc	ra,0x1
    80003a30:	e40080e7          	jalr	-448(ra) # 8000486c <acquire>
    80003a34:	02048c63          	beqz	s1,80003a6c <consoleintr+0x68>
    80003a38:	0a092783          	lw	a5,160(s2)
    80003a3c:	09892703          	lw	a4,152(s2)
    80003a40:	07f00693          	li	a3,127
    80003a44:	40e7873b          	subw	a4,a5,a4
    80003a48:	02e6e263          	bltu	a3,a4,80003a6c <consoleintr+0x68>
    80003a4c:	00d00713          	li	a4,13
    80003a50:	04e48063          	beq	s1,a4,80003a90 <consoleintr+0x8c>
    80003a54:	07f7f713          	andi	a4,a5,127
    80003a58:	00e90733          	add	a4,s2,a4
    80003a5c:	0017879b          	addiw	a5,a5,1
    80003a60:	0af92023          	sw	a5,160(s2)
    80003a64:	00970c23          	sb	s1,24(a4)
    80003a68:	08f92e23          	sw	a5,156(s2)
    80003a6c:	01013403          	ld	s0,16(sp)
    80003a70:	01813083          	ld	ra,24(sp)
    80003a74:	00813483          	ld	s1,8(sp)
    80003a78:	00013903          	ld	s2,0(sp)
    80003a7c:	00005517          	auipc	a0,0x5
    80003a80:	81c50513          	addi	a0,a0,-2020 # 80008298 <cons>
    80003a84:	02010113          	addi	sp,sp,32
    80003a88:	00001317          	auipc	t1,0x1
    80003a8c:	eb030067          	jr	-336(t1) # 80004938 <release>
    80003a90:	00a00493          	li	s1,10
    80003a94:	fc1ff06f          	j	80003a54 <consoleintr+0x50>

0000000080003a98 <consoleinit>:
    80003a98:	fe010113          	addi	sp,sp,-32
    80003a9c:	00113c23          	sd	ra,24(sp)
    80003aa0:	00813823          	sd	s0,16(sp)
    80003aa4:	00913423          	sd	s1,8(sp)
    80003aa8:	02010413          	addi	s0,sp,32
    80003aac:	00004497          	auipc	s1,0x4
    80003ab0:	7ec48493          	addi	s1,s1,2028 # 80008298 <cons>
    80003ab4:	00048513          	mv	a0,s1
    80003ab8:	00003597          	auipc	a1,0x3
    80003abc:	ab058593          	addi	a1,a1,-1360 # 80006568 <CONSOLE_STATUS+0x558>
    80003ac0:	00001097          	auipc	ra,0x1
    80003ac4:	d88080e7          	jalr	-632(ra) # 80004848 <initlock>
    80003ac8:	00000097          	auipc	ra,0x0
    80003acc:	7ac080e7          	jalr	1964(ra) # 80004274 <uartinit>
    80003ad0:	01813083          	ld	ra,24(sp)
    80003ad4:	01013403          	ld	s0,16(sp)
    80003ad8:	00000797          	auipc	a5,0x0
    80003adc:	d9c78793          	addi	a5,a5,-612 # 80003874 <consoleread>
    80003ae0:	0af4bc23          	sd	a5,184(s1)
    80003ae4:	00000797          	auipc	a5,0x0
    80003ae8:	cec78793          	addi	a5,a5,-788 # 800037d0 <consolewrite>
    80003aec:	0cf4b023          	sd	a5,192(s1)
    80003af0:	00813483          	ld	s1,8(sp)
    80003af4:	02010113          	addi	sp,sp,32
    80003af8:	00008067          	ret

0000000080003afc <console_read>:
    80003afc:	ff010113          	addi	sp,sp,-16
    80003b00:	00813423          	sd	s0,8(sp)
    80003b04:	01010413          	addi	s0,sp,16
    80003b08:	00813403          	ld	s0,8(sp)
    80003b0c:	00005317          	auipc	t1,0x5
    80003b10:	84433303          	ld	t1,-1980(t1) # 80008350 <devsw+0x10>
    80003b14:	01010113          	addi	sp,sp,16
    80003b18:	00030067          	jr	t1

0000000080003b1c <console_write>:
    80003b1c:	ff010113          	addi	sp,sp,-16
    80003b20:	00813423          	sd	s0,8(sp)
    80003b24:	01010413          	addi	s0,sp,16
    80003b28:	00813403          	ld	s0,8(sp)
    80003b2c:	00005317          	auipc	t1,0x5
    80003b30:	82c33303          	ld	t1,-2004(t1) # 80008358 <devsw+0x18>
    80003b34:	01010113          	addi	sp,sp,16
    80003b38:	00030067          	jr	t1

0000000080003b3c <panic>:
    80003b3c:	fe010113          	addi	sp,sp,-32
    80003b40:	00113c23          	sd	ra,24(sp)
    80003b44:	00813823          	sd	s0,16(sp)
    80003b48:	00913423          	sd	s1,8(sp)
    80003b4c:	02010413          	addi	s0,sp,32
    80003b50:	00050493          	mv	s1,a0
    80003b54:	00003517          	auipc	a0,0x3
    80003b58:	a1c50513          	addi	a0,a0,-1508 # 80006570 <CONSOLE_STATUS+0x560>
    80003b5c:	00005797          	auipc	a5,0x5
    80003b60:	8807ae23          	sw	zero,-1892(a5) # 800083f8 <pr+0x18>
    80003b64:	00000097          	auipc	ra,0x0
    80003b68:	034080e7          	jalr	52(ra) # 80003b98 <__printf>
    80003b6c:	00048513          	mv	a0,s1
    80003b70:	00000097          	auipc	ra,0x0
    80003b74:	028080e7          	jalr	40(ra) # 80003b98 <__printf>
    80003b78:	00003517          	auipc	a0,0x3
    80003b7c:	9d850513          	addi	a0,a0,-1576 # 80006550 <CONSOLE_STATUS+0x540>
    80003b80:	00000097          	auipc	ra,0x0
    80003b84:	018080e7          	jalr	24(ra) # 80003b98 <__printf>
    80003b88:	00100793          	li	a5,1
    80003b8c:	00003717          	auipc	a4,0x3
    80003b90:	5cf72623          	sw	a5,1484(a4) # 80007158 <panicked>
    80003b94:	0000006f          	j	80003b94 <panic+0x58>

0000000080003b98 <__printf>:
    80003b98:	f3010113          	addi	sp,sp,-208
    80003b9c:	08813023          	sd	s0,128(sp)
    80003ba0:	07313423          	sd	s3,104(sp)
    80003ba4:	09010413          	addi	s0,sp,144
    80003ba8:	05813023          	sd	s8,64(sp)
    80003bac:	08113423          	sd	ra,136(sp)
    80003bb0:	06913c23          	sd	s1,120(sp)
    80003bb4:	07213823          	sd	s2,112(sp)
    80003bb8:	07413023          	sd	s4,96(sp)
    80003bbc:	05513c23          	sd	s5,88(sp)
    80003bc0:	05613823          	sd	s6,80(sp)
    80003bc4:	05713423          	sd	s7,72(sp)
    80003bc8:	03913c23          	sd	s9,56(sp)
    80003bcc:	03a13823          	sd	s10,48(sp)
    80003bd0:	03b13423          	sd	s11,40(sp)
    80003bd4:	00005317          	auipc	t1,0x5
    80003bd8:	80c30313          	addi	t1,t1,-2036 # 800083e0 <pr>
    80003bdc:	01832c03          	lw	s8,24(t1)
    80003be0:	00b43423          	sd	a1,8(s0)
    80003be4:	00c43823          	sd	a2,16(s0)
    80003be8:	00d43c23          	sd	a3,24(s0)
    80003bec:	02e43023          	sd	a4,32(s0)
    80003bf0:	02f43423          	sd	a5,40(s0)
    80003bf4:	03043823          	sd	a6,48(s0)
    80003bf8:	03143c23          	sd	a7,56(s0)
    80003bfc:	00050993          	mv	s3,a0
    80003c00:	4a0c1663          	bnez	s8,800040ac <__printf+0x514>
    80003c04:	60098c63          	beqz	s3,8000421c <__printf+0x684>
    80003c08:	0009c503          	lbu	a0,0(s3)
    80003c0c:	00840793          	addi	a5,s0,8
    80003c10:	f6f43c23          	sd	a5,-136(s0)
    80003c14:	00000493          	li	s1,0
    80003c18:	22050063          	beqz	a0,80003e38 <__printf+0x2a0>
    80003c1c:	00002a37          	lui	s4,0x2
    80003c20:	00018ab7          	lui	s5,0x18
    80003c24:	000f4b37          	lui	s6,0xf4
    80003c28:	00989bb7          	lui	s7,0x989
    80003c2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003c30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003c34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003c38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003c3c:	00148c9b          	addiw	s9,s1,1
    80003c40:	02500793          	li	a5,37
    80003c44:	01998933          	add	s2,s3,s9
    80003c48:	38f51263          	bne	a0,a5,80003fcc <__printf+0x434>
    80003c4c:	00094783          	lbu	a5,0(s2)
    80003c50:	00078c9b          	sext.w	s9,a5
    80003c54:	1e078263          	beqz	a5,80003e38 <__printf+0x2a0>
    80003c58:	0024849b          	addiw	s1,s1,2
    80003c5c:	07000713          	li	a4,112
    80003c60:	00998933          	add	s2,s3,s1
    80003c64:	38e78a63          	beq	a5,a4,80003ff8 <__printf+0x460>
    80003c68:	20f76863          	bltu	a4,a5,80003e78 <__printf+0x2e0>
    80003c6c:	42a78863          	beq	a5,a0,8000409c <__printf+0x504>
    80003c70:	06400713          	li	a4,100
    80003c74:	40e79663          	bne	a5,a4,80004080 <__printf+0x4e8>
    80003c78:	f7843783          	ld	a5,-136(s0)
    80003c7c:	0007a603          	lw	a2,0(a5)
    80003c80:	00878793          	addi	a5,a5,8
    80003c84:	f6f43c23          	sd	a5,-136(s0)
    80003c88:	42064a63          	bltz	a2,800040bc <__printf+0x524>
    80003c8c:	00a00713          	li	a4,10
    80003c90:	02e677bb          	remuw	a5,a2,a4
    80003c94:	00003d97          	auipc	s11,0x3
    80003c98:	904d8d93          	addi	s11,s11,-1788 # 80006598 <digits>
    80003c9c:	00900593          	li	a1,9
    80003ca0:	0006051b          	sext.w	a0,a2
    80003ca4:	00000c93          	li	s9,0
    80003ca8:	02079793          	slli	a5,a5,0x20
    80003cac:	0207d793          	srli	a5,a5,0x20
    80003cb0:	00fd87b3          	add	a5,s11,a5
    80003cb4:	0007c783          	lbu	a5,0(a5)
    80003cb8:	02e656bb          	divuw	a3,a2,a4
    80003cbc:	f8f40023          	sb	a5,-128(s0)
    80003cc0:	14c5d863          	bge	a1,a2,80003e10 <__printf+0x278>
    80003cc4:	06300593          	li	a1,99
    80003cc8:	00100c93          	li	s9,1
    80003ccc:	02e6f7bb          	remuw	a5,a3,a4
    80003cd0:	02079793          	slli	a5,a5,0x20
    80003cd4:	0207d793          	srli	a5,a5,0x20
    80003cd8:	00fd87b3          	add	a5,s11,a5
    80003cdc:	0007c783          	lbu	a5,0(a5)
    80003ce0:	02e6d73b          	divuw	a4,a3,a4
    80003ce4:	f8f400a3          	sb	a5,-127(s0)
    80003ce8:	12a5f463          	bgeu	a1,a0,80003e10 <__printf+0x278>
    80003cec:	00a00693          	li	a3,10
    80003cf0:	00900593          	li	a1,9
    80003cf4:	02d777bb          	remuw	a5,a4,a3
    80003cf8:	02079793          	slli	a5,a5,0x20
    80003cfc:	0207d793          	srli	a5,a5,0x20
    80003d00:	00fd87b3          	add	a5,s11,a5
    80003d04:	0007c503          	lbu	a0,0(a5)
    80003d08:	02d757bb          	divuw	a5,a4,a3
    80003d0c:	f8a40123          	sb	a0,-126(s0)
    80003d10:	48e5f263          	bgeu	a1,a4,80004194 <__printf+0x5fc>
    80003d14:	06300513          	li	a0,99
    80003d18:	02d7f5bb          	remuw	a1,a5,a3
    80003d1c:	02059593          	slli	a1,a1,0x20
    80003d20:	0205d593          	srli	a1,a1,0x20
    80003d24:	00bd85b3          	add	a1,s11,a1
    80003d28:	0005c583          	lbu	a1,0(a1)
    80003d2c:	02d7d7bb          	divuw	a5,a5,a3
    80003d30:	f8b401a3          	sb	a1,-125(s0)
    80003d34:	48e57263          	bgeu	a0,a4,800041b8 <__printf+0x620>
    80003d38:	3e700513          	li	a0,999
    80003d3c:	02d7f5bb          	remuw	a1,a5,a3
    80003d40:	02059593          	slli	a1,a1,0x20
    80003d44:	0205d593          	srli	a1,a1,0x20
    80003d48:	00bd85b3          	add	a1,s11,a1
    80003d4c:	0005c583          	lbu	a1,0(a1)
    80003d50:	02d7d7bb          	divuw	a5,a5,a3
    80003d54:	f8b40223          	sb	a1,-124(s0)
    80003d58:	46e57663          	bgeu	a0,a4,800041c4 <__printf+0x62c>
    80003d5c:	02d7f5bb          	remuw	a1,a5,a3
    80003d60:	02059593          	slli	a1,a1,0x20
    80003d64:	0205d593          	srli	a1,a1,0x20
    80003d68:	00bd85b3          	add	a1,s11,a1
    80003d6c:	0005c583          	lbu	a1,0(a1)
    80003d70:	02d7d7bb          	divuw	a5,a5,a3
    80003d74:	f8b402a3          	sb	a1,-123(s0)
    80003d78:	46ea7863          	bgeu	s4,a4,800041e8 <__printf+0x650>
    80003d7c:	02d7f5bb          	remuw	a1,a5,a3
    80003d80:	02059593          	slli	a1,a1,0x20
    80003d84:	0205d593          	srli	a1,a1,0x20
    80003d88:	00bd85b3          	add	a1,s11,a1
    80003d8c:	0005c583          	lbu	a1,0(a1)
    80003d90:	02d7d7bb          	divuw	a5,a5,a3
    80003d94:	f8b40323          	sb	a1,-122(s0)
    80003d98:	3eeaf863          	bgeu	s5,a4,80004188 <__printf+0x5f0>
    80003d9c:	02d7f5bb          	remuw	a1,a5,a3
    80003da0:	02059593          	slli	a1,a1,0x20
    80003da4:	0205d593          	srli	a1,a1,0x20
    80003da8:	00bd85b3          	add	a1,s11,a1
    80003dac:	0005c583          	lbu	a1,0(a1)
    80003db0:	02d7d7bb          	divuw	a5,a5,a3
    80003db4:	f8b403a3          	sb	a1,-121(s0)
    80003db8:	42eb7e63          	bgeu	s6,a4,800041f4 <__printf+0x65c>
    80003dbc:	02d7f5bb          	remuw	a1,a5,a3
    80003dc0:	02059593          	slli	a1,a1,0x20
    80003dc4:	0205d593          	srli	a1,a1,0x20
    80003dc8:	00bd85b3          	add	a1,s11,a1
    80003dcc:	0005c583          	lbu	a1,0(a1)
    80003dd0:	02d7d7bb          	divuw	a5,a5,a3
    80003dd4:	f8b40423          	sb	a1,-120(s0)
    80003dd8:	42ebfc63          	bgeu	s7,a4,80004210 <__printf+0x678>
    80003ddc:	02079793          	slli	a5,a5,0x20
    80003de0:	0207d793          	srli	a5,a5,0x20
    80003de4:	00fd8db3          	add	s11,s11,a5
    80003de8:	000dc703          	lbu	a4,0(s11)
    80003dec:	00a00793          	li	a5,10
    80003df0:	00900c93          	li	s9,9
    80003df4:	f8e404a3          	sb	a4,-119(s0)
    80003df8:	00065c63          	bgez	a2,80003e10 <__printf+0x278>
    80003dfc:	f9040713          	addi	a4,s0,-112
    80003e00:	00f70733          	add	a4,a4,a5
    80003e04:	02d00693          	li	a3,45
    80003e08:	fed70823          	sb	a3,-16(a4)
    80003e0c:	00078c93          	mv	s9,a5
    80003e10:	f8040793          	addi	a5,s0,-128
    80003e14:	01978cb3          	add	s9,a5,s9
    80003e18:	f7f40d13          	addi	s10,s0,-129
    80003e1c:	000cc503          	lbu	a0,0(s9)
    80003e20:	fffc8c93          	addi	s9,s9,-1
    80003e24:	00000097          	auipc	ra,0x0
    80003e28:	b90080e7          	jalr	-1136(ra) # 800039b4 <consputc>
    80003e2c:	ffac98e3          	bne	s9,s10,80003e1c <__printf+0x284>
    80003e30:	00094503          	lbu	a0,0(s2)
    80003e34:	e00514e3          	bnez	a0,80003c3c <__printf+0xa4>
    80003e38:	1a0c1663          	bnez	s8,80003fe4 <__printf+0x44c>
    80003e3c:	08813083          	ld	ra,136(sp)
    80003e40:	08013403          	ld	s0,128(sp)
    80003e44:	07813483          	ld	s1,120(sp)
    80003e48:	07013903          	ld	s2,112(sp)
    80003e4c:	06813983          	ld	s3,104(sp)
    80003e50:	06013a03          	ld	s4,96(sp)
    80003e54:	05813a83          	ld	s5,88(sp)
    80003e58:	05013b03          	ld	s6,80(sp)
    80003e5c:	04813b83          	ld	s7,72(sp)
    80003e60:	04013c03          	ld	s8,64(sp)
    80003e64:	03813c83          	ld	s9,56(sp)
    80003e68:	03013d03          	ld	s10,48(sp)
    80003e6c:	02813d83          	ld	s11,40(sp)
    80003e70:	0d010113          	addi	sp,sp,208
    80003e74:	00008067          	ret
    80003e78:	07300713          	li	a4,115
    80003e7c:	1ce78a63          	beq	a5,a4,80004050 <__printf+0x4b8>
    80003e80:	07800713          	li	a4,120
    80003e84:	1ee79e63          	bne	a5,a4,80004080 <__printf+0x4e8>
    80003e88:	f7843783          	ld	a5,-136(s0)
    80003e8c:	0007a703          	lw	a4,0(a5)
    80003e90:	00878793          	addi	a5,a5,8
    80003e94:	f6f43c23          	sd	a5,-136(s0)
    80003e98:	28074263          	bltz	a4,8000411c <__printf+0x584>
    80003e9c:	00002d97          	auipc	s11,0x2
    80003ea0:	6fcd8d93          	addi	s11,s11,1788 # 80006598 <digits>
    80003ea4:	00f77793          	andi	a5,a4,15
    80003ea8:	00fd87b3          	add	a5,s11,a5
    80003eac:	0007c683          	lbu	a3,0(a5)
    80003eb0:	00f00613          	li	a2,15
    80003eb4:	0007079b          	sext.w	a5,a4
    80003eb8:	f8d40023          	sb	a3,-128(s0)
    80003ebc:	0047559b          	srliw	a1,a4,0x4
    80003ec0:	0047569b          	srliw	a3,a4,0x4
    80003ec4:	00000c93          	li	s9,0
    80003ec8:	0ee65063          	bge	a2,a4,80003fa8 <__printf+0x410>
    80003ecc:	00f6f693          	andi	a3,a3,15
    80003ed0:	00dd86b3          	add	a3,s11,a3
    80003ed4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003ed8:	0087d79b          	srliw	a5,a5,0x8
    80003edc:	00100c93          	li	s9,1
    80003ee0:	f8d400a3          	sb	a3,-127(s0)
    80003ee4:	0cb67263          	bgeu	a2,a1,80003fa8 <__printf+0x410>
    80003ee8:	00f7f693          	andi	a3,a5,15
    80003eec:	00dd86b3          	add	a3,s11,a3
    80003ef0:	0006c583          	lbu	a1,0(a3)
    80003ef4:	00f00613          	li	a2,15
    80003ef8:	0047d69b          	srliw	a3,a5,0x4
    80003efc:	f8b40123          	sb	a1,-126(s0)
    80003f00:	0047d593          	srli	a1,a5,0x4
    80003f04:	28f67e63          	bgeu	a2,a5,800041a0 <__printf+0x608>
    80003f08:	00f6f693          	andi	a3,a3,15
    80003f0c:	00dd86b3          	add	a3,s11,a3
    80003f10:	0006c503          	lbu	a0,0(a3)
    80003f14:	0087d813          	srli	a6,a5,0x8
    80003f18:	0087d69b          	srliw	a3,a5,0x8
    80003f1c:	f8a401a3          	sb	a0,-125(s0)
    80003f20:	28b67663          	bgeu	a2,a1,800041ac <__printf+0x614>
    80003f24:	00f6f693          	andi	a3,a3,15
    80003f28:	00dd86b3          	add	a3,s11,a3
    80003f2c:	0006c583          	lbu	a1,0(a3)
    80003f30:	00c7d513          	srli	a0,a5,0xc
    80003f34:	00c7d69b          	srliw	a3,a5,0xc
    80003f38:	f8b40223          	sb	a1,-124(s0)
    80003f3c:	29067a63          	bgeu	a2,a6,800041d0 <__printf+0x638>
    80003f40:	00f6f693          	andi	a3,a3,15
    80003f44:	00dd86b3          	add	a3,s11,a3
    80003f48:	0006c583          	lbu	a1,0(a3)
    80003f4c:	0107d813          	srli	a6,a5,0x10
    80003f50:	0107d69b          	srliw	a3,a5,0x10
    80003f54:	f8b402a3          	sb	a1,-123(s0)
    80003f58:	28a67263          	bgeu	a2,a0,800041dc <__printf+0x644>
    80003f5c:	00f6f693          	andi	a3,a3,15
    80003f60:	00dd86b3          	add	a3,s11,a3
    80003f64:	0006c683          	lbu	a3,0(a3)
    80003f68:	0147d79b          	srliw	a5,a5,0x14
    80003f6c:	f8d40323          	sb	a3,-122(s0)
    80003f70:	21067663          	bgeu	a2,a6,8000417c <__printf+0x5e4>
    80003f74:	02079793          	slli	a5,a5,0x20
    80003f78:	0207d793          	srli	a5,a5,0x20
    80003f7c:	00fd8db3          	add	s11,s11,a5
    80003f80:	000dc683          	lbu	a3,0(s11)
    80003f84:	00800793          	li	a5,8
    80003f88:	00700c93          	li	s9,7
    80003f8c:	f8d403a3          	sb	a3,-121(s0)
    80003f90:	00075c63          	bgez	a4,80003fa8 <__printf+0x410>
    80003f94:	f9040713          	addi	a4,s0,-112
    80003f98:	00f70733          	add	a4,a4,a5
    80003f9c:	02d00693          	li	a3,45
    80003fa0:	fed70823          	sb	a3,-16(a4)
    80003fa4:	00078c93          	mv	s9,a5
    80003fa8:	f8040793          	addi	a5,s0,-128
    80003fac:	01978cb3          	add	s9,a5,s9
    80003fb0:	f7f40d13          	addi	s10,s0,-129
    80003fb4:	000cc503          	lbu	a0,0(s9)
    80003fb8:	fffc8c93          	addi	s9,s9,-1
    80003fbc:	00000097          	auipc	ra,0x0
    80003fc0:	9f8080e7          	jalr	-1544(ra) # 800039b4 <consputc>
    80003fc4:	ff9d18e3          	bne	s10,s9,80003fb4 <__printf+0x41c>
    80003fc8:	0100006f          	j	80003fd8 <__printf+0x440>
    80003fcc:	00000097          	auipc	ra,0x0
    80003fd0:	9e8080e7          	jalr	-1560(ra) # 800039b4 <consputc>
    80003fd4:	000c8493          	mv	s1,s9
    80003fd8:	00094503          	lbu	a0,0(s2)
    80003fdc:	c60510e3          	bnez	a0,80003c3c <__printf+0xa4>
    80003fe0:	e40c0ee3          	beqz	s8,80003e3c <__printf+0x2a4>
    80003fe4:	00004517          	auipc	a0,0x4
    80003fe8:	3fc50513          	addi	a0,a0,1020 # 800083e0 <pr>
    80003fec:	00001097          	auipc	ra,0x1
    80003ff0:	94c080e7          	jalr	-1716(ra) # 80004938 <release>
    80003ff4:	e49ff06f          	j	80003e3c <__printf+0x2a4>
    80003ff8:	f7843783          	ld	a5,-136(s0)
    80003ffc:	03000513          	li	a0,48
    80004000:	01000d13          	li	s10,16
    80004004:	00878713          	addi	a4,a5,8
    80004008:	0007bc83          	ld	s9,0(a5)
    8000400c:	f6e43c23          	sd	a4,-136(s0)
    80004010:	00000097          	auipc	ra,0x0
    80004014:	9a4080e7          	jalr	-1628(ra) # 800039b4 <consputc>
    80004018:	07800513          	li	a0,120
    8000401c:	00000097          	auipc	ra,0x0
    80004020:	998080e7          	jalr	-1640(ra) # 800039b4 <consputc>
    80004024:	00002d97          	auipc	s11,0x2
    80004028:	574d8d93          	addi	s11,s11,1396 # 80006598 <digits>
    8000402c:	03ccd793          	srli	a5,s9,0x3c
    80004030:	00fd87b3          	add	a5,s11,a5
    80004034:	0007c503          	lbu	a0,0(a5)
    80004038:	fffd0d1b          	addiw	s10,s10,-1
    8000403c:	004c9c93          	slli	s9,s9,0x4
    80004040:	00000097          	auipc	ra,0x0
    80004044:	974080e7          	jalr	-1676(ra) # 800039b4 <consputc>
    80004048:	fe0d12e3          	bnez	s10,8000402c <__printf+0x494>
    8000404c:	f8dff06f          	j	80003fd8 <__printf+0x440>
    80004050:	f7843783          	ld	a5,-136(s0)
    80004054:	0007bc83          	ld	s9,0(a5)
    80004058:	00878793          	addi	a5,a5,8
    8000405c:	f6f43c23          	sd	a5,-136(s0)
    80004060:	000c9a63          	bnez	s9,80004074 <__printf+0x4dc>
    80004064:	1080006f          	j	8000416c <__printf+0x5d4>
    80004068:	001c8c93          	addi	s9,s9,1
    8000406c:	00000097          	auipc	ra,0x0
    80004070:	948080e7          	jalr	-1720(ra) # 800039b4 <consputc>
    80004074:	000cc503          	lbu	a0,0(s9)
    80004078:	fe0518e3          	bnez	a0,80004068 <__printf+0x4d0>
    8000407c:	f5dff06f          	j	80003fd8 <__printf+0x440>
    80004080:	02500513          	li	a0,37
    80004084:	00000097          	auipc	ra,0x0
    80004088:	930080e7          	jalr	-1744(ra) # 800039b4 <consputc>
    8000408c:	000c8513          	mv	a0,s9
    80004090:	00000097          	auipc	ra,0x0
    80004094:	924080e7          	jalr	-1756(ra) # 800039b4 <consputc>
    80004098:	f41ff06f          	j	80003fd8 <__printf+0x440>
    8000409c:	02500513          	li	a0,37
    800040a0:	00000097          	auipc	ra,0x0
    800040a4:	914080e7          	jalr	-1772(ra) # 800039b4 <consputc>
    800040a8:	f31ff06f          	j	80003fd8 <__printf+0x440>
    800040ac:	00030513          	mv	a0,t1
    800040b0:	00000097          	auipc	ra,0x0
    800040b4:	7bc080e7          	jalr	1980(ra) # 8000486c <acquire>
    800040b8:	b4dff06f          	j	80003c04 <__printf+0x6c>
    800040bc:	40c0053b          	negw	a0,a2
    800040c0:	00a00713          	li	a4,10
    800040c4:	02e576bb          	remuw	a3,a0,a4
    800040c8:	00002d97          	auipc	s11,0x2
    800040cc:	4d0d8d93          	addi	s11,s11,1232 # 80006598 <digits>
    800040d0:	ff700593          	li	a1,-9
    800040d4:	02069693          	slli	a3,a3,0x20
    800040d8:	0206d693          	srli	a3,a3,0x20
    800040dc:	00dd86b3          	add	a3,s11,a3
    800040e0:	0006c683          	lbu	a3,0(a3)
    800040e4:	02e557bb          	divuw	a5,a0,a4
    800040e8:	f8d40023          	sb	a3,-128(s0)
    800040ec:	10b65e63          	bge	a2,a1,80004208 <__printf+0x670>
    800040f0:	06300593          	li	a1,99
    800040f4:	02e7f6bb          	remuw	a3,a5,a4
    800040f8:	02069693          	slli	a3,a3,0x20
    800040fc:	0206d693          	srli	a3,a3,0x20
    80004100:	00dd86b3          	add	a3,s11,a3
    80004104:	0006c683          	lbu	a3,0(a3)
    80004108:	02e7d73b          	divuw	a4,a5,a4
    8000410c:	00200793          	li	a5,2
    80004110:	f8d400a3          	sb	a3,-127(s0)
    80004114:	bca5ece3          	bltu	a1,a0,80003cec <__printf+0x154>
    80004118:	ce5ff06f          	j	80003dfc <__printf+0x264>
    8000411c:	40e007bb          	negw	a5,a4
    80004120:	00002d97          	auipc	s11,0x2
    80004124:	478d8d93          	addi	s11,s11,1144 # 80006598 <digits>
    80004128:	00f7f693          	andi	a3,a5,15
    8000412c:	00dd86b3          	add	a3,s11,a3
    80004130:	0006c583          	lbu	a1,0(a3)
    80004134:	ff100613          	li	a2,-15
    80004138:	0047d69b          	srliw	a3,a5,0x4
    8000413c:	f8b40023          	sb	a1,-128(s0)
    80004140:	0047d59b          	srliw	a1,a5,0x4
    80004144:	0ac75e63          	bge	a4,a2,80004200 <__printf+0x668>
    80004148:	00f6f693          	andi	a3,a3,15
    8000414c:	00dd86b3          	add	a3,s11,a3
    80004150:	0006c603          	lbu	a2,0(a3)
    80004154:	00f00693          	li	a3,15
    80004158:	0087d79b          	srliw	a5,a5,0x8
    8000415c:	f8c400a3          	sb	a2,-127(s0)
    80004160:	d8b6e4e3          	bltu	a3,a1,80003ee8 <__printf+0x350>
    80004164:	00200793          	li	a5,2
    80004168:	e2dff06f          	j	80003f94 <__printf+0x3fc>
    8000416c:	00002c97          	auipc	s9,0x2
    80004170:	40cc8c93          	addi	s9,s9,1036 # 80006578 <CONSOLE_STATUS+0x568>
    80004174:	02800513          	li	a0,40
    80004178:	ef1ff06f          	j	80004068 <__printf+0x4d0>
    8000417c:	00700793          	li	a5,7
    80004180:	00600c93          	li	s9,6
    80004184:	e0dff06f          	j	80003f90 <__printf+0x3f8>
    80004188:	00700793          	li	a5,7
    8000418c:	00600c93          	li	s9,6
    80004190:	c69ff06f          	j	80003df8 <__printf+0x260>
    80004194:	00300793          	li	a5,3
    80004198:	00200c93          	li	s9,2
    8000419c:	c5dff06f          	j	80003df8 <__printf+0x260>
    800041a0:	00300793          	li	a5,3
    800041a4:	00200c93          	li	s9,2
    800041a8:	de9ff06f          	j	80003f90 <__printf+0x3f8>
    800041ac:	00400793          	li	a5,4
    800041b0:	00300c93          	li	s9,3
    800041b4:	dddff06f          	j	80003f90 <__printf+0x3f8>
    800041b8:	00400793          	li	a5,4
    800041bc:	00300c93          	li	s9,3
    800041c0:	c39ff06f          	j	80003df8 <__printf+0x260>
    800041c4:	00500793          	li	a5,5
    800041c8:	00400c93          	li	s9,4
    800041cc:	c2dff06f          	j	80003df8 <__printf+0x260>
    800041d0:	00500793          	li	a5,5
    800041d4:	00400c93          	li	s9,4
    800041d8:	db9ff06f          	j	80003f90 <__printf+0x3f8>
    800041dc:	00600793          	li	a5,6
    800041e0:	00500c93          	li	s9,5
    800041e4:	dadff06f          	j	80003f90 <__printf+0x3f8>
    800041e8:	00600793          	li	a5,6
    800041ec:	00500c93          	li	s9,5
    800041f0:	c09ff06f          	j	80003df8 <__printf+0x260>
    800041f4:	00800793          	li	a5,8
    800041f8:	00700c93          	li	s9,7
    800041fc:	bfdff06f          	j	80003df8 <__printf+0x260>
    80004200:	00100793          	li	a5,1
    80004204:	d91ff06f          	j	80003f94 <__printf+0x3fc>
    80004208:	00100793          	li	a5,1
    8000420c:	bf1ff06f          	j	80003dfc <__printf+0x264>
    80004210:	00900793          	li	a5,9
    80004214:	00800c93          	li	s9,8
    80004218:	be1ff06f          	j	80003df8 <__printf+0x260>
    8000421c:	00002517          	auipc	a0,0x2
    80004220:	36450513          	addi	a0,a0,868 # 80006580 <CONSOLE_STATUS+0x570>
    80004224:	00000097          	auipc	ra,0x0
    80004228:	918080e7          	jalr	-1768(ra) # 80003b3c <panic>

000000008000422c <printfinit>:
    8000422c:	fe010113          	addi	sp,sp,-32
    80004230:	00813823          	sd	s0,16(sp)
    80004234:	00913423          	sd	s1,8(sp)
    80004238:	00113c23          	sd	ra,24(sp)
    8000423c:	02010413          	addi	s0,sp,32
    80004240:	00004497          	auipc	s1,0x4
    80004244:	1a048493          	addi	s1,s1,416 # 800083e0 <pr>
    80004248:	00048513          	mv	a0,s1
    8000424c:	00002597          	auipc	a1,0x2
    80004250:	34458593          	addi	a1,a1,836 # 80006590 <CONSOLE_STATUS+0x580>
    80004254:	00000097          	auipc	ra,0x0
    80004258:	5f4080e7          	jalr	1524(ra) # 80004848 <initlock>
    8000425c:	01813083          	ld	ra,24(sp)
    80004260:	01013403          	ld	s0,16(sp)
    80004264:	0004ac23          	sw	zero,24(s1)
    80004268:	00813483          	ld	s1,8(sp)
    8000426c:	02010113          	addi	sp,sp,32
    80004270:	00008067          	ret

0000000080004274 <uartinit>:
    80004274:	ff010113          	addi	sp,sp,-16
    80004278:	00813423          	sd	s0,8(sp)
    8000427c:	01010413          	addi	s0,sp,16
    80004280:	100007b7          	lui	a5,0x10000
    80004284:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004288:	f8000713          	li	a4,-128
    8000428c:	00e781a3          	sb	a4,3(a5)
    80004290:	00300713          	li	a4,3
    80004294:	00e78023          	sb	a4,0(a5)
    80004298:	000780a3          	sb	zero,1(a5)
    8000429c:	00e781a3          	sb	a4,3(a5)
    800042a0:	00700693          	li	a3,7
    800042a4:	00d78123          	sb	a3,2(a5)
    800042a8:	00e780a3          	sb	a4,1(a5)
    800042ac:	00813403          	ld	s0,8(sp)
    800042b0:	01010113          	addi	sp,sp,16
    800042b4:	00008067          	ret

00000000800042b8 <uartputc>:
    800042b8:	00003797          	auipc	a5,0x3
    800042bc:	ea07a783          	lw	a5,-352(a5) # 80007158 <panicked>
    800042c0:	00078463          	beqz	a5,800042c8 <uartputc+0x10>
    800042c4:	0000006f          	j	800042c4 <uartputc+0xc>
    800042c8:	fd010113          	addi	sp,sp,-48
    800042cc:	02813023          	sd	s0,32(sp)
    800042d0:	00913c23          	sd	s1,24(sp)
    800042d4:	01213823          	sd	s2,16(sp)
    800042d8:	01313423          	sd	s3,8(sp)
    800042dc:	02113423          	sd	ra,40(sp)
    800042e0:	03010413          	addi	s0,sp,48
    800042e4:	00003917          	auipc	s2,0x3
    800042e8:	e7c90913          	addi	s2,s2,-388 # 80007160 <uart_tx_r>
    800042ec:	00093783          	ld	a5,0(s2)
    800042f0:	00003497          	auipc	s1,0x3
    800042f4:	e7848493          	addi	s1,s1,-392 # 80007168 <uart_tx_w>
    800042f8:	0004b703          	ld	a4,0(s1)
    800042fc:	02078693          	addi	a3,a5,32
    80004300:	00050993          	mv	s3,a0
    80004304:	02e69c63          	bne	a3,a4,8000433c <uartputc+0x84>
    80004308:	00001097          	auipc	ra,0x1
    8000430c:	834080e7          	jalr	-1996(ra) # 80004b3c <push_on>
    80004310:	00093783          	ld	a5,0(s2)
    80004314:	0004b703          	ld	a4,0(s1)
    80004318:	02078793          	addi	a5,a5,32
    8000431c:	00e79463          	bne	a5,a4,80004324 <uartputc+0x6c>
    80004320:	0000006f          	j	80004320 <uartputc+0x68>
    80004324:	00001097          	auipc	ra,0x1
    80004328:	88c080e7          	jalr	-1908(ra) # 80004bb0 <pop_on>
    8000432c:	00093783          	ld	a5,0(s2)
    80004330:	0004b703          	ld	a4,0(s1)
    80004334:	02078693          	addi	a3,a5,32
    80004338:	fce688e3          	beq	a3,a4,80004308 <uartputc+0x50>
    8000433c:	01f77693          	andi	a3,a4,31
    80004340:	00004597          	auipc	a1,0x4
    80004344:	0c058593          	addi	a1,a1,192 # 80008400 <uart_tx_buf>
    80004348:	00d586b3          	add	a3,a1,a3
    8000434c:	00170713          	addi	a4,a4,1
    80004350:	01368023          	sb	s3,0(a3)
    80004354:	00e4b023          	sd	a4,0(s1)
    80004358:	10000637          	lui	a2,0x10000
    8000435c:	02f71063          	bne	a4,a5,8000437c <uartputc+0xc4>
    80004360:	0340006f          	j	80004394 <uartputc+0xdc>
    80004364:	00074703          	lbu	a4,0(a4)
    80004368:	00f93023          	sd	a5,0(s2)
    8000436c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004370:	00093783          	ld	a5,0(s2)
    80004374:	0004b703          	ld	a4,0(s1)
    80004378:	00f70e63          	beq	a4,a5,80004394 <uartputc+0xdc>
    8000437c:	00564683          	lbu	a3,5(a2)
    80004380:	01f7f713          	andi	a4,a5,31
    80004384:	00e58733          	add	a4,a1,a4
    80004388:	0206f693          	andi	a3,a3,32
    8000438c:	00178793          	addi	a5,a5,1
    80004390:	fc069ae3          	bnez	a3,80004364 <uartputc+0xac>
    80004394:	02813083          	ld	ra,40(sp)
    80004398:	02013403          	ld	s0,32(sp)
    8000439c:	01813483          	ld	s1,24(sp)
    800043a0:	01013903          	ld	s2,16(sp)
    800043a4:	00813983          	ld	s3,8(sp)
    800043a8:	03010113          	addi	sp,sp,48
    800043ac:	00008067          	ret

00000000800043b0 <uartputc_sync>:
    800043b0:	ff010113          	addi	sp,sp,-16
    800043b4:	00813423          	sd	s0,8(sp)
    800043b8:	01010413          	addi	s0,sp,16
    800043bc:	00003717          	auipc	a4,0x3
    800043c0:	d9c72703          	lw	a4,-612(a4) # 80007158 <panicked>
    800043c4:	02071663          	bnez	a4,800043f0 <uartputc_sync+0x40>
    800043c8:	00050793          	mv	a5,a0
    800043cc:	100006b7          	lui	a3,0x10000
    800043d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800043d4:	02077713          	andi	a4,a4,32
    800043d8:	fe070ce3          	beqz	a4,800043d0 <uartputc_sync+0x20>
    800043dc:	0ff7f793          	andi	a5,a5,255
    800043e0:	00f68023          	sb	a5,0(a3)
    800043e4:	00813403          	ld	s0,8(sp)
    800043e8:	01010113          	addi	sp,sp,16
    800043ec:	00008067          	ret
    800043f0:	0000006f          	j	800043f0 <uartputc_sync+0x40>

00000000800043f4 <uartstart>:
    800043f4:	ff010113          	addi	sp,sp,-16
    800043f8:	00813423          	sd	s0,8(sp)
    800043fc:	01010413          	addi	s0,sp,16
    80004400:	00003617          	auipc	a2,0x3
    80004404:	d6060613          	addi	a2,a2,-672 # 80007160 <uart_tx_r>
    80004408:	00003517          	auipc	a0,0x3
    8000440c:	d6050513          	addi	a0,a0,-672 # 80007168 <uart_tx_w>
    80004410:	00063783          	ld	a5,0(a2)
    80004414:	00053703          	ld	a4,0(a0)
    80004418:	04f70263          	beq	a4,a5,8000445c <uartstart+0x68>
    8000441c:	100005b7          	lui	a1,0x10000
    80004420:	00004817          	auipc	a6,0x4
    80004424:	fe080813          	addi	a6,a6,-32 # 80008400 <uart_tx_buf>
    80004428:	01c0006f          	j	80004444 <uartstart+0x50>
    8000442c:	0006c703          	lbu	a4,0(a3)
    80004430:	00f63023          	sd	a5,0(a2)
    80004434:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004438:	00063783          	ld	a5,0(a2)
    8000443c:	00053703          	ld	a4,0(a0)
    80004440:	00f70e63          	beq	a4,a5,8000445c <uartstart+0x68>
    80004444:	01f7f713          	andi	a4,a5,31
    80004448:	00e806b3          	add	a3,a6,a4
    8000444c:	0055c703          	lbu	a4,5(a1)
    80004450:	00178793          	addi	a5,a5,1
    80004454:	02077713          	andi	a4,a4,32
    80004458:	fc071ae3          	bnez	a4,8000442c <uartstart+0x38>
    8000445c:	00813403          	ld	s0,8(sp)
    80004460:	01010113          	addi	sp,sp,16
    80004464:	00008067          	ret

0000000080004468 <uartgetc>:
    80004468:	ff010113          	addi	sp,sp,-16
    8000446c:	00813423          	sd	s0,8(sp)
    80004470:	01010413          	addi	s0,sp,16
    80004474:	10000737          	lui	a4,0x10000
    80004478:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000447c:	0017f793          	andi	a5,a5,1
    80004480:	00078c63          	beqz	a5,80004498 <uartgetc+0x30>
    80004484:	00074503          	lbu	a0,0(a4)
    80004488:	0ff57513          	andi	a0,a0,255
    8000448c:	00813403          	ld	s0,8(sp)
    80004490:	01010113          	addi	sp,sp,16
    80004494:	00008067          	ret
    80004498:	fff00513          	li	a0,-1
    8000449c:	ff1ff06f          	j	8000448c <uartgetc+0x24>

00000000800044a0 <uartintr>:
    800044a0:	100007b7          	lui	a5,0x10000
    800044a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800044a8:	0017f793          	andi	a5,a5,1
    800044ac:	0a078463          	beqz	a5,80004554 <uartintr+0xb4>
    800044b0:	fe010113          	addi	sp,sp,-32
    800044b4:	00813823          	sd	s0,16(sp)
    800044b8:	00913423          	sd	s1,8(sp)
    800044bc:	00113c23          	sd	ra,24(sp)
    800044c0:	02010413          	addi	s0,sp,32
    800044c4:	100004b7          	lui	s1,0x10000
    800044c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800044cc:	0ff57513          	andi	a0,a0,255
    800044d0:	fffff097          	auipc	ra,0xfffff
    800044d4:	534080e7          	jalr	1332(ra) # 80003a04 <consoleintr>
    800044d8:	0054c783          	lbu	a5,5(s1)
    800044dc:	0017f793          	andi	a5,a5,1
    800044e0:	fe0794e3          	bnez	a5,800044c8 <uartintr+0x28>
    800044e4:	00003617          	auipc	a2,0x3
    800044e8:	c7c60613          	addi	a2,a2,-900 # 80007160 <uart_tx_r>
    800044ec:	00003517          	auipc	a0,0x3
    800044f0:	c7c50513          	addi	a0,a0,-900 # 80007168 <uart_tx_w>
    800044f4:	00063783          	ld	a5,0(a2)
    800044f8:	00053703          	ld	a4,0(a0)
    800044fc:	04f70263          	beq	a4,a5,80004540 <uartintr+0xa0>
    80004500:	100005b7          	lui	a1,0x10000
    80004504:	00004817          	auipc	a6,0x4
    80004508:	efc80813          	addi	a6,a6,-260 # 80008400 <uart_tx_buf>
    8000450c:	01c0006f          	j	80004528 <uartintr+0x88>
    80004510:	0006c703          	lbu	a4,0(a3)
    80004514:	00f63023          	sd	a5,0(a2)
    80004518:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000451c:	00063783          	ld	a5,0(a2)
    80004520:	00053703          	ld	a4,0(a0)
    80004524:	00f70e63          	beq	a4,a5,80004540 <uartintr+0xa0>
    80004528:	01f7f713          	andi	a4,a5,31
    8000452c:	00e806b3          	add	a3,a6,a4
    80004530:	0055c703          	lbu	a4,5(a1)
    80004534:	00178793          	addi	a5,a5,1
    80004538:	02077713          	andi	a4,a4,32
    8000453c:	fc071ae3          	bnez	a4,80004510 <uartintr+0x70>
    80004540:	01813083          	ld	ra,24(sp)
    80004544:	01013403          	ld	s0,16(sp)
    80004548:	00813483          	ld	s1,8(sp)
    8000454c:	02010113          	addi	sp,sp,32
    80004550:	00008067          	ret
    80004554:	00003617          	auipc	a2,0x3
    80004558:	c0c60613          	addi	a2,a2,-1012 # 80007160 <uart_tx_r>
    8000455c:	00003517          	auipc	a0,0x3
    80004560:	c0c50513          	addi	a0,a0,-1012 # 80007168 <uart_tx_w>
    80004564:	00063783          	ld	a5,0(a2)
    80004568:	00053703          	ld	a4,0(a0)
    8000456c:	04f70263          	beq	a4,a5,800045b0 <uartintr+0x110>
    80004570:	100005b7          	lui	a1,0x10000
    80004574:	00004817          	auipc	a6,0x4
    80004578:	e8c80813          	addi	a6,a6,-372 # 80008400 <uart_tx_buf>
    8000457c:	01c0006f          	j	80004598 <uartintr+0xf8>
    80004580:	0006c703          	lbu	a4,0(a3)
    80004584:	00f63023          	sd	a5,0(a2)
    80004588:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000458c:	00063783          	ld	a5,0(a2)
    80004590:	00053703          	ld	a4,0(a0)
    80004594:	02f70063          	beq	a4,a5,800045b4 <uartintr+0x114>
    80004598:	01f7f713          	andi	a4,a5,31
    8000459c:	00e806b3          	add	a3,a6,a4
    800045a0:	0055c703          	lbu	a4,5(a1)
    800045a4:	00178793          	addi	a5,a5,1
    800045a8:	02077713          	andi	a4,a4,32
    800045ac:	fc071ae3          	bnez	a4,80004580 <uartintr+0xe0>
    800045b0:	00008067          	ret
    800045b4:	00008067          	ret

00000000800045b8 <kinit>:
    800045b8:	fc010113          	addi	sp,sp,-64
    800045bc:	02913423          	sd	s1,40(sp)
    800045c0:	fffff7b7          	lui	a5,0xfffff
    800045c4:	00005497          	auipc	s1,0x5
    800045c8:	e6b48493          	addi	s1,s1,-405 # 8000942f <end+0xfff>
    800045cc:	02813823          	sd	s0,48(sp)
    800045d0:	01313c23          	sd	s3,24(sp)
    800045d4:	00f4f4b3          	and	s1,s1,a5
    800045d8:	02113c23          	sd	ra,56(sp)
    800045dc:	03213023          	sd	s2,32(sp)
    800045e0:	01413823          	sd	s4,16(sp)
    800045e4:	01513423          	sd	s5,8(sp)
    800045e8:	04010413          	addi	s0,sp,64
    800045ec:	000017b7          	lui	a5,0x1
    800045f0:	01100993          	li	s3,17
    800045f4:	00f487b3          	add	a5,s1,a5
    800045f8:	01b99993          	slli	s3,s3,0x1b
    800045fc:	06f9e063          	bltu	s3,a5,8000465c <kinit+0xa4>
    80004600:	00004a97          	auipc	s5,0x4
    80004604:	e30a8a93          	addi	s5,s5,-464 # 80008430 <end>
    80004608:	0754ec63          	bltu	s1,s5,80004680 <kinit+0xc8>
    8000460c:	0734fa63          	bgeu	s1,s3,80004680 <kinit+0xc8>
    80004610:	00088a37          	lui	s4,0x88
    80004614:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004618:	00003917          	auipc	s2,0x3
    8000461c:	b5890913          	addi	s2,s2,-1192 # 80007170 <kmem>
    80004620:	00ca1a13          	slli	s4,s4,0xc
    80004624:	0140006f          	j	80004638 <kinit+0x80>
    80004628:	000017b7          	lui	a5,0x1
    8000462c:	00f484b3          	add	s1,s1,a5
    80004630:	0554e863          	bltu	s1,s5,80004680 <kinit+0xc8>
    80004634:	0534f663          	bgeu	s1,s3,80004680 <kinit+0xc8>
    80004638:	00001637          	lui	a2,0x1
    8000463c:	00100593          	li	a1,1
    80004640:	00048513          	mv	a0,s1
    80004644:	00000097          	auipc	ra,0x0
    80004648:	5e4080e7          	jalr	1508(ra) # 80004c28 <__memset>
    8000464c:	00093783          	ld	a5,0(s2)
    80004650:	00f4b023          	sd	a5,0(s1)
    80004654:	00993023          	sd	s1,0(s2)
    80004658:	fd4498e3          	bne	s1,s4,80004628 <kinit+0x70>
    8000465c:	03813083          	ld	ra,56(sp)
    80004660:	03013403          	ld	s0,48(sp)
    80004664:	02813483          	ld	s1,40(sp)
    80004668:	02013903          	ld	s2,32(sp)
    8000466c:	01813983          	ld	s3,24(sp)
    80004670:	01013a03          	ld	s4,16(sp)
    80004674:	00813a83          	ld	s5,8(sp)
    80004678:	04010113          	addi	sp,sp,64
    8000467c:	00008067          	ret
    80004680:	00002517          	auipc	a0,0x2
    80004684:	f3050513          	addi	a0,a0,-208 # 800065b0 <digits+0x18>
    80004688:	fffff097          	auipc	ra,0xfffff
    8000468c:	4b4080e7          	jalr	1204(ra) # 80003b3c <panic>

0000000080004690 <freerange>:
    80004690:	fc010113          	addi	sp,sp,-64
    80004694:	000017b7          	lui	a5,0x1
    80004698:	02913423          	sd	s1,40(sp)
    8000469c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800046a0:	009504b3          	add	s1,a0,s1
    800046a4:	fffff537          	lui	a0,0xfffff
    800046a8:	02813823          	sd	s0,48(sp)
    800046ac:	02113c23          	sd	ra,56(sp)
    800046b0:	03213023          	sd	s2,32(sp)
    800046b4:	01313c23          	sd	s3,24(sp)
    800046b8:	01413823          	sd	s4,16(sp)
    800046bc:	01513423          	sd	s5,8(sp)
    800046c0:	01613023          	sd	s6,0(sp)
    800046c4:	04010413          	addi	s0,sp,64
    800046c8:	00a4f4b3          	and	s1,s1,a0
    800046cc:	00f487b3          	add	a5,s1,a5
    800046d0:	06f5e463          	bltu	a1,a5,80004738 <freerange+0xa8>
    800046d4:	00004a97          	auipc	s5,0x4
    800046d8:	d5ca8a93          	addi	s5,s5,-676 # 80008430 <end>
    800046dc:	0954e263          	bltu	s1,s5,80004760 <freerange+0xd0>
    800046e0:	01100993          	li	s3,17
    800046e4:	01b99993          	slli	s3,s3,0x1b
    800046e8:	0734fc63          	bgeu	s1,s3,80004760 <freerange+0xd0>
    800046ec:	00058a13          	mv	s4,a1
    800046f0:	00003917          	auipc	s2,0x3
    800046f4:	a8090913          	addi	s2,s2,-1408 # 80007170 <kmem>
    800046f8:	00002b37          	lui	s6,0x2
    800046fc:	0140006f          	j	80004710 <freerange+0x80>
    80004700:	000017b7          	lui	a5,0x1
    80004704:	00f484b3          	add	s1,s1,a5
    80004708:	0554ec63          	bltu	s1,s5,80004760 <freerange+0xd0>
    8000470c:	0534fa63          	bgeu	s1,s3,80004760 <freerange+0xd0>
    80004710:	00001637          	lui	a2,0x1
    80004714:	00100593          	li	a1,1
    80004718:	00048513          	mv	a0,s1
    8000471c:	00000097          	auipc	ra,0x0
    80004720:	50c080e7          	jalr	1292(ra) # 80004c28 <__memset>
    80004724:	00093703          	ld	a4,0(s2)
    80004728:	016487b3          	add	a5,s1,s6
    8000472c:	00e4b023          	sd	a4,0(s1)
    80004730:	00993023          	sd	s1,0(s2)
    80004734:	fcfa76e3          	bgeu	s4,a5,80004700 <freerange+0x70>
    80004738:	03813083          	ld	ra,56(sp)
    8000473c:	03013403          	ld	s0,48(sp)
    80004740:	02813483          	ld	s1,40(sp)
    80004744:	02013903          	ld	s2,32(sp)
    80004748:	01813983          	ld	s3,24(sp)
    8000474c:	01013a03          	ld	s4,16(sp)
    80004750:	00813a83          	ld	s5,8(sp)
    80004754:	00013b03          	ld	s6,0(sp)
    80004758:	04010113          	addi	sp,sp,64
    8000475c:	00008067          	ret
    80004760:	00002517          	auipc	a0,0x2
    80004764:	e5050513          	addi	a0,a0,-432 # 800065b0 <digits+0x18>
    80004768:	fffff097          	auipc	ra,0xfffff
    8000476c:	3d4080e7          	jalr	980(ra) # 80003b3c <panic>

0000000080004770 <kfree>:
    80004770:	fe010113          	addi	sp,sp,-32
    80004774:	00813823          	sd	s0,16(sp)
    80004778:	00113c23          	sd	ra,24(sp)
    8000477c:	00913423          	sd	s1,8(sp)
    80004780:	02010413          	addi	s0,sp,32
    80004784:	03451793          	slli	a5,a0,0x34
    80004788:	04079c63          	bnez	a5,800047e0 <kfree+0x70>
    8000478c:	00004797          	auipc	a5,0x4
    80004790:	ca478793          	addi	a5,a5,-860 # 80008430 <end>
    80004794:	00050493          	mv	s1,a0
    80004798:	04f56463          	bltu	a0,a5,800047e0 <kfree+0x70>
    8000479c:	01100793          	li	a5,17
    800047a0:	01b79793          	slli	a5,a5,0x1b
    800047a4:	02f57e63          	bgeu	a0,a5,800047e0 <kfree+0x70>
    800047a8:	00001637          	lui	a2,0x1
    800047ac:	00100593          	li	a1,1
    800047b0:	00000097          	auipc	ra,0x0
    800047b4:	478080e7          	jalr	1144(ra) # 80004c28 <__memset>
    800047b8:	00003797          	auipc	a5,0x3
    800047bc:	9b878793          	addi	a5,a5,-1608 # 80007170 <kmem>
    800047c0:	0007b703          	ld	a4,0(a5)
    800047c4:	01813083          	ld	ra,24(sp)
    800047c8:	01013403          	ld	s0,16(sp)
    800047cc:	00e4b023          	sd	a4,0(s1)
    800047d0:	0097b023          	sd	s1,0(a5)
    800047d4:	00813483          	ld	s1,8(sp)
    800047d8:	02010113          	addi	sp,sp,32
    800047dc:	00008067          	ret
    800047e0:	00002517          	auipc	a0,0x2
    800047e4:	dd050513          	addi	a0,a0,-560 # 800065b0 <digits+0x18>
    800047e8:	fffff097          	auipc	ra,0xfffff
    800047ec:	354080e7          	jalr	852(ra) # 80003b3c <panic>

00000000800047f0 <kalloc>:
    800047f0:	fe010113          	addi	sp,sp,-32
    800047f4:	00813823          	sd	s0,16(sp)
    800047f8:	00913423          	sd	s1,8(sp)
    800047fc:	00113c23          	sd	ra,24(sp)
    80004800:	02010413          	addi	s0,sp,32
    80004804:	00003797          	auipc	a5,0x3
    80004808:	96c78793          	addi	a5,a5,-1684 # 80007170 <kmem>
    8000480c:	0007b483          	ld	s1,0(a5)
    80004810:	02048063          	beqz	s1,80004830 <kalloc+0x40>
    80004814:	0004b703          	ld	a4,0(s1)
    80004818:	00001637          	lui	a2,0x1
    8000481c:	00500593          	li	a1,5
    80004820:	00048513          	mv	a0,s1
    80004824:	00e7b023          	sd	a4,0(a5)
    80004828:	00000097          	auipc	ra,0x0
    8000482c:	400080e7          	jalr	1024(ra) # 80004c28 <__memset>
    80004830:	01813083          	ld	ra,24(sp)
    80004834:	01013403          	ld	s0,16(sp)
    80004838:	00048513          	mv	a0,s1
    8000483c:	00813483          	ld	s1,8(sp)
    80004840:	02010113          	addi	sp,sp,32
    80004844:	00008067          	ret

0000000080004848 <initlock>:
    80004848:	ff010113          	addi	sp,sp,-16
    8000484c:	00813423          	sd	s0,8(sp)
    80004850:	01010413          	addi	s0,sp,16
    80004854:	00813403          	ld	s0,8(sp)
    80004858:	00b53423          	sd	a1,8(a0)
    8000485c:	00052023          	sw	zero,0(a0)
    80004860:	00053823          	sd	zero,16(a0)
    80004864:	01010113          	addi	sp,sp,16
    80004868:	00008067          	ret

000000008000486c <acquire>:
    8000486c:	fe010113          	addi	sp,sp,-32
    80004870:	00813823          	sd	s0,16(sp)
    80004874:	00913423          	sd	s1,8(sp)
    80004878:	00113c23          	sd	ra,24(sp)
    8000487c:	01213023          	sd	s2,0(sp)
    80004880:	02010413          	addi	s0,sp,32
    80004884:	00050493          	mv	s1,a0
    80004888:	10002973          	csrr	s2,sstatus
    8000488c:	100027f3          	csrr	a5,sstatus
    80004890:	ffd7f793          	andi	a5,a5,-3
    80004894:	10079073          	csrw	sstatus,a5
    80004898:	fffff097          	auipc	ra,0xfffff
    8000489c:	8e4080e7          	jalr	-1820(ra) # 8000317c <mycpu>
    800048a0:	07852783          	lw	a5,120(a0)
    800048a4:	06078e63          	beqz	a5,80004920 <acquire+0xb4>
    800048a8:	fffff097          	auipc	ra,0xfffff
    800048ac:	8d4080e7          	jalr	-1836(ra) # 8000317c <mycpu>
    800048b0:	07852783          	lw	a5,120(a0)
    800048b4:	0004a703          	lw	a4,0(s1)
    800048b8:	0017879b          	addiw	a5,a5,1
    800048bc:	06f52c23          	sw	a5,120(a0)
    800048c0:	04071063          	bnez	a4,80004900 <acquire+0x94>
    800048c4:	00100713          	li	a4,1
    800048c8:	00070793          	mv	a5,a4
    800048cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800048d0:	0007879b          	sext.w	a5,a5
    800048d4:	fe079ae3          	bnez	a5,800048c8 <acquire+0x5c>
    800048d8:	0ff0000f          	fence
    800048dc:	fffff097          	auipc	ra,0xfffff
    800048e0:	8a0080e7          	jalr	-1888(ra) # 8000317c <mycpu>
    800048e4:	01813083          	ld	ra,24(sp)
    800048e8:	01013403          	ld	s0,16(sp)
    800048ec:	00a4b823          	sd	a0,16(s1)
    800048f0:	00013903          	ld	s2,0(sp)
    800048f4:	00813483          	ld	s1,8(sp)
    800048f8:	02010113          	addi	sp,sp,32
    800048fc:	00008067          	ret
    80004900:	0104b903          	ld	s2,16(s1)
    80004904:	fffff097          	auipc	ra,0xfffff
    80004908:	878080e7          	jalr	-1928(ra) # 8000317c <mycpu>
    8000490c:	faa91ce3          	bne	s2,a0,800048c4 <acquire+0x58>
    80004910:	00002517          	auipc	a0,0x2
    80004914:	ca850513          	addi	a0,a0,-856 # 800065b8 <digits+0x20>
    80004918:	fffff097          	auipc	ra,0xfffff
    8000491c:	224080e7          	jalr	548(ra) # 80003b3c <panic>
    80004920:	00195913          	srli	s2,s2,0x1
    80004924:	fffff097          	auipc	ra,0xfffff
    80004928:	858080e7          	jalr	-1960(ra) # 8000317c <mycpu>
    8000492c:	00197913          	andi	s2,s2,1
    80004930:	07252e23          	sw	s2,124(a0)
    80004934:	f75ff06f          	j	800048a8 <acquire+0x3c>

0000000080004938 <release>:
    80004938:	fe010113          	addi	sp,sp,-32
    8000493c:	00813823          	sd	s0,16(sp)
    80004940:	00113c23          	sd	ra,24(sp)
    80004944:	00913423          	sd	s1,8(sp)
    80004948:	01213023          	sd	s2,0(sp)
    8000494c:	02010413          	addi	s0,sp,32
    80004950:	00052783          	lw	a5,0(a0)
    80004954:	00079a63          	bnez	a5,80004968 <release+0x30>
    80004958:	00002517          	auipc	a0,0x2
    8000495c:	c6850513          	addi	a0,a0,-920 # 800065c0 <digits+0x28>
    80004960:	fffff097          	auipc	ra,0xfffff
    80004964:	1dc080e7          	jalr	476(ra) # 80003b3c <panic>
    80004968:	01053903          	ld	s2,16(a0)
    8000496c:	00050493          	mv	s1,a0
    80004970:	fffff097          	auipc	ra,0xfffff
    80004974:	80c080e7          	jalr	-2036(ra) # 8000317c <mycpu>
    80004978:	fea910e3          	bne	s2,a0,80004958 <release+0x20>
    8000497c:	0004b823          	sd	zero,16(s1)
    80004980:	0ff0000f          	fence
    80004984:	0f50000f          	fence	iorw,ow
    80004988:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000498c:	ffffe097          	auipc	ra,0xffffe
    80004990:	7f0080e7          	jalr	2032(ra) # 8000317c <mycpu>
    80004994:	100027f3          	csrr	a5,sstatus
    80004998:	0027f793          	andi	a5,a5,2
    8000499c:	04079a63          	bnez	a5,800049f0 <release+0xb8>
    800049a0:	07852783          	lw	a5,120(a0)
    800049a4:	02f05e63          	blez	a5,800049e0 <release+0xa8>
    800049a8:	fff7871b          	addiw	a4,a5,-1
    800049ac:	06e52c23          	sw	a4,120(a0)
    800049b0:	00071c63          	bnez	a4,800049c8 <release+0x90>
    800049b4:	07c52783          	lw	a5,124(a0)
    800049b8:	00078863          	beqz	a5,800049c8 <release+0x90>
    800049bc:	100027f3          	csrr	a5,sstatus
    800049c0:	0027e793          	ori	a5,a5,2
    800049c4:	10079073          	csrw	sstatus,a5
    800049c8:	01813083          	ld	ra,24(sp)
    800049cc:	01013403          	ld	s0,16(sp)
    800049d0:	00813483          	ld	s1,8(sp)
    800049d4:	00013903          	ld	s2,0(sp)
    800049d8:	02010113          	addi	sp,sp,32
    800049dc:	00008067          	ret
    800049e0:	00002517          	auipc	a0,0x2
    800049e4:	c0050513          	addi	a0,a0,-1024 # 800065e0 <digits+0x48>
    800049e8:	fffff097          	auipc	ra,0xfffff
    800049ec:	154080e7          	jalr	340(ra) # 80003b3c <panic>
    800049f0:	00002517          	auipc	a0,0x2
    800049f4:	bd850513          	addi	a0,a0,-1064 # 800065c8 <digits+0x30>
    800049f8:	fffff097          	auipc	ra,0xfffff
    800049fc:	144080e7          	jalr	324(ra) # 80003b3c <panic>

0000000080004a00 <holding>:
    80004a00:	00052783          	lw	a5,0(a0)
    80004a04:	00079663          	bnez	a5,80004a10 <holding+0x10>
    80004a08:	00000513          	li	a0,0
    80004a0c:	00008067          	ret
    80004a10:	fe010113          	addi	sp,sp,-32
    80004a14:	00813823          	sd	s0,16(sp)
    80004a18:	00913423          	sd	s1,8(sp)
    80004a1c:	00113c23          	sd	ra,24(sp)
    80004a20:	02010413          	addi	s0,sp,32
    80004a24:	01053483          	ld	s1,16(a0)
    80004a28:	ffffe097          	auipc	ra,0xffffe
    80004a2c:	754080e7          	jalr	1876(ra) # 8000317c <mycpu>
    80004a30:	01813083          	ld	ra,24(sp)
    80004a34:	01013403          	ld	s0,16(sp)
    80004a38:	40a48533          	sub	a0,s1,a0
    80004a3c:	00153513          	seqz	a0,a0
    80004a40:	00813483          	ld	s1,8(sp)
    80004a44:	02010113          	addi	sp,sp,32
    80004a48:	00008067          	ret

0000000080004a4c <push_off>:
    80004a4c:	fe010113          	addi	sp,sp,-32
    80004a50:	00813823          	sd	s0,16(sp)
    80004a54:	00113c23          	sd	ra,24(sp)
    80004a58:	00913423          	sd	s1,8(sp)
    80004a5c:	02010413          	addi	s0,sp,32
    80004a60:	100024f3          	csrr	s1,sstatus
    80004a64:	100027f3          	csrr	a5,sstatus
    80004a68:	ffd7f793          	andi	a5,a5,-3
    80004a6c:	10079073          	csrw	sstatus,a5
    80004a70:	ffffe097          	auipc	ra,0xffffe
    80004a74:	70c080e7          	jalr	1804(ra) # 8000317c <mycpu>
    80004a78:	07852783          	lw	a5,120(a0)
    80004a7c:	02078663          	beqz	a5,80004aa8 <push_off+0x5c>
    80004a80:	ffffe097          	auipc	ra,0xffffe
    80004a84:	6fc080e7          	jalr	1788(ra) # 8000317c <mycpu>
    80004a88:	07852783          	lw	a5,120(a0)
    80004a8c:	01813083          	ld	ra,24(sp)
    80004a90:	01013403          	ld	s0,16(sp)
    80004a94:	0017879b          	addiw	a5,a5,1
    80004a98:	06f52c23          	sw	a5,120(a0)
    80004a9c:	00813483          	ld	s1,8(sp)
    80004aa0:	02010113          	addi	sp,sp,32
    80004aa4:	00008067          	ret
    80004aa8:	0014d493          	srli	s1,s1,0x1
    80004aac:	ffffe097          	auipc	ra,0xffffe
    80004ab0:	6d0080e7          	jalr	1744(ra) # 8000317c <mycpu>
    80004ab4:	0014f493          	andi	s1,s1,1
    80004ab8:	06952e23          	sw	s1,124(a0)
    80004abc:	fc5ff06f          	j	80004a80 <push_off+0x34>

0000000080004ac0 <pop_off>:
    80004ac0:	ff010113          	addi	sp,sp,-16
    80004ac4:	00813023          	sd	s0,0(sp)
    80004ac8:	00113423          	sd	ra,8(sp)
    80004acc:	01010413          	addi	s0,sp,16
    80004ad0:	ffffe097          	auipc	ra,0xffffe
    80004ad4:	6ac080e7          	jalr	1708(ra) # 8000317c <mycpu>
    80004ad8:	100027f3          	csrr	a5,sstatus
    80004adc:	0027f793          	andi	a5,a5,2
    80004ae0:	04079663          	bnez	a5,80004b2c <pop_off+0x6c>
    80004ae4:	07852783          	lw	a5,120(a0)
    80004ae8:	02f05a63          	blez	a5,80004b1c <pop_off+0x5c>
    80004aec:	fff7871b          	addiw	a4,a5,-1
    80004af0:	06e52c23          	sw	a4,120(a0)
    80004af4:	00071c63          	bnez	a4,80004b0c <pop_off+0x4c>
    80004af8:	07c52783          	lw	a5,124(a0)
    80004afc:	00078863          	beqz	a5,80004b0c <pop_off+0x4c>
    80004b00:	100027f3          	csrr	a5,sstatus
    80004b04:	0027e793          	ori	a5,a5,2
    80004b08:	10079073          	csrw	sstatus,a5
    80004b0c:	00813083          	ld	ra,8(sp)
    80004b10:	00013403          	ld	s0,0(sp)
    80004b14:	01010113          	addi	sp,sp,16
    80004b18:	00008067          	ret
    80004b1c:	00002517          	auipc	a0,0x2
    80004b20:	ac450513          	addi	a0,a0,-1340 # 800065e0 <digits+0x48>
    80004b24:	fffff097          	auipc	ra,0xfffff
    80004b28:	018080e7          	jalr	24(ra) # 80003b3c <panic>
    80004b2c:	00002517          	auipc	a0,0x2
    80004b30:	a9c50513          	addi	a0,a0,-1380 # 800065c8 <digits+0x30>
    80004b34:	fffff097          	auipc	ra,0xfffff
    80004b38:	008080e7          	jalr	8(ra) # 80003b3c <panic>

0000000080004b3c <push_on>:
    80004b3c:	fe010113          	addi	sp,sp,-32
    80004b40:	00813823          	sd	s0,16(sp)
    80004b44:	00113c23          	sd	ra,24(sp)
    80004b48:	00913423          	sd	s1,8(sp)
    80004b4c:	02010413          	addi	s0,sp,32
    80004b50:	100024f3          	csrr	s1,sstatus
    80004b54:	100027f3          	csrr	a5,sstatus
    80004b58:	0027e793          	ori	a5,a5,2
    80004b5c:	10079073          	csrw	sstatus,a5
    80004b60:	ffffe097          	auipc	ra,0xffffe
    80004b64:	61c080e7          	jalr	1564(ra) # 8000317c <mycpu>
    80004b68:	07852783          	lw	a5,120(a0)
    80004b6c:	02078663          	beqz	a5,80004b98 <push_on+0x5c>
    80004b70:	ffffe097          	auipc	ra,0xffffe
    80004b74:	60c080e7          	jalr	1548(ra) # 8000317c <mycpu>
    80004b78:	07852783          	lw	a5,120(a0)
    80004b7c:	01813083          	ld	ra,24(sp)
    80004b80:	01013403          	ld	s0,16(sp)
    80004b84:	0017879b          	addiw	a5,a5,1
    80004b88:	06f52c23          	sw	a5,120(a0)
    80004b8c:	00813483          	ld	s1,8(sp)
    80004b90:	02010113          	addi	sp,sp,32
    80004b94:	00008067          	ret
    80004b98:	0014d493          	srli	s1,s1,0x1
    80004b9c:	ffffe097          	auipc	ra,0xffffe
    80004ba0:	5e0080e7          	jalr	1504(ra) # 8000317c <mycpu>
    80004ba4:	0014f493          	andi	s1,s1,1
    80004ba8:	06952e23          	sw	s1,124(a0)
    80004bac:	fc5ff06f          	j	80004b70 <push_on+0x34>

0000000080004bb0 <pop_on>:
    80004bb0:	ff010113          	addi	sp,sp,-16
    80004bb4:	00813023          	sd	s0,0(sp)
    80004bb8:	00113423          	sd	ra,8(sp)
    80004bbc:	01010413          	addi	s0,sp,16
    80004bc0:	ffffe097          	auipc	ra,0xffffe
    80004bc4:	5bc080e7          	jalr	1468(ra) # 8000317c <mycpu>
    80004bc8:	100027f3          	csrr	a5,sstatus
    80004bcc:	0027f793          	andi	a5,a5,2
    80004bd0:	04078463          	beqz	a5,80004c18 <pop_on+0x68>
    80004bd4:	07852783          	lw	a5,120(a0)
    80004bd8:	02f05863          	blez	a5,80004c08 <pop_on+0x58>
    80004bdc:	fff7879b          	addiw	a5,a5,-1
    80004be0:	06f52c23          	sw	a5,120(a0)
    80004be4:	07853783          	ld	a5,120(a0)
    80004be8:	00079863          	bnez	a5,80004bf8 <pop_on+0x48>
    80004bec:	100027f3          	csrr	a5,sstatus
    80004bf0:	ffd7f793          	andi	a5,a5,-3
    80004bf4:	10079073          	csrw	sstatus,a5
    80004bf8:	00813083          	ld	ra,8(sp)
    80004bfc:	00013403          	ld	s0,0(sp)
    80004c00:	01010113          	addi	sp,sp,16
    80004c04:	00008067          	ret
    80004c08:	00002517          	auipc	a0,0x2
    80004c0c:	a0050513          	addi	a0,a0,-1536 # 80006608 <digits+0x70>
    80004c10:	fffff097          	auipc	ra,0xfffff
    80004c14:	f2c080e7          	jalr	-212(ra) # 80003b3c <panic>
    80004c18:	00002517          	auipc	a0,0x2
    80004c1c:	9d050513          	addi	a0,a0,-1584 # 800065e8 <digits+0x50>
    80004c20:	fffff097          	auipc	ra,0xfffff
    80004c24:	f1c080e7          	jalr	-228(ra) # 80003b3c <panic>

0000000080004c28 <__memset>:
    80004c28:	ff010113          	addi	sp,sp,-16
    80004c2c:	00813423          	sd	s0,8(sp)
    80004c30:	01010413          	addi	s0,sp,16
    80004c34:	1a060e63          	beqz	a2,80004df0 <__memset+0x1c8>
    80004c38:	40a007b3          	neg	a5,a0
    80004c3c:	0077f793          	andi	a5,a5,7
    80004c40:	00778693          	addi	a3,a5,7
    80004c44:	00b00813          	li	a6,11
    80004c48:	0ff5f593          	andi	a1,a1,255
    80004c4c:	fff6071b          	addiw	a4,a2,-1
    80004c50:	1b06e663          	bltu	a3,a6,80004dfc <__memset+0x1d4>
    80004c54:	1cd76463          	bltu	a4,a3,80004e1c <__memset+0x1f4>
    80004c58:	1a078e63          	beqz	a5,80004e14 <__memset+0x1ec>
    80004c5c:	00b50023          	sb	a1,0(a0)
    80004c60:	00100713          	li	a4,1
    80004c64:	1ae78463          	beq	a5,a4,80004e0c <__memset+0x1e4>
    80004c68:	00b500a3          	sb	a1,1(a0)
    80004c6c:	00200713          	li	a4,2
    80004c70:	1ae78a63          	beq	a5,a4,80004e24 <__memset+0x1fc>
    80004c74:	00b50123          	sb	a1,2(a0)
    80004c78:	00300713          	li	a4,3
    80004c7c:	18e78463          	beq	a5,a4,80004e04 <__memset+0x1dc>
    80004c80:	00b501a3          	sb	a1,3(a0)
    80004c84:	00400713          	li	a4,4
    80004c88:	1ae78263          	beq	a5,a4,80004e2c <__memset+0x204>
    80004c8c:	00b50223          	sb	a1,4(a0)
    80004c90:	00500713          	li	a4,5
    80004c94:	1ae78063          	beq	a5,a4,80004e34 <__memset+0x20c>
    80004c98:	00b502a3          	sb	a1,5(a0)
    80004c9c:	00700713          	li	a4,7
    80004ca0:	18e79e63          	bne	a5,a4,80004e3c <__memset+0x214>
    80004ca4:	00b50323          	sb	a1,6(a0)
    80004ca8:	00700e93          	li	t4,7
    80004cac:	00859713          	slli	a4,a1,0x8
    80004cb0:	00e5e733          	or	a4,a1,a4
    80004cb4:	01059e13          	slli	t3,a1,0x10
    80004cb8:	01c76e33          	or	t3,a4,t3
    80004cbc:	01859313          	slli	t1,a1,0x18
    80004cc0:	006e6333          	or	t1,t3,t1
    80004cc4:	02059893          	slli	a7,a1,0x20
    80004cc8:	40f60e3b          	subw	t3,a2,a5
    80004ccc:	011368b3          	or	a7,t1,a7
    80004cd0:	02859813          	slli	a6,a1,0x28
    80004cd4:	0108e833          	or	a6,a7,a6
    80004cd8:	03059693          	slli	a3,a1,0x30
    80004cdc:	003e589b          	srliw	a7,t3,0x3
    80004ce0:	00d866b3          	or	a3,a6,a3
    80004ce4:	03859713          	slli	a4,a1,0x38
    80004ce8:	00389813          	slli	a6,a7,0x3
    80004cec:	00f507b3          	add	a5,a0,a5
    80004cf0:	00e6e733          	or	a4,a3,a4
    80004cf4:	000e089b          	sext.w	a7,t3
    80004cf8:	00f806b3          	add	a3,a6,a5
    80004cfc:	00e7b023          	sd	a4,0(a5)
    80004d00:	00878793          	addi	a5,a5,8
    80004d04:	fed79ce3          	bne	a5,a3,80004cfc <__memset+0xd4>
    80004d08:	ff8e7793          	andi	a5,t3,-8
    80004d0c:	0007871b          	sext.w	a4,a5
    80004d10:	01d787bb          	addw	a5,a5,t4
    80004d14:	0ce88e63          	beq	a7,a4,80004df0 <__memset+0x1c8>
    80004d18:	00f50733          	add	a4,a0,a5
    80004d1c:	00b70023          	sb	a1,0(a4)
    80004d20:	0017871b          	addiw	a4,a5,1
    80004d24:	0cc77663          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d28:	00e50733          	add	a4,a0,a4
    80004d2c:	00b70023          	sb	a1,0(a4)
    80004d30:	0027871b          	addiw	a4,a5,2
    80004d34:	0ac77e63          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d38:	00e50733          	add	a4,a0,a4
    80004d3c:	00b70023          	sb	a1,0(a4)
    80004d40:	0037871b          	addiw	a4,a5,3
    80004d44:	0ac77663          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d48:	00e50733          	add	a4,a0,a4
    80004d4c:	00b70023          	sb	a1,0(a4)
    80004d50:	0047871b          	addiw	a4,a5,4
    80004d54:	08c77e63          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d58:	00e50733          	add	a4,a0,a4
    80004d5c:	00b70023          	sb	a1,0(a4)
    80004d60:	0057871b          	addiw	a4,a5,5
    80004d64:	08c77663          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d68:	00e50733          	add	a4,a0,a4
    80004d6c:	00b70023          	sb	a1,0(a4)
    80004d70:	0067871b          	addiw	a4,a5,6
    80004d74:	06c77e63          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d78:	00e50733          	add	a4,a0,a4
    80004d7c:	00b70023          	sb	a1,0(a4)
    80004d80:	0077871b          	addiw	a4,a5,7
    80004d84:	06c77663          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d88:	00e50733          	add	a4,a0,a4
    80004d8c:	00b70023          	sb	a1,0(a4)
    80004d90:	0087871b          	addiw	a4,a5,8
    80004d94:	04c77e63          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004d98:	00e50733          	add	a4,a0,a4
    80004d9c:	00b70023          	sb	a1,0(a4)
    80004da0:	0097871b          	addiw	a4,a5,9
    80004da4:	04c77663          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004da8:	00e50733          	add	a4,a0,a4
    80004dac:	00b70023          	sb	a1,0(a4)
    80004db0:	00a7871b          	addiw	a4,a5,10
    80004db4:	02c77e63          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004db8:	00e50733          	add	a4,a0,a4
    80004dbc:	00b70023          	sb	a1,0(a4)
    80004dc0:	00b7871b          	addiw	a4,a5,11
    80004dc4:	02c77663          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004dc8:	00e50733          	add	a4,a0,a4
    80004dcc:	00b70023          	sb	a1,0(a4)
    80004dd0:	00c7871b          	addiw	a4,a5,12
    80004dd4:	00c77e63          	bgeu	a4,a2,80004df0 <__memset+0x1c8>
    80004dd8:	00e50733          	add	a4,a0,a4
    80004ddc:	00b70023          	sb	a1,0(a4)
    80004de0:	00d7879b          	addiw	a5,a5,13
    80004de4:	00c7f663          	bgeu	a5,a2,80004df0 <__memset+0x1c8>
    80004de8:	00f507b3          	add	a5,a0,a5
    80004dec:	00b78023          	sb	a1,0(a5)
    80004df0:	00813403          	ld	s0,8(sp)
    80004df4:	01010113          	addi	sp,sp,16
    80004df8:	00008067          	ret
    80004dfc:	00b00693          	li	a3,11
    80004e00:	e55ff06f          	j	80004c54 <__memset+0x2c>
    80004e04:	00300e93          	li	t4,3
    80004e08:	ea5ff06f          	j	80004cac <__memset+0x84>
    80004e0c:	00100e93          	li	t4,1
    80004e10:	e9dff06f          	j	80004cac <__memset+0x84>
    80004e14:	00000e93          	li	t4,0
    80004e18:	e95ff06f          	j	80004cac <__memset+0x84>
    80004e1c:	00000793          	li	a5,0
    80004e20:	ef9ff06f          	j	80004d18 <__memset+0xf0>
    80004e24:	00200e93          	li	t4,2
    80004e28:	e85ff06f          	j	80004cac <__memset+0x84>
    80004e2c:	00400e93          	li	t4,4
    80004e30:	e7dff06f          	j	80004cac <__memset+0x84>
    80004e34:	00500e93          	li	t4,5
    80004e38:	e75ff06f          	j	80004cac <__memset+0x84>
    80004e3c:	00600e93          	li	t4,6
    80004e40:	e6dff06f          	j	80004cac <__memset+0x84>

0000000080004e44 <__memmove>:
    80004e44:	ff010113          	addi	sp,sp,-16
    80004e48:	00813423          	sd	s0,8(sp)
    80004e4c:	01010413          	addi	s0,sp,16
    80004e50:	0e060863          	beqz	a2,80004f40 <__memmove+0xfc>
    80004e54:	fff6069b          	addiw	a3,a2,-1
    80004e58:	0006881b          	sext.w	a6,a3
    80004e5c:	0ea5e863          	bltu	a1,a0,80004f4c <__memmove+0x108>
    80004e60:	00758713          	addi	a4,a1,7
    80004e64:	00a5e7b3          	or	a5,a1,a0
    80004e68:	40a70733          	sub	a4,a4,a0
    80004e6c:	0077f793          	andi	a5,a5,7
    80004e70:	00f73713          	sltiu	a4,a4,15
    80004e74:	00174713          	xori	a4,a4,1
    80004e78:	0017b793          	seqz	a5,a5
    80004e7c:	00e7f7b3          	and	a5,a5,a4
    80004e80:	10078863          	beqz	a5,80004f90 <__memmove+0x14c>
    80004e84:	00900793          	li	a5,9
    80004e88:	1107f463          	bgeu	a5,a6,80004f90 <__memmove+0x14c>
    80004e8c:	0036581b          	srliw	a6,a2,0x3
    80004e90:	fff8081b          	addiw	a6,a6,-1
    80004e94:	02081813          	slli	a6,a6,0x20
    80004e98:	01d85893          	srli	a7,a6,0x1d
    80004e9c:	00858813          	addi	a6,a1,8
    80004ea0:	00058793          	mv	a5,a1
    80004ea4:	00050713          	mv	a4,a0
    80004ea8:	01088833          	add	a6,a7,a6
    80004eac:	0007b883          	ld	a7,0(a5)
    80004eb0:	00878793          	addi	a5,a5,8
    80004eb4:	00870713          	addi	a4,a4,8
    80004eb8:	ff173c23          	sd	a7,-8(a4)
    80004ebc:	ff0798e3          	bne	a5,a6,80004eac <__memmove+0x68>
    80004ec0:	ff867713          	andi	a4,a2,-8
    80004ec4:	02071793          	slli	a5,a4,0x20
    80004ec8:	0207d793          	srli	a5,a5,0x20
    80004ecc:	00f585b3          	add	a1,a1,a5
    80004ed0:	40e686bb          	subw	a3,a3,a4
    80004ed4:	00f507b3          	add	a5,a0,a5
    80004ed8:	06e60463          	beq	a2,a4,80004f40 <__memmove+0xfc>
    80004edc:	0005c703          	lbu	a4,0(a1)
    80004ee0:	00e78023          	sb	a4,0(a5)
    80004ee4:	04068e63          	beqz	a3,80004f40 <__memmove+0xfc>
    80004ee8:	0015c603          	lbu	a2,1(a1)
    80004eec:	00100713          	li	a4,1
    80004ef0:	00c780a3          	sb	a2,1(a5)
    80004ef4:	04e68663          	beq	a3,a4,80004f40 <__memmove+0xfc>
    80004ef8:	0025c603          	lbu	a2,2(a1)
    80004efc:	00200713          	li	a4,2
    80004f00:	00c78123          	sb	a2,2(a5)
    80004f04:	02e68e63          	beq	a3,a4,80004f40 <__memmove+0xfc>
    80004f08:	0035c603          	lbu	a2,3(a1)
    80004f0c:	00300713          	li	a4,3
    80004f10:	00c781a3          	sb	a2,3(a5)
    80004f14:	02e68663          	beq	a3,a4,80004f40 <__memmove+0xfc>
    80004f18:	0045c603          	lbu	a2,4(a1)
    80004f1c:	00400713          	li	a4,4
    80004f20:	00c78223          	sb	a2,4(a5)
    80004f24:	00e68e63          	beq	a3,a4,80004f40 <__memmove+0xfc>
    80004f28:	0055c603          	lbu	a2,5(a1)
    80004f2c:	00500713          	li	a4,5
    80004f30:	00c782a3          	sb	a2,5(a5)
    80004f34:	00e68663          	beq	a3,a4,80004f40 <__memmove+0xfc>
    80004f38:	0065c703          	lbu	a4,6(a1)
    80004f3c:	00e78323          	sb	a4,6(a5)
    80004f40:	00813403          	ld	s0,8(sp)
    80004f44:	01010113          	addi	sp,sp,16
    80004f48:	00008067          	ret
    80004f4c:	02061713          	slli	a4,a2,0x20
    80004f50:	02075713          	srli	a4,a4,0x20
    80004f54:	00e587b3          	add	a5,a1,a4
    80004f58:	f0f574e3          	bgeu	a0,a5,80004e60 <__memmove+0x1c>
    80004f5c:	02069613          	slli	a2,a3,0x20
    80004f60:	02065613          	srli	a2,a2,0x20
    80004f64:	fff64613          	not	a2,a2
    80004f68:	00e50733          	add	a4,a0,a4
    80004f6c:	00c78633          	add	a2,a5,a2
    80004f70:	fff7c683          	lbu	a3,-1(a5)
    80004f74:	fff78793          	addi	a5,a5,-1
    80004f78:	fff70713          	addi	a4,a4,-1
    80004f7c:	00d70023          	sb	a3,0(a4)
    80004f80:	fec798e3          	bne	a5,a2,80004f70 <__memmove+0x12c>
    80004f84:	00813403          	ld	s0,8(sp)
    80004f88:	01010113          	addi	sp,sp,16
    80004f8c:	00008067          	ret
    80004f90:	02069713          	slli	a4,a3,0x20
    80004f94:	02075713          	srli	a4,a4,0x20
    80004f98:	00170713          	addi	a4,a4,1
    80004f9c:	00e50733          	add	a4,a0,a4
    80004fa0:	00050793          	mv	a5,a0
    80004fa4:	0005c683          	lbu	a3,0(a1)
    80004fa8:	00178793          	addi	a5,a5,1
    80004fac:	00158593          	addi	a1,a1,1
    80004fb0:	fed78fa3          	sb	a3,-1(a5)
    80004fb4:	fee798e3          	bne	a5,a4,80004fa4 <__memmove+0x160>
    80004fb8:	f89ff06f          	j	80004f40 <__memmove+0xfc>

0000000080004fbc <__mem_free>:
    80004fbc:	ff010113          	addi	sp,sp,-16
    80004fc0:	00813423          	sd	s0,8(sp)
    80004fc4:	01010413          	addi	s0,sp,16
    80004fc8:	00002597          	auipc	a1,0x2
    80004fcc:	1b058593          	addi	a1,a1,432 # 80007178 <freep>
    80004fd0:	0005b783          	ld	a5,0(a1)
    80004fd4:	ff050693          	addi	a3,a0,-16
    80004fd8:	0007b703          	ld	a4,0(a5)
    80004fdc:	00d7fc63          	bgeu	a5,a3,80004ff4 <__mem_free+0x38>
    80004fe0:	00e6ee63          	bltu	a3,a4,80004ffc <__mem_free+0x40>
    80004fe4:	00e7fc63          	bgeu	a5,a4,80004ffc <__mem_free+0x40>
    80004fe8:	00070793          	mv	a5,a4
    80004fec:	0007b703          	ld	a4,0(a5)
    80004ff0:	fed7e8e3          	bltu	a5,a3,80004fe0 <__mem_free+0x24>
    80004ff4:	fee7eae3          	bltu	a5,a4,80004fe8 <__mem_free+0x2c>
    80004ff8:	fee6f8e3          	bgeu	a3,a4,80004fe8 <__mem_free+0x2c>
    80004ffc:	ff852803          	lw	a6,-8(a0)
    80005000:	02081613          	slli	a2,a6,0x20
    80005004:	01c65613          	srli	a2,a2,0x1c
    80005008:	00c68633          	add	a2,a3,a2
    8000500c:	02c70a63          	beq	a4,a2,80005040 <__mem_free+0x84>
    80005010:	fee53823          	sd	a4,-16(a0)
    80005014:	0087a503          	lw	a0,8(a5)
    80005018:	02051613          	slli	a2,a0,0x20
    8000501c:	01c65613          	srli	a2,a2,0x1c
    80005020:	00c78633          	add	a2,a5,a2
    80005024:	04c68263          	beq	a3,a2,80005068 <__mem_free+0xac>
    80005028:	00813403          	ld	s0,8(sp)
    8000502c:	00d7b023          	sd	a3,0(a5)
    80005030:	00f5b023          	sd	a5,0(a1)
    80005034:	00000513          	li	a0,0
    80005038:	01010113          	addi	sp,sp,16
    8000503c:	00008067          	ret
    80005040:	00872603          	lw	a2,8(a4)
    80005044:	00073703          	ld	a4,0(a4)
    80005048:	0106083b          	addw	a6,a2,a6
    8000504c:	ff052c23          	sw	a6,-8(a0)
    80005050:	fee53823          	sd	a4,-16(a0)
    80005054:	0087a503          	lw	a0,8(a5)
    80005058:	02051613          	slli	a2,a0,0x20
    8000505c:	01c65613          	srli	a2,a2,0x1c
    80005060:	00c78633          	add	a2,a5,a2
    80005064:	fcc692e3          	bne	a3,a2,80005028 <__mem_free+0x6c>
    80005068:	00813403          	ld	s0,8(sp)
    8000506c:	0105053b          	addw	a0,a0,a6
    80005070:	00a7a423          	sw	a0,8(a5)
    80005074:	00e7b023          	sd	a4,0(a5)
    80005078:	00f5b023          	sd	a5,0(a1)
    8000507c:	00000513          	li	a0,0
    80005080:	01010113          	addi	sp,sp,16
    80005084:	00008067          	ret

0000000080005088 <__mem_alloc>:
    80005088:	fc010113          	addi	sp,sp,-64
    8000508c:	02813823          	sd	s0,48(sp)
    80005090:	02913423          	sd	s1,40(sp)
    80005094:	03213023          	sd	s2,32(sp)
    80005098:	01513423          	sd	s5,8(sp)
    8000509c:	02113c23          	sd	ra,56(sp)
    800050a0:	01313c23          	sd	s3,24(sp)
    800050a4:	01413823          	sd	s4,16(sp)
    800050a8:	01613023          	sd	s6,0(sp)
    800050ac:	04010413          	addi	s0,sp,64
    800050b0:	00002a97          	auipc	s5,0x2
    800050b4:	0c8a8a93          	addi	s5,s5,200 # 80007178 <freep>
    800050b8:	00f50913          	addi	s2,a0,15
    800050bc:	000ab683          	ld	a3,0(s5)
    800050c0:	00495913          	srli	s2,s2,0x4
    800050c4:	0019049b          	addiw	s1,s2,1
    800050c8:	00048913          	mv	s2,s1
    800050cc:	0c068c63          	beqz	a3,800051a4 <__mem_alloc+0x11c>
    800050d0:	0006b503          	ld	a0,0(a3)
    800050d4:	00852703          	lw	a4,8(a0)
    800050d8:	10977063          	bgeu	a4,s1,800051d8 <__mem_alloc+0x150>
    800050dc:	000017b7          	lui	a5,0x1
    800050e0:	0009099b          	sext.w	s3,s2
    800050e4:	0af4e863          	bltu	s1,a5,80005194 <__mem_alloc+0x10c>
    800050e8:	02099a13          	slli	s4,s3,0x20
    800050ec:	01ca5a13          	srli	s4,s4,0x1c
    800050f0:	fff00b13          	li	s6,-1
    800050f4:	0100006f          	j	80005104 <__mem_alloc+0x7c>
    800050f8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    800050fc:	00852703          	lw	a4,8(a0)
    80005100:	04977463          	bgeu	a4,s1,80005148 <__mem_alloc+0xc0>
    80005104:	00050793          	mv	a5,a0
    80005108:	fea698e3          	bne	a3,a0,800050f8 <__mem_alloc+0x70>
    8000510c:	000a0513          	mv	a0,s4
    80005110:	00000097          	auipc	ra,0x0
    80005114:	1f0080e7          	jalr	496(ra) # 80005300 <kvmincrease>
    80005118:	00050793          	mv	a5,a0
    8000511c:	01050513          	addi	a0,a0,16
    80005120:	07678e63          	beq	a5,s6,8000519c <__mem_alloc+0x114>
    80005124:	0137a423          	sw	s3,8(a5)
    80005128:	00000097          	auipc	ra,0x0
    8000512c:	e94080e7          	jalr	-364(ra) # 80004fbc <__mem_free>
    80005130:	000ab783          	ld	a5,0(s5)
    80005134:	06078463          	beqz	a5,8000519c <__mem_alloc+0x114>
    80005138:	0007b503          	ld	a0,0(a5)
    8000513c:	00078693          	mv	a3,a5
    80005140:	00852703          	lw	a4,8(a0)
    80005144:	fc9760e3          	bltu	a4,s1,80005104 <__mem_alloc+0x7c>
    80005148:	08e48263          	beq	s1,a4,800051cc <__mem_alloc+0x144>
    8000514c:	4127073b          	subw	a4,a4,s2
    80005150:	02071693          	slli	a3,a4,0x20
    80005154:	01c6d693          	srli	a3,a3,0x1c
    80005158:	00e52423          	sw	a4,8(a0)
    8000515c:	00d50533          	add	a0,a0,a3
    80005160:	01252423          	sw	s2,8(a0)
    80005164:	00fab023          	sd	a5,0(s5)
    80005168:	01050513          	addi	a0,a0,16
    8000516c:	03813083          	ld	ra,56(sp)
    80005170:	03013403          	ld	s0,48(sp)
    80005174:	02813483          	ld	s1,40(sp)
    80005178:	02013903          	ld	s2,32(sp)
    8000517c:	01813983          	ld	s3,24(sp)
    80005180:	01013a03          	ld	s4,16(sp)
    80005184:	00813a83          	ld	s5,8(sp)
    80005188:	00013b03          	ld	s6,0(sp)
    8000518c:	04010113          	addi	sp,sp,64
    80005190:	00008067          	ret
    80005194:	000019b7          	lui	s3,0x1
    80005198:	f51ff06f          	j	800050e8 <__mem_alloc+0x60>
    8000519c:	00000513          	li	a0,0
    800051a0:	fcdff06f          	j	8000516c <__mem_alloc+0xe4>
    800051a4:	00003797          	auipc	a5,0x3
    800051a8:	27c78793          	addi	a5,a5,636 # 80008420 <base>
    800051ac:	00078513          	mv	a0,a5
    800051b0:	00fab023          	sd	a5,0(s5)
    800051b4:	00f7b023          	sd	a5,0(a5)
    800051b8:	00000713          	li	a4,0
    800051bc:	00003797          	auipc	a5,0x3
    800051c0:	2607a623          	sw	zero,620(a5) # 80008428 <base+0x8>
    800051c4:	00050693          	mv	a3,a0
    800051c8:	f11ff06f          	j	800050d8 <__mem_alloc+0x50>
    800051cc:	00053703          	ld	a4,0(a0)
    800051d0:	00e7b023          	sd	a4,0(a5)
    800051d4:	f91ff06f          	j	80005164 <__mem_alloc+0xdc>
    800051d8:	00068793          	mv	a5,a3
    800051dc:	f6dff06f          	j	80005148 <__mem_alloc+0xc0>

00000000800051e0 <__putc>:
    800051e0:	fe010113          	addi	sp,sp,-32
    800051e4:	00813823          	sd	s0,16(sp)
    800051e8:	00113c23          	sd	ra,24(sp)
    800051ec:	02010413          	addi	s0,sp,32
    800051f0:	00050793          	mv	a5,a0
    800051f4:	fef40593          	addi	a1,s0,-17
    800051f8:	00100613          	li	a2,1
    800051fc:	00000513          	li	a0,0
    80005200:	fef407a3          	sb	a5,-17(s0)
    80005204:	fffff097          	auipc	ra,0xfffff
    80005208:	918080e7          	jalr	-1768(ra) # 80003b1c <console_write>
    8000520c:	01813083          	ld	ra,24(sp)
    80005210:	01013403          	ld	s0,16(sp)
    80005214:	02010113          	addi	sp,sp,32
    80005218:	00008067          	ret

000000008000521c <__getc>:
    8000521c:	fe010113          	addi	sp,sp,-32
    80005220:	00813823          	sd	s0,16(sp)
    80005224:	00113c23          	sd	ra,24(sp)
    80005228:	02010413          	addi	s0,sp,32
    8000522c:	fe840593          	addi	a1,s0,-24
    80005230:	00100613          	li	a2,1
    80005234:	00000513          	li	a0,0
    80005238:	fffff097          	auipc	ra,0xfffff
    8000523c:	8c4080e7          	jalr	-1852(ra) # 80003afc <console_read>
    80005240:	fe844503          	lbu	a0,-24(s0)
    80005244:	01813083          	ld	ra,24(sp)
    80005248:	01013403          	ld	s0,16(sp)
    8000524c:	02010113          	addi	sp,sp,32
    80005250:	00008067          	ret

0000000080005254 <console_handler>:
    80005254:	fe010113          	addi	sp,sp,-32
    80005258:	00813823          	sd	s0,16(sp)
    8000525c:	00113c23          	sd	ra,24(sp)
    80005260:	00913423          	sd	s1,8(sp)
    80005264:	02010413          	addi	s0,sp,32
    80005268:	14202773          	csrr	a4,scause
    8000526c:	100027f3          	csrr	a5,sstatus
    80005270:	0027f793          	andi	a5,a5,2
    80005274:	06079e63          	bnez	a5,800052f0 <console_handler+0x9c>
    80005278:	00074c63          	bltz	a4,80005290 <console_handler+0x3c>
    8000527c:	01813083          	ld	ra,24(sp)
    80005280:	01013403          	ld	s0,16(sp)
    80005284:	00813483          	ld	s1,8(sp)
    80005288:	02010113          	addi	sp,sp,32
    8000528c:	00008067          	ret
    80005290:	0ff77713          	andi	a4,a4,255
    80005294:	00900793          	li	a5,9
    80005298:	fef712e3          	bne	a4,a5,8000527c <console_handler+0x28>
    8000529c:	ffffe097          	auipc	ra,0xffffe
    800052a0:	4b8080e7          	jalr	1208(ra) # 80003754 <plic_claim>
    800052a4:	00a00793          	li	a5,10
    800052a8:	00050493          	mv	s1,a0
    800052ac:	02f50c63          	beq	a0,a5,800052e4 <console_handler+0x90>
    800052b0:	fc0506e3          	beqz	a0,8000527c <console_handler+0x28>
    800052b4:	00050593          	mv	a1,a0
    800052b8:	00001517          	auipc	a0,0x1
    800052bc:	25850513          	addi	a0,a0,600 # 80006510 <CONSOLE_STATUS+0x500>
    800052c0:	fffff097          	auipc	ra,0xfffff
    800052c4:	8d8080e7          	jalr	-1832(ra) # 80003b98 <__printf>
    800052c8:	01013403          	ld	s0,16(sp)
    800052cc:	01813083          	ld	ra,24(sp)
    800052d0:	00048513          	mv	a0,s1
    800052d4:	00813483          	ld	s1,8(sp)
    800052d8:	02010113          	addi	sp,sp,32
    800052dc:	ffffe317          	auipc	t1,0xffffe
    800052e0:	4b030067          	jr	1200(t1) # 8000378c <plic_complete>
    800052e4:	fffff097          	auipc	ra,0xfffff
    800052e8:	1bc080e7          	jalr	444(ra) # 800044a0 <uartintr>
    800052ec:	fddff06f          	j	800052c8 <console_handler+0x74>
    800052f0:	00001517          	auipc	a0,0x1
    800052f4:	32050513          	addi	a0,a0,800 # 80006610 <digits+0x78>
    800052f8:	fffff097          	auipc	ra,0xfffff
    800052fc:	844080e7          	jalr	-1980(ra) # 80003b3c <panic>

0000000080005300 <kvmincrease>:
    80005300:	fe010113          	addi	sp,sp,-32
    80005304:	01213023          	sd	s2,0(sp)
    80005308:	00001937          	lui	s2,0x1
    8000530c:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80005310:	00813823          	sd	s0,16(sp)
    80005314:	00113c23          	sd	ra,24(sp)
    80005318:	00913423          	sd	s1,8(sp)
    8000531c:	02010413          	addi	s0,sp,32
    80005320:	01250933          	add	s2,a0,s2
    80005324:	00c95913          	srli	s2,s2,0xc
    80005328:	02090863          	beqz	s2,80005358 <kvmincrease+0x58>
    8000532c:	00000493          	li	s1,0
    80005330:	00148493          	addi	s1,s1,1
    80005334:	fffff097          	auipc	ra,0xfffff
    80005338:	4bc080e7          	jalr	1212(ra) # 800047f0 <kalloc>
    8000533c:	fe991ae3          	bne	s2,s1,80005330 <kvmincrease+0x30>
    80005340:	01813083          	ld	ra,24(sp)
    80005344:	01013403          	ld	s0,16(sp)
    80005348:	00813483          	ld	s1,8(sp)
    8000534c:	00013903          	ld	s2,0(sp)
    80005350:	02010113          	addi	sp,sp,32
    80005354:	00008067          	ret
    80005358:	01813083          	ld	ra,24(sp)
    8000535c:	01013403          	ld	s0,16(sp)
    80005360:	00813483          	ld	s1,8(sp)
    80005364:	00013903          	ld	s2,0(sp)
    80005368:	00000513          	li	a0,0
    8000536c:	02010113          	addi	sp,sp,32
    80005370:	00008067          	ret
	...
