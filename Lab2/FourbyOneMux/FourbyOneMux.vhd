library ieee;
use ieee.std_logic_1164.all;

entity FourbyOneMux is
port ( i : in std_logic_vector(3 downto 0);
	sel: in std_logic_vector(1 downto 0);
	z : out std_logic);
end entity;

architecture Struct of FourbyOneMux is
	component TwoByOneMux is
		port(i: in std_logic_vector(1 downto 0);
			  sel: in std_logic;
		     z:out std_logic);
	end component;
	
	signal x: std_logic_vector(1 downto 0);
	
	begin
	
		G1: TwoByOneMux port map(i(1 downto 0), sel(0), x(0));
		G2: TwoByOneMux port map(i(3 downto 2), sel(0), x(1));
		G3: TwoByOneMux port map(x(1 downto 0), sel(1), z);
		
	end Struct;
	