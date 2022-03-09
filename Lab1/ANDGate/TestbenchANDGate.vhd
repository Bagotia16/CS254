entity TestbenchANDGate is
end TestbenchANDGate;

architecture tb of TestbenchANDGate is
	signal x,y : bit;  --inputs
	signal z: bit;		--outputs
	
	component ANDGate is
		port(
			a,b: in bit;
			c: out bit
		);
	end component;
	
begin
	ANDGate_instance: ANDGate
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