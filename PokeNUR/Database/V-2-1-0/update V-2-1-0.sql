ALTER TABLE tblPokemones
ADD COLUMN nivel int NOT NULL;

ALTER TABLE tblPokemones
ADD COLUMN experiencia int NOT NULL;

ALTER TABLE tblPokemones
ADD COLUMN puntosVida int NOT NULL;

ALTER TABLE tblItems
ADD COLUMN funcion text NOT NULL;

ALTER TABLE tblAtaques
ADD COLUMN daño int NOT NULL;

ALTER TABLE tblUsuarios
ADD COLUMN cantDinero int NOT NULL;

DELETE FROM tblversiones;

INSERT INTO public.tblversiones(
	versionmayor, versionmenor, patch)
	VALUES (2, 1, 0);

