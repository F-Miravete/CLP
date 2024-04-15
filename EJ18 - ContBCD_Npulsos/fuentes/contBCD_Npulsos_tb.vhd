library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- --------------------------------------------------------------------------------------
-- Contador BCD de 1 digito (Reset sincronico) Test Bench
-- --------------------------------------------------------------------------------------

entity contBCD_Npulsos_tb is 
end;

architecture contBCD_Npulsos_tb_arch of contBCD_Npulsos_tb is 
    component contBCD_Npulsos is 
        port(
            i_rst: in std_logic;
            i_ena: in std_logic;
            i_clk: in std_logic;
            o_sal: out std_logic_vector(3 downto 0);
            o_ovf: out std_logic
        );
    end component;

    signal i_clk_tb: std_logic := '0';
    signal i_rst_tb: std_logic := '0';
    signal i_ena_tb: std_logic := '1';
    signal o_sal_tb: std_logic_vector(3 downto 0);
    signal o_ovf_tb: std_logic;

begin
    i_clk_tb <= not i_clk_tb after 10 ns;
    i_rst_tb <= '1' after 65 ns, '0' after 75 ns;
    i_ena_tb <= '0' after 200 ns, '1' after 300 ns;

    DUT: contBCD_Npulsos
    port map(
        i_clk => i_clk_tb,
        i_rst => i_rst_tb,
        i_ena => i_ena_tb,
        o_sal => o_sal_tb,
        o_ovf => o_ovf_tb
    );
end architecture;
