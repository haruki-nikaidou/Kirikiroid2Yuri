# Krikiroid2-Yuri  

![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/YuriSizuku/Kirikiroid2Yuri?color=green&label=krkr2yuri&style=flat-square)  

☘️ A krikiroid2 project matained by Yurisizuku.  
Support the newer android device and more format.  
Windows or linux will also be supported (in future).

New features :  

- develop  
  - [x] clear camke project structure
  - [x] well documention for develop and usage
  - [x] scripts to compile or cross compile without pain
  - [x] vscode and android studio project for multi enviroment
  - [ ] ci in github action to automaticly build
- platform
  - android
    - [x] SDK level above 21 (android 5.1, Lolipop)
    - [ ] SAF to access extern sdcard
  - windows
  - linux
- render  
- game support

## 1. usage

## 2. Build  

I add some futures by reverse engine before, and now this project can be build from source.  This is really a very hard work, because there are so many dependencies, lack of files, code not compatible problems.  

### (1) prepare  

- wget, git, make, cmake  
- python2(for cocos2d-x v3), msys2 (if windows)  
- thirdparty depedency (see `_fetch.sh` in detail)  

``` shell
# wget 
https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.7.tar.gz
https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
https://downloads.xiph.org/releases/ogg/libogg-1.3.5.tar.gz
https://downloads.xiph.org/releases/opus/opusfile-0.12.tar.gz
https://www.rarlab.com/rar/unrarsrc-6.0.7.tar.gz
https://www.libsdl.org/release/SDL2-2.0.14.tar.gz

# git
https://github.com/krkrz/oniguruma
https://github.com/google/breakpad
https://github.com/zeas2/FFmpeg

# git with version
https://github.com/google/oboe/archive/refs/tags/1.7.0.tar.gz
https://github.com/kcat/openal-soft/archive/refs/tags/1.23.0.tar.gz
https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/2.1.5.1.tar.gz
https://github.com/opencv/opencv/archive/refs/tags/4.7.0.tar.gz
https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz
https://github.com/libarchive/libarchive/archive/refs/tags/v3.6.2.tar.gz
https://github.com/cocos2d/cocos2d-x/archive/refs/tags/cocos2d-x-3.17.2.tar.gz
```

In windows, you must use msys2 to build ffmpeg port.  

## (2) android  

- android sdk with `ANDROID_HOME` variable in env  
- android ndk 25.2.9519653  

Use `cross_android64.sh` to build.  
See `_androida64.sh` for how to build dependencies.

## 3. Compatibility  

|game|version|status|description|
|----|-------|------|-----------|

## 4. Issues (including solved)

## 5. Todo

___
Original information about kirikiroid2 bellow, also refered some dependencies from [ningshanwutuobang](https://github.com/ningshanwutuobang/Kirikiroid2).  

## Kirikiroid2 - A cross-platform port of Kirikiri2/KirikiriZ  

==========================================================

Based on most code from [Kirikiri2](http://kikyou.info/tvp/) and [KirikiriZ](https://github.com/krkrz/krkrz)

Video playback module modified from [kodi](https://github.com/xbmc/xbmc)

Some string code from [glibc](https://www.gnu.org/s/libc) and [Apple Libc](https://opensource.apple.com/source/Libc).

Real-time texture codec modified from [etcpak](https://bitbucket.org/wolfpld/etcpak.git), [pvrtccompressor](https://bitbucket.org/jthlim/pvrtccompressor), [astcrt](https://github.com/daoo/astcrt)

Android storage accessing code from [AmazeFileManager](https://github.com/arpitkh96/AmazeFileManager)
