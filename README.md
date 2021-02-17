# D-Link DIR-2660 Gargoyle
Gargoyle port for D-Link DIR-2660 A1 router. Tested on my machine with typical issues for older MT76 wireless driver. May contain lots of bugs, made for educational purposes. Apart from having a parallel NAND memory, in this device model SGE introduced different image padding.  
# Flashing
Set your computer IP to 192.168.0.2 and gateway to 192.168.0.1  
While pressing the RESET button power on the device. Hold the button until the power will start to flash.  
Access 192.168.0.1 from your web browser to access recovery environment and upload the factory bin file.  
Don't mind the progress, it's just a hardcoded counter with no relevance. Watch the LEDs until the router reboots.  
# Building
Ubuntu 18.04 is the recommended build environment. Before attempting to build the image, install the required packages by issuing the commands below:
```terminal
sudo apt update
sudo apt-get install build-essential asciidoc binutils bzip2 gawk \
gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 \
libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip \
p7zip-full msmtp libssl-dev texinfo npm

```
Next clone the repository and enter the directory:
```terminal
git clone https://github.com/pchmura4/DIR-2660_Gargoyle
cd DIR-2660_Gargoyle
```
Make the script executable and run it:
```terminal
chmod +x build.sh
./build.sh
```
Upon completing the build process two binaries should appear in the directory. By changing the third line inside the script you can switch the commit to a different SHA.