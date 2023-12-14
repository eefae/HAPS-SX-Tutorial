#include <stdio.h>
#include <stdint.h>
#include "platform.h"
#include "xil_printf.h"
#include "xil_io.h"

int testRegion(u64* addr){
    xil_printf("Testing Region @ 0x%lX ---> ", addr);
    u64* p = addr;
    for(int i = 0; i < 64 ; i++){
    	*p = 0xFFFFAAAAFFFFAAAA;
    	p += 16;
    	//xil_printf("0x%lX    0x%lX\n\r", addr+(i*64), Xil_In64(addr+(i*64)));
    }

    p = addr;

    for(int i = 0; i < 64; i++){
    	//xil_printf("0x%lX:  0x%lX\n\r", p, *p);
    	if (*p != (u64)0xFFFFAAAAFFFFAAAA){
    		xil_printf("FAILED\n\r");
    		xil_printf("### ADDR:%lX    EXPECTED: 0xFFFFAAAAFFFFAAAA   RETURNED: %lX\n\r", p, *p);
    		return 1;
    	}
    	p += 16;
    	/*
    	if (*p != 0xFFFFAAAAFFFFAAAA){
    		xil_printf("FAILED\n\r");
    		xil_printf("ADDR:%lX    EXPECTED: 0xFFFFAAAAFFFFAAAA   RETURNED: %lX\n\r", p, *p);

    		return 1;
    	}
  */
    }
    xil_printf("PASSED\n\r");
}

int main()
{
    init_platform();

    xil_printf("Starting DDR Test Program...\n\r");
	//u64 i;
	u64 *baseAddr = (u64*)0x400000000;
	//u64 *highAdr = (u64*)0x7FFFFFFFF;


	testRegion((u64*)0x400000000);
	testRegion((u64*)0x40AA00000);
	testRegion((u64*)0x500000000);
	testRegion((u64*)0x50AA00000);
	testRegion((u64*)0x600000000);
	testRegion((u64*)0x60AA00000);
	testRegion((u64*)0x700000000);
	testRegion((u64*)0x70AA00000);


    xil_printf("Memory Done\n\r");


    cleanup_platform();
    return 0;
}
