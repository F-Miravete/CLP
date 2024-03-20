library ieee;
use ieee.std_logic_1164.all;

entity sum4b_tb is
end;

architecture sum4b_tb_arq of sum4b_tb is

	-- Declaracion de componente
	component sum4b is
		port(
			op1: in std_logic_vector(3 downto 0);
			op2: in std_logic_vector(3 downto 0);
			 ci: in std_logic;
			sal: out std_logic_vector(3 downto 0);
			 co: out std_logic
		);
	end component;
	
	-- Declaracion de senales de prueba
	signal op1_tb: std_logic_vector(3 downto 0) := "0000";
	signal op2_tb: std_logic_vector(3 downto 0) := "0001";
	signal ci_tb: std_logic := '0';
	signal sal_tb: std_logic_vector(3 downto 0);
	signal co_tb: std_logic;

begin

	op1_tb <= "0011" after 100 ns, "0111" after 400 ns;
	op2_tb <= "1000" after 250 ns;
	ci_tb <= '1' after 500 ns;

	DUT: sum4b
		port map(
			op1	=> op1_tb, 
			op2	=> op2_tb,
			 ci => ci_tb,
			sal	=> sal_tb,
			 co => co_tb
		);
	
end;
