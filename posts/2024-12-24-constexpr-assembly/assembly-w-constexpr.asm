
main:
 sub    rsp,0x8
 mov    edx,0x40
 mov    esi,0x0
    R_X86_64_32 .rodata+0x48
 xor    eax,eax
 mov    edi,0x0
    R_X86_64_32 .rodata.str1.1
 call   1a <main+0x1a>
    R_X86_64_PLT32 printf-0x4
 mov    edx,0x28
 mov    esi,0x0
    R_X86_64_32 .rodata+0x8
 xor    eax,eax
 mov    edi,0x0
    R_X86_64_32 .rodata.str1.1+0xc
 call   30 <main+0x30>
    R_X86_64_PLT32 printf-0x4
 xor    eax,eax
 add    rsp,0x8
 ret