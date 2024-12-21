import pwn

io = pwn.remote("host5.metaproblems.com", "7050")
io.recvuntil("p =")
p = int(io.recvline().strip())
io.recvuntil("secret =")
secret = int(io.recvline().strip())

io.sendlineafter("Enter your secret: ", str((p - 1) + secret))
io.interactive()
