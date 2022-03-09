entity TestbenchNOTGate is
end TestbenchNOTGate;

architecture tb of TestbenchNOTGate is
	signal x : bit;  --inputs
	signal y: bit;		--outputs
	
	component NOTGate is
		port(
			a: in bit;
			b: out bit
		);
	end component;
	
begin
	NOTGate_instance: NOTGate
	port map(
		a=>x, 
		b=>y
	);

	process --inputs
	begin
		x <= '0';
		wait for 5 ns;
	
		x <= '1';
		wait for 5 ns;
	end process;
end tb;