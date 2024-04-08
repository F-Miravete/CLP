----------------------------------------------------------------------
--                                                                  --
--  CESE CO20 Asignatura: Circuitos Logicos Programables (FPGA)     --
--                                                                  --
----------------------------------------------------------------------
--                                                                  --
--    Filename            : waveGenerator.vhd                       --
--                                                                  --
--    Author              : Flavio Miravete                         --
--                                                                  --
--    Date last modified  : 6.4.2024                                --
--                                                                  --
--    Description         : Generador de Onda                       --
--                          SIN/COS/SQUARE/SAWTOOTH (12 bits)       --
--                                                                  --
----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity waveGenerator is

port (
  i_clk       : in  std_logic;
  i_rst       : in  std_logic;
  i_en        : in  std_logic;
  i_phase     : in  std_logic_vector(11 downto 0); -- NCO incremento de fase
  
  sin_out     : out std_logic_vector(11 downto 0);
  cos_out     : out std_logic_vector(11 downto 0);
  squ_out     : out std_logic_vector(11 downto 0);
  saw_out     : out std_logic_vector(11 downto 0) );
  
end entity;

architecture waveGenerator_arch of waveGenerator is

    component sincos_rom
        port (
            i_clk      : in  std_logic;
            i_en       : in  std_logic;
            i_addr     : in  std_logic_vector(11 downto 0);
            o_sin      : out std_logic_vector(11 downto 0);
            o_cos      : out std_logic_vector(11 downto 0) ); 
    end component;
    
    signal  nco_out       : std_logic_vector(11 downto 0);
    signal  rom_addr      : std_logic_vector(11 downto 0);
    signal  rom_addr_reg  : std_logic_vector(11 downto 0);
    
    begin
    
    --------------------------------------------------------------------------
    -- Formula del oscilador NCO : i_phase = (Fout / Fclk)*2^12             --
    --                                                                      --
    -- E.g. Fout = 1,56MHz, Fclk = 100MHz,  i_phase = (1,56/100)*4096 = 64  --
    --                                                                      --    
    --------------------------------------------------------------------------
    
    proc_nco12: process(i_clk, i_rst)
    begin
        if i_rst = '0' then
            nco_out <= (others => '0');
        elsif i_clk'event and i_clk = '1' then
            if i_en = '1' then
                nco_out <= unsigned(nco_out) + unsigned(i_phase); 
            end if;
        end if;
    end process proc_nco12;
    
    rom_addr <= nco_out;
    
    ----------------------------------------------------------------------
    -- SIN/COS ROM es una LUT de 4096 x 12-bit                          --
    -- 12-bit permite amplitudes entre 2047 y -2047                     --
    ----------------------------------------------------------------------
    
    rom: sincos_rom
    
      port map (
        i_clk   => i_clk,
        i_en    => i_en,
        i_addr  => rom_addr,
        o_sin   => sin_out,
        o_cos   => cos_out );
    
    delay_regs: process(i_clk)
    begin
      if i_clk'event and i_clk = '1' then
        if i_en = '1' then
          rom_addr_reg <= rom_addr;
        end if;
      end if;
    end process delay_regs;
    
    --------------------------------------------------------------
    -- Onda cuadrada generada desde el bit MSb del acumulador   --
    --------------------------------------------------------------
    
    squ_out <= "011111111111" when rom_addr_reg(11) = '1' else "100000000000";
    
    --------------------------------------------------------------
    -- Onda diente de sierra generada desde el acumulador       --
    --------------------------------------------------------------
    
    saw_out <= rom_addr_reg;
        
end waveGenerator_arch;