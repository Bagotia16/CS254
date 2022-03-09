entity NOTGate is
	port(	
		-- input
		A: in bit;
		-- output
		B: out bit
	);
end entity NOTGate;

architecture Struct of NOTGate is
begin
	-- NOT Gate
	B <= (not A);
end Struct;
