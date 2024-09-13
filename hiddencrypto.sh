#!/bin/sh
# fail on error
set -e

dir_to_encrypt=./to_encrypt
encrypted_archive_name=./.volume.bin

encrypted_volume_name=./encrypted_volume.tar.bz2

encrypty(){
    echo "Compressing Directory..."
    tar cfj $encrypted_volume_name $dir_to_encrypt
    # check success of previous or die
    echo "Sucesfully Compressed, Shredding Directory..."
    ./secure-delete/srm -rz $dir_to_encrypt
    # check success of previous or die
    echo "Successfully Shredded Directory, Encrypting. Please Input Passphrase..."
    scrypt enc $encrypted_volume_name $encrypted_archive_name
    # check success of previous or die
    echo "Successfully Encrypted, Shredding Archive..."
    ./secure-delete/srm -rz $encrypted_volume_name
    # check success of previous or die
    echo "Wiping deallocated RAM..."
    sudo ./secure-delete/smem -l -v
    echo "Success: Done"
}

decrypty(){
    echo "Starting..."
    echo "Decrypting. Please Input Passphrase..."
    scrypt dec $encrypted_archive_name $encrypted_volume_name
    # check success of previous or die
    echo "Successfully Decrytped, Shredding Encrypted Archive..."
    ./secure-delete/srm -rz $encrypted_archive_name
    # check success of previous or die
    echo "Successfully Shredded Encrypted Archive, Decompressing..."
    tar xfj $encrypted_volume_name
    # check success of previous or die
    echo "Successfully Decompressed Decrypted Archive, Shredding Decrypted Archive..."
    ./secure-delete/srm -rz $encrypted_volume_name
    # check success of previous or die
    echo "Shredding deallocated RAM..."
    sudo ./secure-delete/smem -l -v
    echo "Success: Done"
}

if [ "$1" = "enc" ]; then
    encrypty
elif [ "$1" = "dec" ]; then
    decrypty
elif [ $1 = "install" ]; then 
	if ! [ -f "$(command -v scrypt)" ] &&  [ -f "$(command -v tar)" ] && [ -f "$(command -v make)" ]; then
        	echo "Needed Applications Not Found, Installing..."
	        sudo apt install scrypt secure-delete tar build-essential
	        echo "Success: Installed"
	fi

    if ! [ -d "./secure-delete" ]; then
        git clone https://github.com/BlackArch/secure-delete.git
        cd secure-delete
        make
    fi

	if ! [ -d $dir_to_encrypt ]; then
		echo "$dir_to_encrypt Not Found, Creating..."
		mkdir $dir_to_encrypt
	fi

	echo "Success: Ready to use"
else
	echo "Usage:\nEncrypt:\n\tsh hiddencrypto.sh enc\nDecrypt:\n\tsh hiddencrypto.sh dec\nInstall:\n\tsh hiddencrypto.sh install"
fi
