/* Minimal Teensy 4.1 Linker Script */

MEMORY
{
  ITCM (rx)  : ORIGIN = 0x00000000, LENGTH = 512K
  DTCM (rwx) : ORIGIN = 0x20000000, LENGTH = 512K
  OCRAM (rwx): ORIGIN = 0x20200000, LENGTH = 512K
  FLASH (rx) : ORIGIN = 0x60000000, LENGTH = 8192K
}

SECTIONS
{
  .text : {
    KEEP(*(.vectors))
    *(.text*)
    *(.rodata*)
    _etext = .;
  } >FLASH

  .data : AT(_etext) {
    _data = .;
    *(.data*)
    _edata = .;
  } >DTCM

  .bss : {
    _bss = .;
    *(.bss*)
    *(COMMON)
    _ebss = .;
  } >DTCM

  .heap (COPY) : {
    __end__ = .;
    end = __end__;
    *(.heap*)
    __HeapLimit = .;
  } >DTCM

  .stack (COPY) : {
    __StackLimit = .;
    *(.stack*)
    __StackTop = .;
  } >DTCM
}
