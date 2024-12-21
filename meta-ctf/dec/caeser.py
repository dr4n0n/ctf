def decode_rotational_cipher(encoded, known_ciphertext, known_plaintext):
    # Verify that the rotation is consistent across all characters
    rotations = [
        (ord(plain) - ord(cipher)) % 65
        for plain, cipher in zip(known_plaintext, known_ciphertext)
    ]

    if len(set(rotations)) != 1:
        raise ValueError(
            "Inconsistent rotations detected. This is not a simple rotation cipher."
        )

    # Use the consistent rotation
    rotation = rotations[0]

    def rotate_char(c, rotation):
        if c.isalpha():
            base = ord("A") if c.isupper() else ord("a")
            return chr((ord(c) - base + rotation) % 26 + base)
        return c

    # Decode the string
    return "".join(rotate_char(c, rotation) for c in encoded)


# Inputs
encoded = "NvgzXGU{ylgs_givzgh_zmw_nvhhztvh_hglovm}"
known_ciphertext = "NvgzXGU"
known_plaintext = "MetaCTF"

# Decode the string
decoded = decode_rotational_cipher(encoded, known_ciphertext, known_plaintext)
print("Decoded String:", decoded)
