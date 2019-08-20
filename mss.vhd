--MSS de la maquina

LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
entity MSS is
	port	(clock, resetn, start, ingresar, cambiar,cincocambio,cinco,verde,correcto,tiempo,incorrecto,tres_segundos,cr,fin,seg_rojo: in std_logic;
			en_matrix,reset_ram,reset_ingreso,en_ledrojo,en_verde,modo_ram,modo_ingreso,reset_memoria1,modo_memoria1: out std_logic;
			led_correcto,led_error,uno,dos,tres,visto,x,ruido1,ruido2,contcambio,modo,en_guardar,guardado: out std_logic);
end MSS;

architecture sol of MSS is
type estado is (ta,tb,tc,td,te,tf,tg1,tg2,th,ti1,ti2,ti3,ti4,ti5,tj,tk,ts,tt,tr,tl,tp,tg,tq,tv,tu,tz);
signal y: estado;
begin
MSS_transiciones:process(resetn,clock)
	begin
		if (resetn='0') then y<=ta;
		elsif(clock'event and clock='1') then
			case y is
				when ta =>if start='1' then y<=tb;--presiono start
										else y<=ta;end if;
						when tb =>if start='0' then y<=tc;--suelto start
										else y<=tb;end if;
						when tc => y<=td;
						when td => if ingresar='1' then y<=te;
									elsif cambiar ='1' then y<=tp;
									else y<=td;end if;
						when te => if cinco = '1' then y<=tf;--espera a ingresar las 5 senales
									else y<=te;
									end if ;
						when tf => y<=tg;--3 intentos
						when tg => if correcto='1' then y<=th;
										elsif incorrecto='1' then y<=ti1;
										else y<=tg;
										end if ;
						when th => if verde='1' then y<=td;
										else y<=th;
										end if ;
						when ti1=> y<=ti2;--dos intentos
						when ti2=> if cinco = '1' then y<=tg1;--espera a ingresar las 5 senales
									else y<=ti2;
									end if ;
						when tg1=> if correcto='1' then y<=th;
										elsif incorrecto='1' then y<=ti3;
										else y<=tg1;
										end if ;
						when ti3=> y<=ti4;--1 intento
						when ti4=>  if cinco = '1' then y<=tg2;--espera a ingresar las 5 senales
									else y<=ti4;end if ;
									
						when tg2=> if correcto='1' then y<=th;
										elsif incorrecto='1' then y<=ti5;
										else y<=tg2;
										end if ;
						when ti5=> if tiempo='1' then y<=tj;
										else y<=ti5;--x
										end if ;
						when tj=> y<=tk;
						when tk=>  if tiempo='1' then y<=td;
										else y<=tl;--ruido1
										end if ;
						when tl=> 	y<=tk;--ruido2
						
						when tp=> if cinco='1' then y<=tq;
										else  y<=tp;
										end if ;
						when tq=> if cr='1' then y<=tr;
										elsif fin='1' then y<=ts;
										else y<=tq;
										end if ;
						when tr=> if seg_rojo='1' then y<=tz;
										else y<=tr;
										end if ;
						when ts=> y<=tt;
						when tt=> y<=tu;
						when tu=> if tres_segundos='1' then y<=tv;else y<=tu; end if;
						when tv=> y<=td;
						when tz=> y<=td;
						end case;
		end if;
end process;

MSS_salidas: process (y)
		begin--poner todas las salidas como cero para poder activar cada bloque en el estado que se desea
				reset_ingreso<='1';reset_ram<='1';reset_ingreso<='1'; modo_ingreso<='0'; tres<='0';dos<='0';led_error<='0';visto<='0';
				uno<='0'; x<='0';ruido1<='0';modo_ram<='0'; en_ledrojo<='0';modo_memoria1<='0';en_guardar<='0';guardado<='0';ruido2<='0';en_verde<='0';modo<='0';led_correcto<='0';contcambio<='0';
				case y is 
				when ta =>
				when tb =>
				when tc =>reset_ingreso<='0';reset_ram<='0';
				when td =>
				when te =>modo_ingreso<='1';tres<='1';
		      when tf =>
				when tg =>
            when tg1 =>dos<='1';
            when tg2=>uno<='1';
				when th =>en_verde<='1';visto<='1';reset_ingreso<='0';led_correcto<='1';
				when ti1=>dos<='1';reset_ingreso<='0';modo_ingreso<='1';		
				when ti2=>dos<='1';modo_ingreso<='1';		
				when ti3=>uno<='1';reset_ingreso<='0';
				when ti4=>uno<='1';modo_ingreso<='1';
				when ti5=>x<='1';led_error<='1';
				when tj=>reset_ingreso<='0';
				when tk=>ruido1<='1';
				when ts=>ruido2<='1';en_guardar<='1';guardado<='1';
				when tt=>ruido2<='1';modo_ram<='1';en_guardar<='1';guardado<='1';
				when tr=>en_ledrojo<='1';x<='1';led_error<='1';
				when tp=>modo_ingreso<='1';ruido2<='1';
				when tq=>contcambio<='1';modo_ram<='0';ruido2<='1';
				when tl=>ruido2<='1';
				when tu=>en_verde<='1';visto<='1';led_correcto<='1';
				when tv=>reset_ingreso<='0';
				when tz=>reset_ingreso<='0';
			end case;
end process;
end sol;