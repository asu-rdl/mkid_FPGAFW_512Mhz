-- edge detection
library ieee; use ieee.std_logic_1164.all; use ieee.numeric_std.all;

entity edge_detect is
  port ( input  : in std_logic;
         clk    : in std_logic;
         rst    : in std_logic;
         output : out std_logic
       );
end entity edge_detect;

architecture struct of edge_detect is
  signal delay1_out : std_logic;
  signal inv_delay1_out : std_logic;
  signal and_out : std_logic;
begin
  inv_delay1_out <= not(delay1_out);
  -- output and gate
  and_1 : entity work.and2(basic)
    port map(input,inv_delay1_out,and_out);

  -- one cycle delay
  reg1 : entity work.d_ff(basic)
    port map ( input, clk, rst, delay1_out);
  
  -- one cycle delay
  reg2 : entity work.d_ff(basic)
    port map ( and_out, clk, rst, output);

end architecture struct;
