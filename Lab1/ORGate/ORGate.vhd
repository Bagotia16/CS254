entity ORGate is
	port(	
		-- inputs
		A,B: in bit;
		-- output
		C: out bit
	);
end entity ORGate;

architecture Struct of ORGate is
begin
	-- OR Gate
	C <= (A or B);
end Struct;
