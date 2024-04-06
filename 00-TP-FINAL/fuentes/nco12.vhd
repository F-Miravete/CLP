----------------------------------------------------------------------
--                                                                  --
--  CESE CO20 Asignatura: Circuitos Logicos Programables (FPGA)     --
--                                                                  --
----------------------------------------------------------------------
--                                                                  --
--    Filename            : nco12.vhd                               --
--                                                                  --
--    Author              : Flavio Miravete                         --
--                                                                  --
--    Date last modified  : 6.4.2024                                --
--                                                                  --
--    Description         : Oscilador Controlado Numericamente      --
--                          12 bits                                 --
--                                                                  --
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity nco12 is
port (
    i_clk      : in  std_logic;
    i_rst      : in  std_logic;
    i_fcw      : in  std_logic_vector(11 downto 0);
    o_nco      : out std_logic_vector(11 downto 0));
end nco12;

architecture nco12_arch of nco12 is

signal r_fcw   : unsigned(11 downto 0);
signal r_nco   : unsigned(11 downto 0);

begin

p_nco12 : process(i_clk,i_rst)
begin
    if(i_rst='0') then
        r_fcw  <= (others=>'0');
        r_nco  <= (others=>'0');
    elsif(rising_edge(i_clk)) then
        r_fcw  <= unsigned(i_fcw);
        r_nco  <= r_nco + r_fcw;
    end if;
end process p_nco12;

o_nco <= std_logic_vector(r_nco);

end nco12_arch;