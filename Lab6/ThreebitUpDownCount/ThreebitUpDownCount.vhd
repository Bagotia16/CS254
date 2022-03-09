library ieee;
use ieee.std_logic_1164.all;

entity ThreebitUpDownCount is
port ( clk, rst, up : in std_logic;
count : out std_logic_vector (2 downto 0));
end entity;

architecture struct of ThreebitUpDownCount is 

component andgate is
Port( A,B: in std_logic;
	E: out std_logic);
end component;

component orgate is
Port( A,B: in std_logic;
	E: out std_logic);
end component;

component notgate is
Port(A: in std_logic;
B: out std_logic);
end component;

component xorgate is
Port( A,B: in std_logic;
	E: out std_logic);
end component;

component and3gate is
Port(A,B,C: in std_logic;
	D: out std_logic);
end component;

component and4gate is
Port(A,B,C,D: in std_logic;
	E: out std_logic);
end component;

component or3gate is
Port(A,B,C: in std_logic;
	D: out std_logic);
end component;

component DFlipFlop is
	port (clk, rst, d: in std_logic; q: out std_logic);
end component;

signal del2,del1,del0 : std_logic;
signal q0,q1,q2 : std_logic:='0';
signal nrst: std_logic;
signal x: std_logic_vector(11 downto 0);
signal w: std_logic;

begin
	notreset: notgate port map(rst,nrst);
	N0: notgate port map(up,w);
	N1: notgate port map(q0,x(0));
	N2: notgate port map(q1,x(1));
	N3: notgate port map(q2,x(2));

	d0: andgate port map(x(0),nrst,del0);
	dff0: DFlipFlop port map(clk,rst,del0,q0);
	
	X1: xorgate port map(q1,q0,x(3));
	X2: xorgate port map(w,x(3),x(4));
	d1: andgate port map(x(4),nrst,del1);
	dff1: DFlipFlop port map(clk,rst,del1,q1);
	
	A6: and4gate port map(w,x(2),x(1),x(0),x(5));
	A7: and4gate port map(up,x(2),q1,q0,x(6));
	A8: and3gate port map(w,q2,q0,x(7));
	A9: and3gate port map(up,q2,x(1),x(8));
	A10: and3gate port map(q2,q1,x(0),x(9));
	O3: or3gate port map(x(5),x(6),x(7),x(10));
	O4: or3gate port map(x(10),x(8),x(9),x(11));
	d2: andgate port map(x(11),nrst,del2);
	dff2: DFlipFlop port map(clk,rst,del2,q2);
	
	count(0) <= q0;
	count(1) <= q1;
	count(2) <= q2;
	
end architecture;
	
	
	
	
	