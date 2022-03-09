library ieee;
use ieee.std_logic_1164.all;

entity EightbitKogStonAddSub is
port ( a, b : in std_logic_vector (7 downto 0);
cin: in std_logic;
sum: out std_logic_vector (7 downto 0);
cout: out std_logic);
end entity;

architecture struct of EightbitKogStonAddSub is

component AndGate is
	port( a,b : in std_logic;
	c : out std_logic);
end component;

component OrGate is
	port( a,b : in std_logic;
	c : out std_logic);
end component;

component XorGate is
	port( a,b : in std_logic;
	c : out std_logic);
end component;

signal l: std_logic_vector(7 downto 0);
signal c: std_logic_vector(7 downto 1);
signal p: std_logic_vector(7 downto 0);
signal g: std_logic_vector(7 downto 0);

signal Prop: std_logic_vector(17 downto 0);
signal Gen: std_logic_vector(17 downto 0);
signal x: std_logic_vector(17 downto 0);

begin
	b0: XorGate port map(cin,b(0),l(0));
	b1: XorGate port map(cin,b(1),l(1));
	b2: XorGate port map(cin,b(2),l(2));
	b3: XorGate port map(cin,b(3),l(3));
	b4: XorGate port map(cin,b(4),l(4));
	b5: XorGate port map(cin,b(5),l(5));
	b6: XorGate port map(cin,b(6),l(6));
	b7: XorGate port map(cin,b(7),l(7));

	g0: AndGate port map(a(0),l(0),g(0));
	g1: AndGate port map(a(1),l(1),g(1));
	g2: AndGate port map(a(2),l(2),g(2));
	g3: AndGate port map(a(3),l(3),g(3));
	g4: AndGate port map(a(4),l(4),g(4));
	g5: AndGate port map(a(5),l(5),g(5));
	g6: AndGate port map(a(6),l(6),g(6));
	g7: AndGate port map(a(7),l(7),g(7));
	
	p0: XorGate port map(a(0),l(0),p(0));
	p1: XorGate port map(a(1),l(1),p(1));
	p2: XorGate port map(a(2),l(2),p(2));
	p3: XorGate port map(a(3),l(3),p(3));
	p4: XorGate port map(a(4),l(4),p(4));
	p5: XorGate port map(a(5),l(5),p(5));
	p6: XorGate port map(a(6),l(6),p(6));
	p7: XorGate port map(a(7),l(7),p(7));
	
	And01: AndGate port map(p(0),cin,x(0));
	And02: AndGate port map(p(0),'1',Prop(0));
	Or0: OrGate port map(g(0),x(0),Gen(0));
	And11: AndGate port map(p(1),g(0),x(1));
	And12: AndGate port map(p(1),p(0),Prop(1));
	Or1: OrGate port map(g(1),x(1),Gen(1));
	And21: AndGate port map(p(2),g(1),x(2));
	And22: AndGate port map(p(2),p(1),Prop(2));
	Or2: OrGate port map(g(2),x(2),Gen(2));
	And31: AndGate port map(p(3),g(2),x(3));
	And32: AndGate port map(p(3),p(2),Prop(3));
	Or3: OrGate port map(g(3),x(3),Gen(3));
	And41: AndGate port map(p(4),g(3),x(4));
	And42: AndGate port map(p(4),p(3),Prop(4));
	Or4: OrGate port map(g(4),x(4),Gen(4));
	And51: AndGate port map(p(5),g(4),x(5));
	And52: AndGate port map(p(5),p(4),Prop(5));
	Or5: OrGate port map(g(5),x(5),Gen(5));
	And61: AndGate port map(p(6),g(5),x(6));
	And62: AndGate port map(p(6),p(5),Prop(6));
	Or6: OrGate port map(g(6),x(6),Gen(6));
	And71: AndGate port map(p(7),g(6),x(7));
	And72: AndGate port map(p(7),p(6),Prop(7));
	Or7: OrGate port map(g(7),x(7),Gen(7));
	And81: AndGate port map(Prop(2),Gen(0),x(8));
	And82: AndGate port map(Prop(2),Prop(0),Prop(8));
	Or8: OrGate port map(Gen(2),x(8),Gen(8));
	And91: AndGate port map(Prop(3),Gen(1),x(9));
	And92: AndGate port map(Prop(3),Prop(1),Prop(9));
	Or9: OrGate port map(Gen(3),x(9),Gen(9));
	And101: AndGate port map(Prop(4),Gen(2),x(10));
	And102: AndGate port map(Prop(4),Prop(2),Prop(10));
	Or10: OrGate port map(Gen(4),x(10),Gen(10));
	And111: AndGate port map(Prop(5),Gen(3),x(11));
	And112: AndGate port map(Prop(5),Prop(3),Prop(11));
	Or11: OrGate port map(Gen(5),x(11),Gen(11));
	And121: AndGate port map(Prop(6),Gen(4),x(12));
	And122: AndGate port map(Prop(6),Prop(4),Prop(12));
	Or12: OrGate port map(Gen(6),x(12),Gen(12));
	And131: AndGate port map(Prop(7),Gen(5),x(13));
	And132: AndGate port map(Prop(7),Prop(5),Prop(13));
	Or13: OrGate port map(Gen(7),x(13),Gen(13));
	And141: AndGate port map(Prop(10),Gen(0),x(14));
	And142: AndGate port map(Prop(10),Prop(0),Prop(14));
	Or14: OrGate port map(Gen(10),x(14),Gen(14));
	And151: AndGate port map(Prop(11),Gen(1),x(15));
	And152: AndGate port map(Prop(11),Prop(1),Prop(15));
	Or15: OrGate port map(Gen(11),x(15),Gen(15));
	And161: AndGate port map(Prop(12),Gen(2),x(16));
	And162: AndGate port map(Prop(12),Prop(2),Prop(16));
	Or16: OrGate port map(Gen(12),x(16),Gen(16));
	And171: AndGate port map(Prop(13),Gen(3),x(17));
	And172: AndGate port map(Prop(13),Prop(3),Prop(17));
	Or17: OrGate port map(Gen(13),x(17),Gen(17));
	
	c(1) <= Gen(0);
	c(2) <= Gen(1);
	c(3) <= Gen(8);
	c(4) <= Gen(9);
	c(5) <= Gen(14);
	c(6) <= Gen(15);
	c(7) <= Gen(16);
	cout <= Gen(17);
	
	Sum0: XorGate port map(p(0),cin,sum(0));
	Sum1: XorGate port map(p(1),c(1),sum(1));
	Sum2: XorGate port map(p(2),c(2),sum(2));
	Sum3: XorGate port map(p(3),c(3),sum(3));
	Sum4: XorGate port map(p(4),c(4),sum(4));
	Sum5: XorGate port map(p(5),c(5),sum(5));
	Sum6: XorGate port map(p(6),c(6),sum(6));
	Sum7: XorGate port map(p(7),c(7),sum(7));
	
end struct;

	
	
	
	
	
	
	