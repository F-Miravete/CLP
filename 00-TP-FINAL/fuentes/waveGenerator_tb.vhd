----------------------------------------------------------------------
--                                                                  --
--  CESE CO20 Asignatura: Circuitos Logicos Programables (FPGA)     --
--                                                                  --
----------------------------------------------------------------------
--                                                                  --
--    Filename            : waveGenerator_tb.vhd                    --
--                                                                  --
--    Author              : Flavio Miravete                         --
--                                                                  --
--    Date last modified  : 6.4.2024                                --
--                                                                  --
--    Description         : Generador de Onda Test Bench            --
--                          SIN/COS/SQUARE/SAWTOOTH (12 bits)       --
--                                                                  --
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity waveGenerator_tb is
end;



--------------------------------------------------------



architecture waveGenerator_tb_arq of waveGenerator_tb is

	-- Declaracion de componente
	component waveGenerator is
		port(
			i_clk       : in  std_logic;
            i_rst       : in  std_logic;
            i_en        : in  std_logic;
            i_phase     : in  std_logic_vector(11 downto 0); -- NCO incremento de fase
  
            sin_out     : out std_logic_vector(11 downto 0);
            cos_out     : out std_logic_vector(11 downto 0);
            squ_out     : out std_logic_vector(11 downto 0);
            saw_out     : out std_logic_vector(11 downto 0) );
	end component;

    -- Declaracion de senales de prueba
	signal i_clk_tb  : std_logic :='0';
	signal i_rst_tb  : std_logic :='0';
    signal i_en_tb   : std_logic :='1';
	signal i_phase_tb: std_logic_vector(11 downto 0) := "000000100000";
	signal sin_out_tb: std_logic_vector(11 downto 0);
    signal cos_out_tb: std_logic_vector(11 downto 0);
    signal squ_out_tb: std_logic_vector(11 downto 0);
    signal saw_out_tb: std_logic_vector(11 downto 0);

begin

    i_clk_tb <= not i_clk_tb after 5 ns; 
    i_rst_tb <= '1' after 20 ns;
    i_phase_tb <= "000100000000" after 3000 ns;
    
    DUT: waveGenerator
		port map(
			i_clk	=> i_clk_tb, 
			i_rst	=> i_rst_tb,
            i_en    => i_en_tb,
			i_phase	=> i_phase_tb,
			sin_out => sin_out_tb,
            cos_out => cos_out_tb,
            squ_out => squ_out_tb,
            saw_out => saw_out_tb
		);
	
end;