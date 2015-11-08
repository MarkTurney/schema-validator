#!/bin/bash
# This script creates a windows installer using the nsis script "installer.nsi".

# Qt's bin, Qt's Mingw bin, Cygwin's bin, and NSIS must be in the PATH environment variable.
# example: C:\cygwin\bin;C:\Qt\2010.01\qt\bin;C:\Qt\2010.01\mingw\bin;C:\Program Files\NSIS

QT_BASE_DIR=C:/Qt/2010.01
QT_BIN_DIR=$QT_BASE_DIR/qt/bin

# Move to the scheme_validator directory and remove any build files.
cd ..
cd ..
rm *.o
rm Makefile*
rm moc_*
rm qrc_*
rm schema_validator
rm debug/*
rm release/*

# Isolate the project name.
x=$PWD
PROJECT_NAME=${x##*/}

# Move to the schema_validator parent directory, delete, and create the directory "installer".
cd ..
rm -rf installer
mkdir installer
cd installer

# Create the daughter "source" directory and copy all source files into it.
mkdir source
mkdir source/debug
mkdir source/release
cp ../$PROJECT_NAME/* ./source
cp -r ../$PROJECT_NAME/resources ./source

# Copy the examples into the project directory.
#TODO - move this into the source directory.
cp -r ../$PROJECT_NAME/examples .

# Go back to the project directory and build the project.
cd ../$PROJECT_NAME
qmake $PROJECT_NAME.pro
mingw32-make release

# Copy the built executable into the installer directory.
cp ./release/$PROJECT_NAME.exe ../installer

# Copy the required dlls into the installer directory.
cp $QT_BIN_DIR/libgcc_s_dw2-1.dll ../installer
cp $QT_BIN_DIR/mingwm10.dll ../installer
cp $QT_BIN_DIR/QtCore4.dll ../installer
cp $QT_BIN_DIR/QtGui4.dll ../installer
cp $QT_BIN_DIR/QtNetwork4.dll ../installer
cp $QT_BIN_DIR/QtXmlPatterns4.dll ../installer

# Copy the readme, license, and installer script into the installer directory.
cp ./installers/windows/installer.nsi ../installer
cp ./ReadMe.txt ../installer
cp ./License.txt ../installer

# Move to the installer directory and compile the nsis script.
cd ../installer
makensis installer.nsi

# Copy installer to project parent directory and delete the build directory.
cd ..
cp ./installer/schema_validator_installer.exe ./
rm -rf ./installer
