library ieee;
use ieee.std_logic_1164.all;

entity orgate is
Port( A,B: in std_logic;
	E: out std_logic);
end orgate;

architecture working of orgate is
begin
E<=(A or B);
end working;