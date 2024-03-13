library ieee;
use ieee.std_logic_1164.all;

entity sum1b_tb is
end;

architecture sum1b_tb_arq of sum1b_tb is

	-- Declaracion de componente
	component sum1b is
		port(
			op1: in std_logic;
			op2: in std_logic;
			 ci: in std_logic;
			sal: out std_logic;
			 co: out std_logic
		);
	end component;
	
	-- Declaracion de senales de prueba
	signal op1_tb: std_logic := '0';
	signal op2_tb: std_logic := '0';
	signal ci_tb: std_logic := '0';
	signal sal_tb: std_logic;
	signal co_tb: std_logic;

begin

	-- op1_tb <= '1' after 100 ns, '0' after 500 ns;
	-- op2_tb <= '1' after 200 ns, '0' after 400 ns;
	-- ci_tb  <= '1' after 150 ns, '0' after 900 ns;
	op1_tb <= not op1_tb after 10 ns;
	op2_tb <= not op2_tb after 20 ns;
	ci_tb <= not ci_tb after 40 ns;

	DUT: sum1b
		port map(
			op1	=> op1_tb, 
			op2	=> op2_tb,
			 ci => ci_tb,
			sal	=> sal_tb,
			 co => co_tb
		);
	
end;
