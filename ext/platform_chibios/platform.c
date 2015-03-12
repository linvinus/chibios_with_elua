// Platform-dependent functions

#include "platform.h"
#include "type.h"
#include "devman.h"
#include "genstd.h"
#include "stacks.h"
#include <reent.h>
#include <errno.h>
#include <string.h>
#include <ctype.h>
#include <stdio.h>
//#include "lpc288x.h"
//#include "target.h"
//#include "uart.h"
#include "utils.h"
#include "common.h"
#include "platform_conf.h"
#include "hal.h"

// ****************************************************************************
// Platform initialization

int platform_init()
{ 

  // Setup PIO, not needed, done in chibios board.h
  //pios_init();

  cmn_platform_init();

  return PLATFORM_OK;
} 

// ****************************************************************************
// PIO functions
GPIO_TypeDef * const pio_port[] = { GPIOA, GPIOB, GPIOC, GPIOD, GPIOE, GPIOF, GPIOG, GPIOH, GPIOI };
uint16_t const ignore_pins[] = { 1<<2|1<<3|1<<11|1<<12, /*A2,A3,A11,A12 UART2 RX,TX,GPIOA_OTG_FS_DM,GPIOA_OTG_FS_DP */
								0,0,0,0,0,0,0,0,0};

pio_type platform_pio_op( unsigned port, pio_type pinmask, int op )
{
  pio_type retval = 1;//ok , 0-error
  GPIO_TypeDef * target_port = pio_port[ port ];
  uint16_t new_state = 0xffff;
  
  switch( op )
  {
    case PLATFORM_IO_PORT_SET_VALUE:
		palWritePort(target_port,pinmask);
      break;

    case PLATFORM_IO_PORT_DIR_OUTPUT:
		new_state &= ~(ignore_pins[port]);//exclude some pins
		palSetGroupMode(target_port,new_state, 0, PAL_STM32_MODE_OUTPUT | PAL_STM32_OTYPE_PUSHPULL | PAL_STM32_OSPEED_MID1 | PAL_STM32_PUDR_FLOATING );
      break;
      
    case PLATFORM_IO_PORT_DIR_INPUT:
		new_state &= ~(ignore_pins[port]);//exclude some pins
		palSetGroupMode(target_port,new_state, 0, PAL_STM32_MODE_INPUT | PAL_STM32_OTYPE_PUSHPULL | PAL_STM32_OSPEED_MID1 | PAL_STM32_PUDR_FLOATING );
      break;
            
    case PLATFORM_IO_PORT_GET_VALUE:
		retval=palReadPort(target_port);
      break;

    case PLATFORM_IO_PIN_GET:
		retval=palReadPad(target_port,pinmask);
      break;

    case PLATFORM_IO_PIN_SET:
		if(ignore_pins[port] & pinmask)
			retval=0;//notify user about error
		pinmask &= ~(ignore_pins[port]);
		palSetPort(target_port,pinmask);
      break;
      
    case PLATFORM_IO_PIN_CLEAR:
		if(ignore_pins[port] & pinmask)
			retval=0;//notify user about error
		pinmask &= ~(ignore_pins[port]);
		palClearPort(target_port,pinmask);
      break;
      
    case PLATFORM_IO_PIN_DIR_OUTPUT:
		if(ignore_pins[port] & pinmask)
			retval=0;//notify user about error
		pinmask &= ~(ignore_pins[port]);
		palSetGroupMode(target_port,pinmask, 0, PAL_STM32_MODE_OUTPUT);
      break;

    case PLATFORM_IO_PIN_DIR_INPUT:
		if(ignore_pins[port] & pinmask)
			retval=0;//notify user about error
		pinmask &= ~(ignore_pins[port]);
		palSetGroupMode(target_port,pinmask, 0, PAL_STM32_MODE_INPUT);
      break;
      
    default:
      retval = 0;
      break;
  }
  return retval;  
}

// ****************************************************************************
// UART

u32 platform_uart_setup( unsigned id, u32 baud, int databits, int parity, int stopbits )
{
  ( void )id;
  return 0;//uart_init( baud, databits, parity, stopbits );
}

void platform_s_uart_send( unsigned id, u8 data )
{
	sdPutTimeout((SerialDriver*)eLuaSDriver, data,1000/*ticks, TIME_IMMEDIATE - bad idea*/);
  //uart_write( data );
}

int platform_s_uart_recv( unsigned id, timer_data_type timeout )
{
  if( timeout == 0 )
  {
    // Return data only if already available
    return sdGetTimeout((SerialDriver*)eLuaSDriver,TIME_IMMEDIATE);
  }
  if( timeout ==  -1 || timeout == STD_INFINITE_TIMEOUT)
  {
    // Return data only if already available
    return sdGetTimeout((SerialDriver*)eLuaSDriver,TIME_INFINITE);
  }
  return sdGetTimeout((SerialDriver*)eLuaSDriver,timeout);

}

int platform_s_uart_set_flow_control( unsigned id, int type )
{
  return PLATFORM_ERR;
}

// ****************************************************************************
// Timer


// Helper: get timer clock
static u32 platform_timer_get_clock( unsigned id )
{
  return 0;//MAIN_CLOCK / tmr_prescale[ ( *tmr_ctrl[ id ] >> 2 ) & 0x03 ];
}

// Helper: set timer clock
static u32 platform_timer_set_clock( unsigned id, u32 clock )
{
  return 0;//MAIN_CLOCK / tmr_prescale[ mini ];
}

void platform_s_timer_delay( unsigned id, timer_data_type delay_us )
{
}
      
timer_data_type platform_s_timer_op( unsigned id, int op, timer_data_type data )
{
  u32 res = 0;
  //~ TIM_TypeDef *ptimer = (TIM_TypeDef*)timer[ id ];

  data = data;
  switch( op )
  {
    case PLATFORM_TIMER_OP_START:
      //~ TIM_SetCounter( ptimer, 0 );
      res = chTimeNow();
      break;

    case PLATFORM_TIMER_OP_READ:
      res = chTimeNow();//TIM_GetCounter( ptimer );
      break;

    case PLATFORM_TIMER_OP_SET_CLOCK:
      res = CH_FREQUENCY;//platform_timer_set_clock( id, data );
      break;

    case PLATFORM_TIMER_OP_GET_CLOCK:
      res = CH_FREQUENCY;//platform_timer_get_clock( id );
      break;

    case PLATFORM_TIMER_OP_GET_MAX_CNT:
      res = 0xFFFFFFFF;//( timer_width[id] == 32 ? 0xFFFFFFFF : 0xFFFF );
      break;

  }
  return res;

}

u64 platform_timer_sys_raw_read()
{
  return MS2ST(chTimeNow());
}

void platform_timer_sys_disable_int()
{
  //~ SysTick->CTRL &= ~( 1 << SysTick_CTRL_TICKINT_Pos );
}

void platform_timer_sys_enable_int()
{
  //~ SysTick->CTRL |= 1 << SysTick_CTRL_TICKINT_Pos;
}

timer_data_type platform_timer_read_sys()
{
  return MS2ST(chTimeNow());
}
