-- Inicialize Tipos

	INSERT INTO public.tbltipo VALUES (1, 'Fuego');    
	INSERT INTO public.tbltipo VALUES (2, 'Agua');    
	INSERT INTO public.tbltipo VALUES (3, 'Planta');    
	INSERT INTO public.tbltipo VALUES (4, 'Electrico');    
	INSERT INTO public.tbltipo VALUES (5, 'Tierra');    
	INSERT INTO public.tbltipo VALUES (6, 'Aire');    
	INSERT INTO public.tbltipo VALUES (7, 'Psiquico');    
	INSERT INTO public.tbltipo VALUES (8, 'Fantasma');    
	INSERT INTO public.tbltipo VALUES (9, 'Bicho');    
	INSERT INTO public.tbltipo VALUES (10, 'Normal');    

-- inicialize Ataques

	INSERT INTO public.tblataques VALUES (1, 'Ascuas', 1, 40);
	INSERT INTO public.tblataques VALUES (2, 'Llamarada', 1, 80);
	INSERT INTO public.tblataques VALUES (3, 'Giro Fuego', 1, 60);
	INSERT INTO public.tblataques VALUES (4, 'V de Fuego', 1, 90);
	INSERT INTO public.tblataques VALUES (5, 'Buseo', 2, 40);
	INSERT INTO public.tblataques VALUES (6, 'Burbujas', 2, 60);
	INSERT INTO public.tblataques VALUES (7, 'Hidrobomba', 2, 90);
	INSERT INTO public.tblataques VALUES (8, 'Surf', 2, 80);
	INSERT INTO public.tblataques VALUES (9, 'Hojas Navaja', 3, 80);
	INSERT INTO public.tblataques VALUES (11, 'Latigo Sepa', 3, 40);
	INSERT INTO public.tblataques VALUES (12, 'Rayo Solar', 3, 90);
	INSERT INTO public.tblataques VALUES (13, 'Semillas Drenadoras', 3, 40);
	INSERT INTO public.tblataques VALUES (14, 'Impac Trueno', 4, 40);
	INSERT INTO public.tblataques VALUES (15, 'Atack Trueno', 4, 60);
	INSERT INTO public.tblataques VALUES (16, 'Trueno', 4, 80);
	INSERT INTO public.tblataques VALUES (17, 'Tacleada De Voltios', 4, 90);
	INSERT INTO public.tblataques VALUES (18, 'Ataque Arena', 5, 20);
	INSERT INTO public.tblataques VALUES (19, 'Excavar', 5, 70);
	INSERT INTO public.tblataques VALUES (20, 'Fisura', 5, 90);
	INSERT INTO public.tblataques VALUES (21, 'Terremoto', 5, 80);
	INSERT INTO public.tblataques VALUES (22, 'Vuelo', 6, 60);
	INSERT INTO public.tblataques VALUES (23, 'Golpe Aereo', 6, 40);
	INSERT INTO public.tblataques VALUES (24, 'Ataque de Ala', 6, 60);
	INSERT INTO public.tblataques VALUES (25, 'Tornado', 6, 60);
	INSERT INTO public.tblataques VALUES (26, 'Hiponosis', 7, 0);
	INSERT INTO public.tblataques VALUES (27, 'Rayo Psiquico', 7, 80);
	INSERT INTO public.tblataques VALUES (28, 'Come Sueños', 7, 100);
	INSERT INTO public.tblataques VALUES (29, 'Confusion', 7, 70);
	INSERT INTO public.tblataques VALUES (30, 'Bola De Sombras', 8, 70);
	INSERT INTO public.tblataques VALUES (31, 'Lenguetazo', 8, 30);
	INSERT INTO public.tblataques VALUES (32, 'Puno de sombras', 8, 70);
	INSERT INTO public.tblataques VALUES (33, 'Tinieblas', 8, 80);
	INSERT INTO public.tblataques VALUES (34, 'Polvo Venenoso', 9, 30);
	INSERT INTO public.tblataques VALUES (35, 'Aguijon', 9, 50);
	INSERT INTO public.tblataques VALUES (36, 'Guadana Venenosa', 9, 70);
	INSERT INTO public.tblataques VALUES (37, 'Chupa Vidas', 9, 50);
	INSERT INTO public.tblataques VALUES (38, 'Golpe Furia', 10, 20);
	INSERT INTO public.tblataques VALUES (39, 'Embestida', 10, 50);
	INSERT INTO public.tblataques VALUES (40, 'MoVimiento Sismico', 10, 60);
	INSERT INTO public.tblataques VALUES (41, 'Placaje', 10, 40);

DELETE FROM tblversiones;

INSERT INTO public.tblversiones(
	versionmayor, versionmenor, patch)
	VALUES (2, 2, 1);

