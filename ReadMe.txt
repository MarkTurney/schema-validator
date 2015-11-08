
Validator v1.0.1 readme.txt
Updated 2010-02-13

Send all feedback/comments/problems to markturney@xmlsoft.com
Copyright 2010 Mark Turney



WHAT IS SCHEMA VALIDATOR?
=========================

Schema Validator is a cross-platform tool that allows you to validate XML files
against XML Schema files.  For more information on XML Schema, visit:
http://www.w3.org/XML/Schema


LICENSING AND COST
==================

Schema Validator is a GPL open source application and as such costs nothing to
use or distribute.  If you want to re-use the source code of Schema Validator,
you are bound to the GPL v3 license.  For more information on the GPL v3
license, please open the license.txt file in the install directory or visit:
http://www.gnu.org/licenses/gpl.html


WARRANTY
========

Schema Validator is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.


INSTALLATION
============

Windows:
- Download "schema_validator_setup.exe".
- Double click the schema_validator_setup.exe file and follow the installation guide.

Linux (incomplete):
- Download "schema-validator_1.0.0_amd64.deb".

OSX (incomplete)

From Source (any OS):
- Download and install the Qt framework (4.6 or higher) for your OS from:
    http://qt.nokia.com/downloads
- Ensure that the Qt bin directory (Qt/20xx/qt/bin) is in your PATH environment variable.
- Download "schema_validator_1.0.0.tar.gz".
- Uncompress schema_validator_1.0.0.tar.gz.
- Navigate to the uncompressed schema_validator directory in a command prompt.
- Type "qmake schema_validator.pro".  This will create the makefile for your system.
- Type "make install".  This will build and install Schema Validator on your system.
- Make a link from the executable schema validator file to your desktop.


REMOVAL
=======

Windows:
- Open Control Panel
- Open Add/Remove Programs
- Click on Author and select Remove

Linux (incomplete)

OSX (incomplete)

Source:
- Delete the validator installation directory.


ACKNOWLEDGMENTS (chronological order)
=====================================

Pierre-Paul Lavoie - Reviewer and Translator [fr-CA]


VERSION HISTORY
========================

2010-02-13 v1.0.1
    Added color coded validation result.
    Fixed bugs found by Pierre-Paul Lavoie.
    Added French Candada translation from Pierre-Paul Lavoie.

2010-02-07 v1.0.0
    Initial release of Schema Validator.
