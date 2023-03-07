# prepare dirs
if ! [ -d $CMAKELISTS_PATH/thirdparty/port ]; then mkdir -p $CMAKELISTS_PATH/thirdparty/port; fi
if ! [ -d $CMAKELISTS_PATH/thirdparty/build/arch_androida32 ]; then mkdir -p $CMAKELISTS_PATH/thirdparty/build/arch_androida32; fi
if ! [ -d $CMAKELISTS_PATH/thirdparty/build/arch_androida64 ]; then mkdir -p $CMAKELISTS_PATH/thirdparty/build/arch_androida64; fi

# fetch by wget
function fetch_port() # urlbase, name, outpath
{
    if ! [ -d "$CMAKELISTS_PATH/thirdparty/port/$2" ]; then
        echo "## fetch_port $1 $2"
        wget $1/$2.tar.gz -O $CMAKELISTS_PATH/thirdparty/port/$2.tar.gz 
        tar zxf $CMAKELISTS_PATH/thirdparty/port/$2.tar.gz -C $CMAKELISTS_PATH/thirdparty/port
    fi
}

# fetch by git
function fetch_port2()
{
    if ! [ -d "$CMAKELISTS_PATH/thirdparty/port/$2" ]; then
        inpath=$1/$2.git
        outpath=$CMAKELISTS_PATH/thirdparty/port/$2
        tag=$3
        echo "## fetch_port $inpath $tag"
        if [ -n "$tag" ]; then 
            git clone --recursive --depth 1 --branch $tag $inpath $outpath 
        else
            git clone --recursive --depth 1 $inpath $outpath
        fi
    fi
}

# wget ports
function fetch_vorbis()
{
    VORBIS_NAME=libvorbis-1.3.7
    VORBIS_SRC=$CMAKELISTS_PATH/thirdparty/port/$VORBIS_NAME
    fetch_port https://downloads.xiph.org/releases/vorbis $VORBIS_NAME
}

function fetch_opus()
{
    OPUS_NAME=opus-1.3.1
    OPUS_SRC=$CMAKELISTS_PATH/thirdparty/port/$OPUS_NAME
    fetch_port https://archive.mozilla.org/pub/opus $OPUS_NAME
}

function fetch_ogg()
{
    OGG_NAME=libogg-1.3.5
    OGG_SRC=$CMAKELISTS_PATH/thirdparty/port/$OGG_NAME
    fetch_port https://downloads.xiph.org/releases/ogg $OGG_NAME
}

function fetch_opusfile()
{
    OPUSFILE_NAME=opusfile-0.12
    OPUSFILE_SRC=$CMAKELISTS_PATH/thirdparty/port/$OPUSFILE_NAME
    fetch_port https://downloads.xiph.org/releases/opus $OPUSFILE_NAME
}

function fetch_unrar()
{
    UNRAR_NAME=unrarsrc-6.0.7
    UNRAR_SRC=$CMAKELISTS_PATH/thirdparty/port/$UNRAR_NAME
    fetch_port https://www.rarlab.com/rar $UNRAR_NAME
    if [ -d $CMAKELISTS_PATH/thirdparty/port/unrar ]; then
        mv $CMAKELISTS_PATH/thirdparty/port/unrar $UNRAR_SRC
    fi
}

function fetch_p7zip()
{
    P7ZIP_NAME=p7zip_16.02
    P7ZIP_SRC=$CMAKELISTS_PATH/thirdparty/port/$P7ZIP_NAME
    if ! [ -d "$CMAKELISTS_PATH/thirdparty/port/$P7ZIP_NAME" ]; then
        echo "## fetch_port $P7ZIP_NAME"
        wget https://sourceforge.net/projects/p7zip/files/p7zip/16.02/p7zip_16.02_src_all.tar.bz2 -O $CMAKELISTS_PATH/thirdparty/port/$P7ZIP_NAME.tar.bz2
        tar zxf $CMAKELISTS_PATH/thirdparty/port//$P7ZIP_NAME.tar.bz2 -C $CMAKELISTS_PATH/thirdparty/port
    fi 
}

function fetch_sdl2()
{
    SDL2_NAME=SDL2-2.0.14
    SDL2_SRC=$CMAKELISTS_PATH/thirdparty/port/$SDL2_NAME
    fetch_port https://www.libsdl.org/release $SDL2_NAME
}

# git ports
function fetch_openal()
{
    OPENAL_NAME=openal-soft
    OPENAL_VERSION=1.23.0
    OPENAL_SRC=$CMAKELISTS_PATH/thirdparty/port/$OPENAL_NAME
    fetch_port2 https://github.com/kcat $OPENAL_NAME $OPENAL_VERSION
}

function fetch_oboe()
{
    OBOE_NAME=oboe
    OBOE_VERSION=1.7.0
    OBOE_SRC=$CMAKELISTS_PATH/thirdparty/port/$OBOE_NAME
    fetch_port2 https://github.com/google $OBOE_NAME $OBOE_VERSION
}

function fetch_jpeg()
{
    JPEG_NAME=libjpeg-turbo
    JPEG_SRC=$CMAKELISTS_PATH/thirdparty/port/$JPEG_NAME
    JPEG_VERSION=2.1.5.1
    fetch_port2 https://github.com/libjpeg-turbo $JPEG_NAME $JPEG_VERSION
}

function fetch_opencv()
{
    OPENCV_NAME=opencv
    OPENCV_VERSION=4.7.0
    OPENCV_SRC=$CMAKELISTS_PATH/thirdparty/port/$OPENCV_NAME
    fetch_port2 https://github.com/opencv $OPENCV_NAME $OPENCV_VERSION
}

function fetch_ffmpeg()
{
    FFMPEG_NAME=ffmpeg
    FFMPEG_SRC=$CMAKELISTS_PATH/thirdparty/port/$FFMPEG_NAME
    fetch_port2 https://github.com/zeas2 $FFMPEG_NAME
}

function fetch_lz4()
{
    LZ4_NAME=lz4
    LZ4_VERSION=v1.9.4
    LZ4_SRC=$CMAKELISTS_PATH/thirdparty/port/$LZ4_NAME
    fetch_port2 https://github.com/lz4 $LZ4_NAME $LZ4_VERSION
}

function fetch_archive()
{
    ARCHIVE_NAME=libarchive
    ARCHIVE_VERSION=v3.6.2
    ARCHIVE_SRC=$CMAKELISTS_PATH/thirdparty/port/$ARCHIVE_NAME
    fetch_port2 https://github.com/libarchive $ARCHIVE_NAME $ARCHIVE_VERSION
}

function fetch_oniguruma()
{
    ONIGURUMA_NAME=oniguruma
    ONIGURUMA_SRC=$CMAKELISTS_PATH/thirdparty/port/$ONIGURUMA_NAME
    fetch_port2 https://github.com/krkrz $ONIGURUMA_NAME
}

function fetch_breakpad()
{
    BREAKPAD_NAME=breakpad
    BREAKPAD_SRC=$CMAKELISTS_PATH/thirdparty/port/$BREAKPAD_NAME
    fetch_port2 https://github.com/google $BREAKPAD_NAME
}

function fetch_cocos2dx()
{
    COCOS2DX_NAME=cocos2d-x
    COCOS2DX_VERSION=v3
    COCOS2DX_SRC=$CMAKELISTS_PATH/thirdparty/port/$COCOS2DX_NAME
    fetch_port2 https://github.com/cocos2d $COCOS2DX_NAME

    if ! [ -d "$CMAKELISTS_PATH/thirdparty/port/$COCOS2DX_NAME" ]; then    
        pushd $COCOS2DX_SRC
            python2 download-deps.py # must use cocos v3 and python2
            git config --global url.https://github.com/.insteadOf git://github.com/
            git submodule update --init # submodule might cuse some problem, as it use git@
        popd
    fi
}

# unuse ports
function fetch_syscall()
{
    SYSCALL_NAME=linux-syscall-support
    SYSCALL_SRC=$CMAKELISTS_PATH/thirdparty/port/$SYSCALL_NAME
    fetch_port2 https://github.com/adelshokhy112 $SYSCALL_NAME
}

function fetch_bpg()
{
    BPG_NAME=android-bpg
    BPG_SRC=$CMAKELISTS_PATH/thirdparty/port/$BPG_NAME
    fetch_port2 https://github.com/alexandruc $BPG_NAME
}

function fetch_jxr()
{
    JXR_NAME=jxrlib
    JXR_SRC=$CMAKELISTS_PATH/thirdparty/port/$JXR_NAME
    fetch_port2 https://github.com/krkrz $JXR_NAME
}