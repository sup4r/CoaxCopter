sudo echo "Opening ramdisk: "
file $1
echo "Stripping u-boot header..."
dd bs=64 skip=1 if=$1 of=$1.noheader.gz
echo "Unzipping..."
gunzip $1.noheader.gz
echo "Extracting files from cpio archive..."
mkdir ramdisk
cd ramdisk/
sudo cpio -i --no-absolute-filenames < ../$1.noheader
echo "Cleaning temp file"
rm ../$1.noheader
echo "All done."

