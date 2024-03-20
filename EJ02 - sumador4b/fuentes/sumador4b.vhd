library ieee;
use ieee.std_logic_1164.all;

-- ****************************** --
-- Sumador de 4 bit --
-- ****************************** --
entity sum4b is
  port
  (
    op1 : in std_logic_vector(3 downto 0);
    op2 : in std_logic_vector(3 downto 0);
    ci  : in std_logic;
    sal : out std_logic_vector(3 downto 0);
    co  : out std_logic
  );
end sum4b;

architecture sum4b_arch of sum4b is

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

  signal aux : std_logic_vector(4 downto 0);

begin

  aux(0) <= ci;
 
  sum1b_0 : sum1b
    port map (
      op1 => op1(0) ,
      op2 => op2(0) ,
      ci  =>  ci    ,
      sal => sal(0) ,
      co  => aux(1)
    );

  sum1b_1 : sum1b
    port map (
      op1 => op1(1) ,
      op2 => op2(1) ,
      ci  => aux(1) ,
      sal => sal(1) ,
      co  => aux(2)
    );

  sum1b_2 : sum1b
    port map (
      op1 => op1(2) ,
      op2 => op2(2) ,
      ci  => aux(2) ,
      sal => sal(2) ,
      co  => aux(3)
    );  

  sum1b_3 : sum1b
    port map (
      op1 => op1(3) ,
      op2 => op2(3) ,
      ci  => aux(3) ,
      sal => sal(3) ,
      co  => aux(4)
    );

  co <= aux(4);

end sum4b_arch;