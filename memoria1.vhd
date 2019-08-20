library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity memoria1 is
	port(data: in std_logic_vector(3 downto 0);
	clock,reset,modo: in std_logic;
	q0,q1,q2,q3,q4: buffer std_logic_vector(3 downto 0);
	cinco:out std_logic);
end memoria1;
architecture sol of memoria1 is
signal lugar: std_logic_vector(4 downto 0);
begin
	PROCESS(clock,reset)
		BEGIN
			if reset='0' then q0<="0000";q1<="0000";q2<="0000";q3<="0000";
						q4<="0000";lugar<="00000";cinco<='0';
			elsif (clock'event and clock='1') then
					if modo='1' then--escritura
						if lugar="00101" then lugar<="00000";cinco<='1';
						elsif lugar="00000" then q0<=data;lugar<=lugar+1;cinco<='0';
						elsif lugar="00001" then q1<=data;lugar<=lugar+1;cinco<='0';
						elsif lugar="00010" then q2<=data;lugar<=lugar+1;cinco<='0';
						elsif lugar="00011" then q3<=data;lugar<=lugar+1;cinco<='0';
						elsif lugar="00100" then q4<=data;lugar<=lugar+1;
								end if;
			end if;end if;
	end process;
end sol;