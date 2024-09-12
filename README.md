# hiddencrypto
Silly lil script for using [scrypt](https://github.com/Tarsnap/scrypt), [secure-delete  (srm)](https://github.com/BlackArch/secure-delete), and tar to open and close an encrypted (scrypt) and compressed (bz2) and shred (srm) any lingering data immediately.

## Back Up Your Shit
* This script is probably as unstable as I am and will probably end up nuking your files
* If you lose your passphrase or type it in wrong twice on encryption, your data has gone bye bye
* For real, back up your shit
* Do not trust me or my code

## Important Details
* Each time you encrypt the directory, it will use a brand new passphrase that you input. You can still use the old one, but it is set each time to whatever you enter twice regardless of the previous passphrase
* Back Up Your Shit! This is a completely unforgiving script when it comes to setting the password wrong

## Usage
To install:  
`sh hidden.sh install`  
  
To encrypt:  
`sh hidden.sh enc`  
  
To decrypt:  
`sh hidden.sh dec`  

**Misc Considerations to Properly Format and Flesh Out Later (maybe lmfao)/Todo**
```
Shredding the footprint of files moved to the encrypted dir
    Shredding empty space on disk // script?
Disk management issues
    Automated backup issues: temporarily disable or exempt automated backups
    RAID/etc considerations
Manual and secure backups of encrypted data
        Use independant passphrases for password failure recovery
        Test backups with its passphrase
High-security passphrase generation and storage
    Link to excellent passphrase creation guide
    Caution to not use password generator on comptuer, instead create manually on PAPER
    Write down on paper, no digital files saved anywhere EVER- Physical ONLY
        Or just memorize your passphrases lol
Total data descruction by shredding headers and/or encrypted file // script? automate? lol
Potential memory key leaks
Potential OS key leaks
Potential side-channel attacks
Best practice reccomendation to disable networking when using hiddencrypto
```

## License
Distributed under the [WTFPL Version 2](http://www.wtfpl.net/) [![WTFPL](assets/wtfpl-badge.png)](http://www.wtfpl.net/)  
See [assets/COPYING.txt](assets/COPYING.txt) for text  
