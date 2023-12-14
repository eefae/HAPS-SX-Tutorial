#!/bin/bash -f

export HAPS_IP=192.168.1.225:2542

export XILINX_HOME=/tools/xilinx
export SYNOPSYS_HOME=/tools/synopsys
export XILINXD_LICENSE_FILE=~/.Xilinx/Xil_License.lic


export VITIS_HOME=${XILINX_HOME}/Vitis/2021.2
export VIVADO_HOME=${XILINX_HOME}/Vivado/2021.2
export CONFPRO_HOME=${SYNOPSYS_HOME}/confprosx/1.1.9/Confpro-SX_1.1.9/guibin

source $VITIS_HOME/settings64.sh
source $VIVADO_HOME/settings64.sh 

