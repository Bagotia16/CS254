library ieee;
use ieee.std_logic_1164.all;

entity ANDGate is
	port(
		-- inputs
		A,B: in std_logic;
		-- output
		C: out std_logic
	);
end entity ANDGate;

architecture Struct of ANDGate is
begin
	-- AND Gate
	C <= (A and B);
end Struct;