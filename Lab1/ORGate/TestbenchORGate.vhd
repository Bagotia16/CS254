entity TestbenchORGate is
end TestbenchORGate;

architecture tb of TestbenchORGate is
	signal x,y : bit;  --inputs
	signal z: bit;		--outputs
	
	component ORGate is
		port(
			-- inputs
			a,b: in bit;
			-- output
			c: out bit
		);
	end component;
	
begin
	ORGate_instance: ORGate
	port map(
		a=>x, 
		b=>y, 
		c=>z
	);

	process --inputs
	begin
		x <= '0';
		y <= '0';
		wait for 5 ns;
	
		x <= '0';
		y <= '1';
		wait for 5 ns;
		
		x <= '1';
		y <= '0';
		wait for 5 ns;
		
		x <= '1';
		y <= '1';
		wait for 5 ns;
		
	end process;
end tb;
