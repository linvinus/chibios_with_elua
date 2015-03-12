#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
#include "platform.h"
#include "lrotable.h"
#include "platform_conf.h"
#include "auxmods.h"



//Lua: SleepMilliseconds(millsec)
static int sleep_milliseconds( lua_State *L )
{
  unsigned milli;
  
  milli = luaL_checkinteger( L, 1 );
  chThdSleepMilliseconds(milli);
  return 0;
}
//Lua: SleepSeconds(sec)
static int sleep_senonds( lua_State *L )
{
  unsigned sec;
  
  sec = luaL_checkinteger( L, 1 );
  chThdSleepSeconds(sec);
  return 0;
}

#define MIN_OPT_LEVEL 2
#include "lrodefs.h"  

// Module function map
const LUA_REG_TYPE thd_map[] =
{ 
  { LSTRKEY( "SleepMilliseconds" ),  LFUNCVAL( sleep_milliseconds ) },
  { LSTRKEY( "SleepSeconds" ),  LFUNCVAL( sleep_milliseconds ) },
  { LNILKEY, LNILVAL }
};

LUALIB_API int luaopen_thd( lua_State *L )
{
  LREGISTER( L, "thd", thd_map );
}  

// Add the module to the module table. Do *NOT* terminate this with a NULL entry
// The linker script does it for you.
//~ _ELUA_MODTAB = {
	//~ { "ch", luaopen_chibios }
//~ };
