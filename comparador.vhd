library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	Port(a0,a1,a2,a3,a4: in std_logic_vector(3 downto 0);
		  b0,b1,b2,b3,b4: in std_logic_vector(3 downto 0);
		  igual: out std_logic);
end comparador;

architecture arch of comparador 	is
Begin
	igual <= '1' when (a0=b0) and (a1=b1) and (a2=b2) and (a3=b3) and (a4=b4) else '0';
end arch;