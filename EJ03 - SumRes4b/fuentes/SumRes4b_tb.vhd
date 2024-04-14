library ieee;
use ieee.std_logic_1164.all;

entity sumres4b_tb is
end;

architecture sumres4b_tb_arq of sumres4b_tb is
    
	-- Declaracion de componente
	component sumres4b is
        generic (N : natural := 4);
		port(
			op1: in std_logic_vector(N-1 downto 0);
			op2: in std_logic_vector(N-1 downto 0);
			 ci: in std_logic;
        sum_res: in std_logic;
			sal: out std_logic_vector(N-1 downto 0);
			 co: out std_logic
		);
	end component;

	constant N_tb : natural := 4;
	-- Declaracion de senales de prueba
	signal op1_tb: std_logic_vector(N_tb-1 downto 0) := "0000";
	signal op2_tb: std_logic_vector(N_tb-1 downto 0) := "0001";
	signal ci_tb: std_logic := '0';
    signal sum_res_tb: std_logic := '0';
	signal sal_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;

begin

	op1_tb <= "0011" after 100 ns, "0111" after 400 ns;
	op2_tb <= "0010" after 250 ns;
	--ci_tb <= '1' after 500 ns;
    sum_res_tb <= '1' after 600 ns;

	DUT: sumres4b
        generic map (N => N_tb)
		port map(
			op1	=> op1_tb, 
			op2	=> op2_tb,
			 ci => ci_tb,
            sum_res => sum_res_tb,
			sal	=> sal_tb,
			 co => co_tb
		);
	
end;