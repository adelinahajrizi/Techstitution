#! /usr/bin/env bash

# check python version, should be over 2.7
ret=`python -c 'import sys; print("%i" % (sys.hexversion<0x02060000))'`
if [ $ret -eq 0 ]; then
    echo "Required version of Python already installed."

else
	echo "Python not installed."
    exit 1
fi

echo "Testing whether virtualenv is installed..."
# test whether virtualenv is installed
ve=`command -v virtualenv`
if [ -z "$ve" ]; then
   echo "You need to install virtualenv?"
   echo -e "Install virtualenv? [y/n] \c "
   read word
   if [ $word == "y" ]; then
      echo "This will install virtualenv"
      echo `pip install virtualenv`
   fi
fi

# start virtual env and install flask
echo `virtualenv -p "C:\Python27\python.exe" venv`
currentDir=`pwd`
virtualenvPath='venv/Scripts/activate'
source $currentDir/$virtualenvPath 

pip install -r requirements.txt
echo "Installation complete."
