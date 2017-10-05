# Installing xgboost on mac
Running on mac....

## Failed attempt by strictly following readme
```
git clone --recursive https://github.com/dmlc/xgboost
cd xgboost; cp make/config.mk ./config.mk
```

## Failed attempt with (latest) gcc
```
brew reinstall gcc --without-multilib
make -j4
```

## Failed attempt with llvm :
```
brew update
brew upgrade
brew install --with-toolchain llvm
echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```
To know which components / options are available:
```
brew info llvm
```

This finishes (after about 30 minutes), with the following comments:
```
To use the bundled libc++ please add the following LDFLAGS:
  LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"

This formula is keg-only, which means it was not symlinked into /usr/local,
because macOS already provides this software and installing another version in
parallel can cause all kinds of trouble.

If you need to have this software first in your PATH run:
  echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.bash_profile

For compilers to find this software you may need to set:
    LDFLAGS:  -L/usr/local/opt/llvm/lib
    CPPFLAGS: -I/usr/local/opt/llvm/include
```

Thus we comply and nicely change `config.mk` and update:
```
export CC = /usr/local/opt/llvm/bin/clang
export CXX = $(CC)++
ADD_LDFLAGS = -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib
ADD_CFLAGS = -I/usr/local/opt/llvm/include -I/usr/local/opt/llvm/include/c++/v1/
```
And then continue building:
```
make -j4
```

## Final successful install with gcc 6e
```
brew install homebrew/versions/gcc6 --without-multilib
cd dmlc-core/
cmake -DCMAKE_CXX_COMPILER=g++-6 -DCMAKE_C_COMPILER=gcc-6
cd ..
cmake -DCMAKE_CXX_COMPILER=g++-6 -DCMAKE_C_COMPILER=gcc-6
chmod +x build.sh
./build.sh
```

Either globally, or for a specific conda environment
then first `source activate target-conda-env` and then:
```
cd python-package/
python setup.py install
```
