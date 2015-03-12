ELUA=$(CHIBIOSLUA)/ext/elua

ELUA_SRC_CSRC = $(ELUA)/src/buf.c \
            $(ELUA)/src/common.c \
            $(ELUA)/src/common_fs.c \
            $(ELUA)/src/common_tmr.c \
            $(ELUA)/src/common_uart.c \
            $(ELUA)/src/dlmalloc.c \
            $(ELUA)/src/elua_adc.c \
            $(ELUA)/src/elua_int.c \
            $(ELUA)/src/elua_uip.c \
            $(ELUA)/src/eluarpc.c \
            $(ELUA)/src/linenoise.c \
            $(ELUA)/src/romfs.c \
            $(ELUA)/src/salloc.c \
            $(ELUA)/src/semifs.c \
            $(ELUA)/src/xmodem.c \
            $(ELUA)/src/luarpc_elua_uart.c \
            $(ELUA)/src/term.c
            

ELUA_LUA_CSRC = $(ELUA)/src/lua/lapi.c \
            $(ELUA)/src/lua/lauxlib.c \
            $(ELUA)/src/lua/lbaselib.c \
            $(ELUA)/src/lua/lcode.c \
            $(ELUA)/src/lua/ldblib.c \
            $(ELUA)/src/lua/ldebug.c \
            $(ELUA)/src/lua/ldo.c \
            $(ELUA)/src/lua/ldump.c \
            $(ELUA)/src/lua/legc.c \
            $(ELUA)/src/lua/lfunc.c \
            $(ELUA)/src/lua/lgc.c \
            $(ELUA)/src/lua/linit.c \
            $(ELUA)/src/lua/liolib.c \
            $(ELUA)/src/lua/llex.c \
            $(ELUA)/src/lua/lmathlib.c \
            $(ELUA)/src/lua/lmem.c \
            $(ELUA)/src/lua/loadlib.c \
            $(ELUA)/src/lua/lobject.c \
            $(ELUA)/src/lua/lopcodes.c \
            $(ELUA)/src/lua/loslib.c \
            $(ELUA)/src/lua/lparser.c \
            $(ELUA)/src/lua/lrotable.c \
            $(ELUA)/src/lua/lstate.c \
            $(ELUA)/src/lua/lstring.c \
            $(ELUA)/src/lua/lstrlib.c \
            $(ELUA)/src/lua/ltable.c \
            $(ELUA)/src/lua/ltablib.c \
            $(ELUA)/src/lua/ltm.c \
            $(ELUA)/src/lua/lua.c \
            $(ELUA)/src/lua/lundump.c \
            $(ELUA)/src/lua/lvm.c \
            $(ELUA)/src/lua/lzio.c

            
ELUA_MODULES_CSRC = $(ELUA)/src/modules/adc.c \
            $(ELUA)/src/modules/bit.c \
            $(ELUA)/src/modules/bitarray.c \
            $(ELUA)/src/modules/can.c \
            $(ELUA)/src/modules/cpu.c \
            $(ELUA)/src/modules/elua.c \
            $(ELUA)/src/modules/i2c.c \
            $(ELUA)/src/modules/lpack.c \
            $(ELUA)/src/modules/luarpc.c \
            $(ELUA)/src/modules/net.c \
            $(ELUA)/src/modules/pd.c \
            $(ELUA)/src/modules/pio.c \
            $(ELUA)/src/modules/pwm.c \
            $(ELUA)/src/modules/spi.c \
            $(ELUA)/src/modules/tmr.c \
            $(ELUA)/src/modules/uart.c \
            $(ELUA)/src/modules/term.c


ELUA_NEWLIB_CSRC = $(ELUA)/src/newlib/devman.c \
            $(ELUA)/src/newlib/genstd.c \
            $(ELUA)/src/newlib/stdtcp.c \
            $(ELUA)/src/newlib/stubs.c


ELUA_REMOTEFS_CSRC = $(ELUA)/src/remotefs/client.c \
            $(ELUA)/src/remotefs/elua_os_io.c \
            $(ELUA)/src/remotefs/elua_rfs.c \
            $(ELUA)/src/remotefs/remotefs.c


ELUA_SHELL_CSRC = $(ELUA)/src/shell/shell.c \
            $(ELUA)/src/shell/shell_adv_cp_mv.c \
            $(ELUA)/src/shell/shell_adv_rm.c \
            $(ELUA)/src/shell/shell_cat.c \
            $(ELUA)/src/shell/shell_help.c \
            $(ELUA)/src/shell/shell_ls.c \
            $(ELUA)/src/shell/shell_lua.c \
            $(ELUA)/src/shell/shell_mkdir.c \
            $(ELUA)/src/shell/shell_recv.c \
            $(ELUA)/src/shell/shell_ver.c \
            $(ELUA)/src/shell/shell_wofmt.c


ELUA_uIP_CSRC = $(ELUA)/src/uip/uip_arp.c \
            $(ELUA)/src/uip/uip.c \
            $(ELUA)/src/uip/uiplib.c \
            $(ELUA)/src/uip/dhcpc.c \
            $(ELUA)/src/uip/psock.c \
            $(ELUA)/src/uip/resolv.c \
            $(ELUA)/src/uip/uip-neighbor.c
            
            
ELUA_PLATFORM1_CSRC =  $(CHIBIOSLUA)/ext/platform_chibios/platform.c 

ELUA_PLATFORM2_CSRC = $(ELUA)/src/platform/arm_cortex_interrupts.c

ELUA_EXT_CSRC =  $(CHIBIOSLUA)/ext/elua_chibios_mod.c \
                 $(CHIBIOSLUA)/ext/ch_lua.c

#            $(ELUA)/src/platform/arm_utils.s \

ELUA_FATFS_CSRC = $(ELUA)/src/fatfs/ccsbcs.c \
            $(ELUA)/src/fatfs/ff.c


#ELUA_ALL_CSRC = $(ELUA_EXT_CSRC) $(ELUA_SRC_CSRC) $(ELUA_FATFS_CSRC) $(ELUA_LUA_CSRC) $(ELUA_MODULES_CSRC) $(ELUA_NEWLIB_CSRC) $(ELUA_REMOTEFS_CSRC) $(ELUA_SHELL_CSRC) $(ELUA_uIP_CSRC) $(ELUA_PLATFORM1_CSRC) $(ELUA_PLATFORM2_CSRC)


ELUA_SRC_OBJS     = $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_SRC_CSRC:.c=.o.elua_src)))
ELUA_LUA_OBJS     = $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_LUA_CSRC:.c=.o.elua_lua)))
ELUA_MODULES_OBJS = $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_MODULES_CSRC:.c=.o.elua_modules)))
ELUA_NEWLIB_OBJS  = $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_NEWLIB_CSRC:.c=.o.elua_newlib)))
ELUA_REMOTEFS_OBJS= $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_REMOTEFS_CSRC:.c=.o.elua_remotefs)))
ELUA_SHELL_OBJS   = $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_SHELL_CSRC:.c=.o.elua_shell)))
ELUA_uIP_OBJS     = $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_uIP_CSRC:.c=.o.elua_uip)))
ELUA_PLATFORM_OBJS= $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_PLATFORM_CSRC:.c=.o.elua_platform)))
ELUA_FATFS_OBJS= $(addprefix $(BUILDDIR)/obj/, $(notdir $(ELUA_FATFS_CSRC:.c=.o.elua_fatfs)))
ELUA_EXT_OBJS= $(BUILDDIR)/obj/ch_lua.o.ext $(BUILDDIR)/obj/elua_chibios_mod.o.ext  $(BUILDDIR)/obj/platform.o.PLATFORM1  $(BUILDDIR)/obj/arm_cortex_interrupts.o.PLATFORM2


EXT_INC = $(CHIBIOSLUA)/ext \
            $(ELUA)/inc \
            $(ELUA)/inc/newlib \
            $(CHIBIOSLUA)/ext/platform_chibios \
            $(ELUA)/src/lua \
            $(ELUA)/src/modules \
            $(ELUA)/boards/headers \
            $(ELUA)/inc/remotefs

EXT_ASMSRC = $(ELUA)/src/platform/cortex_utils.s

#   $(shell ls $(ELUA)/src/platform/chibios 2>/dev/null || ln -s $(CHIBIOSLUA)/ext/platform_chibios $(ELUA)/src/platform/chibios 2>/dev/null) \
#   $(shell ls $(ELUA)/src/boards/headers/board_stm32f4chibios.h 2>/dev/null || ln -s $(CHIBIOSLUA)/ext/platform_chibios/board_stm32f4chibios.h $(ELUA)/src/boards/headers/board_stm32f4chibios.h 2>/dev/null) \

EXT_PREPROCESS_SHELL=$(warning EXT_PREPROCESS_SHELL) \
   $(shell ln -s $(CHIBIOSLUA)/ext/stm32f4chibios.lua $(ELUA)/boards/known/stm32f4chibios.lua 2>/dev/null) \
   $(shell ls $(ELUA)/src/platform/chibios >/dev/null 2>&1  || ln -s $(CHIBIOSLUA)/ext/platform_chibios $(ELUA)/src/platform/chibios >/dev/null 2>&1) \
   $(shell (cd ${ELUA} ; patch -N <$(CHIBIOSLUA)/ext/build_data.lua.diff ; ./build_elua.lua board=stm32f4chibios config_only=true; ./build_elua.lua board=stm32f4chibios) >>./build.log 2>&1)

#main link with rules.mk
ELUA_ALL_OBJS= $(EXT_PREPROCESS_SHELL) $(ELUA_EXT_OBJS) $(ELUA_SRC_OBJS) $(ELUA_LUA_OBJS) $(ELUA_MODULES_OBJS) $(ELUA_NEWLIB_OBJS) $(ELUA_REMOTEFS_OBJS) $(ELUA_SHELL_OBJS) $(ELUA_uIP_OBJS) $(ELUA_PLATFORM_OBJS)

$(BUILDDIR)/obj/%.o.elua_src : $(ELUA)/src/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.elua_lua : $(ELUA)/src/lua/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.elua_modules : $(ELUA)/src/modules/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.elua_newlib : $(ELUA)/src/newlib/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.elua_remotefs : $(ELUA)/src/remotefs/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

#-E -DI

$(BUILDDIR)/obj/%.o.elua_shell : $(ELUA)/src/shell/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.elua_uip : $(ELUA)/src/uip/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.PLATFORM1 : $(CHIBIOSLUA)/ext/platform_chibios/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.PLATFORM2 : $(ELUA)/src/platform/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.elua_fatfs : $(ELUA)/src/fatfs/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif

$(BUILDDIR)/obj/%.o.ext : $(CHIBIOSLUA)/ext/%.c Makefile
ifeq ($(USE_VERBOSE_COMPILE),yes)
	@echo
	$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
else
	@echo Compiling $(<F)
	@$(CC) -c $(CFLAGS) $(TOPT) -I. $(IINCDIR) $< -o $@
endif


#./build_elua.lua board=stm32f4chibios config_only
