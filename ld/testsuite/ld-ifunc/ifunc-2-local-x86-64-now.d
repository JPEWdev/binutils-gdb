#source: ifunc-2-local-x86-64.s
#as: --64
#ld: -z now -shared -melf_x86_64 --hash-style=sysv
#objdump: -dw
#target: x86_64-*-*
#notarget: x86_64-*-nacl*

.*: +file format .*


Disassembly of section .plt:

0+1f0 <.plt>:
 +[a-f0-9]+:	ff 35 42 01 20 00    	pushq  0x200142\(%rip\)        # 200338 <_GLOBAL_OFFSET_TABLE_\+0x8>
 +[a-f0-9]+:	ff 25 44 01 20 00    	jmpq   \*0x200144\(%rip\)        # 200340 <_GLOBAL_OFFSET_TABLE_\+0x10>
 +[a-f0-9]+:	0f 1f 40 00          	nopl   0x0\(%rax\)

0+200 <\*ABS\*\+0x210@plt>:
 +[a-f0-9]+:	ff 25 42 01 20 00    	jmpq   \*0x200142\(%rip\)        # 200348 <_GLOBAL_OFFSET_TABLE_\+0x18>
 +[a-f0-9]+:	68 00 00 00 00       	pushq  \$0x0
 +[a-f0-9]+:	e9 e0 ff ff ff       	jmpq   1f0 <.plt>

Disassembly of section .text:

0+210 <foo>:
 +[a-f0-9]+:	c3                   	retq   

0+211 <bar>:
 +[a-f0-9]+:	e8 ea ff ff ff       	callq  200 <\*ABS\*\+0x210@plt>
 +[a-f0-9]+:	48 8d 05 e3 ff ff ff 	lea    -0x1d\(%rip\),%rax        # 200 <\*ABS\*\+0x210@plt>
 +[a-f0-9]+:	c3                   	retq   
#pass
