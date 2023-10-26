## VerdiPlay
source ./verdi_vcst.tcl
verdiVcstResizeTopWin
verdiWindowRestoreUserLayout -lastRunLayout
verdiDockWidgetSetCurTab -dock windowDock_vcstConsole_2
::vcst::creatInstAction
::vcst::createAnalyzerAction
::vcst::creatResetLayoutAction
::vcst::creatAssertAnalyzerAction
set ::vcst::EnableUDWin 0
qwConfig -type nWave -cmds [list {qwAddToolBarGroup -group "UDWinGroup"} {qwAddToolBarGroup -group "AssertAnalyzer"}]
srcSetOptions -lockActView on
::vcst::createAddTraceToWaveAction
source /pkgs/synopsys/current/vc_static/auxx/monet/tcl/menu.tcl

set ::vcst::_compositeTrace {1}
verdiVcstSyncMsgColor -errorColor "default_red" -warningColor "default_none" -infoColor "default_none"
verdiSetRCValue -section appSetting -key font -value {Bitstream Vera Sans(11)};
verdiSetPrefEnv -monoFontSize "11"
setStyleFvProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
setStyleFvGoalProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
verdiSetFont -font "Bitstream Vera Sans" -size "11"
verdiVcstOnPropSelectionChanged -strNum 0 -propList {}
verdiDockWidgetSetCurTab -dock widgetDock_VCF:TaskList
verdiVcstSetAppmode -mode FPV -fromVcst
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiDockWidgetSetCurTab -dock widgetDock_VCF:GoalList
verdiAboutDlg -banner {
VC Static

Version T-2022.06-SP2 for linux64 - Nov 29, 2022

Copyright (c) 2010 - 2022 Synopsys, Inc.
}
verdiSetStatusMsg -win Verdi_1 -color red { Design import... cross probing not ready }
set ::vcst::_top "execution_unit"
set ::vcst::_elab ""
set ::vcst::_elabOpts {}
set ::vcst::_rtdbDir {/home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb}
set ::vcst::_hiddenDir {.internal}
set ::vcst::_masterMode true
set ::vcst::_workLib "work"
set ::vcst::_upfOpts " -upf "
set ::vcst::_enableKdb "true"
set ::vcst::_simBinPath "simv"
set ::vcst::_goldenUpfConfig {}
set ::vcst::_nldmNschema {false}
set ::vcst::_kdbAlias {true}
set ::vcst::_covDut {}
set ::vcst::_splitbus {false}
set ::vcst::_enableVerdiLog {1}
set ::vcst::_fml_max_proof_depth {}
set ::vcst::_smartLoad {true}
set ::vcst::_compositeTrace {1}
set ::vcst::_strategyFilePath {}
set ::vcst::_enableVnrWriteKdb {false}
set ::vcst::_bIsFormalFlow {true}
set ::vcst::_bGlobalFsdbPresent {false}
set ::vcst::_sRunModes {}
set ::vcst::_enableVnrWriteKdbResolve {true}
set ::vcst::_diucFlow {false}
set ::vcst::_libArgs ""
set ::vcst::_seqXmlFile ""
schSetVCSTDelimiter -VHDLGenDelim "."
schSetPreference -turboLibs {} -turboLibPaths {}
verdiSetPrefEnv -bSpecifyWindowTitleForDockContainer off
paSetPreference -brightenPowerColor on
schSetPreference -showPassThroughNet on
paSetPreference -AnnotateSignal off
paSetPreference -highlightPowerObject off
srcAssertSetOpt -addSigToWave 0 -addSigWithExpGrp 1 -maskWave 0 -ShowCycleInfo 1
verdiRunVcst -on
schSetVCSTDelimiter -hierDelim .
set ::vcst::_vcstAppHierDelim "."
srcSetXpropOption "tmerge"
set ::vcst::_powerDbDir ""
set ::vcst::_bRestore ""
verdiDockWidgetFix -dock widgetDock_VCF:GoalList
::vcst::loadMainWin "0"
verdiDockWidgetUnfix -dock widgetDock_VCF:GoalList

setStyleFvProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
setStyleFvGoalProgress -css {font-family:Bitstream Vera Sans monospace;font-size:11px}
verdiSetFont -font "Bitstream Vera Sans" -size "11"
verdiSetPrefEnv -monoFontSize "11"
verdiVcstEnableAppMode -enable FRV

verdiRunVcstCmd "action aaVerdiWaitAnnotation -trigger
" -no_wait
verdiRunVcstCmd "action aaMonetSetReuseWave -data \{[verdiGetRCValue -section appSetting -key reuseWave]\}
" -no_wait
verdiSetStatusMsg -win Verdi_1 -color black { Design import ready }
verdiGetVcstCmdResult -xmlstr {<Command name="action" received="1"></Command>}

verdiGetVcstCmdResult -xmlstr {<Command name="action" status="1"></Command>}

verdiGetVcstCmdResult -xmlstr {<Command name="action" received="1"></Command>}

verdiGetVcstCmdResult -xmlstr {<Command name="action" status="1"></Command>}

srcSetPreference -tabNum 16
verdiSetPrefEnv -bDockNewWindowInContainerWhenFindSameType "off"
set ::vcst::_bRestore ""
verdiLayoutFreeze -off
verdiToolBar -rm toolbarHB_TOGGLE_PANEL toolbarHB_EMULATION_PANEL toolbarHB_PRODTYPE_PANEL UVM_AWARE_DEBUG AMS_CONFIG_TOOLBAR NOVAS_TBBR_INTERACTIVEVIEW_PANEL NOVAS_TBBR_DEBUG_REWIND_COMMAND NOVAS_TBBR_DEBUG_REWIND_UNDO_REDO_COMMAND NOVAS_TBBR_DEBUG_REVERSE_COMMAND NOVAS_TBBR_DEBUG_VSIM_COMMAND NOVAS_EMULATION_DEBUG_COMMAND CVG_CER_PANEL
verdiVcstSetSviPid -pid 17758
set ::vcst::_fml_max_proof_depth {-1};set ::vcst::_fml_max_time {12H};catch {verdiVcstOnFmlVarChanged -key {fml_effort} -value {default}}
verdiVcstDesignLoaded
verdiGetVcstCmdResult -xmlstr {<Command name="sim_run" status="1" />}
verdiGetVcstCmdResult -xmlstr {<Command name="sim_save_reset" status="1" />}
report_fv_complexity -silent -sim_save_reset
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key conSize -value {PROPERTY_CLASS,100:PROPERTY_CLOCK,100:PROPERTY_EXPRESSION,100:PROPERTY_ID,100:PROPERTY_INSTANCE,100:PROPERTY_LANGUAGE,100:PROPERTY_LOCATION,100:PROPERTY_NAME,100:PROPERTY_SCOPE,100:PROPERTY_SIGNALS,100:PROPERTY_SVA_TYPE,100:PROPERTY_TYPE,100:PROPERTY_USAGE,100:PROPERTY_VACUITY,100:PROPERTY_WITNESS,100:};
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key conSize -value {PROPERTY_CLASS,776:PROPERTY_CLOCK,100:PROPERTY_EXPRESSION,100:PROPERTY_ID,100:PROPERTY_INSTANCE,100:PROPERTY_LANGUAGE,100:PROPERTY_LOCATION,100:PROPERTY_NAME,100:PROPERTY_SCOPE,100:PROPERTY_SIGNALS,100:PROPERTY_SVA_TYPE,100:PROPERTY_TYPE,100:PROPERTY_USAGE,100:PROPERTY_VACUITY,100:PROPERTY_WITNESS,100:};
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key conSize -value {PROPERTY_CLASS,775:PROPERTY_CLOCK,100:PROPERTY_EXPRESSION,100:PROPERTY_ID,100:PROPERTY_INSTANCE,100:PROPERTY_LANGUAGE,100:PROPERTY_LOCATION,100:PROPERTY_NAME,100:PROPERTY_SCOPE,100:PROPERTY_SIGNALS,100:PROPERTY_SVA_TYPE,100:PROPERTY_TYPE,100:PROPERTY_USAGE,100:PROPERTY_VACUITY,100:PROPERTY_WITNESS,100:};
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiLayoutFreeze -off
::vcst::showDebugViews -1 false false setupSource
verdiWindowMoveDockTab -win Verdi_1 widgetDock_VCF:Shell widgetDock_VCF:GoalList widgetDock_<Message>
verdiDockWidgetSetCurTab -dock widgetDock_VCF:GoalList

viaLogViewerLoadVcstConsoleLogRc
verdiSetRCValue -section appSetting -key glbfilter -value {111}
schSetPreference -displayAbstractSrc off 
srcSetBlackbox   -delim {.}
srcSetGlassbox  -delim {.}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiVcstConstantReport -xmlFile /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/verdi/constant.xml 
verdiSetRCValue -section appSetting -key conSize -value {PROPERTY_CLASS,759:PROPERTY_CLOCK,100:PROPERTY_EXPRESSION,100:PROPERTY_ID,100:PROPERTY_INSTANCE,100:PROPERTY_LANGUAGE,100:PROPERTY_LOCATION,100:PROPERTY_NAME,100:PROPERTY_SCOPE,100:PROPERTY_SIGNALS,100:PROPERTY_SVA_TYPE,100:PROPERTY_TYPE,100:PROPERTY_USAGE,100:PROPERTY_VACUITY,100:PROPERTY_WITNESS,100:};
verdiVcstCheckFv -taskName FPV
vcstRunCovCmd -async gui_vcst_set_parameters -is_running true
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiGetVcstCmdResult -xmlstr {<Command name="check_fv" status="1" />}
receiveFvProgress /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/verdi/gridUsage.xml0
verdiVcstCheckFv -taskName FPV
vcstRunCovCmd -async gui_vcst_set_parameters -is_running false
verdiSetRCValue -section appSetting -key glbfilter -value {111}
verdiSetRCValue -section appSetting -key fvSize -value {PROPERTY_ELAPSED_TIME,320:PROPERTY_ENGINE,186:PROPERTY_NAME,388:PROPERTY_STATUS,75:PROPERTY_TRACE_DEPTH,65:PROPERTY_TYPE,65:PROPERTY_VACUITY,75:PROPERTY_WITNESS,75:};
srcShowDefine -incrSearch {execution_unit.input_id_output_id_0}; 
