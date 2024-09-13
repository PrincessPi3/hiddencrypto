# hiddencrypto
Silly lil script for using [scrypt](https://github.com/Tarsnap/scrypt), [secure-delete  (srm)](https://github.com/BlackArch/secure-delete), and tar to open and close an encrypted (scrypt) and compressed (bz2) and shred (srm) any lingering data immediately.

## Back Up Your Shit
* This script is probably as unstable as I am and will probably end up nuking your files
* If you lose your passphrase or type it in wrong twice on encryption, your data has gone bye bye
* For real, back up your shit
* Do not trust me or my code

## Important Details
* Each time you encrypt the directory, it will use a brand new passphrase that you input. You can still use the old one, but it is set each time to whatever you enter twice regardless of the previous passphrase
* Use a [secure passphrase](assets/how-to-create-a-secure-passphrase-2017-08-10_HQP.pdf) and DO NOT SAVE ON COMPUTER OR PASSSWORD MANAGER! Only save your passphrase on **PHYSICAL PAPER**
* **Back Up Your Shit!** This is a completely unforgiving script when it comes to setting the password wrong
* When creating encrypted backups, be certain to use a seperate, completely dissimilar passphrase for it. Store this passphrase on a seperate piece of paper, stored seperately
* **Test Your Backups** Make completely sure they work and that you a precise and accurate passphrase for them
* If your system has automatic backuops, RAID, cloud storage uplaods, or any other type of redundancy system in place, you should exclude the hiddebncrypto directory from it. Otherwise, partial or even data leaking data could be copied or even uploaded
* **BE AWARE** When moving files from unencrypted drives to the encrypted arcive, **the original files may be recoverable from the original location** even if they are not visible. It is a best practice to shred empty space on that disk afterwords to ensure the orignal data is not forensically recoverable
* Best practice is to disable networking when using hiddencrypto
  
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
  
  
```
Todo:

Total data descruction by shredding headers and/or encrypted file // script // automatable call
Potential memory key leaks
Potential OS key leaks
Potential side-channel attacks
```