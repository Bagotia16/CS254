library ieee;
use ieee.std_logic_1164.all;

entity TwoByOneMux is
	port ( A : in std_logic;
	B : in std_logic;
	sel : in std_logic;
	z : out std_logic);
end entity;

architecture Struct of TwoByOneMux is

signal D,E,F: std_logic;
begin
D <= not(sel);
E <= (D And A);
F <= (sel And B);
z <= (E Or F);

end struct;
