library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.all;

entity matrixsalida is
	port(fila1,fila2,fila3,fila4,fila5,fila6,fila7,fila8: in std_logic_vector(7 downto 0);
			fila: out std_logic_vector(7 downto 0);
			clock,selector,reset: in std_logic;
			salida: out std_logic_vector(7 downto 0));--salida es columna
end matrixsalida;

architecture sol of matrixsalida is
signal r: std_logic_vector(2 downto 0);
begin
	PROCESS(clock,reset)
		BEGIN
			if reset='0' then
				r<="000";
			elsif (clock'event and clock='1') then
				if(selector='1') then
					if (r="000") then r<=r+"001"; salida<="10000000";fila<=fila1;
					elsif (r="001") then r<=r+"001"; salida<="01000000";fila<=fila2;
					elsif (r="010") then r<=r+"001"; salida<="00100000";fila<=fila3;
					elsif (r="011") then r<=r+"001"; salida<="00010000";fila<=fila4;
					elsif (r="100") then r<=r+"001"; salida<="00001000";fila<=fila5;
					elsif (r="101") then r<=r+"001"; salida<="00000100";fila<=fila6;
					elsif (r="110") then r<=r+"001"; salida<="00000010";fila<=fila7;
					elsif (r="111") then r<=r+"001"; salida<="00000001";fila<=fila8;
				elsif (r>"111")then r<="000";
				else salida<="00000000";fila<="00000000";
					end if;
				end if;
			end if;
	end process;
end sol;