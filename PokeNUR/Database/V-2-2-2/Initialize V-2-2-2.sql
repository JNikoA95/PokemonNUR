-- fuego agua planta

INSERT INTO public.tblpokemones(codigo_id, nombre, nivel, experiencia, puntosvida)
	VALUES (1,'Charmander', 1, 0, 20);

INSERT INTO public.tblpokemones(codigo_id, nombre, nivel, experiencia, puntosvida)
	VALUES (2, 'Squirtle', 1, 0, 20);
    
INSERT INTO public.tblpokemones(codigo_id, nombre, nivel, experiencia, puntosvida)
	VALUES (3,'Bulbasaur', 1, 0, 20);
    
INSERT INTO public.tbltipopokemon(codigo_id, pokemon_id, tipo_id)
	VALUES (1,1, 1);

INSERT INTO public.tbltipopokemon(codigo_id, pokemon_id, tipo_id)
	VALUES (2, 2, 2);
    
INSERT INTO public.tbltipopokemon(codigo_id, pokemon_id, tipo_id)
	VALUES (3, 3, 3);
    
INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (1, 1, 1);
 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (2, 1, 2);
 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (3, 1, 3);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (4, 1, 4);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (5, 2, 5);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (6, 2, 6);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (7, 2, 7);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (8, 2, 8);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (9, 3, 9);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (10, 3, 13);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (11, 3, 11);

 INSERT INTO public.tblpokemonataque(codigo_id, pokemon_id, ataque_id)
	VALUES (12, 3, 12);
	
DELETE FROM tblversiones;

INSERT INTO public.tblversiones(
	versionmayor, versionmenor, patch)
	VALUES (2, 2, 2);

