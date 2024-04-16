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
        o_squ: out std_logic
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
    
    COMPONENT vio_0
      PORT (
        clk : IN STD_LOGIC;
        probe_out0 : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
      );
    END COMPONENT;
    
    COMPONENT ila_0
    
    PORT (
        clk : IN STD_LOGIC;
        probe0 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); 
        probe1 : IN STD_LOGIC_VECTOR(11 DOWNTO 0); 
        probe2 : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        probe3 : IN STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
    END COMPONENT  ;
     
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
    
    vio_0_inst : vio_0
          PORT MAP (
            clk => i_clk,
            probe_out0 => probe_i_phase
          );
          
    ila_0_inst : ila_0
          PORT MAP (
              clk => i_clk,
              probe0 => probe_sin_out, 
              probe1 => probe_cos_out, 
              probe2 => probe_squ_out,
              probe3 => probe_saw_out
          );
          
    o_squ <= probe_squ_out(11);          
end;
