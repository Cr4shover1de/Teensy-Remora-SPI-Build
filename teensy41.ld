/* Linker script for Teensy 4.1 */

MEMORY
{
  ITCM (rx)  : ORIGIN = 0x00000000, LENGTH = 512K
  DTCM (rw)  : ORIGIN = 0x20000000, LENGTH = 512K
  RAM  (rwx) : ORIGIN = 0x20200000, LENGTH = 1024K
  FLASH(rx)  : ORIGIN = 0x60000000, LENGTH = 8192K
}

SECTIONS
{
  .text :
  {
    KEEP(*(.isr_vector))
    *(.text*)
    *(.rodata*)
  } > ITCM

  .data : AT (__etext)
  {
    __data_start__ = .;
    *(.data*)
    __data_end__ = .;
  } > DTCM

  .bss :
  {
    __bss_start__ = .;
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;
  } > RAM
}
