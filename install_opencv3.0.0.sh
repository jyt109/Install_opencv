#! /bin/bash
sudo yum update
sudo yum upgrade

sudo yum install -y gcc g++ gtk+-devel libjpeg-devel libtiff-devel jasper-devel libpng-devel zlib-devel cmake unzip python-devel \
	ncurses-devel texinfo gtk2-devel qt-devel tcl-devel tk-devel kernel-headers kernel-devel yum-priorities eigen3-devel —enablerepo=epel
	
wget http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo rpm -ivh epel-release-6-8.noarch.rpm

sudo yum install -y python27 python27-devel
sudo yum install -y freetype-devel libpng-devel
wget https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py -O - | python27
sudo easy_install-2.7 pip
sudo easy_install py4j
sudo pip2.7 install ipython==2.0.0
sudo pip2.7 install pyzmq==14.6.0
sudo pip2.7 install jinja2==2.7.3
sudo pip2.7 install tornado==4.2
sudo pip2.7 install numpy
sudo pip2.7 install matplotlib
sudo yum install -y tmux


wget https://github.com/Itseez/opencv/archive/3.0.0.zip
unzip 3.0.0.zip
cd opencv-3.0.0
mkdir build
cd build
export PYTHON_EXECUTABLE=$(readlink -e $(which python2.7))
export PYTHON_INCLUDE_PATH=${PYTHON_EXECUTABLE%/*/*}/include
export PYTHON_LIBRARY=${PYTHON_EXECUTABLE%/*/*}/lib/libpython2.7.a
export PYTHON_NUMPY_INCLUDE_DIR=${PYTHON_EXECUTABLE%/*/*}/lib/python2.7/site-packages/numpy/core/include/numpy
export PYTHON_PACKAGES_PATH=${PYTHON_EXECUTABLE%/*/*}/lib/python2.7/site-packages
cmake  \
-DBUILD_DOCS=OFF  \
-DBUILD_EXAMPLES=OFF  \
-DBUILD_JPEG=OFF  \
-DBUILD_OPENEXR=OFF  \
-DBUILD_PACKAGE=OFF  \
-DBUILD_PERF_TESTS=OFF  \
-DBUILD_PNG=OFF  \
-DBUILD_SHARED_LIBS=OFF  \
-DBUILD_TBB=OFF  \
-DBUILD_TESTS=OFF  \
-DBUILD_TIFF=OFF  \
-DBUILD_WITH_DEBUG_INFO=OFF  \
-DBUILD_ZLIB=OFF  \
-DWITH_1394=ON  \
-DWITH_EIGEN=ON  \
-DWITH_FFMPEG=ON  \
-DWITH_GIGEAPI=ON  \
-DWITH_GSTREAMER=ON  \
-DWITH_GTK=ON  \
-DWITH_IPP=OFF  \
-DWITH_JASPER=ON  \
-DWITH_JPEG=ON  \
-DWITH_LIBV4L=ON  \
-DWITH_OPENCL=OFF  \
-DWITH_OPENCLAMDBLAS=OFF  \
-DWITH_OPENCLAMDFFT=OFF  \
-DWITH_OPENEXR=OFF  \
-DWITH_OPENGL=ON  \
-DWITH_OPENMP=OFF  \
-DWITH_OPENNI=OFF  \
-DWITH_PNG=ON  \
-DWITH_PVAPI=OFF  \
-DWITH_QT=OFF  \
-DWITH_TBB=ON  \
-DWITH_TIFF=ON  \
-DWITH_UNICAP=OFF  \
-DWITH_V4L=ON  \
-DWITH_XIMEA=OFF  \
-DWITH_XINE=ON  \
-DPYTHON_EXECUTABLE=$PYTHON_EXECUTABLE  \
-DPYTHON_INCLUDE_PATH=$PYTHON_INCLUDE_PATH \
-DPYTHON_LIBRARY=$PYTHON_LIBRARY \
-DPYTHON_NUMPY_INCLUDE_DIR=$PYTHON_NUMPY_INCLUDE_DIR \
-DPYTHON_PACKAGES_PATH=$PYTHON_PACKAGES_PATH \
-DBUILD_SHARED_LIBS=ON \
-DBUILD_PYTHON_SUPPORT=ON \
-DCMAKE_BUILD_TYPE=RELEASE \
-DCMAKE_INSTALL_PREFIX=/usr/local \
-DBUILD_NEW_PYTHON_SUPPORT=ON \
-DINSTALL_C_EXAMPLES=ON \
-DINSTALL_PYTHON_EXAMPLES=ON  \
-DBUILD_EXAMPLES=ON .. \
-Wno-dev ../
-DCMAKE_INSTALL_PREFIX=~/.opencv-3.0.0 \
make -j$(nproc)
sudo make install
sudo ldconfig
