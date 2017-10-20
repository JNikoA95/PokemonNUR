ALTER TABLE tblusuariopokemon add foreign key (usuario_id) references users;

DROP TABLE tblUsuarios cascade

DELETE FROM tblversiones;

INSERT INTO public.tblversiones(
	versionmayor, versionmenor, patch)
	VALUES (2, 2, 0);

