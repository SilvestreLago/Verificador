#!/usr/bin/env python3

import os
from cryptography.fernet import Fernet

files = []
for file in os.listdir():
        if file == "encrypt.py" or file == "key.key" or file == "decrypt.py" or file == "teste.py":
                continue
        if os.path.isfile(file):
                files.append(file)

with open("key.key", "rb") as key:
        secretkey = key.read()

for file in files:
        with open(file, "rb") as thefile:
                contents = thefile.read()
        contents_decrypted = Fernet(secretkey).decrypt(contents)
        with open(file, "wb") as thefile:
                thefile.write(contents_decrypted)