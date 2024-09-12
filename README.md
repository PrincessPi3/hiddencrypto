# hiddencrypto
Silly lil script for using [scrypt](https://github.com/Tarsnap/scrypt), [secure-delete  (srm)](https://github.com/BlackArch/secure-delete), and tar to open and close an encrypted (scrypt) and compressed (bz2) and shred (srm) any lingering data immediately.

## Back up your shit
* This script is probably as unstable as I am and will probably end up nuking your files
* If you lose your passphrase or type it in wrong twice on encryption, your data has gone bye bye
* For real, back up your shit
* Do not trust me or my code

## Usage
To install:  
`sh hidden.sh install`  
  
To encrypt:  
`sh hidden.sh enc`  
  
To decrypt:  
`sh hidden.sh dec`  

## License
Distributed under the [WTFPL Version 2](http://www.wtfpl.net/) [![WTFPL](assets/wtfpl-badge.png)](http://www.wtfpl.net/)  
See [assets/COPYING.txt](assets/COPYING.txt) for text  