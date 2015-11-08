# -------------------------------------------------
# Project created by QtCreator 2009-12-15T22:22:54
# -------------------------------------------------
QT += xml \
    xmlpatterns
TARGET = schema_validator
TEMPLATE = app
SOURCES += main.cpp \
    mainwindow.cpp \
    utility.cpp
HEADERS += mainwindow.hpp \
    messagehandler.hpp \
    utility.hpp
RESOURCES += resources/resources.qrc
TRANSLATIONS = resources/translations/hindi.ts \
    resources/translations/french.ts
CODECFORSRC = UTF-8

# Icon
RC_FILE = schema_validator_icon.rc

# Installation
target.path = /usr/bin/schema_validator
readme.path = /usr/share/schema_validator
readme.files = installer/ReadMe.txt
license.path = /usr/share/schema_validator
license.files = installer/License.txt
examples.path = /usr/share/schema_validator
examples.files = installer/examples/*
INSTALLS += target
INSTALLS += readme
INSTALLS += license
INSTALLS += examples
