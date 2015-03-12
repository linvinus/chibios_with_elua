
local utils = require "utils.utils"
local sf = string.format

addi( sf( '%s', os.getenv( "INCDIR" ) or '' ) )
--~ addlib( { 'c','gcc','m' } )

-- Configuration file for the LPC288x backend


specific_files = "platform.c"

local ldscript = ""
 
  
-- Prepend with path
specific_files = utils.prepend_path( specific_files, sf( "src/platform/%s", platform ) )
specific_files = specific_files .. " src/platform/cortex_utils.s src/platform/arm_cortex_interrupts.c"
--~ ldscript = sf( "src/platform/%s/%s", platform, ldscript )

addm{ "FOR" .. comp.cpu:upper(), 'gcc' }

-- Standard GCC flags
addcf( { '-O0' } )
addcf( { '-g' } )
--~ addcf{ '-ffunction-sections', '-fdata-sections', '-fno-strict-aliasing', '-Wall' }
--~ addlf{ '-nostartfiles', '-nostdlib', '-T', ldscript, '-Wl,--gc-sections', '-Wl,--allow-multiple-definition' }
--~ addaf{ '-x', 'assembler-with-cpp', '-Wall' }
--~ addlib{ 'c','gcc','m' }

-- Special target configuration
local target_flags = { '-mcpu=cortex-m4', '-mthumb','-mfloat-abi=hard', '-mfpu=fpv4-sp-d16' }

-- Configure general flags for target
addcf( { target_flags, '-mlittle-endian' } )
addlf( { target_flags, '-Wl,-e,Reset_Handler', '-Wl,-static' } )
addaf( target_flags )

--~ addm( 'CPUMODE_ARM' )
 
addcf( target_flags )
--~ addlf{ target_flags, '-Wl,-e,HardReset' }
--~ addaf{ target_flags,'-D__ASSEMBLY__' }

-- Toolset data
tools.chibios = {}

-- Array of file names that will be checked against the 'prog' target; their absence will force a rebuild
tools.chibios.prog_flist = { output .. ".bin" }

-- We use 'gcc' as the assembler
toolset.asm = toolset.compile

