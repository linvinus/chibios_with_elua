-- STM32F4DISCOVERY build configuration

return {
  cpu = 'CHIBIOS_CPU',
  components = {
    sercon = { uart = 0, speed = 115200, timer = 0 },
    romfs = true,
    --~ shell = true,
    advanced_shell = true,
    term = { lines = 25, cols = 80 },
    linenoise = { shell_lines = 10, lua_lines = 50 },
    xmodem = true,
    rpc = { uart = 0, speed = 115200 }
  },
  --~ config = {
    --~ ram = { ext_start = { "SDRAM_BASE_ADDR" }, ext_size = { "SDRAM_SIZE" } }
  --~ },
  modules = {
    --~ generic = { 'pd', 'uart', 'term', 'pack', 'bit', 'elua', 'cpu', 'rpc', 'all_lua' }
    generic = { 'pd', 'uart', 'term',  'elua',  'rpc', 'pio', 'all_lua' },
    platform = 'all',
  }
}

