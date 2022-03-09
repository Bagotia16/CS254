library ieee;
use ieee.std_logic_1164.all;

entity TwobitUpCount is
port ( clk, rst : in std_logic;
count: out std_logic_vector (1 downto 0));
end entity;

architecture struct of TwobitUpCount is

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

component DFlipFlop is
	port (clk, rst, d: in std_logic; q: out std_logic);
end component;

signal del2,del1,del0 : std_logic;
signal q0,q1,q2 : std_logic:='0';
signal x: std_logic_vector(5 downto 0);
signal nrst: std_logic;
--signal dff0,dff1,dff2: std_logic;

begin
	notreset: notgate port map(rst,nrst);
	N1: notgate port map(q0,x(0));
	d0: andgate port map(x(0),nrst,del0);
	dff0: DFlipFlop port map(clk,rst,del0,q0);
	
	N2: notgate port map(q2,x(1));
	O1: orgate port map(q0,q1,x(2));
	A1: andgate port map(x(1),x(2),x(3));
	d1: andgate port map(x(3),nrst,del1);
	dff1: DFlipFlop port map(clk,rst,del1,q1);
	
	O2: orgate port map(q0,q2,x(4));
	A2: andgate port map(x(4),q1,x(5));
	d2: andgate port map(x(5),nrst,del2);
	dff2: DFlipFlop port map(clk,rst,del2,q2);
	
	count(0) <= q0;
	count(1) <= q1;
	
end architecture;
	
	
	
	