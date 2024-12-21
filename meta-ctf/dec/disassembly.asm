
hot_coco:	file format elf64-x86-64

Disassembly of section .init:

0000000000001000 <_init>:
    1000: f3 0f 1e fa                  	endbr64
    1004: 48 83 ec 08                  	sub	rsp, 0x8
    1008: 48 8b 05 c1 2f 00 00         	mov	rax, qword ptr [rip + 0x2fc1] # 0x3fd0 <strlen@GLIBC_2.2.5+0x3fd0>
    100f: 48 85 c0                     	test	rax, rax
    1012: 74 02                        	je	0x1016 <_init+0x16>
    1014: ff d0                        	call	rax
    1016: 48 83 c4 08                  	add	rsp, 0x8
    101a: c3                           	ret

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020: ff 35 ca 2f 00 00            	push	qword ptr [rip + 0x2fca] # 0x3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026: ff 25 cc 2f 00 00            	jmp	qword ptr [rip + 0x2fcc] # 0x3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c: 0f 1f 40 00                  	nop	dword ptr [rax]

0000000000001030 <puts@plt>:
    1030: ff 25 ca 2f 00 00            	jmp	qword ptr [rip + 0x2fca] # 0x4000 <_GLOBAL_OFFSET_TABLE_+0x18>
    1036: 68 00 00 00 00               	push	0x0
    103b: e9 e0 ff ff ff               	jmp	0x1020 <.plt>

0000000000001040 <fclose@plt>:
    1040: ff 25 c2 2f 00 00            	jmp	qword ptr [rip + 0x2fc2] # 0x4008 <_GLOBAL_OFFSET_TABLE_+0x20>
    1046: 68 01 00 00 00               	push	0x1
    104b: e9 d0 ff ff ff               	jmp	0x1020 <.plt>

0000000000001050 <strlen@plt>:
    1050: ff 25 ba 2f 00 00            	jmp	qword ptr [rip + 0x2fba] # 0x4010 <_GLOBAL_OFFSET_TABLE_+0x28>
    1056: 68 02 00 00 00               	push	0x2
    105b: e9 c0 ff ff ff               	jmp	0x1020 <.plt>

0000000000001060 <__stack_chk_fail@plt>:
    1060: ff 25 b2 2f 00 00            	jmp	qword ptr [rip + 0x2fb2] # 0x4018 <_GLOBAL_OFFSET_TABLE_+0x30>
    1066: 68 03 00 00 00               	push	0x3
    106b: e9 b0 ff ff ff               	jmp	0x1020 <.plt>

0000000000001070 <printf@plt>:
    1070: ff 25 aa 2f 00 00            	jmp	qword ptr [rip + 0x2faa] # 0x4020 <_GLOBAL_OFFSET_TABLE_+0x38>
    1076: 68 04 00 00 00               	push	0x4
    107b: e9 a0 ff ff ff               	jmp	0x1020 <.plt>

0000000000001080 <fgets@plt>:
    1080: ff 25 a2 2f 00 00            	jmp	qword ptr [rip + 0x2fa2] # 0x4028 <_GLOBAL_OFFSET_TABLE_+0x40>
    1086: 68 05 00 00 00               	push	0x5
    108b: e9 90 ff ff ff               	jmp	0x1020 <.plt>

0000000000001090 <strcmp@plt>:
    1090: ff 25 9a 2f 00 00            	jmp	qword ptr [rip + 0x2f9a] # 0x4030 <_GLOBAL_OFFSET_TABLE_+0x48>
    1096: 68 06 00 00 00               	push	0x6
    109b: e9 80 ff ff ff               	jmp	0x1020 <.plt>

00000000000010a0 <fflush@plt>:
    10a0: ff 25 92 2f 00 00            	jmp	qword ptr [rip + 0x2f92] # 0x4038 <_GLOBAL_OFFSET_TABLE_+0x50>
    10a6: 68 07 00 00 00               	push	0x7
    10ab: e9 70 ff ff ff               	jmp	0x1020 <.plt>

00000000000010b0 <fopen@plt>:
    10b0: ff 25 8a 2f 00 00            	jmp	qword ptr [rip + 0x2f8a] # 0x4040 <_GLOBAL_OFFSET_TABLE_+0x58>
    10b6: 68 08 00 00 00               	push	0x8
    10bb: e9 60 ff ff ff               	jmp	0x1020 <.plt>

00000000000010c0 <fwrite@plt>:
    10c0: ff 25 82 2f 00 00            	jmp	qword ptr [rip + 0x2f82] # 0x4048 <_GLOBAL_OFFSET_TABLE_+0x60>
    10c6: 68 09 00 00 00               	push	0x9
    10cb: e9 50 ff ff ff               	jmp	0x1020 <.plt>

Disassembly of section .text:

00000000000010d0 <_start>:
    10d0: f3 0f 1e fa                  	endbr64
    10d4: 31 ed                        	xor	ebp, ebp
    10d6: 49 89 d1                     	mov	r9, rdx
    10d9: 5e                           	pop	rsi
    10da: 48 89 e2                     	mov	rdx, rsp
    10dd: 48 83 e4 f0                  	and	rsp, -0x10
    10e1: 50                           	push	rax
    10e2: 54                           	push	rsp
    10e3: 45 31 c0                     	xor	r8d, r8d
    10e6: 31 c9                        	xor	ecx, ecx
    10e8: 48 8d 3d f4 01 00 00         	lea	rdi, [rip + 0x1f4]      # 0x12e3 <main>
    10ef: ff 15 cb 2e 00 00            	call	qword ptr [rip + 0x2ecb] # 0x3fc0 <strlen@GLIBC_2.2.5+0x3fc0>
    10f5: f4                           	hlt
    10f6: 66 2e 0f 1f 84 00 00 00 00 00	nop	word ptr cs:[rax + rax]
    1100: 48 8d 3d 59 2f 00 00         	lea	rdi, [rip + 0x2f59]     # 0x4060 <stdout@GLIBC_2.2.5>
    1107: 48 8d 05 52 2f 00 00         	lea	rax, [rip + 0x2f52]     # 0x4060 <stdout@GLIBC_2.2.5>
    110e: 48 39 f8                     	cmp	rax, rdi
    1111: 74 15                        	je	0x1128 <_start+0x58>
    1113: 48 8b 05 ae 2e 00 00         	mov	rax, qword ptr [rip + 0x2eae] # 0x3fc8 <strlen@GLIBC_2.2.5+0x3fc8>
    111a: 48 85 c0                     	test	rax, rax
    111d: 74 09                        	je	0x1128 <_start+0x58>
    111f: ff e0                        	jmp	rax
    1121: 0f 1f 80 00 00 00 00         	nop	dword ptr [rax]
    1128: c3                           	ret
    1129: 0f 1f 80 00 00 00 00         	nop	dword ptr [rax]
    1130: 48 8d 3d 29 2f 00 00         	lea	rdi, [rip + 0x2f29]     # 0x4060 <stdout@GLIBC_2.2.5>
    1137: 48 8d 35 22 2f 00 00         	lea	rsi, [rip + 0x2f22]     # 0x4060 <stdout@GLIBC_2.2.5>
    113e: 48 29 fe                     	sub	rsi, rdi
    1141: 48 89 f0                     	mov	rax, rsi
    1144: 48 c1 ee 3f                  	shr	rsi, 0x3f
    1148: 48 c1 f8 03                  	sar	rax, 0x3
    114c: 48 01 c6                     	add	rsi, rax
    114f: 48 d1 fe                     	sar	rsi
    1152: 74 14                        	je	0x1168 <_start+0x98>
    1154: 48 8b 05 7d 2e 00 00         	mov	rax, qword ptr [rip + 0x2e7d] # 0x3fd8 <strlen@GLIBC_2.2.5+0x3fd8>
    115b: 48 85 c0                     	test	rax, rax
    115e: 74 08                        	je	0x1168 <_start+0x98>
    1160: ff e0                        	jmp	rax
    1162: 66 0f 1f 44 00 00            	nop	word ptr [rax + rax]
    1168: c3                           	ret
    1169: 0f 1f 80 00 00 00 00         	nop	dword ptr [rax]
    1170: f3 0f 1e fa                  	endbr64
    1174: 80 3d 0d 2f 00 00 00         	cmp	byte ptr [rip + 0x2f0d], 0x0 # 0x4088 <stderr@GLIBC_2.2.5+0x8>
    117b: 75 33                        	jne	0x11b0 <_start+0xe0>
    117d: 55                           	push	rbp
    117e: 48 83 3d 5a 2e 00 00 00      	cmp	qword ptr [rip + 0x2e5a], 0x0 # 0x3fe0 <strlen@GLIBC_2.2.5+0x3fe0>
    1186: 48 89 e5                     	mov	rbp, rsp
    1189: 74 0d                        	je	0x1198 <_start+0xc8>
    118b: 48 8b 3d c6 2e 00 00         	mov	rdi, qword ptr [rip + 0x2ec6] # 0x4058 <__dso_handle>
    1192: ff 15 48 2e 00 00            	call	qword ptr [rip + 0x2e48] # 0x3fe0 <strlen@GLIBC_2.2.5+0x3fe0>
    1198: e8 63 ff ff ff               	call	0x1100 <_start+0x30>
    119d: c6 05 e4 2e 00 00 01         	mov	byte ptr [rip + 0x2ee4], 0x1 # 0x4088 <stderr@GLIBC_2.2.5+0x8>
    11a4: 5d                           	pop	rbp
    11a5: c3                           	ret
    11a6: 66 2e 0f 1f 84 00 00 00 00 00	nop	word ptr cs:[rax + rax]
    11b0: c3                           	ret
    11b1: 66 66 2e 0f 1f 84 00 00 00 00 00     	nop	word ptr cs:[rax + rax]
    11bc: 0f 1f 40 00                  	nop	dword ptr [rax]
    11c0: f3 0f 1e fa                  	endbr64
    11c4: e9 67 ff ff ff               	jmp	0x1130 <_start+0x60>

00000000000011c9 <count_matching_bits>:
    11c9: 55                           	push	rbp
    11ca: 48 89 e5                     	mov	rbp, rsp
    11cd: 48 83 ec 50                  	sub	rsp, 0x50
    11d1: 48 89 7d b8                  	mov	qword ptr [rbp - 0x48], rdi
    11d5: 48 89 75 b0                  	mov	qword ptr [rbp - 0x50], rsi
    11d9: c7 45 cc 00 00 00 00         	mov	dword ptr [rbp - 0x34], 0x0
    11e0: 48 8b 45 b8                  	mov	rax, qword ptr [rbp - 0x48]
    11e4: 48 89 c7                     	mov	rdi, rax
    11e7: e8 64 fe ff ff               	call	0x1050 <strlen@plt>
    11ec: 48 89 45 e8                  	mov	qword ptr [rbp - 0x18], rax
    11f0: 48 8b 45 b0                  	mov	rax, qword ptr [rbp - 0x50]
    11f4: 48 89 c7                     	mov	rdi, rax
    11f7: e8 54 fe ff ff               	call	0x1050 <strlen@plt>
    11fc: 48 89 45 f0                  	mov	qword ptr [rbp - 0x10], rax
    1200: 48 8b 55 f0                  	mov	rdx, qword ptr [rbp - 0x10]
    1204: 48 8b 45 e8                  	mov	rax, qword ptr [rbp - 0x18]
    1208: 48 39 c2                     	cmp	rdx, rax
    120b: 48 0f 43 c2                  	cmovae	rax, rdx
    120f: 48 89 45 f8                  	mov	qword ptr [rbp - 0x8], rax
    1213: 48 c7 45 e0 00 00 00 00      	mov	qword ptr [rbp - 0x20], 0x0
    121b: e9 8e 00 00 00               	jmp	0x12ae <count_matching_bits+0xe5>
    1220: 48 8b 45 e0                  	mov	rax, qword ptr [rbp - 0x20]
    1224: 48 3b 45 e8                  	cmp	rax, qword ptr [rbp - 0x18]
    1228: 73 10                        	jae	0x123a <count_matching_bits+0x71>
    122a: 48 8b 55 b8                  	mov	rdx, qword ptr [rbp - 0x48]
    122e: 48 8b 45 e0                  	mov	rax, qword ptr [rbp - 0x20]
    1232: 48 01 d0                     	add	rax, rdx
    1235: 0f b6 00                     	movzx	eax, byte ptr [rax]
    1238: eb 05                        	jmp	0x123f <count_matching_bits+0x76>
    123a: b8 00 00 00 00               	mov	eax, 0x0
    123f: 88 45 ca                     	mov	byte ptr [rbp - 0x36], al
    1242: 48 8b 45 e0                  	mov	rax, qword ptr [rbp - 0x20]
    1246: 48 3b 45 f0                  	cmp	rax, qword ptr [rbp - 0x10]
    124a: 73 10                        	jae	0x125c <count_matching_bits+0x93>
    124c: 48 8b 55 b0                  	mov	rdx, qword ptr [rbp - 0x50]
    1250: 48 8b 45 e0                  	mov	rax, qword ptr [rbp - 0x20]
    1254: 48 01 d0                     	add	rax, rdx
    1257: 0f b6 00                     	movzx	eax, byte ptr [rax]
    125a: eb 05                        	jmp	0x1261 <count_matching_bits+0x98>
    125c: b8 00 00 00 00               	mov	eax, 0x0
    1261: 88 45 cb                     	mov	byte ptr [rbp - 0x35], al
    1264: c7 45 d0 00 00 00 00         	mov	dword ptr [rbp - 0x30], 0x0
    126b: eb 36                        	jmp	0x12a3 <count_matching_bits+0xda>
    126d: 0f be 55 ca                  	movsx	edx, byte ptr [rbp - 0x36]
    1271: 8b 45 d0                     	mov	eax, dword ptr [rbp - 0x30]
    1274: 89 c1                        	mov	ecx, eax
    1276: d3 fa                        	sar	edx, cl
    1278: 89 d0                        	mov	eax, edx
    127a: 83 e0 01                     	and	eax, 0x1
    127d: 89 45 d8                     	mov	dword ptr [rbp - 0x28], eax
    1280: 0f be 55 cb                  	movsx	edx, byte ptr [rbp - 0x35]
    1284: 8b 45 d0                     	mov	eax, dword ptr [rbp - 0x30]
    1287: 89 c1                        	mov	ecx, eax
    1289: d3 fa                        	sar	edx, cl
    128b: 89 d0                        	mov	eax, edx
    128d: 83 e0 01                     	and	eax, 0x1
    1290: 89 45 dc                     	mov	dword ptr [rbp - 0x24], eax
    1293: 8b 45 d8                     	mov	eax, dword ptr [rbp - 0x28]
    1296: 3b 45 dc                     	cmp	eax, dword ptr [rbp - 0x24]
    1299: 75 04                        	jne	0x129f <count_matching_bits+0xd6>
    129b: 83 45 cc 01                  	add	dword ptr [rbp - 0x34], 0x1
    129f: 83 45 d0 01                  	add	dword ptr [rbp - 0x30], 0x1
    12a3: 83 7d d0 07                  	cmp	dword ptr [rbp - 0x30], 0x7
    12a7: 7e c4                        	jle	0x126d <count_matching_bits+0xa4>
    12a9: 48 83 45 e0 01               	add	qword ptr [rbp - 0x20], 0x1
    12ae: 48 8b 45 e0                  	mov	rax, qword ptr [rbp - 0x20]
    12b2: 48 3b 45 f8                  	cmp	rax, qword ptr [rbp - 0x8]
    12b6: 0f 82 64 ff ff ff            	jb	0x1220 <count_matching_bits+0x57>
    12bc: 48 8b 45 f8                  	mov	rax, qword ptr [rbp - 0x8]
    12c0: 48 2b 45 e8                  	sub	rax, qword ptr [rbp - 0x18]
    12c4: 48 89 c2                     	mov	rdx, rax
    12c7: 48 8b 45 f8                  	mov	rax, qword ptr [rbp - 0x8]
    12cb: 48 2b 45 f0                  	sub	rax, qword ptr [rbp - 0x10]
    12cf: 48 01 d0                     	add	rax, rdx
    12d2: c1 e0 03                     	shl	eax, 0x3
    12d5: 89 45 d4                     	mov	dword ptr [rbp - 0x2c], eax
    12d8: 8b 45 d4                     	mov	eax, dword ptr [rbp - 0x2c]
    12db: 29 45 cc                     	sub	dword ptr [rbp - 0x34], eax
    12de: 8b 45 cc                     	mov	eax, dword ptr [rbp - 0x34]
    12e1: c9                           	leave
    12e2: c3                           	ret

00000000000012e3 <main>:
    12e3: 55                           	push	rbp
    12e4: 48 89 e5                     	mov	rbp, rsp
    12e7: 48 81 ec 30 02 00 00         	sub	rsp, 0x230
    12ee: 64 48 8b 04 25 28 00 00 00   	mov	rax, qword ptr fs:[0x28]
    12f7: 48 89 45 f8                  	mov	qword ptr [rbp - 0x8], rax
    12fb: 31 c0                        	xor	eax, eax
    12fd: 48 8d 05 04 0d 00 00         	lea	rax, [rip + 0xd04]      # 0x2008 <_IO_stdin_used+0x8>
    1304: 48 89 c6                     	mov	rsi, rax
    1307: 48 8d 05 fc 0c 00 00         	lea	rax, [rip + 0xcfc]      # 0x200a <_IO_stdin_used+0xa>
    130e: 48 89 c7                     	mov	rdi, rax
    1311: e8 9a fd ff ff               	call	0x10b0 <fopen@plt>
    1316: 48 89 85 d8 fd ff ff         	mov	qword ptr [rbp - 0x228], rax
    131d: 48 83 bd d8 fd ff ff 00      	cmp	qword ptr [rbp - 0x228], 0x0
    1325: 75 2d                        	jne	0x1354 <main+0x71>
    1327: 48 8b 05 52 2d 00 00         	mov	rax, qword ptr [rip + 0x2d52] # 0x4080 <stderr@GLIBC_2.2.5>
    132e: 48 89 c1                     	mov	rcx, rax
    1331: ba 1b 00 00 00               	mov	edx, 0x1b
    1336: be 01 00 00 00               	mov	esi, 0x1
    133b: 48 8d 05 d6 0c 00 00         	lea	rax, [rip + 0xcd6]      # 0x2018 <_IO_stdin_used+0x18>
    1342: 48 89 c7                     	mov	rdi, rax
    1345: e8 76 fd ff ff               	call	0x10c0 <fwrite@plt>
    134a: b8 01 00 00 00               	mov	eax, 0x1
    134f: e9 6b 02 00 00               	jmp	0x15bf <main+0x2dc>
    1354: 48 8d 05 dd 0c 00 00         	lea	rax, [rip + 0xcdd]      # 0x2038 <_IO_stdin_used+0x38>
    135b: 48 89 c7                     	mov	rdi, rax
    135e: e8 cd fc ff ff               	call	0x1030 <puts@plt>
    1363: 48 8b 95 d8 fd ff ff         	mov	rdx, qword ptr [rbp - 0x228]
    136a: 48 8d 85 f0 fd ff ff         	lea	rax, [rbp - 0x210]
    1371: be 00 01 00 00               	mov	esi, 0x100
    1376: 48 89 c7                     	mov	rdi, rax
    1379: e8 02 fd ff ff               	call	0x1080 <fgets@plt>
    137e: 48 85 c0                     	test	rax, rax
    1381: 75 3c                        	jne	0x13bf <main+0xdc>
    1383: 48 8b 05 f6 2c 00 00         	mov	rax, qword ptr [rip + 0x2cf6] # 0x4080 <stderr@GLIBC_2.2.5>
    138a: 48 89 c1                     	mov	rcx, rax
    138d: ba 2a 00 00 00               	mov	edx, 0x2a
    1392: be 01 00 00 00               	mov	esi, 0x1
    1397: 48 8d 05 0a 0d 00 00         	lea	rax, [rip + 0xd0a]      # 0x20a8 <_IO_stdin_used+0xa8>
    139e: 48 89 c7                     	mov	rdi, rax
    13a1: e8 1a fd ff ff               	call	0x10c0 <fwrite@plt>
    13a6: 48 8b 85 d8 fd ff ff         	mov	rax, qword ptr [rbp - 0x228]
    13ad: 48 89 c7                     	mov	rdi, rax
    13b0: e8 8b fc ff ff               	call	0x1040 <fclose@plt>
    13b5: b8 01 00 00 00               	mov	eax, 0x1
    13ba: e9 00 02 00 00               	jmp	0x15bf <main+0x2dc>
    13bf: 48 8b 85 d8 fd ff ff         	mov	rax, qword ptr [rbp - 0x228]
    13c6: 48 89 c7                     	mov	rdi, rax
    13c9: e8 72 fc ff ff               	call	0x1040 <fclose@plt>
    13ce: 48 8d 85 f0 fd ff ff         	lea	rax, [rbp - 0x210]
    13d5: 48 89 c7                     	mov	rdi, rax
    13d8: e8 73 fc ff ff               	call	0x1050 <strlen@plt>
    13dd: 48 89 85 e0 fd ff ff         	mov	qword ptr [rbp - 0x220], rax
    13e4: 48 8b 85 e0 fd ff ff         	mov	rax, qword ptr [rbp - 0x220]
    13eb: 48 83 e8 01                  	sub	rax, 0x1
    13ef: 0f b6 84 05 f0 fd ff ff      	movzx	eax, byte ptr [rbp + rax - 0x210]
    13f7: 3c 0a                        	cmp	al, 0xa
    13f9: 75 1b                        	jne	0x1416 <main+0x133>
    13fb: 48 8b 85 e0 fd ff ff         	mov	rax, qword ptr [rbp - 0x220]
    1402: 48 83 e8 01                  	sub	rax, 0x1
    1406: c6 84 05 f0 fd ff ff 00      	mov	byte ptr [rbp + rax - 0x210], 0x0
    140e: 48 83 ad e0 fd ff ff 01      	sub	qword ptr [rbp - 0x220], 0x1
    1416: c7 85 d0 fd ff ff ff ff ff ff	mov	dword ptr [rbp - 0x230], 0xffffffff
    1420: 48 8d 05 ac 0c 00 00         	lea	rax, [rip + 0xcac]      # 0x20d3 <_IO_stdin_used+0xd3>
    1427: 48 89 c7                     	mov	rdi, rax
    142a: b8 00 00 00 00               	mov	eax, 0x0
    142f: e8 3c fc ff ff               	call	0x1070 <printf@plt>
    1434: 48 8b 05 25 2c 00 00         	mov	rax, qword ptr [rip + 0x2c25] # 0x4060 <stdout@GLIBC_2.2.5>
    143b: 48 89 c7                     	mov	rdi, rax
    143e: e8 5d fc ff ff               	call	0x10a0 <fflush@plt>
    1443: 48 8b 15 26 2c 00 00         	mov	rdx, qword ptr [rip + 0x2c26] # 0x4070 <stdin@GLIBC_2.2.5>
    144a: 48 8d 85 f0 fe ff ff         	lea	rax, [rbp - 0x110]
    1451: be 00 01 00 00               	mov	esi, 0x100
    1456: 48 89 c7                     	mov	rdi, rax
    1459: e8 22 fc ff ff               	call	0x1080 <fgets@plt>
    145e: 48 85 c0                     	test	rax, rax
    1461: 75 28                        	jne	0x148b <main+0x1a8>
    1463: 48 8b 05 16 2c 00 00         	mov	rax, qword ptr [rip + 0x2c16] # 0x4080 <stderr@GLIBC_2.2.5>
    146a: 48 89 c1                     	mov	rcx, rax
    146d: ba 15 00 00 00               	mov	edx, 0x15
    1472: be 01 00 00 00               	mov	esi, 0x1
    1477: 48 8d 05 68 0c 00 00         	lea	rax, [rip + 0xc68]      # 0x20e6 <_IO_stdin_used+0xe6>
    147e: 48 89 c7                     	mov	rdi, rax
    1481: e8 3a fc ff ff               	call	0x10c0 <fwrite@plt>
    1486: e9 2f 01 00 00               	jmp	0x15ba <main+0x2d7>
    148b: 48 8d 85 f0 fe ff ff         	lea	rax, [rbp - 0x110]
    1492: 48 89 c7                     	mov	rdi, rax
    1495: e8 b6 fb ff ff               	call	0x1050 <strlen@plt>
    149a: 48 89 85 e8 fd ff ff         	mov	qword ptr [rbp - 0x218], rax
    14a1: 48 8b 85 e8 fd ff ff         	mov	rax, qword ptr [rbp - 0x218]
    14a8: 48 83 e8 01                  	sub	rax, 0x1
    14ac: 0f b6 84 05 f0 fe ff ff      	movzx	eax, byte ptr [rbp + rax - 0x110]
    14b4: 3c 0a                        	cmp	al, 0xa
    14b6: 75 1b                        	jne	0x14d3 <main+0x1f0>
    14b8: 48 8b 85 e8 fd ff ff         	mov	rax, qword ptr [rbp - 0x218]
    14bf: 48 83 e8 01                  	sub	rax, 0x1
    14c3: c6 84 05 f0 fe ff ff 00      	mov	byte ptr [rbp + rax - 0x110], 0x0
    14cb: 48 83 ad e8 fd ff ff 01      	sub	qword ptr [rbp - 0x218], 0x1
    14d3: 48 8d 95 f0 fd ff ff         	lea	rdx, [rbp - 0x210]
    14da: 48 8d 85 f0 fe ff ff         	lea	rax, [rbp - 0x110]
    14e1: 48 89 d6                     	mov	rsi, rdx
    14e4: 48 89 c7                     	mov	rdi, rax
    14e7: e8 dd fc ff ff               	call	0x11c9 <count_matching_bits>
    14ec: 89 85 d4 fd ff ff            	mov	dword ptr [rbp - 0x22c], eax
    14f2: 48 8d 95 f0 fd ff ff         	lea	rdx, [rbp - 0x210]
    14f9: 48 8d 85 f0 fe ff ff         	lea	rax, [rbp - 0x110]
    1500: 48 89 d6                     	mov	rsi, rdx
    1503: 48 89 c7                     	mov	rdi, rax
    1506: e8 85 fb ff ff               	call	0x1090 <strcmp@plt>
    150b: 85 c0                        	test	eax, eax
    150d: 75 29                        	jne	0x1538 <main+0x255>
    150f: 48 8d 05 ea 0b 00 00         	lea	rax, [rip + 0xbea]      # 0x2100 <_IO_stdin_used+0x100>
    1516: 48 89 c7                     	mov	rdi, rax
    1519: e8 12 fb ff ff               	call	0x1030 <puts@plt>
    151e: 48 8b 05 3b 2b 00 00         	mov	rax, qword ptr [rip + 0x2b3b] # 0x4060 <stdout@GLIBC_2.2.5>
    1525: 48 89 c7                     	mov	rdi, rax
    1528: e8 73 fb ff ff               	call	0x10a0 <fflush@plt>
    152d: 90                           	nop
    152e: b8 00 00 00 00               	mov	eax, 0x0
    1533: e9 87 00 00 00               	jmp	0x15bf <main+0x2dc>
    1538: 83 bd d0 fd ff ff ff         	cmp	dword ptr [rbp - 0x230], -0x1
    153f: 75 11                        	jne	0x1552 <main+0x26f>
    1541: 48 8d 05 f0 0b 00 00         	lea	rax, [rip + 0xbf0]      # 0x2138 <_IO_stdin_used+0x138>
    1548: 48 89 c7                     	mov	rdi, rax
    154b: e8 e0 fa ff ff               	call	0x1030 <puts@plt>
    1550: eb 4d                        	jmp	0x159f <main+0x2bc>
    1552: 8b 85 d4 fd ff ff            	mov	eax, dword ptr [rbp - 0x22c]
    1558: 3b 85 d0 fd ff ff            	cmp	eax, dword ptr [rbp - 0x230]
    155e: 7e 11                        	jle	0x1571 <main+0x28e>
    1560: 48 8d 05 01 0c 00 00         	lea	rax, [rip + 0xc01]      # 0x2168 <_IO_stdin_used+0x168>
    1567: 48 89 c7                     	mov	rdi, rax
    156a: e8 c1 fa ff ff               	call	0x1030 <puts@plt>
    156f: eb 2e                        	jmp	0x159f <main+0x2bc>
    1571: 8b 85 d4 fd ff ff            	mov	eax, dword ptr [rbp - 0x22c]
    1577: 3b 85 d0 fd ff ff            	cmp	eax, dword ptr [rbp - 0x230]
    157d: 7d 11                        	jge	0x1590 <main+0x2ad>
    157f: 48 8d 05 22 0c 00 00         	lea	rax, [rip + 0xc22]      # 0x21a8 <_IO_stdin_used+0x1a8>
    1586: 48 89 c7                     	mov	rdi, rax
    1589: e8 a2 fa ff ff               	call	0x1030 <puts@plt>
    158e: eb 0f                        	jmp	0x159f <main+0x2bc>
    1590: 48 8d 05 49 0c 00 00         	lea	rax, [rip + 0xc49]      # 0x21e0 <_IO_stdin_used+0x1e0>
    1597: 48 89 c7                     	mov	rdi, rax
    159a: e8 91 fa ff ff               	call	0x1030 <puts@plt>
    159f: 48 8b 05 ba 2a 00 00         	mov	rax, qword ptr [rip + 0x2aba] # 0x4060 <stdout@GLIBC_2.2.5>
    15a6: 48 89 c7                     	mov	rdi, rax
    15a9: e8 f2 fa ff ff               	call	0x10a0 <fflush@plt>
    15ae: 8b 85 d4 fd ff ff            	mov	eax, dword ptr [rbp - 0x22c]
    15b4: 89 85 d0 fd ff ff            	mov	dword ptr [rbp - 0x230], eax
    15ba: e9 61 fe ff ff               	jmp	0x1420 <main+0x13d>
    15bf: 48 8b 55 f8                  	mov	rdx, qword ptr [rbp - 0x8]
    15c3: 64 48 2b 14 25 28 00 00 00   	sub	rdx, qword ptr fs:[0x28]
    15cc: 74 05                        	je	0x15d3 <main+0x2f0>
    15ce: e8 8d fa ff ff               	call	0x1060 <__stack_chk_fail@plt>
    15d3: c9                           	leave
    15d4: c3                           	ret

Disassembly of section .fini:

00000000000015d8 <_fini>:
    15d8: f3 0f 1e fa                  	endbr64
    15dc: 48 83 ec 08                  	sub	rsp, 0x8
    15e0: 48 83 c4 08                  	add	rsp, 0x8
    15e4: c3                           	ret
