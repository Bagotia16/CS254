library ieee;
use ieee.std_logic_1164.all;

entity FourbitFullAdd is
port ( a, b : in std_logic_vector (3 downto 0);
cin: in std_logic;
sum : out std_logic_vector (3 downto 0);
carry: out std_logic);
end entity;

architecture struct of FourbitFullAdd is

component OnebitFullAdd is
port ( a, b, cin : in std_logic;
sum, carry: out std_logic);
end component;

signal x: std_logic_vector (2 downto 0);

begin

F1: OnebitFullAdd port map(a(0),b(0),cin,sum(0),x(0));
F2: OnebitFullAdd port map(a(1),b(1),x(0),sum(1),x(1));
F3: OnebitFullAdd port map(a(2),b(2),x(1),sum(2),x(2));
F4: OnebitFullAdd port map(a(3),b(3),x(2),sum(3),carry);

end architecture;

