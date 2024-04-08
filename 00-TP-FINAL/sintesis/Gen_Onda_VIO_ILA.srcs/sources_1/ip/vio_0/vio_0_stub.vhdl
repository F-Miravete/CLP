-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
-- Date        : Mon Apr  8 18:57:04 2024
-- Host        : md3hrntc running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/01 - ELECTRONICA/Especializaciones/CESE/10 Circuitos Logicos
--               Programables/Practicas/CLP/00-TP-FINAL/sintesis/Gen_Onda_VIO_ILA.srcs/sources_1/ip/vio_0/vio_0_stub.vhdl}
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_out0 : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_out0[11:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2018.1";
begin
end;
