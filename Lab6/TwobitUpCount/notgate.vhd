library ieee;
use ieee.std_logic_1164.all;

entity notgate is
Port(A: in std_logic;
B: out std_logic);
end notgate;

architecture struct of notgate is
begin
B<= not A;
end struct;

