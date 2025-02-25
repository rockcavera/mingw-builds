
#
# The BSD 3-Clause License. http://www.opensource.org/licenses/BSD-3-Clause
#
# This file is part of MinGW-W64(mingw-builds: https://github.com/niXman/mingw-builds) project.
# Copyright (c) 2011-2021 by niXman (i dotty nixman doggy gmail dotty com)
# Copyright (c) 2012-2015 by Alexpux (alexpux doggy gmail dotty com)
# All rights reserved.
#
# Project: MinGW-W64 ( http://sourceforge.net/projects/mingw-w64/ )
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
# - Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
# - Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the distribution.
# - Neither the name of the 'MinGW-W64' nor the names of its contributors may
#     be used to endorse or promote products derived from this software
#     without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# **************************************************************************

PKG_NAME=make_git
PKG_DIR_NAME=make_git
PKG_TYPE=git
PKG_URLS=(
	"https://git.savannah.gnu.org/cgit/make.git|repo:$PKG_TYPE|module:$PKG_NAME"
)

PKG_PRIORITY=extra

#

PKG_PATCHES=(
	make/make-linebuf-mingw.patch
	make/make-getopt.patch
)

#

PKG_EXECUTE_AFTER_PATCH=(
)

#

PKG_CONFIGURE_FLAGS=(
)

#

PKG_MAKE_FLAGS=(
)

#

PKG_INSTALL_FLAGS=(
)

PKG_EXECUTE_AFTER_INSTALL=(
	"cp -rf $SRCS_DIR/$PKG_NAME $CURR_BUILD_DIR/"
	"cmd /c 'build_w32.bat gcc'"
	"strip -s gnumake.exe -o mingw32-make.exe"
	"cp -f mingw32-make.exe $PREFIX/bin/"
	"cp -f libgnumake-1.dll.a $PREFIX/lib/"
	"cp -f gnumake.h $PREFIX/include/"
)
# **************************************************************************
