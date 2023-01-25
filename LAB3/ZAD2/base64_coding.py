import base64


def encode(message):
    msgBytes = message.encode('ascii')
    base64Bytes = base64.b64encode(msgBytes)
    return base64Bytes.decode("ascii")


def decode(bytes):
    base64Bytes = bytes.encode("ascii")
    decodedBytes = base64.b64decode(base64Bytes)
    return decodedBytes.decode("ascii")


TEST_PHASE="The quick brown fox jumps over the lazy dog"


print("Phase: ")
print(TEST_PHASE)

print("1. ENCODING:")
encodedMsg=encode(TEST_PHASE)
print(encodedMsg)

print("2. DECODING:")
decoded=decode(encodedMsg)
print(decoded)
