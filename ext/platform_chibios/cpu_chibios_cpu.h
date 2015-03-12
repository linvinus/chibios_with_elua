// i386 (Intel) CPU configuration

#ifndef __CPU_I386_H__
#define __CPU_I386_H__

#include "stacks.h"

// Number of resources (0 if not available/not implemented)
#define NUM_PIO               5 /*port count*/
#define NUM_SPI               0
#define NUM_UART              1
#define NUM_TIMER             0
#define NUM_PWM               0
#define NUM_ADC               0
#define NUM_CAN               0

// CPU frequency (needed by the CPU module and MMCFS code, 0 if not used)
#define CPU_FREQUENCY         0

// PIO prefix ('0' for P0, P1, ... or 'A' for PA, PB, ...)
#define PIO_PREFIX            'A'
// Pins per port configuration:
// #define PIO_PINS_PER_PORT (n) if each port has the same number of pins, or
// #define PIO_PIN_ARRAY { n1, n2, ... } to define pins per port in an array
// Use #define PIO_PINS_PER_PORT 0 if this isn't needed
#define PIO_PINS_PER_PORT     16

// Allocator data: define your free memory zones here in two arrays
// (start address and end address)
//~ #define SRAM_ORIGIN           0x20010000
//~ #define SRAM_SIZE             0x10000
//~ #define INTERNAL_RAM1_FIRST_FREE end
//~ #define INTERNAL_RAM1_LAST_FREE  ( SRAM_ORIGIN + SRAM_SIZE - STACK_SIZE_TOTAL - 1 )
#define INTERNAL_SRAM_BASE    0x20010000
#define INTERNAL_SRAM_SIZE    ( 63 * 1024 )
#define INTERNAL_RAM1_FIRST_FREE        0x20010000
#define INTERNAL_RAM1_LAST_FREE         ( INTERNAL_SRAM_BASE + INTERNAL_SRAM_SIZE - STACK_SIZE_TOTAL -1 )
//dlmalloc.h MORECORE -> _sbrk_r (newlib) / elua_sbrk (multiple) -> 
//	-> platform_get_first_free_ram  ->  MEM_START_ADDRESS -> INTERNAL_RAM1_FIRST_FREE 

#define BUILD_MMCFS 1
#define PLATFORM_HAS_SYSTIMER 1

//INTERNAL_RAM1_LAST_FREE  -> MEM_END_ADDRESS
#endif // #ifndef __CPU_I386_H__

