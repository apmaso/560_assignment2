verdiSetActWin -dock widgetDock_<Decl._Tree>
verdiWindowWorkMode -win $_Verdi_1 -formalVerification
verdiDockWidgetDisplay -dock windowDock_vcstConsole_2
srcSetPreference -vcstOpts \
           {-demo -file fpv_sva_run.tcl -prompt vcf -fmode _default -new_verdi_comm}
verdiWindowResize -win $_Verdi_1 "50" "0" "1250" "800"
verdiWindowResize -win $_Verdi_1 "0" "24" "1250" "800"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "0" "24" "1252" "802"
schSetVCSTDelimiter -VHDLGenDelim "."
verdiSetPrefEnv -bSpecifyWindowTitleForDockContainer "off"
paSetPreference -brightenPowerColor on
paSetPreference -AnnotateSignal off -brightenPowerColor on
paSetPreference -AnnotateSignal off -highlightPowerObject off -brightenPowerColor \
           on
schSetVCSTDelimiter -hierDelim "."
srcSetXpropOption "tmerge"
wvSetPreference -overwrite off
wvSetPreference -getAllSignal off
simSetSimulator "-vcssv" -exec \
           "/home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/simv" \
           -args
debImport "-simflow" "-smart_load_kdb" "-dbdir" \
          "/home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/simv.daidir" \
          -autoalias
srcSetPreference -tabNum 16
debLoadUserDefinedFile \
           /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/verdi/constant.uddb
srcSetOptions -userAnnot on -win $_nTrace1 -field 2
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs clear=\"true\"/>
</Command>
"
opVerdiComponents -xmlstr \
           "<Command delimiter=\"/\" name=\"schSession\">
<HighlightObjs>
<H_Nets>
<H_Net name=\"execution_unit/rst_b\" text=\"C:1\" color=\"2\"/>
</H_Nets>
</HighlightObjs>
</Command>
"
verdiRunVcstCmd check_fv

verdiSetActWin -dock widgetDock_VCF:GoalList
debExit
