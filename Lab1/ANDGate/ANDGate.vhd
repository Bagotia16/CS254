entity ANDGate is
	port(
		-- inputs
		A,B: in bit;
		-- output
		C: out bit
	);
end entity ANDGate;

architecture Struct of ANDGate is
begin
	-- AND Gate
	C <= (A and B);
end Struct;
