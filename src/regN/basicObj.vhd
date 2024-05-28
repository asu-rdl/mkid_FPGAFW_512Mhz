library ieee; 
use ieee.std_logic_1164.all;

package basic_obj is
  component and2 is
    port ( a, b : in std_logic; y: out std_logic);
  end component and2;

  component regN is
    generic ( width : positive := 4);
    port ( data_in : in std_logic_vector(width - 1 downto 0);
       en, clk, rst : in std_logic;
       data_out : out std_logic_vector(width - 1 downto 0) );
  end component regN;

  component d_ff is
    port ( d, clk, rst : in std_logic; q: out std_logic);
  end component d_ff;


end package basic_obj;

------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;

entity and2 is
  port ( a, b : in std_logic; y: out std_logic);
end and2;

architecture basic of and2 is
begin
  y <= a and b; -- after 2 ns;

end architecture basic;


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
use work.basic_obj.all;

entity regN is
  generic ( width : positive := 4);
  port ( data_in : in std_logic_vector(width - 1 downto 0);
     en, clk, rst : in std_logic;
     data_out : out std_logic_vector(width - 1 downto 0) );
end entity regN;

architecture struct of regN is 
  signal int_clk : std_logic;
begin
  reg_array : for bit_index in 0 to width - 1 generate
  begin 
    reg : d_ff
      port map (data_in(bit_index), int_clk, rst, data_out(bit_index));
  end generate reg_array;
  gate : and2
    port map (en, clk, int_clk);
end architecture struct;


------------------------------------------------------------------------------
------------------------------------------------------------------------------
------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;

entity d_ff is
  port ( d, clk, rst : in std_logic; q: out std_logic);
end d_ff;

architecture basic of d_ff is
begin
  ff_behaviour : process(clk,rst) is
  begin
    if (rst='1') then
      q <= '0';
    elsif (rising_edge(clk)) then
      q <= d;
    end if;
  end process ff_behaviour;
end architecture basic;
