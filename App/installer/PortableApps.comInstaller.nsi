;Copyright 2007-2017  John T. Haller of PortableApps.com
;Website: http://PortableApps.com/

;This software is OSI Certified Open Source Software.
;OSI Certified is a certification mark of the Open Source Initiative.

;This program is free software; you can redistribute it and/or
;modify it under the terms of the GNU General Public License
;as published by the Free Software Foundation; either version 2
;of the License, or (at your option) any later version.

;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.

;You should have received a copy of the GNU General Public License
;along with this program; if not, write to the Free Software
;Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

;EXCEPTION: The PortableApps.com Installer can be used with open source
;applications licensed under OSI-approved licenses as well as freeware provided
;it is unmodified and it adheres to the current PortableApps.com Format Specification
;as published at PortableApps.com/development. It may also be used with commercial
;software by contacting PortableApps.com.

;NSIS3
Unicode true 
ManifestDPIAware true

!define PORTABLEAPPSINSTALLERVERSION "3.5.5.0"
!define PORTABLEAPPS.COMFORMATVERSION "3.5.5"

!if ${__FILE__} == "PortableApps.comInstallerPlugin.nsi"
	!include PortableApps.comInstallerPluginConfig.nsh
	!define PLUGININSTALLER
!else
	!include PortableApps.comInstallerConfig.nsh
!endif

!define MAINSECTIONIDX 0
!ifdef MAINSECTIONTITLE
	!define OPTIONALSECTIONIDX 1
!endif

;7z Usage
!ifdef AdvancedExtract1To
	!define bolUses7Zip true
!else
	!ifdef DoubleExtract1To
		!define bolUses7Zip true
	!else
		!ifdef Download2AdvancedExtract1To
			!define bolUses7Zip true
		!else
			!ifdef Download2DoubleExtract1To
				!define bolUses7Zip true
			!else
				!ifdef Download3AdvancedExtract1To
					!define bolUses7Zip true
				!else
					!ifdef Download3DoubleExtract1To
						!define bolUses7Zip true
					!else
						!ifdef Download4AdvancedExtract1To
							!define bolUses7Zip true
						!else
							!ifdef Download4DoubleExtract1To
								!define bolUses7Zip true
							!else
								!ifdef Download5AdvancedExtract1To
									!define bolUses7Zip true
								!else
									!ifdef Download5DoubleExtract1To
										!define bolUses7Zip true
									!else
										!ifdef Download6AdvancedExtract1To
											!define bolUses7Zip true
										!else
											!ifdef Download6DoubleExtract1To
												!define bolUses7Zip true
											!else
												!ifdef Download7AdvancedExtract1To
													!define bolUses7Zip true
												!else
													!ifdef Download7DoubleExtract1To
														!define bolUses7Zip true
													!else
														!ifdef Download8AdvancedExtract1To
															!define bolUses7Zip true
														!else
															!ifdef Download8DoubleExtract1To
																!define bolUses7Zip true
															!else
																!ifdef Download9AdvancedExtract1To
																	!define bolUses7Zip true
																!else
																	!ifdef Download9DoubleExtract1To
																		!define bolUses7Zip true
																	!else
																		!ifdef Download10AdvancedExtract1To
																			!define bolUses7Zip true
																		!else
																			!ifdef Download10DoubleExtract1To
																				!define bolUses7Zip true
																			!else
																				!ifdef CustomCodeUses7zip
																					!if CustomCodeUses7zip = true
																						!define bolUses7Zip true
																					!endif
																				!endif
																			!endif
																		!endif
																	!endif
																!endif
															!endif
														!endif
													!endif
												!endif
											!endif
										!endif
									!endif
								!endif
							!endif
						!endif
					!endif
				!endif
			!endif
		!endif
	!endif
!endif

;=== Program Details
Name "${PORTABLEAPPNAME}" "${PORTABLEAPPNAMEDOUBLEDAMPERSANDS}"
OutFile "..\..\..\${FILENAME}.paf.exe"
!ifdef COMMONFILESPLUGIN
	InstallDir "\CommonFiles\${APPID}"
!else
	InstallDir "\${APPID}"
!endif
Caption "${PORTABLEAPPNAME} | PortableApps.com Installer"
VIProductVersion "${VERSION}"
VIAddVersionKey ProductName "${PORTABLEAPPNAME}"
VIAddVersionKey Comments "${INSTALLERCOMMENTS}"
VIAddVersionKey CompanyName "PortableApps.com"
VIAddVersionKey LegalCopyright "2007-2017 PortableApps.com, PortableApps.com Installer ${PORTABLEAPPSINSTALLERVERSION}"
VIAddVersionKey FileDescription "${PORTABLEAPPNAME}"
VIAddVersionKey FileVersion "${VERSION}"
VIAddVersionKey ProductVersion "${VERSION}"
VIAddVersionKey InternalName "${PORTABLEAPPNAME}"
VIAddVersionKey LegalTrademarks "${INSTALLERADDITIONALTRADEMARKS}PortableApps.com is a registered trademark of Rare Ideas, LLC."
VIAddVersionKey OriginalFilename "${FILENAME}.paf.exe"
VIAddVersionKey PortableApps.comInstallerVersion "${PORTABLEAPPSINSTALLERVERSION}"
VIAddVersionKey PortableApps.comFormatVersion "${PORTABLEAPPS.COMFORMATVERSION}"
VIAddVersionKey PortableApps.comAppID "${APPID}"
!ifdef DownloadURL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownloadURL "${DownloadURL}"
	VIAddVersionKey PortableApps.comDownloadKnockURL "${DownloadKnockURL}"
	VIAddVersionKey PortableApps.comDownloadName "${DownloadName}"
	VIAddVersionKey PortableApps.comDownloadFileName "${DownloadFileName}"
	!ifdef DownloadMD5
		VIAddVersionKey PortableApps.comDownloadMD5 "${DownloadMD5}"
	!endif
	!ifdef DownloadCachedByPAc
		VIAddVersionKey DownloadCachedByPAc "true"
	!endif
!endif
!ifdef Download2URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload2URL "${Download2URL}"
	VIAddVersionKey PortableApps.comDownload2KnockURL "${Download2KnockURL}"
	VIAddVersionKey PortableApps.comDownload2Name "${Download2Name}"
	VIAddVersionKey PortableApps.comDownload2FileName "${Download2FileName}"
	!ifdef Download2MD5
		VIAddVersionKey PortableApps.comDownload2MD5 "${Download2MD5}"
	!endif
	!ifdef Download2CachedByPAc
		VIAddVersionKey Download2CachedByPAc "true"
	!endif
!endif
!ifdef Download3URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload3URL "${Download3URL}"
	VIAddVersionKey PortableApps.comDownload3KnockURL "${Download3KnockURL}"
	VIAddVersionKey PortableApps.comDownload3Name "${Download3Name}"
	VIAddVersionKey PortableApps.comDownload3FileName "${Download3FileName}"
	!ifdef Download3MD5
		VIAddVersionKey PortableApps.comDownload3MD5 "${Download3MD5}"
	!endif
	!ifdef Download3CachedByPAc
		VIAddVersionKey Download3CachedByPAc "true"
	!endif
!endif
!ifdef Download4URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload4URL "${Download4URL}"
	VIAddVersionKey PortableApps.comDownload4KnockURL "${Download4KnockURL}"
	VIAddVersionKey PortableApps.comDownload4Name "${Download4Name}"
	VIAddVersionKey PortableApps.comDownload4FileName "${Download4FileName}"
	!ifdef Download4MD5
		VIAddVersionKey PortableApps.comDownload4MD5 "${Download4MD5}"
	!endif
	!ifdef Download4CachedByPAc
		VIAddVersionKey Download4CachedByPAc "true"
	!endif
!endif
!ifdef Download5URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload5URL "${Download5URL}"
	VIAddVersionKey PortableApps.comDownload5KnockURL "${Download5KnockURL}"
	VIAddVersionKey PortableApps.comDownload5Name "${Download5Name}"
	VIAddVersionKey PortableApps.comDownload5FileName "${Download5FileName}"
	!ifdef Download5MD5
		VIAddVersionKey PortableApps.comDownload5MD5 "${Download5MD5}"
	!endif
	!ifdef Download5CachedByPAc
		VIAddVersionKey Download5CachedByPAc "true"
	!endif
!endif
!ifdef Download6URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload6URL "${Download6URL}"
	VIAddVersionKey PortableApps.comDownload6KnockURL "${Download6KnockURL}"
	VIAddVersionKey PortableApps.comDownload6Name "${Download6Name}"
	VIAddVersionKey PortableApps.comDownload6FileName "${Download6FileName}"
	!ifdef Download6MD5
		VIAddVersionKey PortableApps.comDownload6MD5 "${Download6MD5}"
	!endif
	!ifdef Download6CachedByPAc
		VIAddVersionKey Download6CachedByPAc "true"
	!endif
!endif
!ifdef Download7URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload7URL "${Download7URL}"
	VIAddVersionKey PortableApps.comDownload7KnockURL "${Download7KnockURL}"
	VIAddVersionKey PortableApps.comDownload7Name "${Download7Name}"
	VIAddVersionKey PortableApps.comDownload7FileName "${Download7FileName}"
	!ifdef Download7MD5
		VIAddVersionKey PortableApps.comDownload7MD5 "${Download7MD5}"
	!endif
	!ifdef Download7CachedByPAc
		VIAddVersionKey Download7CachedByPAc "true"
	!endif
!endif
!ifdef Download8URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload8URL "${Download8URL}"
	VIAddVersionKey PortableApps.comDownload8KnockURL "${Download8KnockURL}"
	VIAddVersionKey PortableApps.comDownload8Name "${Download8Name}"
	VIAddVersionKey PortableApps.comDownload8FileName "${Download8FileName}"
	!ifdef Download8MD5
		VIAddVersionKey PortableApps.comDownload8MD5 "${Download8MD5}"
	!endif
	!ifdef Download8CachedByPAc
		VIAddVersionKey Download8CachedByPAc "true"
	!endif
!endif
!ifdef Download9URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload9URL "${Download9URL}"
	VIAddVersionKey PortableApps.comDownload9KnockURL "${Download9KnockURL}"
	VIAddVersionKey PortableApps.comDownload9Name "${Download9Name}"
	VIAddVersionKey PortableApps.comDownload9FileName "${Download9FileName}"
	!ifdef Download9MD5
		VIAddVersionKey PortableApps.comDownload9MD5 "${Download9MD5}"
	!endif
	!ifdef Download9CachedByPAc
		VIAddVersionKey Download9CachedByPAc "true"
	!endif
!endif
!ifdef Download10URL ;advertise the needed bits to the PA.c Updater
	VIAddVersionKey PortableApps.comDownload10URL "${Download10URL}"
	VIAddVersionKey PortableApps.comDownload10KnockURL "${Download10KnockURL}"
	VIAddVersionKey PortableApps.comDownload10Name "${Download10Name}"
	VIAddVersionKey PortableApps.comDownload10FileName "${Download10FileName}"
	!ifdef Download10MD5
		VIAddVersionKey PortableApps.comDownload10MD5 "${Download10MD5}"
	!endif
	!ifdef Download10CachedByPAc
		VIAddVersionKey Download10CachedByPAc "true"
	!endif
!endif

;=== Runtime Switches
SetCompress Auto
SetCompressor /SOLID lzma
SetCompressorDictSize 32
SetDatablockOptimize On
CRCCheck on
AutoCloseWindow True
RequestExecutionLevel user
AllowRootDirInstall true

;=== Include
!include MUI2.nsh
!include FileFunc.nsh
!include LogicLib.nsh
!ifdef PRESERVEFILE1
	!include PortableApps.comInstallerMoveFiles.nsh
!endif
!ifdef COPYLOCALFILES
	!include Registry.nsh
!endif
!include TextFunc.nsh
!include WordFunc.nsh
!include PortableApps.comInstallerDriveFreeSpaceCustom.nsh
!include PortableApps.comInstallerDumpLogToFile.nsh
!include PortableApps.comInstallerTBProgress.nsh

;=== Program Icon
Icon "PortableApps.comInstaller.ico"
!define MUI_ICON "PortableApps.comInstaller.ico"
!define MUI_UNICON "PortableApps.comInstaller.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "PortableApps.comInstallerHeader.bmp"
!define MUI_HEADERIMAGE_BITMAP_RTL "PortableApps.comInstallerHeaderRTL.bmp"
!define MUI_HEADERIMAGE_RIGHT

;=== Icon & Stye ===
BrandingText "PortableApps.com®"

;=== Pages
!ifdef COPYLOCALFILES
	!define MUI_CUSTOMFUNCTION_ABORT CustomAbortFunction
!endif
!define MUI_LANGDLL_WINDOWTITLE "${PORTABLEAPPNAME}"
!define MUI_LANGDLL_INFO "Please select a language for the installer."
!define MUI_WELCOMEFINISHPAGE_BITMAP "PortableApps.comInstaller.bmp"
!ifdef PLUGINNAME
	!define MUI_WELCOMEPAGE_TITLE "${PORTABLEAPPNAMEDOUBLEDAMPERSANDS}"
!else
	!define MUI_WELCOMEPAGE_TITLE "${PORTABLEAPPNAMEDOUBLEDAMPERSANDS}"
!endif
!define MUI_WELCOMEPAGE_TEXT "$(welcome)"
!define MUI_PAGE_CUSTOMFUNCTION_PRE PreWelcome
!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowWelcome
!define MUI_COMPONENTSPAGE_SMALLDESC
!insertmacro MUI_PAGE_WELCOME
!ifdef LICENSEAGREEMENT
	;!define MUI_LICENSEPAGE_CHECKBOX
	!define MUI_PAGE_CUSTOMFUNCTION_PRE PreLicense
	!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowLicense
	!define MUI_PAGE_CUSTOMFUNCTION_LEAVE LeaveLicense
	!insertmacro MUI_PAGE_LICENSE "..\..\App\AppInfo\${LICENSEAGREEMENT}"
!endif
!ifdef MAINSECTIONTITLE
	!define MUI_PAGE_CUSTOMFUNCTION_PRE PreComponents
	!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowComponents
	!insertmacro MUI_PAGE_COMPONENTS
!endif
!define MUI_DIRECTORYPAGE_VERIFYONLEAVE
!define MUI_PAGE_CUSTOMFUNCTION_PRE PreDirectory
!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowDirectory
!define MUI_PAGE_CUSTOMFUNCTION_LEAVE LeaveDirectory
!insertmacro MUI_PAGE_DIRECTORY
!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowInstFiles
!insertmacro MUI_PAGE_INSTFILES
!define MUI_FINISHPAGE_TEXT "$(finish)"
!define MUI_PAGE_CUSTOMFUNCTION_PRE PreFinish
!define MUI_PAGE_CUSTOMFUNCTION_SHOW ShowFinish
!define MUI_FINISHPAGE_TITLE_3LINES
;!define MUI_FINISHPAGE_CANCEL_ENABLED ;Disabled due to bug in MUI2
!ifndef PLUGINNAME
	!define MUI_FINISHPAGE_RUN_NOTCHECKED
	!define MUI_FINISHPAGE_RUN "$INSTDIR\${FINISHPAGERUN}"
!endif
!insertmacro MUI_PAGE_FINISH

;=== Languages
!ifndef INSTALLERMULTILINGUAL
	!insertmacro MUI_LANGUAGE "${INSTALLERLANGUAGE}"
	!include PortableApps.comInstallerLanguages\${INSTALLERLANGUAGE}.nsh
!else
	!tempfile LangAutoDetectFile
	!macro IncludeLang _LANG_NAME
		; define and filename are all uppercase but both case insensitive
		!ifdef USES_${_LANG_NAME}
			!insertmacro MUI_LANGUAGE "${_LANG_NAME}"
			!include PortableApps.comInstallerLanguages\${_LANG_NAME}.nsh
			!appendfile "${LangAutoDetectFile}" "${Case} ${LANG_${_LANG_NAME}}$\n"
		!endif
	!macroend
	!define IncludeLang "!insertmacro IncludeLang"

	${IncludeLang} English
	${IncludeLang} EnglishGB
	${IncludeLang} Afrikaans
	${IncludeLang} Albanian
	${IncludeLang} Arabic
	${IncludeLang} Armenian
	${IncludeLang} Basque
	${IncludeLang} Belarusian
	${IncludeLang} Bosnian
	${IncludeLang} Breton
	${IncludeLang} Bulgarian
	${IncludeLang} Catalan
	${IncludeLang} Cibemba
	${IncludeLang} Croatian
	${IncludeLang} Czech
	${IncludeLang} Danish
	${IncludeLang} Dutch
	${IncludeLang} Efik
	${IncludeLang} Esperanto
	${IncludeLang} Estonian
	${IncludeLang} Farsi
	${IncludeLang} Finnish
	${IncludeLang} French
	${IncludeLang} Galician
	${IncludeLang} Georgian
	${IncludeLang} German
	${IncludeLang} Greek
	${IncludeLang} Hebrew
	${IncludeLang} Hungarian
	${IncludeLang} Icelandic
	${IncludeLang} Igbo
	${IncludeLang} Indonesian
	${IncludeLang} Irish
	${IncludeLang} Italian
	${IncludeLang} Japanese
	${IncludeLang} Khmer
	${IncludeLang} Korean
	${IncludeLang} Kurdish
	${IncludeLang} Latvian
	${IncludeLang} Lithuanian
	${IncludeLang} Luxembourgish
	${IncludeLang} Macedonian
	${IncludeLang} Malagasy
	${IncludeLang} Malay
	${IncludeLang} Mongolian
	${IncludeLang} Norwegian
	${IncludeLang} NorwegianNynorsk
	${IncludeLang} Pashto
	${IncludeLang} Polish
	${IncludeLang} Portuguese
	${IncludeLang} PortugueseBR
	${IncludeLang} Romanian
	${IncludeLang} Russian
	${IncludeLang} Serbian
	${IncludeLang} SerbianLatin
	${IncludeLang} SimpChinese
	${IncludeLang} Slovak
	${IncludeLang} Slovenian
	${IncludeLang} Spanish
	${IncludeLang} SpanishInternational
	${IncludeLang} Swahili
	${IncludeLang} Swedish
	${IncludeLang} Thai
	${IncludeLang} TradChinese
	${IncludeLang} Turkish
	${IncludeLang} Ukrainian
	${IncludeLang} Uzbek
	${IncludeLang} Valencia
	${IncludeLang} Vietnamese
	${IncludeLang} Welsh
	${IncludeLang} Yoruba

	!insertmacro MUI_RESERVEFILE_LANGDLL
!endif

;=== Macros
;Generic macro for use by defined file/directory handling
!macro !insertmacro1-10 _m
!insertmacro ${_m} 1
!insertmacro ${_m} 2
!insertmacro ${_m} 3
!insertmacro ${_m} 4
!insertmacro ${_m} 5
!insertmacro ${_m} 6
!insertmacro ${_m} 7
!insertmacro ${_m} 8
!insertmacro ${_m} 9
!insertmacro ${_m} 10
!macroend
!define !insertmacro1-10 "!insertmacro !insertmacro1-10"

!define PageHeaderHackForHighContrast "!insertmacro PageHeaderHackForHighContrast"
!macro PageHeaderHackForHighContrast
	!if ${MUI_SYSVERSION} >= 2
		SetCtlColors $mui.Header.Text 0x000000 0xFFFFFF
		SetCtlColors $mui.Header.SubText 0x000000 0xFFFFFF
	!else
		Push $0
		FindWindow $0 "#32770" "" $HWNDPARENT
		GetDlgItem $0 $HWNDPARENT 1037
		SetCtlColors $0 0x000000 0xFFFFFF
		GetDlgItem $0 $HWNDPARENT 1038
		SetCtlColors $0 0x000000 0xFFFFFF
		Pop $0
	!endif
!macroend

;=== Variables
Var FOUNDPORTABLEAPPSPATH
!ifdef MAINSECTIONTITLE
	Var OPTIONAL1DONE
!endif
Var AUTOMATEDINSTALL
Var AUTOCLOSE
Var SILENTLANGUAGEMODE
Var HIDEINSTALLER
Var MINIMIZEINSTALLER
!ifdef LICENSEAGREEMENT
	Var EULAVERSIONMATCH
!endif
!ifdef COPYLOCALFILES
	Var CopyLocalFilesFrom
	Var CopyLocalFilesTo
	Var MISSINGFILEORPATH
!endif
!ifdef DOWNLOADURL
	Var MD5MISMATCH
	Var DOWNLOADRESULT
	Var DOWNLOADEDFILE
	Var DOWNLOADALREADYEXISTED
	Var SECONDDOWNLOADATTEMPT
	Var DownloadURLActual
!endif
!ifdef DOWNLOAD2URL
	Var DOWNLOAD2RESULT
	Var DOWNLOADED2FILE
	Var DOWNLOAD2ALREADYEXISTED
	Var SECONDDOWNLOAD2ATTEMPT
	Var Download2URLActual
!endif
!ifdef DOWNLOAD3URL
	Var DOWNLOAD3RESULT
	Var DOWNLOADED3FILE
	Var DOWNLOAD3ALREADYEXISTED
	Var SECONDDOWNLOAD3ATTEMPT
	Var Download3URLActual
!endif
!ifdef DOWNLOAD4URL
	Var DOWNLOAD4RESULT
	Var DOWNLOADED4FILE
	Var DOWNLOAD4ALREADYEXISTED
	Var SECONDDOWNLOAD4ATTEMPT
	Var Download4URLActual
!endif
!ifdef DOWNLOAD5URL
	Var DOWNLOAD5RESULT
	Var DOWNLOADED5FILE
	Var DOWNLOAD5ALREADYEXISTED
	Var SECONDDOWNLOAD5ATTEMPT
	Var Download5URLActual
!endif
!ifdef DOWNLOAD6URL
	Var DOWNLOAD6RESULT
	Var DOWNLOADED6FILE
	Var DOWNLOAD6ALREADYEXISTED
	Var SECONDDOWNLOAD6ATTEMPT
	Var Download6URLActual
!endif
!ifdef DOWNLOAD7URL
	Var DOWNLOAD7RESULT
	Var DOWNLOADED7FILE
	Var DOWNLOAD7ALREADYEXISTED
	Var SECONDDOWNLOAD7ATTEMPT
	Var Download7URLActual
!endif
!ifdef DOWNLOAD8URL
	Var DOWNLOAD8RESULT
	Var DOWNLOADED8FILE
	Var DOWNLOAD8ALREADYEXISTED
	Var SECONDDOWNLOAD8ATTEMPT
	Var Download8URLActual
!endif
!ifdef DOWNLOAD9URL
	Var DOWNLOAD9RESULT
	Var DOWNLOADED9FILE
	Var DOWNLOAD9ALREADYEXISTED
	Var SECONDDOWNLOAD9ATTEMPT
	Var Download9URLActual
!endif
!ifdef DOWNLOAD10URL
	Var DOWNLOAD10RESULT
	Var DOWNLOADED10FILE
	Var DOWNLOAD10ALREADYEXISTED
	Var SECONDDOWNLOAD10ATTEMPT
	Var Download10URLActual
!endif
!ifdef LICENSEAGREEMENT
	Var INTERNALEULAVERSION
!endif
Var InstallingStatusString
Var bolAppUpgrade
Var bolLogFile
Var PAcLocaleID
Var strLastDirectory
Var strTimeStore
!ifdef DownloadURL
	Var intWarnOnZoneCrossing
!endif
Var bolHighContrast

;=== Custom Code
!ifdef USESCUSTOMCODE
	!if ${__FILE__} == "PortableApps.comInstallerPlugin.nsi"
		!include PortableApps.comInstallerPluginCustom.nsh
	!else
		!include PortableApps.comInstallerCustom.nsh
	!endif
!endif

!ifdef INSTALLERMULTILINGUAL
	!macro CaseLang _LANG_NAME _LANG_ID
		!ifdef USES_${_LANG_NAME}
			${Case} ${_LANG_ID}
		!endif
	!macroend
	!define CaseLang "!insertmacro CaseLang"
!endif

Function .onInit
	;=== Check for high contrast mode from platform
	ReadEnvStr $bolHighContrast "PortableApps.comHighContrast"

	StrCpy $ITaskbarList3 0 ;Small hack to avoid warning when installers have no EULA and can't trigger error state
	SetSilent normal

	!ifdef DownloadURL
	StrCpy $R0 $EXEFILE "" -15
	${If} $R0 != "_online.paf.exe"
	${AndIf} $R0 != "line.paf[1].exe" ;Handle IE's renaming of files when run directly from a download
	${AndIf} $R0 != "line.paf[2].exe"
	${AndIf} $R0 != "line.paf[3].exe"
	${AndIf} $R0 != "line.paf[4].exe"
	${AndIf} $R0 != "line.paf[5].exe"
	${AndIf} $R0 != "line.paf[6].exe"
	${AndIf} $R0 != "line.paf[7].exe"
	${AndIf} $R0 != "line.paf[8].exe"
	${AndIf} $R0 != "line.paf[9].exe"
		MessageBox MB_OK|MB_ICONSTOP `PortableApps.com Installers that download files must end with "_online.paf.exe".  This is to ensure that users always know that an installer downloads files before it is run.  Please rename the file to end in _online.paf.exe before running.`
		Abort
	${EndIf}
	!endif

	InitPluginsDir

	!ifdef INSTALLERMULTILINGUAL
		ReadEnvStr $PAcLocaleID "PortableApps.comLocaleID"
		${Switch} $PAcLocaleID
			; Use the Case statements formed earlier.
			!include "${LangAutoDetectFile}"
			!delfile "${LangAutoDetectFile}"
			!undef LangAutoDetectFile
				StrCpy $LANGUAGE $PAcLocaleID
				${Break}
			${Default}
				${GetOptions} $CMDLINE "/DESTINATION=" $0
				${IfNot} ${Errors}
				${AndIf} ${FileExists} `$0\PortableApps.com\PortableAppsPlatform.exe`
					;Automated platform install but doesn't support the exact language
					
					;Language Fallbacks, if none, then English
					${If} $PAcLocaleID == 3082 ;SpanishInternational
					${AndIf} ${USES_SPANISH} == "true"
						StrCpy $LANGUAGE 1034 ;Spanish
					${Else}
						${If} $PAcLocaleID == 1034 ;Spanish
						${AndIf} ${USES_SPANISHINTERNATIONAL} == "true"
							StrCpy $LANGUAGE 3082 ;SpanishInternational
						${Else}
							${If} $PAcLocaleID == 1046 ;PortugueseBR
							${AndIf} ${USES_PORTUGUESE} == "true"
								StrCpy $LANGUAGE 2070 ;Portuguese
							${Else}
								${If} $PAcLocaleID == 2070 ;Portuguese
								${AndIf} ${USES_PORTUGUESEBR} == "true"
									StrCpy $LANGUAGE 1046 ;PortugueseBR
								${Else}
									StrCpy $LANGUAGE 1033 ;English as last fallback
								${EndIf}
							${EndIf}
						${EndIf}
					${EndIf}
				${Else}
					!insertmacro MUI_LANGDLL_DISPLAY
				${EndIf}
		${EndSwitch}
	!endif

	;=== Check for logging mode
	${GetOptions} $CMDLINE "/LOG=" $0
	
	${IfNot} ${Errors}
	${AndIf} $0 == "true"
		StrCpy $bolLogFile true
	${Else}
		ClearErrors
	${EndIf}
	
	;=== Check for a specified installation directory
	${GetOptions} $CMDLINE "/DESTINATION=" $0

	${IfNot} ${Errors}
		!ifdef COMMONFILESPLUGIN
			StrCpy $INSTDIR "$0CommonFiles\${APPID}"
		!else
			${GetOptions} $CMDLINE "/COPYNUMBER=" $1
			${IfNot} ${Errors}
				StrCpy $INSTDIR "$0${APPID}_Copy_$1"
			${Else}
				StrCpy $INSTDIR "$0${APPID}"
			${EndIf}
		!endif

		!ifdef LICENSEAGREEMENT
			!ifndef EULAVERSION
				StrCpy $INTERNALEULAVERSION "1"
			!else
				StrCpy $INTERNALEULAVERSION ${EULAVERSION}
			!endif
			${If} ${FileExists} "$INSTDIR\Data\PortableApps.comInstaller\license.ini"
				ReadINIStr $0 "$INSTDIR\Data\PortableApps.comInstaller\license.ini" "PortableApps.comInstaller" "EULAVersion"
				ClearErrors
				${If} $0 == $INTERNALEULAVERSION
					StrCpy $EULAVERSIONMATCH "true"
				${EndIf}
			${EndIf}
		!endif

		;=== Check for PortableApps.com Platform
		${GetParent} $INSTDIR $0
		!ifdef COMMONFILESPLUGIN
			${GetParent} $0 $0
		!endif

		;=== Check that it exists at the right location
		DetailPrint '$(checkforplatform)'

		${If} ${FileExists} `$0\PortableApps.com\PortableAppsPlatform.exe`
			;=== Check that it's the real deal
			MoreInfo::GetProductName `$0\PortableApps.com\PortableAppsPlatform.exe`
			Pop $1
			${If} $1 == "PortableApps.com Platform"
				MoreInfo::GetCompanyName `$0\PortableApps.com\PortableAppsPlatform.exe`
				Pop $1
				${If} $1 == "PortableApps.com"
					;=== Check that it's running
					FindProcDLL::FindProc "PortableAppsPlatform.exe"
					${If} $R0 == 1
						;=== Do a partially automated install
						StrCpy $AUTOMATEDINSTALL "true"

						ClearErrors
						${GetOptions} $CMDLINE "/AUTOCLOSE=" $R0
						${IfNot} ${Errors}
						${AndIf} $R0 == "true"
							StrCpy $AUTOCLOSE "true"
						${EndIf}

						ClearErrors
						${GetOptions} $CMDLINE "/HIDEINSTALLER=" $R0
						${IfNot} ${Errors}
						${AndIf} $R0 == "true"
							StrCpy $HIDEINSTALLER "true"
						${EndIf}

						ClearErrors
						${GetOptions} $CMDLINE "/MINIMIZEINSTALLER=" $R0
						${IfNot} ${Errors}
						${AndIf} $R0 == "true"
							StrCpy $MINIMIZEINSTALLER "true"
						${EndIf}

						ClearErrors
						${GetOptions} $CMDLINE "/SILENT=" $R0
						${IfNot} ${Errors}
						${AndIf} $R0 == "true"
							;Duplicate of the size calculation code, to be functionalized later
							SectionGetSize ${MAINSECTIONIDX} $1 ;=== Space Required for App
							
							!ifdef MAINSECTIONTITLE
								SectionGetFlags ${OPTIONALSECTIONIDX} $9
								IntOp $9 $9 & ${SF_SELECTED}
								${If} $9 >= ${SF_SELECTED}
									SectionGetSize ${OPTIONALSECTIONIDX} $2 ;=== Space Required for App
									IntOp $1 $1 + $2
								${EndIf}
							!endif
							${GetRoot} $INSTDIR $2
							;${DriveSpace} `$2\` "/D=F /S=M" $3 ;=== Space Free on Device
							${DriveFreeSpaceCustom} "$2\" $3
							
							;Convert app size to MB from KB
							IntOp $1 $1 / 1024
							
							${If} $1 == 0
							;If less than 1MB, round to 1MB
								StrCpy $1 1
							${EndIf}
							
							${If} $3 <= $1
								IntOp $1 $1 * 1024
								IntOp $3 $3 * 1024
								!ifndef PLUGININSTALLER ;=== If not a plugin installer, add the current install size to free space
									${If} ${FileExists} $INSTDIR
										${GetSize} `$INSTDIR` "/M=*.* /S=0K /G=0" $4 $5 $6 ;=== Current installation size
										IntOp $3 $3 + $4 ;=== Space Free + Current Root Install Size
										${GetSize} `$INSTDIR\App` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
										IntOp $3 $3 + $4 ;=== Space Free + Current App Install Size
										${GetSize} `$INSTDIR\Other` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
										IntOp $3 $3 + $4 ;=== Space Free + Current Other Install Size

										${If} `${ADDONSDIRECTORYPRESERVE}` != "NONE"
										${AndIf} ${FileExists} `$INSTDIR\${ADDONSDIRECTORYPRESERVE}`
												${GetSize} `$INSTDIR\${ADDONSDIRECTORYPRESERVE}` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Size of Data directory
												IntOp $3 $3 - $4 ;=== Remove the plugins directory from the free space calculation
										${EndIf}
									${EndIf}
								!else
									!ifdef COMMONFILESPLUGIN ;Duplicate code for now, to do above for CommonFiles as well
										${If} ${FileExists} $INSTDIR
											${GetSize} `$INSTDIR` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
											IntOp $3 $3 + $4 ;=== Space Free + Current Install Size
										${EndIf}
									!endif
								!endif
								${If} $3 <= $1
									MessageBox MB_OK|MB_ICONEXCLAMATION "$(notenoughspace)"
									Abort
								${EndIf}
							${EndIf}

							!ifdef LICENSEAGREEMENT
								${If} $EULAVERSIONMATCH == "true"
									SetSilent silent
								${EndIf}
							!else
								SetSilent silent
							!endif
						${EndIf}

						ClearErrors
						${GetOptions} $CMDLINE "/SILENTLANGUAGEMODE=" $R0
						${IfNot} ${Errors}
							${If} $R0 == "auto"
							${OrIf} $R0 == "never"
							${OrIf} $R0 == "always"
								StrCpy $SILENTLANGUAGEMODE $R0
							${Else}
								StrCpy $SILENTLANGUAGEMODE "auto"
							${EndIf}
						${Else}
							StrCpy $SILENTLANGUAGEMODE "auto"
						${EndIf}

					${EndIf}
				${EndIf}
			${EndIf}
		${EndIf}
	${Else}
		ClearErrors
		;=== Check legacy location
		${GetOptions} $CMDLINE "-o" $R0
		${IfNot} ${Errors}
			!ifdef COMMONFILESPLUGIN
				StrCpy $INSTDIR "$R0CommonFiles\${APPID}"
			!else
				StrCpy $INSTDIR "$R0${APPID}"
			!endif
		${Else}
			;=== No installation directory found
			ClearErrors
			${If} ${FileExists}	"$PROFILE\PortableApps\*.*"
				StrCpy $FOUNDPORTABLEAPPSPATH "$Profile\PortableApps"
			${Else}
				${GetDrives} "HDD+FDD" GetDrivesCallBack
			${EndIf}
			${If} $FOUNDPORTABLEAPPSPATH != ""
				!ifdef COMMONFILESPLUGIN
					StrCpy $INSTDIR "$FOUNDPORTABLEAPPSPATH\CommonFiles\${APPID}"
				!else
					StrCpy $INSTDIR "$FOUNDPORTABLEAPPSPATH\${APPID}"
				!endif
			${Else}
				;If within Program Files, TEMP or IE Cache, no default install path
				${WordFind} "$EXEDIR\" "$PROGRAMFILES\" "*" $R0
				${WordFind} "$EXEDIR\" "$PROGRAMFILES64\" "*" $R1
				${WordFind} "$EXEDIR\" "$INTERNET_CACHE\" "*" $R2
				${WordFind} "$EXEDIR\" "$TEMP\" "*" $R3
					
				${If} $R0 > 0
				${OrIf} $R1 > 0
				${OrIf} $R2 > 0
				${OrIf} $R3 > 0
					StrCpy $INSTDIR ""
				${Else}
					!ifdef COMMONFILESPLUGIN
						StrCpy $INSTDIR "$EXEDIR\CommonFiles\${APPID}"
					!else
						StrCpy $INSTDIR "$EXEDIR\${APPID}"
					!endif
				${EndIf}
			${EndIf}
		${EndIf}
	${EndIf}

	!ifdef MAINSECTIONTITLE
		!ifdef OPTIONALSECTIONPRESELECTEDIFNONENGLISHINSTALL
			;=== If it's not English, select the optional component (languages) by default
			${IfThen} $LANGUAGE != 1033 ${|} SectionSetFlags 1 ${OPTIONALSECTIONIDX} ${|}
		!endif
		${If} ${Silent}
			${If} "${OPTIONALSECTIONINSTALLEDWHENSILENT}" == "true"
				SectionSetFlags 1 ${OPTIONALSECTIONIDX}
			${ElseIf} "${OptionalSectionSelectedInstallType}" == "Multilingual"
				${If} $SILENTLANGUAGEMODE != "never"
					${If} $SILENTLANGUAGEMODE == "always"
						SectionSetFlags 1 ${OPTIONALSECTIONIDX}
					${Else}
						${IfThen} $LANGUAGE != 1033 ${|} SectionSetFlags 1 ${OPTIONALSECTIONIDX} ${|}
					${EndIf}
				${EndIf}
			${EndIf}
		${EndIf}

	!endif

	!ifdef COPYLOCALFILES
		StrCpy $CopyLocalFilesFrom ""

		${If} "${CopyFromRegPath}" != ""
			${registry::Read} "${CopyFromRegPath}" "${CopyFromRegKey}" $R0 $R1
			${If} $R0 != ""
				;Strip trailing slash if there
				StrCpy $1 $R0 "" -1
				${If} $1 == "\"
					StrCpy $R0 $R0 -1
				${EndIf}

				;Go up directories if needed
				${If} "${CopyFromRegRemoveDirectories}" != ""
					StrCpy $1 1
					${Do}
						${GetParent} $R0 $R0
						IntOp $1 $1 + 1
					${LoopUntil} $1 > "${CopyFromRegRemoveDirectories}"
				${EndIf}

				;Check for existence
				${If} ${FileExists} "$R0\*.*"
					StrCpy $CopyLocalFilesFrom $R0
				${EndIf}
			${EndIf}
		${EndIf}

		;Fallback to direct entry
		${If} $CopyLocalFilesFrom == ""
		${AndIf} "${CopyFromDirectory}" != ""
			StrCpy $CopyLocalFilesFrom "${CopyFromDirectory}"
			${WordReplace} $CopyLocalFilesFrom "%PROGRAMFILES%" $PROGRAMFILES + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%PROGRAMFILES32%" $PROGRAMFILES32 + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%PROGRAMFILES64%" $PROGRAMFILES64 + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%COMMONFILES%" $COMMONFILES + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%COMMONFILES32%" $COMMONFILES32 + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%COMMONFILES64%" $COMMONFILES64 + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%DESKTOP%" $DESKTOP + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%WINDIR%" $WINDIR + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%SYSDIR%" $SYSDIR + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%APPDATA%" $APPDATA + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%LOCALAPPDATA%" $LOCALAPPDATA + $CopyLocalFilesFrom
			${WordReplace} $CopyLocalFilesFrom "%TEMP%" $TEMP + $CopyLocalFilesFrom
		${EndIf}
		${If} ${FileExists} "$CopyLocalFilesFrom\*.*"
			SectionGetSize ${MAINSECTIONIDX} $0
			${GetSize} $CopyLocalFilesFrom "/M=*.* /S=0K /G=1" $1 $2 $3
			IntOp $0 $0 + $1
			SectionSetSize ${MAINSECTIONIDX} $0
		${EndIf}
	!endif
	!ifdef AdditionalInstallSize
		SectionGetSize ${MAINSECTIONIDX} $0
		IntOp $0 $0 + ${AdditionalInstallSize}
		SectionSetSize ${MAINSECTIONIDX} $0
	!endif

	${If} "${CHECKRUNNING}" != "NONE"
		;=== Check if app is running?
		RunningTryAgain:
		FindProcDLL::FindProc "${CHECKRUNNING}"
		${If} $R0 == 1
			MessageBox MB_OKCANCEL|MB_ICONINFORMATION $(runwarning) IDOK RunningTryAgain IDCANCEL RunningCancel
			
			RunningCancel:
				Abort
		${EndIf}
	${EndIf}
FunctionEnd

Function PreWelcome
	${IfThen} $AUTOMATEDINSTALL == "true" ${|} Abort ${|}
FunctionEnd

Function ShowWelcome
	SetCtlColors $mui.WelcomePage.Title 0x000000 0xFFFFFF
	SetCtlColors $mui.WelcomePage.Text 0x000000 0xFFFFFF
FunctionEnd

!ifdef LICENSEAGREEMENT
Function PreLicense
	${If} $AUTOMATEDINSTALL == "true"
	${AndIf} $EULAVERSIONMATCH == "true"
		Abort
	${EndIf}

	!ifndef EULAVERSION
		StrCpy $INTERNALEULAVERSION "1"
	!else
		StrCpy $INTERNALEULAVERSION "${EULAVERSION}"
	!endif
	${If} ${FileExists} "$INSTDIR\Data\PortableApps.comInstaller\license.ini"
		ReadINIStr $0 "$INSTDIR\Data\PortableApps.comInstaller\license.ini" "PortableApps.comInstaller" "EULAVersion"
		ClearErrors
		${If} $0 == $INTERNALEULAVERSION
		${AndIf} $AUTOMATEDINSTALL == "true"
			Abort
		${EndIf}
	${EndIf}
FunctionEnd
Function ShowLicense
	${PageHeaderHackForHighContrast}
	${If} $AUTOMATEDINSTALL == "true"
		${TBProgress} 10
		${TBProgress_State} Paused
	${EndIf}
FunctionEnd
Function LeaveLicense
	${If} $AUTOMATEDINSTALL == "true"
		${TBProgress_State} NoProgress
	${EndIf}
FunctionEnd
!endif

Function ShowInstFiles
	w7tbp::Start
	${PageHeaderHackForHighContrast}
FunctionEnd

!ifdef MAINSECTIONTITLE
	Function PreComponents
		${If} $AUTOCLOSE != "true"
		${OrIfNot} ${FileExists} "$INSTDIR\App\AppInfo\appinfo.ini"
			Return
		${EndIf}

		ReadINIStr $0 "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "InstallType"
		ClearErrors
		${If} $0 == "${OPTIONALSECTIONSELECTEDINSTALLTYPE}"
			SectionSetFlags 1 ${OPTIONALSECTIONIDX}
			Abort
		${EndIf}

		;=== Check not selected
		${If} $0 == "${OPTIONALSECTIONNOTSELECTEDINSTALLTYPE}"
			SectionSetFlags 0 ${OPTIONALSECTIONIDX}
			Abort
		${EndIf}
	FunctionEnd
	
	Function ShowComponents
		${PageHeaderHackForHighContrast}
	FunctionEnd
!endif

Function PreDirectory
	${IfThen} $AUTOMATEDINSTALL != "true" ${|} Return ${|}

	SectionGetSize ${MAINSECTIONIDX} $1 ;=== Space Required for App
	!ifdef MAINSECTIONTITLE
		SectionGetFlags ${OPTIONALSECTIONIDX} $9
		IntOp $9 $9 & ${SF_SELECTED}
		${If} $9 >= ${SF_SELECTED}
			SectionGetSize ${OPTIONALSECTIONIDX} $2 ;=== Space Required for App
			IntOp $1 $1 + $2
		${EndIf}
	!endif
	${GetRoot} $INSTDIR $2
	;${DriveSpace} `$2\` "/D=F /S=M" $3 ;=== Space Free on Device
	${DriveFreeSpaceCustom} "$2\" $3
							
	IntOp $1 $1 / 1024

	${If} $3 <= $1
		IntOp $1 $1 * 1024
		IntOp $3 $3 * 1024

		!ifndef PLUGININSTALLER ;=== If not a plugin installer, add the current install size to free space
			${If} ${FileExists} $INSTDIR
				${GetSize} $INSTDIR "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
				IntOp $3 $3 + $4 ;=== Space Free + Current Install Size

				${If} ${FileExists} `$INSTDIR\Data`
					${GetSize} `$INSTDIR\Data` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Size of Data directory
					IntOp $3 $3 - $4 ;=== Remove the data directory from the free space calculation
				${EndIf}

				${If} `${ADDONSDIRECTORYPRESERVE}` != "NONE"
				${AndIf} ${FileExists} `$INSTDIR\${ADDONSDIRECTORYPRESERVE}`
						${GetSize} `$INSTDIR\${ADDONSDIRECTORYPRESERVE}` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Size of Data directory
						IntOp $3 $3 - $4 ;=== Remove the plugins directory from the free space calculation
				${EndIf}
			${EndIf}
		!else
			!ifdef COMMONFILESPLUGIN ;Duplicate code for now, to do above for CommonFiles as well
				${If} ${FileExists} $INSTDIR
					${GetSize} `$INSTDIR` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
					IntOp $3 $3 + $4 ;=== Space Free + Current Install Size
				${EndIf}
			!endif
		!endif

		${If} $3 <= $1
			MessageBox MB_OK|MB_ICONEXCLAMATION "$(notenoughspace)"
			Return
		${EndIf}
	${EndIf}

	;=== Check if app is running?
	${IfThen} "${CHECKRUNNING}" == "NONE" ${|} Abort ${|}
	FindProcDLL::FindProc "${CHECKRUNNING}"
	${IfThen} $R0 != "1" ${|} Abort ${|}
	MessageBox MB_OK|MB_ICONINFORMATION $(runwarning)
FunctionEnd

Function ShowDirectory
	${PageHeaderHackForHighContrast}
FunctionEnd

Function LeaveDirectory
	;=== Prevent destination string changes without user verification
	${GetTime} "" "LS" $0 $1 $2 $3 $4 $5 $6
	${If} $strTimeStore == "$0 $1 $2 $3 $4 $5 $6"
		${GetParent} $INSTDIR $0
		${GetParent} $0 $0
		StrCpy $1 $0 3 -6
		StrCpy $2 $0 1 -2
		${If} $2 == "e"
		${AndIf} $1 == "ber"
			Abort
		${EndIf}
	${EndIf}

	GetInstDirError $0

	;=== Does it already exist? (upgrade)
	${If} ${FileExists} $INSTDIR
	${AndIf} "${CHECKRUNNING}" != "NONE"
		;=== Check if app is running?
		FindProcDLL::FindProc "${CHECKRUNNING}"
		${If} $R0 == 1
			MessageBox MB_OK|MB_ICONINFORMATION $(runwarning)
			Abort
		${EndIf}
	${EndIf}
	
	;=== Check if common files to existing directory with contents
	!ifdef COMMONFILESPLUGIN
		${If} ${FileExists} "$INSTDIR\*.*"
			${GetFileName} "$INSTDIR" $0
			${If} $0 != ${APPID}
			${AndIfNot} ${FileExists} "$INSTDIR\App\AppInfo\plugininstaller.ini"
				;=== Installing to an existing directory with contents that doesn't match the AppID
				MessageBox MB_YESNO|MB_ICONQUESTION $(existingfileswarning) /SD IDYES IDYES InstallToPathWithExistingFiles
					Abort
				InstallToPathWithExistingFiles:
			${EndIf}
		${EndIf}
	!endif


	; 0 is valid, enough space, all fine
	${Select} $0
		${Case} 1
			MessageBox MB_OK|MB_ICONINFORMATION $(invaliddirectory)
			Abort

		${Case} 2
			${IfNot} ${FileExists} $INSTDIR ;=== Is upgrade
				MessageBox MB_OK|MB_ICONEXCLAMATION $(notenoughspace)
				Abort
			${EndIf}

			SectionGetSize ${MAINSECTIONIDX} $1 ;=== Space Required for App
			!ifdef MAINSECTIONTITLE
					SectionGetFlags ${OPTIONALSECTIONIDX} $9
					IntOp $9 $9 & ${SF_SELECTED}
					${If} $9 >= ${SF_SELECTED}
						SectionGetSize ${OPTIONALSECTIONIDX} $2 ;=== Space Required for App
						IntOp $1 $1 + $2
					${EndIf}
			!endif
			${GetRoot} $INSTDIR $2
			;${DriveSpace} `$2\` "/D=F /S=K" $3 ;=== Space Free on Device
			${DriveFreeSpaceCustom} "$2\" $3

			
			!ifndef PLUGININSTALLER ;=== If not a plugin installer, add the current install size to free space
				${GetSize} `$INSTDIR` "/M=*.* /S=0K /G=0" $4 $5 $6 ;=== Current installation size
				IntOp $3 $3 + $4 ;=== Space Free + Current Root Install Size
				${GetSize} `$INSTDIR\App` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
				IntOp $3 $3 + $4 ;=== Space Free + Current App Install Size
				${GetSize} `$INSTDIR\Other` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
				IntOp $3 $3 + $4 ;=== Space Free + Current Other Install Size

				${If} `${ADDONSDIRECTORYPRESERVE}` != "NONE"
				${AndIf} ${FileExists} `$INSTDIR\${ADDONSDIRECTORYPRESERVE}`
						${GetSize} `$INSTDIR\${ADDONSDIRECTORYPRESERVE}` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Size of Data directory
						IntOp $3 $3 - $4 ;=== Remove the plugins directory from the free space calculation
				${EndIf}
			!else
				!ifdef COMMONFILESPLUGIN ;Duplicate code for now, to do above for CommonFiles as well
					${GetSize} `$INSTDIR` "/M=*.* /S=0K /G=1" $4 $5 $6 ;=== Current installation size
					IntOp $3 $3 + $4 ;=== Space Free + Current Install Size
				!endif
			!endif

			${If} $3 <= $1
				MessageBox MB_OK|MB_ICONEXCLAMATION "$(notenoughspace)"
				Abort
			${EndIf}
	${EndSelect}
	
	;Check for Program Files
	ReadEnvStr $0 IPromiseNotToComplainWhenPortableAppsDontWorkRightInProgramFiles
	${If} $0 != "I understand that this may not work and that I can not ask for help with any of my apps when operating in this fashion."
		${WordFind} "$INSTDIR\" "$PROGRAMFILES\" "*" $R0
		${If} $R0 > 0
			MessageBox MB_OK|MB_ICONINFORMATION "$(invaliddirectory) [$PROGRAMFILES or sub-directories]"
			Abort
		${EndIf}
		${WordFind} "$INSTDIR\" "$PROGRAMFILES64\" "*" $R0
		${If} $R0 > 0
			MessageBox MB_OK|MB_ICONINFORMATION "$(invaliddirectory) [$PROGRAMFILES64 or sub-directories]"
			Abort
		${EndIf}
	${EndIf}
FunctionEnd

Function .onVerifyInstDir
	${If} $INSTDIR != ""
	${AndIf} $strLastDirectory != ""
		StrLen $0 $INSTDIR
		StrLen $1 $strLastDirectory
		IntOp $2 $1 + 2
		IntOp $3 $1 - 2
		${If} $0 > $2
		${OrIf} $0 < $3
			${GetTime} "" "LS" $0 $1 $2 $3 $4 $5 $6
			StrCpy $strTimeStore "$0 $1 $2 $3 $4 $5 $6"
		${EndIf}	
	${EndIf}
	StrCpy $strLastDirectory $INSTDIR
FunctionEnd

Function PreFinish
	${IfThen} $AUTOCLOSE == "true" ${|} Abort ${|}
FunctionEnd

;Annoying hack to fix MUI2's broken cancel button
!ifndef SC_CLOSE
!define SC_CLOSE 0xF060
!endif

Function ShowFinish
	;Annoying hack to fix MUI2's broken cancel button Pt2
	EnableWindow $mui.Button.Cancel 1
	System::Call 'USER32::GetSystemMenu(i $hwndparent,i0)i.s'
	System::Call 'USER32::EnableMenuItem(is,i${SC_CLOSE},i0)'

	SetCtlColors $mui.FinishPage.Title 0x000000 0xFFFFFF
	SetCtlColors $mui.FinishPage.Text 0x000000 0xFFFFFF
	
	!ifndef PLUGINNAME
		;These should work but do not
		SetCtlColors $mui.Finishpage.Run 0x000000 0xFFFFFF
		${If} $bolHighContrast == "true"
			;Annoying hack to ensure checkboxes are visible when high contrast is on
			SetCtlColors $mui.Finishpage.Run 0x000000 0x888888
		${EndIf}
	!endif
FunctionEnd

Function GetDrivesCallBack
	;=== Skip usual floppy letters
	${If} $8 == "FDD"
		${If} $9 == "A:\"
		${OrIf} $9 == "B:\"
			Push $0
			Return
		${EndIf}
	${EndIf}

	${If} ${FileExists} $9PortableApps
		StrCpy $FOUNDPORTABLEAPPSPATH $9PortableApps
	${EndIf}

	Push $0
FunctionEnd

!ifdef MAINSECTIONTITLE
	Section "${MAINSECTIONTITLE}"
!else
	Section "App Portable (required)"
!endif

	${If} $MINIMIZEINSTALLER == "true"
		ShowWindow $HWNDPARENT ${SW_MINIMIZE}
	${EndIf}
	${If} $HIDEINSTALLER == "true"
		ShowWindow $HWNDPARENT ${SW_HIDE}
	${EndIf}

	${If} ${FileExists} "$INSTDIR\*.*"
		StrCpy $bolAppUpgrade true
	${EndIf}

	${If} $(installingstatus) != ""
		StrCpy $InstallingStatusString "$(installingstatus)"
	${Else}
		StrCpy $InstallingStatusString "$(MUI_TEXT_INSTALLING_TITLE)"
	${EndIf}

	SectionIn RO
	SetOutPath $INSTDIR

	${If} $bolAppUpgrade == true
		${If} $(prepareupgrade) == ""
			DetailPrint $InstallingStatusString
		${Else}
			DetailPrint $(prepareupgrade)
		${EndIf}
	${Else}
		DetailPrint $InstallingStatusString
	${EndIf}
	SetDetailsPrint ListOnly
	
	;=== Download Files
!ifdef DownloadURL
	${If} ${FileExists} `$EXEDIR\${DownloadFileName}`
		!ifdef DownloadMD5
			md5dll::GetMD5File "$EXEDIR\${DownloadFileName}"
			Pop $R0
			${If} $R0 == ${DownloadMD5}
				StrCpy $DOWNLOADALREADYEXISTED "true"
				StrCpy $DOWNLOADRESULT "OK"
			${EndIf}
		!else
			StrCpy $DOWNLOADALREADYEXISTED "true"
			StrCpy $DOWNLOADRESULT "OK"
		!endif
	${EndIf}
	
	${If} $DOWNLOADALREADYEXISTED == "true"
		StrCpy $DOWNLOADEDFILE "$EXEDIR\${DownloadFileName}"
	${Else}
		StrCpy $DownloadURLActual ${DownloadURL}
		DownloadTheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded`
		SetDetailsPrint both
		${If} $(downloading) != ""
			DetailPrint $(downloading)
		${Else}
			DetailPrint "Downloading ${DownloadName}..."
		${EndIf}

		
		!ifdef DownloadKnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded\KnockURL.html"
			${If} $(downloading) != ""
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $(downloading) $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${DownloadKnockURL}" "$PLUGINSDIR\Downloaded\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${DownloadKnockURL}" "$PLUGINSDIR\Downloaded\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded\${DownloadName}"
		Delete "$PLUGINSDIR\Downloaded\${DownloadFilename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $(downloading) $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$DownloadURLActual" "$PLUGINSDIR\Downloaded\${DownloadName}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$DownloadURLActual" "$PLUGINSDIR\Downloaded\${DownloadName}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $DOWNLOADRESULT
		${If} $DOWNLOADRESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded\${DownloadName}" "$PLUGINSDIR\Downloaded\${DownloadFilename}"
			StrCpy $DOWNLOADEDFILE "$PLUGINSDIR\Downloaded\${DownloadFilename}"
			!ifdef DownloadMD5
				md5dll::GetMD5File "$DOWNLOADEDFILE"
				Pop $R0
				${If} $R0 != ${DownloadMD5}
					${If} $SECONDDOWNLOADATTEMPT != true
						StrCpy $SECONDDOWNLOADATTEMPT true
						Goto DownloadTheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${DownloadFileName}"
					Delete "$PLUGINSDIR\Downloaded\${DownloadFilename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						MessageBox MB_OK|MB_ICONEXCLAMATION $(downloadfilemismatch)
						DetailPrint $(downloadfilemismatch)
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${DownloadName} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${DownloadName} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${DownloadFileName}"
			Delete "$PLUGINSDIR\Downloaded\${DownloadFilename}"
			StrCpy $0 $DownloadURLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$DownloadURLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$DownloadURLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $DownloadURLActual
				Goto DownloadTheFile
			${EndIf}
			
			${If} $SECONDDOWNLOADATTEMPT != true
			${AndIf} $DOWNLOADRESULT != "Cancelled"
				StrCpy $SECONDDOWNLOADATTEMPT true
				Goto DownloadTheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				MessageBox MB_OK|MB_ICONEXCLAMATION $(downloadfailed)
				DetailPrint $(downloadfailed)
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${DownloadName}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${DownloadName}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download2URL
	${If} ${FileExists} `$EXEDIR\${Download2FileName}`
		!ifdef Download2MD5
			md5dll::GetMD5File "$EXEDIR\${Download2FileName}"
			Pop $R0
			${If} $R0 == ${Download2MD5}
				StrCpy $DOWNLOAD2ALREADYEXISTED "true"
				StrCpy $DOWNLOAD2RESULT "OK"
			${EndIf}
		!else
			StrCpy $DOWNLOAD2ALREADYEXISTED "true"
			StrCpy $DOWNLOAD2RESULT "OK"
		!endif
	${EndIf}
	
	${If} $DOWNLOAD2ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED2FILE "$EXEDIR\${Download2FileName}"
	${Else}
		StrCpy $Download2URLActual ${Download2URL}
		Download2TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-2`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download2Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download2Name}..."
		${EndIf}

		
		!ifdef Download2KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-2\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download2Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download2KnockURL}" "$PLUGINSDIR\Downloaded-2\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download2KnockURL}" "$PLUGINSDIR\Downloaded-2\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-2\${Download2Name}"
		Delete "$PLUGINSDIR\Downloaded-2\${Download2Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download2Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download2URLActual" "$PLUGINSDIR\Downloaded-2\${Download2Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download2URLActual" "$PLUGINSDIR\Downloaded-2\${Download2Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $DOWNLOAD2RESULT
		${If} $DOWNLOAD2RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-2\${Download2Name}" "$PLUGINSDIR\Downloaded-2\${Download2Filename}"
			StrCpy $DOWNLOADED2FILE "$PLUGINSDIR\Downloaded-2\${Download2Filename}"
			!ifdef Download2MD5
				md5dll::GetMD5File "$DOWNLOADED2FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download2MD5}
					${If} $SECONDDOWNLOAD2ATTEMPT != true
						StrCpy $SECONDDOWNLOAD2ATTEMPT true
						Goto Download2TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download2FileName}"
					Delete "$PLUGINSDIR\Downloaded-2\${Download2Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download2Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download2Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download2Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download2FileName}"
			Delete "$PLUGINSDIR\Downloaded-2\${Download2Filename}"
			StrCpy $0 $Download2URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download2URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download2URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download2URLActual
				Goto Download2TheFile
			${EndIf}
			
			${If} $SECONDDOWNLOAD2ATTEMPT != true
			${AndIf} $DOWNLOAD2RESULT != "Cancelled"
				StrCpy $SECONDDOWNLOAD2ATTEMPT true
				Goto Download2TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download2Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download2Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download2Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOAD2RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download3URL
	${If} ${FileExists} `$EXEDIR\${Download3FileName}`
		!ifdef Download3MD5
			md5dll::GetMD5File "$EXEDIR\${Download3FileName}"
			Pop $R0
			${If} $R0 == ${Download3MD5}
				StrCpy $Download3ALREADYEXISTED "true"
				StrCpy $Download3RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download3ALREADYEXISTED "true"
			StrCpy $Download3RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download3ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED3FILE "$EXEDIR\${Download3FileName}"
	${Else}
		StrCpy $Download3URLActual ${Download3URL}
		Download3TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-3`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download3Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download3Name}..."
		${EndIf}

		
		!ifdef Download3KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-3\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download3Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download3KnockURL}" "$PLUGINSDIR\Downloaded-3\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download3KnockURL}" "$PLUGINSDIR\Downloaded-3\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-3\${Download3Name}"
		Delete "$PLUGINSDIR\Downloaded-3\${Download3Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download3Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download3URLActual" "$PLUGINSDIR\Downloaded-3\${Download3Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download3URLActual" "$PLUGINSDIR\Downloaded-3\${Download3Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download3RESULT
		${If} $Download3RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-3\${Download3Name}" "$PLUGINSDIR\Downloaded-3\${Download3Filename}"
			StrCpy $DOWNLOADED3FILE "$PLUGINSDIR\Downloaded-3\${Download3Filename}"
			!ifdef Download3MD5
				md5dll::GetMD5File "$DOWNLOADED3FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download3MD5}
					${If} $SECONDDownload3ATTEMPT != true
						StrCpy $SECONDDownload3ATTEMPT true
						Goto Download3TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download3FileName}"
					Delete "$PLUGINSDIR\Downloaded-3\${Download3Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download3Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download3Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download3Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download3FileName}"
			Delete "$PLUGINSDIR\Downloaded-3\${Download3Filename}"
			StrCpy $0 $Download3URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download3URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download3URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download3URLActual
				Goto Download3TheFile
			${EndIf}
			
			${If} $SECONDDownload3ATTEMPT != true
			${AndIf} $Download3RESULT != "Cancelled"
				StrCpy $SECONDDownload3ATTEMPT true
				Goto Download3TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download3Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download3Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download3Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download3RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download4URL
	${If} ${FileExists} `$EXEDIR\${Download4FileName}`
		!ifdef Download4MD5
			md5dll::GetMD5File "$EXEDIR\${Download4FileName}"
			Pop $R0
			${If} $R0 == ${Download4MD5}
				StrCpy $Download4ALREADYEXISTED "true"
				StrCpy $Download4RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download4ALREADYEXISTED "true"
			StrCpy $Download4RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download4ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED4FILE "$EXEDIR\${Download4FileName}"
	${Else}
		StrCpy $Download4URLActual ${Download4URL}
		Download4TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-4`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download4Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download4Name}..."
		${EndIf}

		
		!ifdef Download4KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-4\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download4Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download4KnockURL}" "$PLUGINSDIR\Downloaded-4\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download4KnockURL}" "$PLUGINSDIR\Downloaded-4\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-4\${Download4Name}"
		Delete "$PLUGINSDIR\Downloaded-4\${Download4Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download4Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download4URLActual" "$PLUGINSDIR\Downloaded-4\${Download4Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download4URLActual" "$PLUGINSDIR\Downloaded-4\${Download4Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download4RESULT
		${If} $Download4RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-4\${Download4Name}" "$PLUGINSDIR\Downloaded-4\${Download4Filename}"
			StrCpy $DOWNLOADED4FILE "$PLUGINSDIR\Downloaded-4\${Download4Filename}"
			!ifdef Download4MD5
				md5dll::GetMD5File "$DOWNLOADED4FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download4MD5}
					${If} $SECONDDownload4ATTEMPT != true
						StrCpy $SECONDDownload4ATTEMPT true
						Goto Download4TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download4FileName}"
					Delete "$PLUGINSDIR\Downloaded-4\${Download4Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download4Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download4Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download4Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download4FileName}"
			Delete "$PLUGINSDIR\Downloaded-4\${Download4Filename}"
			StrCpy $0 $Download4URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download4URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download4URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download4URLActual
				Goto Download4TheFile
			${EndIf}
			
			${If} $SECONDDownload4ATTEMPT != true
			${AndIf} $Download4RESULT != "Cancelled"
				StrCpy $SECONDDownload4ATTEMPT true
				Goto Download4TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download4Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download4Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download4Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download4RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download5URL
	${If} ${FileExists} `$EXEDIR\${Download5FileName}`
		!ifdef Download5MD5
			md5dll::GetMD5File "$EXEDIR\${Download5FileName}"
			Pop $R0
			${If} $R0 == ${Download5MD5}
				StrCpy $Download5ALREADYEXISTED "true"
				StrCpy $Download5RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download5ALREADYEXISTED "true"
			StrCpy $Download5RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download5ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED5FILE "$EXEDIR\${Download5FileName}"
	${Else}
		StrCpy $Download5URLActual ${Download5URL}
		Download5TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-5`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download5Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download5Name}..."
		${EndIf}

		
		!ifdef Download5KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-5\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download5Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download5KnockURL}" "$PLUGINSDIR\Downloaded-5\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download5KnockURL}" "$PLUGINSDIR\Downloaded-5\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-5\${Download5Name}"
		Delete "$PLUGINSDIR\Downloaded-5\${Download5Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download5Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download5URLActual" "$PLUGINSDIR\Downloaded-5\${Download5Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download5URLActual" "$PLUGINSDIR\Downloaded-5\${Download5Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download5RESULT
		${If} $Download5RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-5\${Download5Name}" "$PLUGINSDIR\Downloaded-5\${Download5Filename}"
			StrCpy $DOWNLOADED5FILE "$PLUGINSDIR\Downloaded-5\${Download5Filename}"
			!ifdef Download5MD5
				md5dll::GetMD5File "$DOWNLOADED5FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download5MD5}
					${If} $SECONDDownload5ATTEMPT != true
						StrCpy $SECONDDownload5ATTEMPT true
						Goto Download5TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download5FileName}"
					Delete "$PLUGINSDIR\Downloaded-5\${Download5Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download5Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download5Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download5Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download5FileName}"
			Delete "$PLUGINSDIR\Downloaded-5\${Download5Filename}"
			StrCpy $0 $Download5URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download5URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download5URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download5URLActual
				Goto Download5TheFile
			${EndIf}
			
			${If} $SECONDDownload5ATTEMPT != true
			${AndIf} $Download5RESULT != "Cancelled"
				StrCpy $SECONDDownload5ATTEMPT true
				Goto Download5TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download5Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download5Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download5Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download5RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download6URL
	${If} ${FileExists} `$EXEDIR\${Download6FileName}`
		!ifdef Download6MD5
			md5dll::GetMD5File "$EXEDIR\${Download6FileName}"
			Pop $R0
			${If} $R0 == ${Download6MD5}
				StrCpy $Download6ALREADYEXISTED "true"
				StrCpy $Download6RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download6ALREADYEXISTED "true"
			StrCpy $Download6RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download6ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED6FILE "$EXEDIR\${Download6FileName}"
	${Else}
		StrCpy $Download6URLActual ${Download6URL}
		Download6TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-6`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download6Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download6Name}..."
		${EndIf}

		
		!ifdef Download6KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-6\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download6Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download6KnockURL}" "$PLUGINSDIR\Downloaded-6\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download6KnockURL}" "$PLUGINSDIR\Downloaded-6\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-6\${Download6Name}"
		Delete "$PLUGINSDIR\Downloaded-6\${Download6Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download6Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download6URLActual" "$PLUGINSDIR\Downloaded-6\${Download6Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download6URLActual" "$PLUGINSDIR\Downloaded-6\${Download6Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download6RESULT
		${If} $Download6RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-6\${Download6Name}" "$PLUGINSDIR\Downloaded-6\${Download6Filename}"
			StrCpy $DOWNLOADED6FILE "$PLUGINSDIR\Downloaded-6\${Download6Filename}"
			!ifdef Download6MD5
				md5dll::GetMD5File "$DOWNLOADED6FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download6MD5}
					${If} $SECONDDownload6ATTEMPT != true
						StrCpy $SECONDDownload6ATTEMPT true
						Goto Download6TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download6FileName}"
					Delete "$PLUGINSDIR\Downloaded-6\${Download6Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download6Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download6Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download6Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download6FileName}"
			Delete "$PLUGINSDIR\Downloaded-6\${Download6Filename}"
			StrCpy $0 $Download6URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download6URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download6URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download6URLActual
				Goto Download6TheFile
			${EndIf}
			
			${If} $SECONDDownload6ATTEMPT != true
			${AndIf} $Download6RESULT != "Cancelled"
				StrCpy $SECONDDownload6ATTEMPT true
				Goto Download6TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download6Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download6Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download6Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download6RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download7URL
	${If} ${FileExists} `$EXEDIR\${Download7FileName}`
		!ifdef Download7MD5
			md5dll::GetMD5File "$EXEDIR\${Download7FileName}"
			Pop $R0
			${If} $R0 == ${Download7MD5}
				StrCpy $Download7ALREADYEXISTED "true"
				StrCpy $Download7RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download7ALREADYEXISTED "true"
			StrCpy $Download7RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download7ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED7FILE "$EXEDIR\${Download7FileName}"
	${Else}
		StrCpy $Download7URLActual ${Download7URL}
		Download7TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-7`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download7Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download7Name}..."
		${EndIf}

		
		!ifdef Download7KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-7\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download7Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download7KnockURL}" "$PLUGINSDIR\Downloaded-7\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download7KnockURL}" "$PLUGINSDIR\Downloaded-7\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-7\${Download7Name}"
		Delete "$PLUGINSDIR\Downloaded-7\${Download7Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download7Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download7URLActual" "$PLUGINSDIR\Downloaded-7\${Download7Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download7URLActual" "$PLUGINSDIR\Downloaded-7\${Download7Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download7RESULT
		${If} $Download7RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-7\${Download7Name}" "$PLUGINSDIR\Downloaded-7\${Download7Filename}"
			StrCpy $DOWNLOADED7FILE "$PLUGINSDIR\Downloaded-7\${Download7Filename}"
			!ifdef Download7MD5
				md5dll::GetMD5File "$DOWNLOADED7FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download7MD5}
					${If} $SECONDDownload7ATTEMPT != true
						StrCpy $SECONDDownload7ATTEMPT true
						Goto Download7TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download7FileName}"
					Delete "$PLUGINSDIR\Downloaded-7\${Download7Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download7Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download7Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download7Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download7FileName}"
			Delete "$PLUGINSDIR\Downloaded-7\${Download7Filename}"
			StrCpy $0 $Download7URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download7URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download7URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download7URLActual
				Goto Download7TheFile
			${EndIf}
			
			${If} $SECONDDownload7ATTEMPT != true
			${AndIf} $Download7RESULT != "Cancelled"
				StrCpy $SECONDDownload7ATTEMPT true
				Goto Download7TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download7Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download7Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download7Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download7RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download8URL
	${If} ${FileExists} `$EXEDIR\${Download8FileName}`
		!ifdef Download8MD5
			md5dll::GetMD5File "$EXEDIR\${Download8FileName}"
			Pop $R0
			${If} $R0 == ${Download8MD5}
				StrCpy $Download8ALREADYEXISTED "true"
				StrCpy $Download8RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download8ALREADYEXISTED "true"
			StrCpy $Download8RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download8ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED8FILE "$EXEDIR\${Download8FileName}"
	${Else}
		StrCpy $Download8URLActual ${Download8URL}
		Download8TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-8`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download8Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download8Name}..."
		${EndIf}

		
		!ifdef Download8KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-8\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download8Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download8KnockURL}" "$PLUGINSDIR\Downloaded-8\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download8KnockURL}" "$PLUGINSDIR\Downloaded-8\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-8\${Download8Name}"
		Delete "$PLUGINSDIR\Downloaded-8\${Download8Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download8Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download8URLActual" "$PLUGINSDIR\Downloaded-8\${Download8Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download8URLActual" "$PLUGINSDIR\Downloaded-8\${Download8Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download8RESULT
		${If} $Download8RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-8\${Download8Name}" "$PLUGINSDIR\Downloaded-8\${Download8Filename}"
			StrCpy $DOWNLOADED8FILE "$PLUGINSDIR\Downloaded-8\${Download8Filename}"
			!ifdef Download8MD5
				md5dll::GetMD5File "$DOWNLOADED8FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download8MD5}
					${If} $SECONDDownload8ATTEMPT != true
						StrCpy $SECONDDownload8ATTEMPT true
						Goto Download8TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download8FileName}"
					Delete "$PLUGINSDIR\Downloaded-8\${Download8Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download8Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download8Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download8Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download8FileName}"
			Delete "$PLUGINSDIR\Downloaded-8\${Download8Filename}"
			StrCpy $0 $Download8URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download8URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download8URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download8URLActual
				Goto Download8TheFile
			${EndIf}
			
			${If} $SECONDDownload8ATTEMPT != true
			${AndIf} $Download8RESULT != "Cancelled"
				StrCpy $SECONDDownload8ATTEMPT true
				Goto Download8TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download8Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download8Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download8Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download8RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download9URL
	${If} ${FileExists} `$EXEDIR\${Download9FileName}`
		!ifdef Download9MD5
			md5dll::GetMD5File "$EXEDIR\${Download9FileName}"
			Pop $R0
			${If} $R0 == ${Download9MD5}
				StrCpy $Download9ALREADYEXISTED "true"
				StrCpy $Download9RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download9ALREADYEXISTED "true"
			StrCpy $Download9RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download9ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED9FILE "$EXEDIR\${Download9FileName}"
	${Else}
		StrCpy $Download9URLActual ${Download9URL}
		Download9TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-9`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download9Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download9Name}..."
		${EndIf}

		
		!ifdef Download9KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-9\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download9Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download9KnockURL}" "$PLUGINSDIR\Downloaded-9\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download9KnockURL}" "$PLUGINSDIR\Downloaded-9\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-9\${Download9Name}"
		Delete "$PLUGINSDIR\Downloaded-9\${Download9Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download9Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download9URLActual" "$PLUGINSDIR\Downloaded-9\${Download9Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download9URLActual" "$PLUGINSDIR\Downloaded-9\${Download9Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download9RESULT
		${If} $Download9RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-9\${Download9Name}" "$PLUGINSDIR\Downloaded-9\${Download9Filename}"
			StrCpy $DOWNLOADED9FILE "$PLUGINSDIR\Downloaded-9\${Download9Filename}"
			!ifdef Download9MD5
				md5dll::GetMD5File "$DOWNLOADED9FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download9MD5}
					${If} $SECONDDownload9ATTEMPT != true
						StrCpy $SECONDDownload9ATTEMPT true
						Goto Download9TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download9FileName}"
					Delete "$PLUGINSDIR\Downloaded-9\${Download9Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download9Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download9Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download9Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download9FileName}"
			Delete "$PLUGINSDIR\Downloaded-9\${Download9Filename}"
			StrCpy $0 $Download9URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download9URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download9URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download9URLActual
				Goto Download9TheFile
			${EndIf}
			
			${If} $SECONDDownload9ATTEMPT != true
			${AndIf} $Download9RESULT != "Cancelled"
				StrCpy $SECONDDownload9ATTEMPT true
				Goto Download9TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download9Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download9Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download9Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download9RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef Download10URL
	${If} ${FileExists} `$EXEDIR\${Download10FileName}`
		!ifdef Download10MD5
			md5dll::GetMD5File "$EXEDIR\${Download10FileName}"
			Pop $R0
			${If} $R0 == ${Download10MD5}
				StrCpy $Download10ALREADYEXISTED "true"
				StrCpy $Download10RESULT "OK"
			${EndIf}
		!else
			StrCpy $Download10ALREADYEXISTED "true"
			StrCpy $Download10RESULT "OK"
		!endif
	${EndIf}
	
	${If} $Download10ALREADYEXISTED == "true"
		StrCpy $DOWNLOADED10FILE "$EXEDIR\${Download10FileName}"
	${Else}
		StrCpy $Download10URLActual ${Download10URL}
		Download10TheFile:
		CreateDirectory `$PLUGINSDIR\Downloaded-10`
		SetDetailsPrint both
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download10Name}` "+" $0
			DetailPrint $0
		${Else}
			DetailPrint "Downloading ${Download10Name}..."
		${EndIf}

		
		!ifdef Download10KnockURL
			ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
			${EndIf}
		
			SetDetailsPrint none
			Delete "$PLUGINSDIR\Downloaded-10\KnockURL.html"
			${If} $(downloading) != ""
				${WordReplace} `$(downloading)` `${DownloadName}` `${Download10Name}` "+" $0
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "${Download10KnockURL}" "$PLUGINSDIR\Downloaded-10\KnockURL.html" /END
			${Else}
				inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "${Download10KnockURL}" "$PLUGINSDIR\Downloaded-10\KnockURL.html" /END
			${EndIf}
			SetDetailsPrint ListOnly
			Pop $0
			
			${If} $intWarnOnZoneCrossing != 0
				WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
			${EndIf}
		!endif
		
		SetDetailsPrint none
		Delete "$PLUGINSDIR\Downloaded-10\${Download10Name}"
		Delete "$PLUGINSDIR\Downloaded-10\${Download10Filename}"	
		
		ReadRegDWORD $intWarnOnZoneCrossing HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing"
	
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" 0x00000000
		${EndIf}
		
		${If} $(downloading) != ""
			${WordReplace} `$(downloading)` `${DownloadName}` `${Download10Name}` "+" $0
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE $0 $(downloadconnecting) $(downloadsecond) $(downloadminute) $(downloadhour) $(downloadplural) "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s $(downloadremaining))" "$Download10URLActual" "$PLUGINSDIR\Downloaded-10\${Download10Name}" /END
		${Else}
			inetc::get /CONNECTTIMEOUT 30 /NOCOOKIES /TRANSLATE "Downloading %s..." "Connecting..." second minute hour s "%dkB (%d%%) $(downloadof) %dkB @ %d.%01dkB/s" " (%d %s%s remaining)" "$Download10URLActual" "$PLUGINSDIR\Downloaded-10\${Download10Name}" /END
		${EndIf}
		
		${If} $intWarnOnZoneCrossing != 0
			WriteRegDWORD HKCU "Software\Microsoft\Windows\CurrentVersion\Internet Settings\" "WarnonZoneCrossing" $intWarnOnZoneCrossing
		${EndIf}
		
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
		Pop $Download10RESULT
		${If} $Download10RESULT == "OK"
			Rename "$PLUGINSDIR\Downloaded-10\${Download10Name}" "$PLUGINSDIR\Downloaded-10\${Download10Filename}"
			StrCpy $DOWNLOADED10FILE "$PLUGINSDIR\Downloaded-10\${Download10Filename}"
			!ifdef Download10MD5
				md5dll::GetMD5File "$DOWNLOADED10FILE"
				Pop $R0
				StrCpy $MD5MISMATCH "false"
				${If} $R0 != ${Download10MD5}
					${If} $SECONDDownload10ATTEMPT != true
						StrCpy $SECONDDownload10ATTEMPT true
						Goto Download10TheFile
					${EndIf}
					StrCpy $MD5MISMATCH "true"

					Delete "$INTERNET_CACHE\${Download10FileName}"
					Delete "$PLUGINSDIR\Downloaded-10\${Download10Filename}"
					SetDetailsPrint textonly
					DetailPrint ""
					SetDetailsPrint listonly
					${TBProgress_State} Error
					${If} $(downloadfilemismatch) != ""
						${WordReplace} `$(downloadfilemismatch)` "${DownloadName}" "${Download10Name}" "+" $0
						MessageBox MB_OK|MB_ICONEXCLAMATION `$0`
						DetailPrint $0
					${Else}
						MessageBox MB_OK|MB_ICONEXCLAMATION `The downloaded copy of ${Download10Name} is not valid and can not be installed.  Please try installing again.`
						DetailPrint `The downloaded copy of ${Download10Name} is not valid and can not be installed.  Please try installing again.`
					${EndIf}
					${TBProgress_State} NoProgress
					Abort
				${EndIf}
			!endif
		${Else}
			Delete "$INTERNET_CACHE\${Download10FileName}"
			Delete "$PLUGINSDIR\Downloaded-10\${Download10Filename}"
			StrCpy $0 $Download10URLActual 
			
			;Use backup PA.c download server if necessary
			${WordFind} "$Download10URLActual" "http://downloads.portableapps.com" "#" $R0
			${If} $R0 == 1
				${WordReplace} "$Download10URLActual" "http://downloads.portableapps.com" "http://downloads2.portableapps.com" "+" $Download10URLActual
				Goto Download10TheFile
			${EndIf}
			
			${If} $SECONDDownload10ATTEMPT != true
			${AndIf} $Download10RESULT != "Cancelled"
				StrCpy $SECONDDownload10ATTEMPT true
				Goto Download10TheFile
			${EndIf}
			SetDetailsPrint textonly
				DetailPrint ""
			SetDetailsPrint listonly
			${TBProgress_State} Error
			${If} $(downloadfailed) != ""
				${WordReplace} `$(downloadfailed)` "${DownloadName}" "${Download10Name}" "+" $0
				MessageBox MB_OK|MB_ICONEXCLAMATION $0
				DetailPrint $0
			${Else}
				MessageBox MB_OK|MB_ICONEXCLAMATION `The installer was unable to download ${Download10Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $DOWNLOADRESULT)`
				DetailPrint `The installer was unable to download ${Download10Name}.  The installation of the portable app will be incomplete without it. Please try installing again. (ERROR: $Download10RESULT)`
			${EndIf}
			${TBProgress_State} NoProgress
			Abort
		${EndIf}
	${EndIf}
!endif

!ifdef MAINSECTIONTITLE
	SectionGetFlags 1 $0
	IntOp $0 $0 & ${SF_SELECTED}
	${If} $0 != ${SF_SELECTED}
		;=== BEGIN: OPTIONAL NOT SELECTED CLEANUP CODE ===
		;This will be executed before install if the optional section (additional languages, etc) is not selected
		!ifmacrodef CustomCodeOptionalCleanup
			!insertmacro CustomCodeOptionalCleanup
		!endif
		;=== END: OPTIONAL NOT SELECTED CLEANUP CODE ===
	${EndIf}
!endif

	;=== BEGIN: PRE-INSTALL CODE ===
	;This will be executed before the app is installed.  Useful for cleaning up files no longer used.
	!ifmacrodef CustomCodePreInstall
		!insertmacro CustomCodePreInstall
	!endif
	;=== END: PRE-INSTALL CODE ===

	;=== Remove specific files
	!macro RemoveFile _n
		!ifdef REMOVEFILE${_n}
			Delete `$INSTDIR\${REMOVEFILE${_n}}`
		!endif
	!macroend
	${!insertmacro1-10} RemoveFile

	;=== Rename the preserved files so they're not deleted in the next part
	!macro PreserveFilePre _n
		!ifdef PRESERVEFILE${_n}
			${GetFileName} `$INSTDIR\${PRESERVEFILE${_n}}` $1
			${GetParent} `$INSTDIR\${PRESERVEFILE${_n}}` $2
			CreateDirectory `$INSTDIR\~PRESERVEFILE${_n}`
			${MoveFiles} DOS $1 $2 `$INSTDIR\~PRESERVEFILE${_n}`
		!endif
	!macroend
	${!insertmacro1-10} PreserveFilePre

	;=== Remove specific directories
	!macro RemoveDirectory _n
		!ifdef REMOVEDIRECTORY${_n}
			RMDir /r `$INSTDIR\${REMOVEDIRECTORY${_n}}`
		!endif
	!macroend
	${!insertmacro1-10} RemoveDirectory

	;=== Rename the preserved directories so they're not deleted in the next part
	!macro PreserveDirectoryPre _n
		!ifdef PRESERVEDIRECTORY${_n}
			Rename `$INSTDIR\${PRESERVEDIRECTORY${_n}}\` `$INSTDIR\~PRESERVEDIRECTORY${_n}\`
		!endif
	!macroend
	${!insertmacro1-10} PreserveDirectoryPre

	;=== Remove main directories if necessary
	!ifdef REMOVEAPPDIRECTORY
		!ifdef COMMONFILESPLUGIN
			${GetParent} $INSTDIR $0
			${For} $1 1 10
				Rename `$INSTDIR\~PRESERVEFILE$1\` `$0\~PRESERVEFILE$1\`
				Rename `$INSTDIR\~PRESERVEDIRECTORY$1\` `$0\~PRESERVEDIRECTORY$1\`
			${Next}
			RMDir /r $INSTDIR
			CreateDirectory $INSTDIR
			${For} $1 1 10
				Rename `$0\~PRESERVEFILE$1\` `$INSTDIR\~PRESERVEFILE$1\`
				Rename `$0\~PRESERVEDIRECTORY$1\` `$INSTDIR\~PRESERVEDIRECTORY$1\`
			${Next}
		!else
			RMDir /r `$INSTDIR\App`
		!endif
	!endif
	!ifdef REMOVEOTHERDIRECTORY
		RMDir /r `$INSTDIR\Other`
	!endif

	;=== Rename the preserved directories back to their proper names
	!macro PreserveDirectoryPost _n
		!ifdef PRESERVEDIRECTORY${_n}
			${GetParent} `$INSTDIR\${PRESERVEDIRECTORY${_n}}\` $R0
			CreateDirectory $R0
			Rename `$INSTDIR\~PRESERVEDIRECTORY${_n}\` `$INSTDIR\${PRESERVEDIRECTORY${_n}}\`
		!endif
	!macroend
	${!insertmacro1-10} PreserveDirectoryPost

	;=== Rename the preserved files back to their proper names
	!macro PreserveFilePost _n
		!ifdef PRESERVEFILE${_n}
			${GetFileName} `$INSTDIR\${PRESERVEFILE${_n}}` $1
			${GetParent} `$INSTDIR\${PRESERVEFILE${_n}}` $2
			CreateDirectory $2
			${MoveFiles} DOS $1 `$INSTDIR\~PRESERVEFILE${_n}` $2
			RMDir `$INSTDIR\~PRESERVEFILE${_n}`
		!endif
	!macroend
	${!insertmacro1-10} PreserveFilePost

	${If} $bolAppUpgrade == true
		SetDetailsPrint both
		DetailPrint $InstallingStatusString
		SetDetailsPrint ListOnly
	${EndIf}

	!ifndef PLUGININSTALLER
		File /x thumbs.db "..\..\*.exe"
		File /x thumbs.db "..\..\*.html"
		SetOutPath $INSTDIR\App
		File /r /x thumbs.db "..\..\App\*.*"
	!else ifdef COMMONFILESPLUGIN
		SetOutPath $INSTDIR
		File /r /x thumbs.db /x PortableApps.comInstaller*.* "..\..\*.*"
	!else ; non-CommonFiles plugin installer
		SetOutPath $INSTDIR\Data
		File /nonfatal /r /x thumbs.db "..\..\Data\*.*"
		SetOutPath $INSTDIR\App
		File /nonfatal /r /x thumbs.db "..\..\App\*.*"
	!endif

	SetOutPath $INSTDIR\Other
	File /nonfatal /r /x thumbs.db /x PortableApps.comInstaller*.* "..\..\Other\*.*"

	SetOutPath $INSTDIR\Other\Source
	!ifdef USESCUSTOMCODE
		!if ${__FILE__} == "PortableApps.comInstallerPlugin.nsi"
			File "..\..\Other\Source\PortableApps.comInstallerPluginCustom.nsh"
		!else
			File "..\..\Other\Source\PortableApps.comInstallerCustom.nsh"
		!endif
	!endif
	!ifndef PLUGININSTALLER
		CreateDirectory "$INSTDIR\Data"
	!endif

	!ifdef INCLUDEINSTALLERSOURCE
		File /r /x PortableApps.comInstallerCustom.nsh /x PortableApps.comInstallerPluginCustom.nsh "..\..\Other\Source\PortableApps.comInstaller*.*"
	!endif

	;=== Extract 7-Zip if we're using it
	!ifdef bolUses7Zip
		CreateDirectory "$INSTDIR\7zTemp"
		SetOutPath "$INSTDIR\7zTemp"
		File "${NSISDIR}\..\7zip\7z.exe"
		File "${NSISDIR}\..\7zip\7z.dll"
		SetOutPath $INSTDIR
	!endif
	
	;=== Extract Download Files
	!ifdef DownloadURL
		!ifdef DownloadTo
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADEDFILE" "$INSTDIR\${DownloadTo}"
		!else
		;Process the file
			!ifdef AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro AdvancedExtractFilter _n
					!ifdef AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${AdvancedExtract${_n}To}"
						${If} "${AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADEDFILE" -o"$INSTDIR\${AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADEDFILE" -o"$INSTDIR\${AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${DownloadFilename} > ${AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} AdvancedExtractFilter
			!endif
			!ifdef DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded2"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADEDFILE" -o"$PLUGINSDIR\Downloaded2" "${DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${DownloadFilename} > ${DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro DoubleExtractTo _n
					!ifdef DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${DoubleExtract${_n}To}"
						${If} "${DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded2\${DoubleExtractFilename}" -o"$INSTDIR\${DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded2\${DoubleExtractFilename}" -o"$INSTDIR\${DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${DoubleExtractFilename} > ${DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} DoubleExtractTo
			!endif
		!endif
	!endif
	
	!ifdef Download2URL
		!ifdef Download2To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED2FILE" "$INSTDIR\${Download2To}"
		!else
		;Process the file
			!ifdef Download2AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download2AdvancedExtractFilter _n
					!ifdef Download2AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download2AdvancedExtract${_n}To}"
						${If} "${Download2AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED2FILE" -o"$INSTDIR\${Download2AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED2FILE" -o"$INSTDIR\${Download2AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download2Filename} > ${Download2AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download2AdvancedExtractFilter
			!endif
			!ifdef Download2DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-22"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED2FILE" -o"$PLUGINSDIR\Downloaded-22" "${Download2DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download2Filename} > ${Download2DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download2DoubleExtractTo _n
					!ifdef Download2DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download2DoubleExtract${_n}To}"
						${If} "${Download2DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-22\${Download2DoubleExtractFilename}" -o"$INSTDIR\${Download2DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-22\${Download2DoubleExtractFilename}" -o"$INSTDIR\${Download2DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download2DoubleExtractFilename} > ${Download2DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download2DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download3URL
		!ifdef Download3To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED3FILE" "$INSTDIR\${Download3To}"
		!else
		;Process the file
			!ifdef Download3AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download3AdvancedExtractFilter _n
					!ifdef Download3AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download3AdvancedExtract${_n}To}"
						${If} "${Download3AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED3FILE" -o"$INSTDIR\${Download3AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED3FILE" -o"$INSTDIR\${Download3AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download3Filename} > ${Download3AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download3AdvancedExtractFilter
			!endif
			!ifdef Download3DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-33"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED3FILE" -o"$PLUGINSDIR\Downloaded-33" "${Download3DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download3Filename} > ${Download3DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download3DoubleExtractTo _n
					!ifdef Download3DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download3DoubleExtract${_n}To}"
						${If} "${Download3DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-33\${Download3DoubleExtractFilename}" -o"$INSTDIR\${Download3DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-33\${Download3DoubleExtractFilename}" -o"$INSTDIR\${Download3DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download3DoubleExtractFilename} > ${Download3DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download3DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download4URL
		!ifdef Download4To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED4FILE" "$INSTDIR\${Download4To}"
		!else
		;Process the file
			!ifdef Download4AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download4AdvancedExtractFilter _n
					!ifdef Download4AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download4AdvancedExtract${_n}To}"
						${If} "${Download4AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED4FILE" -o"$INSTDIR\${Download4AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED4FILE" -o"$INSTDIR\${Download4AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download4Filename} > ${Download4AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download4AdvancedExtractFilter
			!endif
			!ifdef Download4DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-44"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED4FILE" -o"$PLUGINSDIR\Downloaded-44" "${Download4DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download4Filename} > ${Download4DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download4DoubleExtractTo _n
					!ifdef Download4DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download4DoubleExtract${_n}To}"
						${If} "${Download4DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-44\${Download4DoubleExtractFilename}" -o"$INSTDIR\${Download4DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-44\${Download4DoubleExtractFilename}" -o"$INSTDIR\${Download4DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download4DoubleExtractFilename} > ${Download4DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download4DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download5URL
		!ifdef Download5To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED5FILE" "$INSTDIR\${Download5To}"
		!else
		;Process the file
			!ifdef Download5AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download5AdvancedExtractFilter _n
					!ifdef Download5AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download5AdvancedExtract${_n}To}"
						${If} "${Download5AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED5FILE" -o"$INSTDIR\${Download5AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED5FILE" -o"$INSTDIR\${Download5AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download5Filename} > ${Download5AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download5AdvancedExtractFilter
			!endif
			!ifdef Download5DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-55"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED5FILE" -o"$PLUGINSDIR\Downloaded-55" "${Download5DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download5Filename} > ${Download5DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download5DoubleExtractTo _n
					!ifdef Download5DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download5DoubleExtract${_n}To}"
						${If} "${Download5DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-55\${Download5DoubleExtractFilename}" -o"$INSTDIR\${Download5DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-55\${Download5DoubleExtractFilename}" -o"$INSTDIR\${Download5DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download5DoubleExtractFilename} > ${Download5DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download5DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download6URL
		!ifdef Download6To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED6FILE" "$INSTDIR\${Download6To}"
		!else
		;Process the file
			!ifdef Download6AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download6AdvancedExtractFilter _n
					!ifdef Download6AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download6AdvancedExtract${_n}To}"
						${If} "${Download6AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED6FILE" -o"$INSTDIR\${Download6AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED6FILE" -o"$INSTDIR\${Download6AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download6Filename} > ${Download6AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download6AdvancedExtractFilter
			!endif
			!ifdef Download6DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-66"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED6FILE" -o"$PLUGINSDIR\Downloaded-66" "${Download6DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download6Filename} > ${Download6DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download6DoubleExtractTo _n
					!ifdef Download6DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download6DoubleExtract${_n}To}"
						${If} "${Download6DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-66\${Download6DoubleExtractFilename}" -o"$INSTDIR\${Download6DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-66\${Download6DoubleExtractFilename}" -o"$INSTDIR\${Download6DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download6DoubleExtractFilename} > ${Download6DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download6DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download7URL
		!ifdef Download7To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED7FILE" "$INSTDIR\${Download7To}"
		!else
		;Process the file
			!ifdef Download7AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download7AdvancedExtractFilter _n
					!ifdef Download7AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download7AdvancedExtract${_n}To}"
						${If} "${Download7AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED7FILE" -o"$INSTDIR\${Download7AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED7FILE" -o"$INSTDIR\${Download7AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download7Filename} > ${Download7AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download7AdvancedExtractFilter
			!endif
			!ifdef Download7DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-77"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED7FILE" -o"$PLUGINSDIR\Downloaded-77" "${Download7DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download7Filename} > ${Download7DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download7DoubleExtractTo _n
					!ifdef Download7DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download7DoubleExtract${_n}To}"
						${If} "${Download7DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-77\${Download7DoubleExtractFilename}" -o"$INSTDIR\${Download7DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-77\${Download7DoubleExtractFilename}" -o"$INSTDIR\${Download7DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download7DoubleExtractFilename} > ${Download7DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download7DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download8URL
		!ifdef Download8To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED8FILE" "$INSTDIR\${Download8To}"
		!else
		;Process the file
			!ifdef Download8AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download8AdvancedExtractFilter _n
					!ifdef Download8AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download8AdvancedExtract${_n}To}"
						${If} "${Download8AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED8FILE" -o"$INSTDIR\${Download8AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED8FILE" -o"$INSTDIR\${Download8AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download8Filename} > ${Download8AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download8AdvancedExtractFilter
			!endif
			!ifdef Download8DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-88"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED8FILE" -o"$PLUGINSDIR\Downloaded-88" "${Download8DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download8Filename} > ${Download8DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download8DoubleExtractTo _n
					!ifdef Download8DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download8DoubleExtract${_n}To}"
						${If} "${Download8DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-88\${Download8DoubleExtractFilename}" -o"$INSTDIR\${Download8DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-88\${Download8DoubleExtractFilename}" -o"$INSTDIR\${Download8DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download8DoubleExtractFilename} > ${Download8DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download8DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download9URL
		!ifdef Download9To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED9FILE" "$INSTDIR\${Download9To}"
		!else
		;Process the file
			!ifdef Download9AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download9AdvancedExtractFilter _n
					!ifdef Download9AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download9AdvancedExtract${_n}To}"
						${If} "${Download9AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED9FILE" -o"$INSTDIR\${Download9AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED9FILE" -o"$INSTDIR\${Download9AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download9Filename} > ${Download9AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download9AdvancedExtractFilter
			!endif
			!ifdef Download9DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-99"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED9FILE" -o"$PLUGINSDIR\Downloaded-99" "${Download9DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download9Filename} > ${Download9DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download9DoubleExtractTo _n
					!ifdef Download9DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download9DoubleExtract${_n}To}"
						${If} "${Download9DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-99\${Download9DoubleExtractFilename}" -o"$INSTDIR\${Download9DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-99\${Download9DoubleExtractFilename}" -o"$INSTDIR\${Download9DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download9DoubleExtractFilename} > ${Download9DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download9DoubleExtractTo
			!endif
		!endif
	!endif

	!ifdef Download10URL
		!ifdef Download10To
			;Just copy the file
			CopyFiles /SILENT "$DOWNLOADED10FILE" "$INSTDIR\${Download10To}"
		!else
		;Process the file
			!ifdef Download10AdvancedExtract1To
				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download10AdvancedExtractFilter _n
					!ifdef Download10AdvancedExtract${_n}To
						CreateDirectory "$INSTDIR\${Download10AdvancedExtract${_n}To}"
						${If} "${Download10AdvancedExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$DOWNLOADED10FILE" -o"$INSTDIR\${Download10AdvancedExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED10FILE" -o"$INSTDIR\${Download10AdvancedExtract${_n}To}" "${AdvancedExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download10Filename} > ${Download10AdvancedExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download10AdvancedExtractFilter
			!endif
			!ifdef Download10DoubleExtractFilename
				CreateDirectory "$PLUGINSDIR\Downloaded-1010"
				nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$DOWNLOADED10FILE" -o"$PLUGINSDIR\Downloaded-1010" "${Download10DoubleExtractFilename}" -aoa -y`
				Pop $R0
				${If} $R0 <> 0
					DetailPrint "ERROR: (${Download10Filename} > ${Download10DoubleExtractFilename})"
					Abort
				${EndIf}

				; The original code didn't have a !ifdef for 1, but we
				; know it will be defined, and it doesn't matter if we
				; check if it is because it will be.
				!macro Download10DoubleExtractTo _n
					!ifdef Download10DoubleExtract${_n}To
						CreateDirectory "$INSTDIR\${Download10DoubleExtract${_n}To}"
						${If} "${Download10DoubleExtract${_n}Filter}" == "**"
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x -r "$PLUGINSDIR\Downloaded-1010\${Download10DoubleExtractFilename}" -o"$INSTDIR\${Download10DoubleExtract${_n}To}" * -aoa -y`
						${Else}
							nsExec::Exec `"$INSTDIR\7zTemp\7z.exe" x "$PLUGINSDIR\Downloaded-1010\${Download10DoubleExtractFilename}" -o"$INSTDIR\${Download10DoubleExtract${_n}To}" "${DoubleExtract${_n}Filter}" -aoa -y`
						${EndIf}
						Pop $R0
						${If} $R0 <> 0
							DetailPrint "ERROR: (${Download10DoubleExtractFilename} > ${Download10DoubleExtract${_n}To})"
							Abort
						${EndIf}
					!endif
				!macroend
				${!insertmacro1-10} Download10DoubleExtractTo
			!endif
		!endif
	!endif

	;=== Copy Local Files
	!ifdef COPYLOCALFILES
		${If} ${FileExists} "$CopyLocalFilesFrom\*.*"
			CreateDirectory "$INSTDIR\${CopyToDirectory}"
			CopyFiles /SILENT "$CopyLocalFilesFrom\*.*" "$INSTDIR\${CopyToDirectory}"
		${Else}
			StrCpy $MISSINGFILEORPATH $CopyLocalFilesFrom
			${If} $(copylocalfilesnotfound) != ""
				MessageBox MB_OK|MB_ICONINFORMATION $(copylocalfilesnotfound)
			${Else}
				MessageBox MB_OK|MB_ICONINFORMATION `This installer copies a local version of the application and makes it portable.  Unfortunately, a local copy of the application was not found.  You may reinstall or copy the files yourself to complete the installation at a later time.  (ERROR: $MISSINGFILEORPATH could not be found.)`
			${EndIf}
		${EndIf}
	!endif

	;=== BEGIN: POST-INSTALL CODE ===
	;This will be executed after the app is installed.  Useful for updating configuration files.
	!ifmacrodef CustomCodePostInstall
		!insertmacro CustomCodePostInstall
	!endif
	;=== END: POST-INSTALL CODE ===
	
	;Remove 7-Zip if we used it
	!ifdef bolUses7Zip
		Delete "$INSTDIR\7zTemp\7z.exe"
		Delete "$INSTDIR\7zTemp\7z.dll"
		RMDir "$INSTDIR\7zTemp"
	!endif

	!ifndef PLUGININSTALLER
		;=== Refresh PortableApps.com Menu (not final version)
		${GetParent} $INSTDIR $0
		;=== Check that it exists at the right location
		SetDetailsPrint both
		DetailPrint '$(checkforplatform)'
		${If} ${FileExists} `$0\PortableApps.com\PortableAppsPlatform.exe`
			;=== Check that it's the real deal so we aren't hanging with no response
			MoreInfo::GetProductName `$0\PortableApps.com\PortableAppsPlatform.exe`
			Pop $1
			${If} $1 == "PortableApps.com Platform"
				MoreInfo::GetCompanyName `$0\PortableApps.com\PortableAppsPlatform.exe`
				Pop $1
				${If} $1 == "PortableApps.com"

					;=== Check that it's running
					FindProcDLL::FindProc "PortableAppsPlatform.exe"
					${If} $R0 == "1"

						;=== Send message for the Menu to refresh
						CreateDirectory "$0\PortableApps.com\Data"
						WriteINIStr "$0\PortableApps.com\Data\NewApp.ini" "NewApp" "AppID" "${APPID}"

						DetailPrint '$(refreshmenu)'
						${IfNot} ${FileExists} `$0\PortableApps.com\App\PortableAppsPlatform.exe`
							StrCpy $2 'PortableApps.comPlatformWindowMessageToRefresh$0\PortableApps.com\PortableAppsPlatform.exe'
							System::Call "user32::RegisterWindowMessage(t r2) i .r3"
							SendMessage 65535 $3 0 0 /TIMEOUT=1
						${Else} ; old message
							StrCpy $2 'PortableApps.comPlatformWindowMessageToRefresh$0\PortableApps.com\App\PortableAppsPlatform.exe'
							System::Call "user32::RegisterWindowMessage(t r2) i .r3"
							SendMessage 65535 $3 0 0 /TIMEOUT=1
						${EndIf}
					${EndIf}
				${EndIf}
			${EndIf}
		${EndIf}
	!endif
		DetailPrint $InstallingStatusString
		SetDetailsPrint listonly

!ifdef LICENSEAGREEMENT
	CreateDirectory "$INSTDIR\Data\PortableApps.comInstaller"
	WriteINIStr "$INSTDIR\Data\PortableApps.comInstaller\license.ini" "PortableApps.comInstaller" "EULAVersion" $INTERNALEULAVERSION
	ClearErrors
!endif

!ifdef DownloadURL
	Delete "$INTERNET_CACHE\${DownloadFileName}"
!endif

!ifndef PLUGININSTALLER
	WriteINIStr "$INSTDIR\App\AppInfo\pac_installer_log.ini" "PortableApps.comInstaller" "Info2" "This file was generated by the PortableApps.com Installer wizard and modified by the official PortableApps.com Installer TM Rare Ideas, LLC as the app was installed."
	WriteINIStr "$INSTDIR\App\AppInfo\pac_installer_log.ini" "PortableApps.comInstaller" "Run" "true"
	WriteINIStr "$INSTDIR\App\AppInfo\pac_installer_log.ini" "PortableApps.comInstaller" "InstallerVersion" "${PORTABLEAPPSINSTALLERVERSION}"
	${GetTime} "" "L" $R0 $R1 $R2 $R3 $R4 $R5 $R6
	WriteINIStr "$INSTDIR\App\AppInfo\pac_installer_log.ini" "PortableApps.comInstaller" "InstallDate" "$R2-$R1-$R0"
	WriteINIStr "$INSTDIR\App\AppInfo\pac_installer_log.ini" "PortableApps.comInstaller" "InstallTime" "$R4:$R5:$R6"
!endif

	${If} $bolLogFile == true
		${DumpLogToFile} "$EXEDIR\$EXEFILE.log"
	${EndIf}
	SetOutPath $INSTDIR
SectionEnd

!ifdef MAINSECTIONTITLE
	Section /o "${OPTIONALSECTIONTITLE}"
		SetOutPath $INSTDIR
		File /r "..\..\Optional1\*.*"
		StrCpy $OPTIONAL1DONE "true"
	SectionEnd

	Section "-UpdateAppInfo" SecUpdateAppInfo
	!ifndef PLUGININSTALLER
		${If} $OPTIONAL1DONE != "true"
		${AndIf} "${OPTIONALSECTIONNOTSELECTEDINSTALLTYPE}" != ""
			WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "InstallType" "${OPTIONALSECTIONNOTSELECTEDINSTALLTYPE}"
		${ElseIf} "${OPTIONALSECTIONSELECTEDINSTALLTYPE}" != ""
			WriteINIStr "$INSTDIR\App\AppInfo\appinfo.ini" "Details" "InstallType" "${OPTIONALSECTIONSELECTEDINSTALLTYPE}"
		${EndIf}
	!endif
	SectionEnd

	!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
		!insertmacro MUI_DESCRIPTION_TEXT ${MAINSECTIONIDX} "${MAINSECTIONDESCRIPTION}"
		!insertmacro MUI_DESCRIPTION_TEXT ${OPTIONALSECTIONIDX} "${OPTIONALSECTIONDESCRIPTION}"
	!insertmacro MUI_FUNCTION_DESCRIPTION_END
!endif

Function .onInstFailed
	!ifdef COPYLOCALFILES
		${registry::Unload}
	!endif
	RMDir $INSTDIR ;remove directory if empty
FunctionEnd

!ifdef COPYLOCALFILES
	Function .onInstSuccess
		${registry::Unload}
	FunctionEnd
	Function CustomAbortFunction
		${registry::Unload}
	FunctionEnd
!endif