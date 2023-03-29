#!/bin/bash


sudo apt-get update && sudo apt-get install git \
  autoconf \
	automake \
	build-essential \
	cmake \
	git-core \
	libass-dev \
	libfreetype6-dev \
	libgnutls28-dev \
	libmp3lame-dev \
	libsdl2-dev \
	libtool \
	libva-dev \
	libvdpau-dev \
	libvorbis-dev \
	libxcb1-dev \
	libxcb-shm0-dev \
	libxcb-xfixes0-dev \
	meson \
	ninja-build \
	pkg-config \
	texinfo \
	wget \
	yasm \
	zlib1g-dev \
	libunistring-dev \
	libaom-dev \
	libdav1d-dev \
	nasm \
	libx264-dev \
	libx265-dev \
	libnuma-dev \
	libvpx-dev \
	libfdk-aac-dev \
	libopus-dev \
	libdav1d-dev \
	libavahi-client-dev \
	wget

mkdir ndi_lib && pushd ndi_lib && wget "https://cdn.discordapp.com/attachments/1090285471373983854/1090386838537117706/Install_NDI_Advanced_SDK_v5_Linux.tar.gz"
tar -xvf Install_NDI_Advanced_SDK_v5_Linux.tar.gz
# shellcheck disable=SC2209
yes | PAGER=cat ./Install_NDI_Advanced_SDK_v5_Linux.sh
rm -f Install_NDI_Advanced_SDK_v5_Linux.* && mv NDI\ Advanced\ SDK\ for\ Linux/* . && popd || exit

./configure --prefix="$HOME/ffmpeg_build"\
	--pkg-config-flags="--static"\
	--extra-cflags="-I$HOME/ffmpeg_build/include -Indi_lib/include"\
	--extra-ldflags="-L$HOME/ffmpeg_build/lib -Lndi_lib/x86_64-linux-gnu"\
	--extra-libs="-lpthread -lm"\
	--ld="g++"\
	--bindir="$HOME/bin" --enable-gpl\
	--enable-gnutls\
	--enable-libass\
	--enable-libfdk-aac\
	--enable-libfreetype\
	--enable-libmp3lame\
	--enable-libopus\
	--enable-libvorbis\
	--enable-libvpx\
	--enable-libx264\
	--enable-libx265\
	--enable-nonfree\
	--enable-libndi-newtek