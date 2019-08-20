library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity selector is
	port(ingreso,cambio: in std_logic_vector(3 downto 0);
			salida: out  std_logic_vector(3 downto 0);
			modo: in std_logic);
end selector;

architecture sol of selector is
begin
		process(modo)
			begin
				if modo='1' then 
					salida<= ingreso;
				else salida<=cambio;end if;
		end process;
end sol;