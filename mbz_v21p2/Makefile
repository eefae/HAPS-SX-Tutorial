#!/bin/bash
SHELL:=/bin/bash
VIVADO_PATH=./vivado/hw.xpr

.PHONY:help create_proj build_hw gen_xsa build_sw demo clean
help:
	@echo "+-----------------------------------------------------"
	@echo "| ### MicroBlaze Hello World Demo:"
	@echo "+-----------------------------------------------------"
	@echo "| 1. make create_proj |"
	@echo "| 2. make build_hw    | build the vivado project"
	@echo "| 3. make gen_xsa     | generate xsa file"
	@echo "| 4. make build_sw    | build the vitis project"
	@echo "| 5. make demo        | run the vitis application"
	@echo "+-----------------------------------------------------"
	@echo "| 0. make clean       | clean the demo project"
	@echo "+-----------------------------------------------------"

create_proj:
	vivado -mode batch -source ./script/top.tcl -nolog -nojournal

build_hw:
	vivado -mode batch -project ${VIVADO_PATH} -source ./script/build_hw.tcl -nolog -nojournal

gen_xsa:
	vivado -mode batch -project ${VIVADO_PATH} -source ./script/gen_xsa.tcl -nolog -nojournal

build_sw:
	xsct ./script/build_sw.tcl

demo:
	xsct ./script/run_app.tcl

clean:
	rm ./ws_vitis -rf
	rm ./vivado -rf

