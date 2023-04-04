ENTRY(main)

MEMORY
{
  ram : ORIGIN = 0x80000000, LENGTH = 0x4000
}

SECTIONS
{
  .text 0x80000000 : ALIGN(4)
  {
    *(.text)
  } > ram

  .data 0x80001000 : ALIGN(4)
  {
    *(.data)
  } > ram

  /* Define the size of the code and data sections */
  code_size = SIZEOF(.text);
  data_size = SIZEOF(.data);
}

