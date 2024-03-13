library ieee;
use ieee.std_logic_1164.all;

-- ****************************** --
-- Sumador de 1 bit --
-- ****************************** --
entity sum1b is
  port
  (
    op1 : in std_logic;
    op2 : in std_logic;
    ci  : in std_logic;
    sal : out std_logic;
    co  : out std_logic
  );
end sum1b

architecture sum1b_arch of sum1b is
begin
  sal <= op1 xor op2 xor ci;
  co  <= (op1 and op2) or (op1 and ci) or (op2 and ci);
end;