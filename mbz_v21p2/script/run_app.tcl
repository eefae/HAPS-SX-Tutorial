# XSCT Command
# Launch hw_server and connect use url:TCP:127.0.0.1:3121
connect
after 3000

# Select MicroBlaze Debug Module
target -set -filter  {name =~ "MicroBlaze Debug Module*"}

# Open Jtage terminal
jtagterminal -start
after 1000

# Select MicroBlaze
target -set -filter {name =~ "MicroBlaze #*"}
after 1000

# Download ELF file
dow ./ws_vitis/app_mbzhello/Debug/app_mbzhello.elf
after 1000

# Run the app on MicroBlaze
con
after 1000

# Stop the app
gets stdin

# Close the Jtage terminal
target -set -filter  {name =~ "MicroBlaze Debug Module*"}
jtagterminal -stop

exit
