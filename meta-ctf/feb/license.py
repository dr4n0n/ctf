from scapy.all import *  # Import Scapy for reading packet captures
import struct  # Import struct to handle binary data
import ctypes  # Import ctypes to define and parse custom binary structures


# Define the packet header structure using ctypes
class MALDHeader(ctypes.BigEndianStructure):
    _pack_ = True
    _fields_ = [
        ("version", ctypes.c_uint8, 3),  # 3-bit version field
        ("opcode", ctypes.c_uint8, 5),  # 5-bit opcode field
        ("length", ctypes.c_uint16),  # 16-bit payload length
    ]


# Define opcodes for packet types
opcodes = {1: "BEGIN", 2: "TERMINATE", 3: "ACKBEGIN", 5: "BATCH"}


# Helper function to XOR two byte arrays
def xor(one, two):
    return bytes(a ^ b for (a, b) in zip(one, two))


# Read and filter packets from the PCAP file
pcap = rdpcap("plates.pcapng").filter(lambda x: UDP in x)

# Initialize key exchange variables
nonce1 = None
nonce2 = None
key = None

# Process each packet
for packet in pcap:
    payload = bytes(packet[UDP].payload)  # Extract the UDP payload
    hdr = MALDHeader.from_buffer_copy(payload[0:3])  # Parse the header
    print(hdr.version, opcodes[hdr.opcode], "\tLen:", hdr.length)  # Print header info

    if hdr.opcode == 1:  # If it's a Begin packet
        print("Decoding Begin...")
        nonce1 = payload[3:]  # Extract Nonce1 from the payload
        print("NONCE1", nonce1, "Length:", len(nonce1))

    if hdr.opcode == 3:  # If it's an AckBegin packet
        print("Decoding AckBegin...")
        nonce2 = payload[3:]  # Extract Nonce2 from the payload
        print("NONCE2", nonce2, "Length:", len(nonce2))
        key = xor(nonce1, nonce2)  # Calculate the key using XOR
        print("KEY", key, "Length:", len(key))

    if hdr.opcode == 5:  # If it's a LicensePlateBatch packet
        print("Decoding LicensePlateBatch...")
        numplates = hdr.length // 16  # Calculate the number of plates
        print("Entries:", numplates)
        for i in range(numplates):  # For each license plate
            offset = 3 + i * 16  # Calculate the plate's position in the payload
            plate = payload[offset : offset + 16]  # Extract the plate's data
            (timing,) = struct.unpack("!H", plate[0:2])  # Extract the acquisition time
            encstate = plate[2:4]  # Extract the encrypted state
            encplate = plate[4:14]  # Extract the encrypted plate
            discretionary = plate[14:]  # Extract any remaining bytes
            print(
                timing,
                "\t",
                xor(encstate, key).decode(),  # Decrypt the state
                xor(encplate, key),  # Decrypt the plate
                discretionary,
            )
