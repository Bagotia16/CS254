library ieee;
use ieee.std_logic_1164.all;

entity ORGate is
	port(	
		-- inputs
		A,B: in std_logic;
		-- output
		C: out std_logic
	);
end entity ORGate;

architecture Struct of ORGate is
begin
	-- OR Gate
	C <= (A or B);
end Struct;