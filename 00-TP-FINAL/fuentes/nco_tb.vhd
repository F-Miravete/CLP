library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nco8_tb is
end;

architecture nco8_tb_arq of nco8_tb is

	-- Declaracion de componente
	component nco8 is
		port(
			i_clk             : in  std_logic;
            i_rstb            : in  std_logic;
            i_sync_reset      : in  std_logic;
            i_fcw             : in  std_logic_vector(7 downto 0);
            o_nco             : out std_logic_vector(7 downto 0));
	end component;

    -- Declaracion de senales de prueba
	signal i_clk_tb: std_logic ='0';
	signal i_rstb_tb: std_logic = '0';
	signal i_sync_reset_tb: std_logic := '1';
	signal i_fcw_tb: std_logic_vector(7 downto 0) = "00000100";
	signal o_nco_tb: std_logic_vector(7 downto 0);

begin

    i_clk_tb <= not i_clk_tb after 5 ns; 
    i_sync_reset_tb <= '0' after 20 ns;

    DUT: nco8
		port map(
			i_clk	=> i_clk_tb, 
			i_rstb	=> i_rstb_tb,
			i_sync_reset => i_sync_reset_tb,
			i_fcw	=> i_fcw_tb,
			o_nco => o_nco_tb
		);
	
end;
