library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- --------------------------------------------------------------------------------------
-- Contador BCD de 1 digito (Reset sincronico) con generador de habilitacion incorporado
--
-- Entradas: Reset                          : i_rst 
--           Habilitacion                   : i_ena
--           Clock                          : i_clk
--
-- Salidas: 1 digito BCD                    : o_sal 
-- --------------------------------------------------------------------------------------

entity contBCD_Npulsos is 
    port (
        i_rst: in std_logic;
        i_ena: in std_logic;
        i_clk: in std_logic;
        o_sal: out std_logic_vector(3 downto 0);
        o_ovf: out std_logic
    );
end;

architecture contBCD_Npulsos_arch of contBCD_Npulsos is 

    component genhab is
        generic(
            N: natural := 10
        );
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            q_o: out std_logic
        );
    end component;

    component contBCD_1D is 
        port(
            clk_i: in std_logic;
            rst_i: in std_logic;
            ena_i: in std_logic;
            sal_o: out std_logic_vector(3 downto 0);
            ovf_o: out std_logic
        ); 
    end component;

    signal clk_aux: std_logic;

begin

    GENERADOR_HAB: genhab
    generic map (N => 10)
    port map (
        clk_i => i_clk,
        rst_i => i_rst,
        ena_i => i_ena,
        q_o   => clk_aux
    );

    CONTADOR_BCD: contBCD_1D
    port map (
        clk_i => clk_aux,
		rst_i => i_rst,
		ena_i => i_ena,
		sal_o => o_sal,
        ovf_o => o_ovf
    );

end architecture;

