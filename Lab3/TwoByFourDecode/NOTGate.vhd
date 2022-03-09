library ieee;
use ieee.std_logic_1164.all;

entity NOTGate is
	port(	
		-- input
		A: in std_logic;
		-- output
		B: out std_logic
	);
end entity NOTGate;

architecture Struct of NOTGate is
begin
	-- NOT Gate
	B <= (not A);
end Struct;