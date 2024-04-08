vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vcom -work xil_defaultlib -64 -93 \
"../../../../Gen_Onda_VIO_ILA.srcs/sources_1/ip/vio_0/sim/vio_0.vhd" \


