library ieee;
use ieee.std_logic_1164.all;

-- ****************************** --
-- Sumador Restador de 4 bit      --
-- ****************************** --
entity sumres4b is
  generic (N : positive := 4);
  port
  (
    op1     : in std_logic_vector(N-1 downto 0);
    op2     : in std_logic_vector(N-1 downto 0);
    ci      : in std_logic;
    sum_res : in std_logic; 
    sal     : out std_logic_vector(N-1 downto 0);
    co      : out std_logic
  );
end sumres4b;

architecture sumres4b_arch of sumres4b is

  component sum1b is
    port
    (
      op1 : in std_logic;
      op2 : in std_logic;
      ci  : in std_logic;
      sal : out std_logic;
      co  : out std_logic
    );
  end component; 

  signal aux : std_logic_vector(N downto 0);
  signal auxB: std_logic_vector(N downto 0);

begin

  -- aux(0) <= ci;
  auxB(0) <= op2(0) xor sum_res;
  sum1b_0 : sum1b
    port map (
      op1 => op1(0),
      op2 => auxB(0),
      ci  => sum_res,
      sal => sal(0),
      co  => aux(1)
    );

  auxB(1) <= op2(1) xor sum_res;
  sum1b_1 : sum1b
    port map (
      op1 => op1(1) ,
      op2 => auxB(1) ,
      ci  => aux(1) ,
      sal => sal(1) ,
      co  => aux(2)
    );

  auxB(2) <= op2(2) xor sum_res;
  sum1b_2 : sum1b
    port map (
      op1 => op1(2) ,
      op2 => auxB(2) ,
      ci  => aux(2) ,
      sal => sal(2) ,
      co  => aux(3)
    );  

  auxB(3) <= op2(3) xor sum_res;
  sum1b_3 : sum1b
    port map (
      op1 => op1(3) ,
      op2 => auxB(3) ,
      ci  => aux(3) ,
      sal => sal(3) ,
      co  => aux(4)
    );

  co <= aux(4);

end sumres4b_arch;