# fakepi
This is a shell script tools for testing fake Raspberry Pi 
## Steps
* Download ffmpeg and compile it with following argument.
URL: [ https://github.com/FFmpeg/FFmpeg.git ]
```bash
git clone https://github.com/FFmpeg/FFmpeg.git 
cd FFmpeg/
sudo apt-get build-dep ffmpeg
sudo apt-get -y install libx264-dev
sudo apt-get -y install build-essential libtool pkg-config texinfo zlib1g-dev


./configure --prefix=/usr/local/ffmpeg --enable-omx-rpi --enable-omx --enable-libx264 --enable-nonfree --arch=armel --target-os=linux 
make -j $($proc)
sudo make install 
```

