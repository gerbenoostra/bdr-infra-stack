# Installing OpenCV on a mac

## Failed attempt using HomeBrew

### Installing homebrew

Took it from <http://www.pyimagesearch.com/2016/12/19/install-opencv-3-on-macos-with-homebrew-the-easy-way/>
 but using anaconda python instead of brew's python(3)
 
```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
echo "# Homebrew\n" >> ~/.bash_profile
echo "export PATH=/usr/local/bin:$PATH\n" >> ~/.bash_profile
source ~/.bash_profile
```


### Install opencv using brew
```
brew tap homebrew/science
brew install opencv3 --with-contrib --with-python3 --HEAD
echo /usr/local/opt/opencv3/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/opencv3.pth
```

## Failed attempt using Anaconda

```
conda install --channel https://conda.anaconda.org/menpo opencv3
```
maar niet versie 3.2...: `er228::opencv3=3.2.0 bestaat wel voor osx`

## Building OpenCV ourselves

### Install depedencies
Install Tesseract (OCR library), which needs to be done before building opencv (such that tesseract is available through opencv):
```
brew install tesseract
```

### Select target environment
Create and activate conda env to work in (with numpy,...):
```
conda env create -f environment.yml
source activate [..]
```
Note: we don't use conda's gcc, but the system gcc to also have objective c compiler. So no gcc in environment.yml deps

Building opencv tips can bou found at:
 * (http://stackoverflow.com/questions/20953273/install-opencv-for-python-3-3)
 * (http://docs.opencv.org/trunk/d7/d9f/tutorial_linux_install.html)
 * (https://gist.github.com/arundasan91/b432cb011d1c45b65222d0fac5f9232c#Makefile.config)


### Download required projects
```
mkdir externals
cd externals
git clone git@github.com:opencv/opencv.git
git clone git@github.com:opencv/opencv_contrib.git
git clone git@github.com:aperrau/DetectText.git
```

### Build OpenCV
Now build and install opencv in the anaconda env:
```
mkdir externals/opencv/build
cd externals/opencv/build
cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr/local \
      -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -DPYTHON_DEFAULT_EXECUTABLE=/Users/gerben/anaconda3/envs/opencv/bin/python3.5 \
      -DPYTHON_EXECUTABLE=/Users/gerben/anaconda3/envs/opencv/bin/python3.5 \
      -DPYTHON_INCLUDE_DIRS=/Users/gerben/anaconda3/envs/opencv/include \
      -DPYTHON_INCLUDE_DIR2=/Users/gerben/anaconda3/envs/opencv/include/python3.5m \
      -DPYTHON_LIBRARY=/Users/gerben/anaconda3/envs/opencv/lib/libpython3.5m.dylib \
      -DPYTHON_NUMPY_INCLUDE_DIRS=/Users/gerben/anaconda3/envs/opencv/lib/python3.5/site-packages/numpy/core/include \
      -DWITH_TBB=ON -DWITH_EIGEN=ON \
      ../../opencv
make -j5 # in 5 parallel
sudo make install # actually install
```

### Verify install
Test if you can import numpy and cv2:
```
python3 -c "import numpy"
python3 -c "import cv2"
```

### Possible opencv problem diagnostics
If it doesn't work, you can verify where it might have been placed:
```
find / -name cv2.cpython
```
Not really ideal, but if it is installed in the wrong location, you could move the cv2 dir (which contains the `__init__.py` file) to somewhere else:
```
cp -r /Users/gerben/anaconda3/envs/opencv/lib/python3.5/site-packages/cv2 /Users/gerben/anaconda3/lib/python3.5/site-packages/
```

If the `PYTHON_LIBRARY` path does not exist in the environment, it possibly is in the root anaconda environment

### Build DetectText
Then build DetectText (which depends on opencv): Check `externals/DetectText/README.md` for details
```
cd externals/DetectText
mkdir build
cd build
cmake ..
make
```





