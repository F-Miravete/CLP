----------------------------------------------------------------------
--                                                                  --
--  CESE CO20 Asignatura: Circuitos Logicos Programables (FPGA)     --
--                                                                  --
----------------------------------------------------------------------
--                                                                  --
--    Filename            : nco12_tb.vhd                            --
--                                                                  --
--    Author              : Flavio Miravete                         --
--                                                                  --
--    Date last modified  : 6.4.2024                                --
--                                                                  --
--    Description         : Oscilador Controlado Numericamente TB   --
--                          12 bits                                 --
--                                                                  --
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nco12_tb is
end;

architecture nco12_tb_arq of nco12_tb is

	-- Declaracion de componente
	component nco12 is
		port(
			i_clk             : in  std_logic;
            i_rst             : in  std_logic;
            i_fcw             : in  std_logic_vector(11 downto 0);
            o_nco             : out std_logic_vector(11 downto 0));
	end component;

    -- Declaracion de senales de prueba
	signal i_clk_tb: std_logic :='0';
	signal i_rst_tb: std_logic := '0';
	signal i_fcw_tb: std_logic_vector(11 downto 0) := "000000100000";
	signal o_nco_tb: std_logic_vector(11 downto 0);

begin

    i_clk_tb <= not i_clk_tb after 5 ns; 
    i_rst_tb <= '1' after 20 ns;
    i_fcw_tb <= "000100000000" after 3000 ns;
    
    DUT: nco12
		port map(
			i_clk	=> i_clk_tb, 
			i_rst	=> i_rst_tb,
			i_fcw	=> i_fcw_tb,
			o_nco   => o_nco_tb
		);
	
end;