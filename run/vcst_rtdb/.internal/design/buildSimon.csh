#!/bin/csh -f
setenv VCS_HOME /pkgs/synopsys/current/vc_static/vcs-mx
setenv VC_STATIC_HOME /pkgs/synopsys/current/vc_static
setenv SYNOPSYS_SIM_SETUP /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/synopsys_sim.setup

$VCS_HOME/bin/vcs /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/undef_vcs.v -file /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/vcsCmd -Xvcstatic_extns=0x100  +warn=noSM_CCE  -kdb=common_elab  -Xufe=parallel:incrdump  +warn=noKDB-ELAB-E  +warn=noELW_UNBOUND  -Xverdi_elab_opts=-saveLevel  -verdi_opts "-logdir /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/verdi/elabcomLog " -Xvd_opts=-silent,-ssy,-ssv,-ssz,+disable_message+C00373, -full64

$VCS_HOME/bin/vcs -sverilog  -Xmonet  -scm /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/_PROP_0.xml -o /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/work._PROP_0.exe -Mdir=/home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/design/csrc +warn=noIWNF +warn=noELW_UNBOUND -suppress=DB_LOAD -suppress=SIMU-RESOLUTION -q -l /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/logs/_PROP_0.vcslog  -assert svaext  -cm assert  -error=noMPD  -full64 /home/amaso/common/Documents/ECE560/560_assignment2/run/vcst_rtdb/.internal/formal/_prop_0.sv
