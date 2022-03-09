library ieee;
use ieee.std_logic_1164.all;

entity xorgate is
Port( A,B: in std_logic;
	E: out std_logic);
end xorgate;

architecture working of xorgate is
begin
E<=(A xor B);
end working;