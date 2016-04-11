sudo echo "Building ramdisk folder into image file: " $1
echo "Setting shell options..."
shopt -s dotglob
echo "Building ramdisk image..."
cd ramdisk/
sudo find . | sudo cpio -H newc -o | gzip > $1.gz
cd ..
mkimage -A arm -O linux -T ramdisk -n "Initial Ram Disk" -d ramdisk/$1.gz $1
echo "Remove temp file..."
rm ramdisk/$1.gz
