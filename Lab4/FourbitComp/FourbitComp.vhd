library ieee;
use ieee.std_logic_1164.all;

entity FourbitComp is
port ( a, b : in std_logic_vector (1 downto 0);
l, g, e : out std_logic);
end entity;

architecture struct of FourbitComp is

component TwoByOneMux is
	port ( X,Y : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end component;

signal s: std_logic_vector(11 downto 0);

begin

--a>b: a1.~b1 + a0.~b0(a1+~b1)
M1: TwoByOneMux port map(a(1),'0',b(1),s(0));
M2: TwoByOneMux port map(a(0),'0',b(0),s(1));
M3: TwoByOneMux port map('1',a(1),b(1),s(2));
M4: TwoByOneMux port map('0',s(1),s(2),s(3));
M5: TwoByOneMux port map(s(0),'1',s(3),g);

--a<b: ~a1.b1 + ~a0.b0(~a1+b1)
M6: TwoByOneMux port map(b(1),'0',a(1),s(4));
M7: TwoByOneMux port map(b(0),'0',a(0),s(5));
M8: TwoByOneMux port map('1',b(1),a(1),s(6));
M9: TwoByOneMux port map('0',s(5),s(6),s(7));
M10: TwoByOneMux port map(s(4),'1',s(7),l);

--a=b: (a0b0 + ~a0.~b0).(a1.b1 + ~a1.~b1)
M11: TwoByOneMux port map('1','0',b(0),s(8));
M12: TwoByOneMux port map(s(8),b(0),a(0),s(9));
M13: TwoByOneMux port map('1','0',b(1),s(10));
M14: TwoByOneMux port map(s(10),b(1),a(1),s(11));
M15: TwoByOneMux port map('0',s(9),s(11),e);

end architecture;
