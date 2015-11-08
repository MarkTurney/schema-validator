
;TODO - seriously refactor this (especially pull out common variables)

SetCompressor /FINAL /SOLID lzma

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------

; The name of the installer
Name "Schema Validator"

; The file to write
OutFile "schema_validator_installer.exe"

; The default installation directory
InstallDir "$LOCALAPPDATA\XmlSoft\Schema Validator"

; Registry key to check for directory (so if you install again, it will
; overwrite the old one automatically)
InstallDirRegKey HKCU "Software\XmlSoft\Schema Validator" "Install_Dir"

; Request application privileges for Windows Vista
RequestExecutionLevel admin

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING

;--------------------------------

;Language Selection Dialog Settings

  ;Remember the installer language
  !define MUI_LANGDLL_REGISTRY_ROOT "HKCU" 
  !define MUI_LANGDLL_REGISTRY_KEY "Software\XmlSoft\Schema Validator" 
  !define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

;--------------------------------

; Pages

  !insertmacro MUI_PAGE_WELCOME
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_LICENSE "License.txt"
  !insertmacro MUI_PAGE_INSTFILES
  !insertmacro MUI_PAGE_FINISH

  !insertmacro MUI_UNPAGE_WELCOME
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  !insertmacro MUI_UNPAGE_FINISH
  
  ;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "English" ;first language is the default language
  !insertmacro MUI_LANGUAGE "French"
  !insertmacro MUI_LANGUAGE "German"
  !insertmacro MUI_LANGUAGE "Spanish"
  !insertmacro MUI_LANGUAGE "SpanishInternational"
  !insertmacro MUI_LANGUAGE "SimpChinese"
  !insertmacro MUI_LANGUAGE "TradChinese"
  !insertmacro MUI_LANGUAGE "Japanese"
  !insertmacro MUI_LANGUAGE "Korean"
  !insertmacro MUI_LANGUAGE "Italian"
  !insertmacro MUI_LANGUAGE "Dutch"
  !insertmacro MUI_LANGUAGE "Danish"
  !insertmacro MUI_LANGUAGE "Swedish"
  !insertmacro MUI_LANGUAGE "Norwegian"
  !insertmacro MUI_LANGUAGE "NorwegianNynorsk"
  !insertmacro MUI_LANGUAGE "Finnish"
  !insertmacro MUI_LANGUAGE "Greek"
  !insertmacro MUI_LANGUAGE "Russian"
  !insertmacro MUI_LANGUAGE "Portuguese"
  !insertmacro MUI_LANGUAGE "PortugueseBR"
  !insertmacro MUI_LANGUAGE "Polish"
  !insertmacro MUI_LANGUAGE "Ukrainian"
  !insertmacro MUI_LANGUAGE "Czech"
  !insertmacro MUI_LANGUAGE "Slovak"
  !insertmacro MUI_LANGUAGE "Croatian"
  !insertmacro MUI_LANGUAGE "Bulgarian"
  !insertmacro MUI_LANGUAGE "Hungarian"
  !insertmacro MUI_LANGUAGE "Thai"
  !insertmacro MUI_LANGUAGE "Romanian"
  !insertmacro MUI_LANGUAGE "Latvian"
  !insertmacro MUI_LANGUAGE "Macedonian"
  !insertmacro MUI_LANGUAGE "Estonian"
  !insertmacro MUI_LANGUAGE "Turkish"
  !insertmacro MUI_LANGUAGE "Lithuanian"
  !insertmacro MUI_LANGUAGE "Slovenian"
  !insertmacro MUI_LANGUAGE "Serbian"
  !insertmacro MUI_LANGUAGE "SerbianLatin"
  !insertmacro MUI_LANGUAGE "Arabic"
  !insertmacro MUI_LANGUAGE "Farsi"
  !insertmacro MUI_LANGUAGE "Hebrew"
  !insertmacro MUI_LANGUAGE "Indonesian"
  !insertmacro MUI_LANGUAGE "Mongolian"
  !insertmacro MUI_LANGUAGE "Luxembourgish"
  !insertmacro MUI_LANGUAGE "Albanian"
  !insertmacro MUI_LANGUAGE "Breton"
  !insertmacro MUI_LANGUAGE "Belarusian"
  !insertmacro MUI_LANGUAGE "Icelandic"
  !insertmacro MUI_LANGUAGE "Malay"
  !insertmacro MUI_LANGUAGE "Bosnian"
  !insertmacro MUI_LANGUAGE "Kurdish"
  !insertmacro MUI_LANGUAGE "Irish"
  !insertmacro MUI_LANGUAGE "Uzbek"
  !insertmacro MUI_LANGUAGE "Galician"
  !insertmacro MUI_LANGUAGE "Afrikaans"
  !insertmacro MUI_LANGUAGE "Catalan"
  !insertmacro MUI_LANGUAGE "Esperanto"

;--------------------------------
;Reserve Files
  
  ;If you are using solid compression, files that are required before
  ;the actual installation should be stored first in the data block,
  ;because this will make your installer start faster.
  
  !insertmacro MUI_RESERVEFILE_LANGDLL

;--------------------------------

; Installer sections

Section "Schema Validator (required)" SecApplication

  SectionIn RO
 
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
 
  ; Put file there
  File "schema_validator.exe"
  File "libgcc_s_dw2-1.dll"
  File "mingwm10.dll"
  File "QtCore4.dll"
  File "QtGui4.dll"
  File "QtNetwork4.dll"
  File "QtXmlPatterns4.dll"
  File "License.txt"
  File "ReadMe.txt"
 
  ; Write the installation path into the registry
  WriteRegStr HKCU "SOFTWARE\XmlSoft\Schema Validator" "Install_Dir" "$INSTDIR"
 
  ; Write the uninstall keys for Windows
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\XmlSoft\Schema Validator" "DisplayName" "Schema Validator"
  WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\XmlSoft\Schema Validator" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\XmlSoft\Schema Validator" "NoModify" 1
  WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\XmlSoft\Schema Validator" "NoRepair" 1
  WriteUninstaller "uninstall.exe"
 
SectionEnd

; Optional section (can be disabled by the user)
Section "Start Menu Shortcuts (required)" SecStartMenu

   SectionIn RO

  CreateDirectory "$SMPROGRAMS\XmlSoft\Schema Validator"
  CreateShortCut "$SMPROGRAMS\XmlSoft\Schema Validator\Uninstall.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\XmlSoft\Schema Validator\ReadMe.lnk" "$INSTDIR\ReadMe.txt" "" "$INSTDIR\ReadMe.txt" 0
  CreateShortCut "$SMPROGRAMS\XmlSoft\Schema Validator\Schema Validator.lnk" "$INSTDIR\schema_validator.exe" "" "$INSTDIR\schema_validator.exe" 0
  CreateShortCut "$SMPROGRAMS\XmlSoft\Schema Validator\Examples.lnk" "explorer" "$INSTDIR\examples" "$SYSDIR\SHELL32.dll" "3"

 
SectionEnd

; Optional section
Section "Examples" SecExamples

   File /r "examples"

SectionEnd

; Optional section
Section "Source Files" SecSource

   File /r "source"

SectionEnd

; Optional section (can be disabled by the user)
Section "Desktop Shortcut" SecDesktop

    CreateShortCut "$DESKTOP\Schema Validator.lnk" "$INSTDIR\schema_validator.exe" "" "$INSTDIR\schema_validator.exe" 0
  
SectionEnd

; Optional section (can be disabled by the user)
Section "Quick Launch Shortcut" SecQuick

    CreateShortCut "$QUICKLAUNCH\Schema Validator.lnk" "$INSTDIR\schema_validator.exe" "" "$INSTDIR\schema_validator.exe" 0
  
SectionEnd


;--------------------------------
;Installer Functions

Function .onInit

  ;!insertmacro MUI_LANGDLL_DISPLAY

FunctionEnd

;--------------------------------

; Uninstaller Sections

Section "Uninstall"
 
  ; Remove registry keys
  DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\XmlSoft\Schema Validator"
  DeleteRegKey HKCU "SOFTWARE\XmlSoft\Schema Validator"

  ; Remove files and uninstaller
  Delete $INSTDIR\schema_validator.exe
  Delete $INSTDIR\libgcc_s_dw2-1.dll
  Delete $INSTDIR\mingwm10.dll
  Delete $INSTDIR\QtCore4.dll
  Delete $INSTDIR\QtGui4.dll
  Delete $INSTDIR\QtNetwork4.dll
  Delete $INSTDIR\QtXmlPatterns4.dll
  Delete $INSTDIR\License.txt
  Delete $INSTDIR\ReadMe.txt
  Delete "$DESKTOP\Schema Validator.lnk"
  Delete "$QUICKLAUNCH\Schema Validator.lnk"
  Delete $INSTDIR\uninstall.exe

  ; Remove shortcuts, if any
  Delete "$SMPROGRAMS\XmlSoft\Schema Validator\*.*"

  ; Remove directories used
  RMDir "$SMPROGRAMS\XmlSoft\Schema Validator"
  RMDir /r "$INSTDIR"
  
  ; If there are no other directories in the XmlSoft shortcut directory, remove the XmlSoft shortcut directory.
  ${If} ${FileExists} "$SMPROGRAMS\XmlSoft\"
  ${Else}
    RMDir "$SMPROGRAMS\XmlSoft"
  ${EndIf}
  
  ; If there are no other directories in the XmlSoft application directory, remove the XmlSoft application directory.
  ${If} ${FileExists} "$LOCALAPPDATA\XmlSoft\"
  ${Else}
    RMDir "$LOCALAPPDATA\XmlSoft"
  ${EndIf}


  
SectionEnd

;--------------------------------
;Uninstaller Functions

Function un.onInit

  !insertmacro MUI_UNGETLANGUAGE
  
FunctionEnd
