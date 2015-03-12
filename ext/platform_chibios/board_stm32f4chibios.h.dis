// Lua board configuration file, automatically generated

#ifndef __GENERATED_STM32F4CHIBIOS_H__
#define __GENERATED_STM32F4CHIBIOS_H__

////////////////////////////////////////////////////////////////////////////////
// Configuration for section 'components'

// Configuration for element 'romfs'
#define BUILD_ROMFS

// Configuration for element 'xmodem'
#define CON_FLOW_TYPE                    PLATFORM_UART_FLOW_NONE
#define CON_UART_SPEED                   115200
#define CON_TIMER_ID                     0
#define CON_UART_ID                      0
#define BUILD_XMODEM

// Configuration for element 'rpc'
#define RPC_UART_SPEED                   115200
#define RPC_TIMER_ID                     PLATFORM_TIMER_SYS_ID
#define RPC_UART_ID                      0
#define BUILD_RPC

// Configuration for element 'term'
#define TERM_LINES                       25
#define TERM_COLS                        80
#define BUILD_TERM

// Configuration for element 'sercon'
#define BUILD_CON_GENERIC

// Configuration for element 'shell'
#define BUILD_SHELL

////////////////////////////////////////////////////////////////////////////////
// Configuration for section 'config'

// Configuration for element 'ram'
#define MEM_START_ADDRESS                { ( u32 )( INTERNAL_RAM1_FIRST_FREE ) }
#define MEM_END_ADDRESS                  { ( u32 )( INTERNAL_RAM1_LAST_FREE ) }

// Configuration for element 'vtmr'
#define VTMR_FREQ_HZ                     1
#define VTMR_NUM_TIMERS                  0

///////////////////////////////////////////////////////////////////////////////
// Static sanity checks and additional defines

#if defined( ELUA_BOOT_RPC ) && !defined( BUILD_RPC )
#define BUILD_RPC
#endif

#if defined( BUILD_LUA_INT_HANDLERS ) || defined( BUILD_C_INT_HANDLERS )
  #define BUILD_INT_HANDLERS

  #ifndef INT_TMR_MATCH
  #define INT_TMR_MATCH         ELUA_INT_INVALID_INTERRUPT
  #endif
#endif // #if defined( BUILD_LUA_INT_HANDLERS ) || defined( BUILD_C_INT_HANDLERS )

#ifndef VTMR_NUM_TIMERS
#define VTMR_NUM_TIMERS       0
#endif // #ifndef VTMR_NUM_TIMERS

#ifndef SERMUX_FLOW_TYPE
#define SERMUX_FLOW_TYPE      PLATFORM_UART_FLOW_NONE
#endif

#ifndef CON_FLOW_TYPE
#define CON_FLOW_TYPE         PLATFORM_UART_FLOW_NONE
#endif

#ifndef CON_TIMER_ID
#define CON_TIMER_ID          PLATFORM_TIMER_SYS_ID
#endif

#ifndef RFS_FLOW_TYPE
#define RFS_FLOW_TYPE         PLATFORM_UART_FLOW_NONE
#endif

#ifdef ELUA_BOOT_RPC
  #ifndef RPC_UART_ID
    #define RPC_UART_ID       CON_UART_ID
  #endif

  #ifndef RPC_TIMER_ID
    #define RPC_TIMER_ID      PLATFORM_TIMER_SYS_ID
  #endif

  #ifndef RPC_UART_SPEED
    #define RPC_UART_SPEED    CON_UART_SPEED
  #endif
#endif // #ifdef ELUA_BOOT_RPC

#if ( defined( BUILD_RFS ) || defined( BUILD_SERMUX ) || defined( CON_BUF_SIZE ) || defined ( CDC_BUF_SIZE ) ) && !defined( BUF_ENABLE_UART )
#define BUF_ENABLE_UART
#endif

#if defined( ADC_BUF_SIZE ) && !defined( BUF_ENABLE_ADC )
#define BUF_ENABLE_ADC
#endif

#ifndef CPU_FREQUENCY
#define CPU_FREQUENCY         0
#endif

////////////////////////////////////////////////////////////////////////////////
// Module configuration

#define PLATFORM_MODULES_LINE
#define MODULE_ELUA_LINE                 _ROM( AUXLIB_ELUA, luaopen_elua, elua_map )

#if ( NUM_PIO > 0 )
#define MODULE_PIO_LINE                  _ROM( AUXLIB_PIO, luaopen_pio, pio_map )
#else
#define MODULE_PIO_LINE
#warning Unable to include generic module 'pio' in the image
#endif

#if ( NUM_UART > 0 )
#define MODULE_UART_LINE                 _ROM( AUXLIB_UART, luaopen_uart, uart_map )
#else
#define MODULE_UART_LINE
#warning Unable to include generic module 'uart' in the image
#endif

#define MODULE_LUA_TABLE_LINE            _ROM( LUA_TABLIBNAME, luaopen_table, tab_funcs )
#define MODULE_LUA_DEBUG_LINE            _ROM( LUA_DBLIBNAME, luaopen_debug, dblib )

#if defined( BUILD_RPC )
#define MODULE_RPC_LINE                  _ROM( AUXLIB_RPC, luaopen_rpc, rpc_map )
#else
#define MODULE_RPC_LINE
#warning Unable to include generic module 'rpc' in the image
#endif

#define MODULE_LUA_MATH_LINE             _ROM( LUA_MATHLIBNAME, luaopen_math, math_map )

#if defined( BUILD_TERM )
#define MODULE_TERM_LINE                 _ROM( AUXLIB_TERM, luaopen_term, term_map )
#else
#define MODULE_TERM_LINE
#warning Unable to include generic module 'term' in the image
#endif

#define MODULE_LUA_STRING_LINE           _ROM( LUA_STRLIBNAME, luaopen_string, strlib )
#define MODULE_LUA_CO_LINE               _ROM( LUA_COLIBNAME, luaopen_dummy, co_funcs )
#define MODULE_PD_LINE                   _ROM( AUXLIB_PD, luaopen_pd, pd_map )

#define LUA_PLATFORM_LIBS_ROM\
  PLATFORM_MODULES_LINE\
  MODULE_ELUA_LINE\
  MODULE_PIO_LINE\
  MODULE_UART_LINE\
  MODULE_LUA_TABLE_LINE\
  MODULE_LUA_DEBUG_LINE\
  MODULE_RPC_LINE\
  MODULE_LUA_MATH_LINE\
  MODULE_TERM_LINE\
  MODULE_LUA_STRING_LINE\
  MODULE_LUA_CO_LINE\
  MODULE_PD_LINE

#define LUA_LIBS_NOLTR\
  { LUA_IOLIBNAME, luaopen_io },\
  { LUA_LOADLIBNAME, luaopen_package },\

#endif // #ifndef __GENERATED_STM32F4CHIBIOS_H__
