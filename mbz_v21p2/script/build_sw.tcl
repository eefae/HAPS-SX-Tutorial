# XSCT Command
# Variable Setup
set WS_PATH ./ws_vitis
set XSA_PATH ./vivado/hw.xsa
set PF_NAME pf_mbzhello
set APP_NAME app_mbzhello

# Create Vitis Workspace
setws -switch ${WS_PATH}
########################## Platform ##########################
# List .xsa file processor (Option)
# getprocessor ${XSA_PATH}

# Create Platform Project
platform create -name ${PF_NAME} -hw ${XSA_PATH} -proc microblaze_0 -os standalone

# List Platform Project (Option)
# platform list

# Select Platform Project
platform active ${PF_NAME}

# Build Platform Project
platform generate

########################## Domain ##########################
# List Domain (Option)
# domain list

# Select Domain
domain active standalone_domain

########################## Application ##########################
# Create Application Project
app create -name ${APP_NAME} -platform ${PF_NAME} -domain standalone_domain -proc microblaze_0 -os standalone

# List Application Project (Option)
# app list

# Build Application Project
app build -all

