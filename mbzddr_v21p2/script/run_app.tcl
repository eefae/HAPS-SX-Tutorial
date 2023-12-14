# connect to haps-sx
connect
after 3000
#display available targest
targets
#target debug moduel
target 2
#start uart terminal
jtagterminal -start
after 1000
#target microblaze
target 3
after 1000
#load ELF program
dow ./ws_vitis/app_mbzddr/Debug/app_mbzddr.elf
after 1000
#start microblaze
con

gets stdin

target 2
jtagterminal -stop

exit
