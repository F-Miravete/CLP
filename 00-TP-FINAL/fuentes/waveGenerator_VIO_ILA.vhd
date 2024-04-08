----------------------------------------------------------------------
--                                                                  --
--  CESE CO20 Asignatura: Circuitos Logicos Programables (FPGA)     --
--                                                                  --
----------------------------------------------------------------------
--                                                                  --
--    Filename            : waveGenerator_VIO_ILA.vhd               --
--                                                                  --
--    Author              : Flavio Miravete                         --
--                                                                  --
--    Date last modified  : 8.4.2024                                --
--                                                                  --
--    Description         : Generador de Onda                       --
--                          SIN/COS/SQUARE/SAWTOOTH (12 bits)       --
--                                                                  --
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity waveGenerator_VIO_ILA is
    port(
        i_clk: in std_logic;
        i_rst: in std_logic;
        i_en : in std_logic;
    );
end;

architecture waveGenerator_VIO_ILA_arch of waveGenerator_VIO_ILA is

    component waveGenerator is
        port(
            i_clk       : in  std_logic;
            i_rst       : in  std_logic;
            i_en        : in  std_logic;
            i_phase     : in  std_logic_vector(11 downto 0);
            
            sin_out     : out std_logic_vector(11 downto 0);
            cos_out     : out std_logic_vector(11 downto 0);
            squ_out     : out std_logic_vector(11 downto 0);
            saw_out     : out std_logic_vector(11 downto 0)
        );
        end component;

    signal probe_i_phase: std_logic_vector(11 downto 0);
    signal probe_sin_out: std_logic_vector(11 downto 0);
    signal probe_cos_out: std_logic_vector(11 downto 0);
    signal probe_squ_out: std_logic_vector(11 downto 0);
    signal probe_saw_out: std_logic_vector(11 downto 0);

begin

    waveGenerator_inst: waveGenerator 
        port map(
            i_clk       => i_clk,
            i_rst       => i_rst,
            i_en        => i_en,
            i_phase     => probe_i_phase,
            
            sin_out     => probe_sin_out,
            cos_out     => probe_cos_out,
            squ_out     => probe_squ_out,
            saw_out     => probe_saw_out
        );
end;
