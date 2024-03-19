library ieee;
use ieee.std_logic_1164.all;

entity contBCD is
  port
  (
    clk : in std_logic;
    rst : in std_logic;
    ena : in std_logic;
    sal : out std_logic_vector(3 downto 0);
    max : out std_logic
  );
end contBCD;

architecture contBCD_arch of contBCD is
begin


end contBCD_arch;