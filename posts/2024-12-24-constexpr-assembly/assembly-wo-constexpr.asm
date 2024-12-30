
```nasm
main:
 sub    rsp,0x8
 mov    edx,0x40
 mov    esi,0x0
    R_X86_64_32 .bss+0x48
 xor    eax,eax
 mov    edi,0x0
    R_X86_64_32 .rodata.str1.1
 call   1a <main+0x1a>
    R_X86_64_PLT32 printf-0x4
 mov    edx,0x28
 mov    esi,0x0
    R_X86_64_32 .bss+0x8
 xor    eax,eax
 mov    edi,0x0
    R_X86_64_32 .rodata.str1.1+0xc
 call   30 <main+0x30>
    R_X86_64_PLT32 printf-0x4
 xor    eax,eax
 add    rsp,0x8
 ret
 nop    WORD PTR [rax+rax*1+0x0]
_GLOBAL__sub_I_main:
 pxor   xmm0,xmm0
 movabs rax,0x21646c726f572064
 mov    QWORD PTR [rip+0x0],0x16        # 59 <_GLOBAL__sub_I_main+0x19>
    R_X86_64_PC32 .bss+0x38
 movups XMMWORD PTR [rip+0x0],xmm0        # 60 <_GLOBAL__sub_I_main+0x20>
    R_X86_64_PC32 .bss+0x5a
 movups XMMWORD PTR [rip+0x0],xmm0        # 67 <_GLOBAL__sub_I_main+0x27>
    R_X86_64_PC32 .bss+0x66
 movdqa xmm0,XMMWORD PTR [rip+0x0]        # 6f <_GLOBAL__sub_I_main+0x2f>
    R_X86_64_PC32 .LC2-0x4
 mov    QWORD PTR [rip+0x0],0x19        # 7a <_GLOBAL__sub_I_main+0x3a>
    R_X86_64_PC32 .bss-0x8
 movups XMMWORD PTR [rip+0x0],xmm0        # 81 <_GLOBAL__sub_I_main+0x41>
    R_X86_64_PC32 .bss+0x44
 movdqa xmm0,XMMWORD PTR [rip+0x0]        # 89 <_GLOBAL__sub_I_main+0x49>
    R_X86_64_PC32 .LC3-0x4
 mov    QWORD PTR [rip+0x0],rax        # 90 <_GLOBAL__sub_I_main+0x50>
    R_X86_64_PC32 .bss+0x52
 movups XMMWORD PTR [rip+0x0],xmm0        # 97 <_GLOBAL__sub_I_main+0x57>
    R_X86_64_PC32 .bss+0x4
 movdqa xmm0,XMMWORD PTR [rip+0x0]        # 9f <_GLOBAL__sub_I_main+0x5f>
    R_X86_64_PC32 .LC4-0x4
 mov    BYTE PTR [rip+0x0],0x0        # a6 <_GLOBAL__sub_I_main+0x66>
    R_X86_64_PC32 .bss+0x1c
 movups XMMWORD PTR [rip+0x0],xmm0        # ad <_GLOBAL__sub_I_main+0x6d>
    R_X86_64_PC32 .bss+0xd
 ret
```