DO
$do$
BEGIN
   IF EXISTS (SELECT 1 FROM pg_database WHERE datname = 'PokeNUR_DB') THEN
      RAISE NOTICE 'Database already exists'; 
   ELSE
      PERFORM dblink_exec('dbname=' || current_database()  -- current db
                        , 'CREATE DATABASE PokeNUR_DB');
   END IF;
END
$do$;

-- Creacion de Tablas

CREATE TABLE tblUsuarios(
	codigo_id bigint PRIMARY KEY NOT NULL,
    username text NOT NULL,
    contraseña text NOT NULL
)

CREATE TABLE tblPokemones(
	codigo_id bigint PRIMARY KEY NOT NULL,
    nombre text NOT NULL
)

CREATE TABLE tblItems(
	codigo_id bigint PRIMARY KEY NOT NULL,
    nombreItem text NOT NULL,
    precio bigint NOT NULL
)

CREATE TABLE tblTipo(
	codigo_id bigint PRIMARY KEY NOT NULL,
    nombreTipo text NOT NULL
)

CREATE TABLE tblAtaques(
	codigo_id bigint PRIMARY KEY NOT NULL,
    nombre text NOT NULL,
    tipo_id bigint NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES tblTipo(codigo_id)
)

CREATE TABLE tblBatallas(
	codigo_id bigint PRIMARY KEY NOT NULL,
    jugador1_id bigint NOT NULL,
    jugador2_id bigint NOT NULL,
    FOREIGN KEY (jugador1_id) REFERENCES tblUsuarios(codigo_id),
    FOREIGN KEY (jugador2_id) REFERENCES tblUsuarios(codigo_id)
)

CREATE TABLE tblPokemonAtaque(
    codigo_id bigint NOT NULL PRIMARY KEY,
	pokemon_id bigint NOT NULL,
    ataque_id bigint NOT NULL,
    FOREIGN KEY (pokemon_id) REFERENCES tblPokemones(codigo_id),
    FOREIGN KEY (ataque_id) REFERENCES tblAtaques(codigo_id)
)

CREATE TABLE tblItemsUsuario(
    codigo_id bigint NOT NULL PRIMARY KEY,
	usuario_id bigint NOT NULL,
    item_id bigint NOT NULL,
    cantidad int NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES tblUsuarios(codigo_id),
    FOREIGN KEY (item_id) REFERENCES tblItems(codigo_id)
)

CREATE TABLE tblTipoPokemon(
    codigo_id bigint NOT NULL PRIMARY KEY,
	pokemon_id bigint NOT NULL,
    tipo_id bigint NOT NULL,
    FOREIGN KEY (pokemon_id) REFERENCES tblPokemones(codigo_id),
    FOREIGN KEY (tipo_id) REFERENCES tblTipo(codigo_id)
)


CREATE TABLE tblTipoAtaque(
    codigo_id bigint NOT NULL PRIMARY KEY,
	ataque_id bigint NOT NULL,
    tipo_id bigint NOT NULL,
    FOREIGN KEY (ataque_id) REFERENCES tblataques(codigo_id),
    FOREIGN KEY (tipo_id) REFERENCES tblTipo(codigo_id)
)

CREATE TABLE tblUsuarioPokemon(
    codigo_id bigint NOT NULL PRIMARY KEY,
	usuario_id bigint NOT NULL,
    pokemon_id bigint NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES tblUsuarios(codigo_id),
    FOREIGN KEY (pokemon_id) REFERENCES tblPokemones(codigo_id)
)

-- Creacion de Procedimientos

-- DROP FUNCTION public.mk_tblataques(bigint, text, bigint);

CREATE OR REPLACE FUNCTION public.mk_tblataques(
	p_codigo_id bigint,
	p_nombre text,
	p_tipo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblataques(nombre,tipo_id) VALUES (p_nombre,p_tipo_id) ;  keyp:=CURRVAL('tblataques_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblataques SET nombre = p_nombre,tipo_id = p_tipo_id WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblbatallas(bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION public.mk_tblbatallas(
	p_codigo_id bigint,
	p_jugador1_id bigint,
	p_jugador2_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblbatallas(jugador1_id,jugador2_id) VALUES (p_jugador1_id,p_jugador2_id) ;  keyp:=CURRVAL('tblbatallas_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblbatallas SET jugador1_id = p_jugador1_id,jugador2_id = p_jugador2_id WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblitems(bigint, text, bigint);

CREATE OR REPLACE FUNCTION public.mk_tblitems(
	p_codigo_id bigint,
	p_nombreitem text,
	p_precio bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblitems(nombreitem,precio) VALUES (p_nombreitem,p_precio) ;  keyp:=CURRVAL('tblitems_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblitems SET nombreitem = p_nombreitem,precio = p_precio WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblitemsusuario(bigint, bigint, bigint, integer);

CREATE OR REPLACE FUNCTION public.mk_tblitemsusuario(
	p_codigo_id bigint,
	p_usuario_id bigint,
	p_item_id bigint,
	p_cantidad integer)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblitemsusuario(usuario_id,item_id,cantidad) VALUES (p_usuario_id,p_item_id,p_cantidad) ;  keyp:=CURRVAL('tblitemsusuario_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblitemsusuario SET usuario_id = p_usuario_id,item_id = p_item_id,cantidad = p_cantidad WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblpokemonataque(bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION public.mk_tblpokemonataque(
	p_codigo_id bigint,
	p_pokemon_id bigint,
	p_ataque_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblpokemonataque(pokemon_id,ataque_id) VALUES (p_pokemon_id,p_ataque_id) ;  keyp:=CURRVAL('tblpokemonataque_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblpokemonataque SET pokemon_id = p_pokemon_id,ataque_id = p_ataque_id WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblpokemones(bigint, text);

CREATE OR REPLACE FUNCTION public.mk_tblpokemones(
	p_codigo_id bigint,
	p_nombre text)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblpokemones(nombre) VALUES (p_nombre) ;  keyp:=CURRVAL('tblpokemones_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblpokemones SET nombre = p_nombre WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tbltipo(bigint, text);

CREATE OR REPLACE FUNCTION public.mk_tbltipo(
	p_codigo_id bigint,
	p_nombretipo text)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tbltipo(nombretipo) VALUES (p_nombretipo) ;  keyp:=CURRVAL('tbltipo_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tbltipo SET nombretipo = p_nombretipo WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tbltipoataque(bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION public.mk_tbltipoataque(
	p_codigo_id bigint,
	p_ataque_id bigint,
	p_tipo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tbltipoataque(ataque_id,tipo_id) VALUES (p_ataque_id,p_tipo_id) ;  keyp:=CURRVAL('tbltipoataque_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tbltipoataque SET ataque_id = p_ataque_id,tipo_id = p_tipo_id WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tbltipopokemon(bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION public.mk_tbltipopokemon(
	p_codigo_id bigint,
	p_pokemon_id bigint,
	p_tipo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tbltipopokemon(pokemon_id,tipo_id) VALUES (p_pokemon_id,p_tipo_id) ;  keyp:=CURRVAL('tbltipopokemon_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tbltipopokemon SET pokemon_id = p_pokemon_id,tipo_id = p_tipo_id WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblusuariopokemon(bigint, bigint, bigint);

CREATE OR REPLACE FUNCTION public.mk_tblusuariopokemon(
	p_codigo_id bigint,
	p_usuario_id bigint,
	p_pokemon_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblusuariopokemon(usuario_id,pokemon_id) VALUES (p_usuario_id,p_pokemon_id) ;  keyp:=CURRVAL('tblusuariopokemon_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblusuariopokemon SET usuario_id = p_usuario_id,pokemon_id = p_pokemon_id WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.mk_tblusuarios(bigint, text, text);

CREATE OR REPLACE FUNCTION public.mk_tblusuarios(
	p_codigo_id bigint,
	p_username text,
	"p_contraseña" text)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
DECLARE keyp INT;  BEGIN IF p_codigo_id=0 THEN INSERT INTO public.tblusuarios(username,contraseña) VALUES (p_username,p_contraseña) ;  keyp:=CURRVAL('tblusuarios_codigo_id_seq');RETURN keyp; ELSE UPDATE public.tblusuarios SET username = p_username,contraseña = p_contraseña WHERE codigo_id = p_codigo_id; RETURN p_codigo_id; END IF; END; 
$BODY$;

-- DROP FUNCTION public.del_tblataques(bigint);

CREATE OR REPLACE FUNCTION public.del_tblataques(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblataques WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblbatallas(bigint);

CREATE OR REPLACE FUNCTION public.del_tblbatallas(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblbatallas WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblitems(bigint);

CREATE OR REPLACE FUNCTION public.del_tblitems(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblitems WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblitemsusuario(bigint);

CREATE OR REPLACE FUNCTION public.del_tblitemsusuario(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblitemsusuario WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblpokemonataque(bigint);

CREATE OR REPLACE FUNCTION public.del_tblpokemonataque(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblpokemonataque WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblpokemones(bigint);

CREATE OR REPLACE FUNCTION public.del_tblpokemones(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblpokemones WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tbltipo(bigint);

CREATE OR REPLACE FUNCTION public.del_tbltipo(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tbltipo WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tbltipoataque(bigint);

CREATE OR REPLACE FUNCTION public.del_tbltipoataque(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tbltipoataque WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tbltipopokemon(bigint);

CREATE OR REPLACE FUNCTION public.del_tbltipopokemon(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tbltipopokemon WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblusuariopokemon(bigint);

CREATE OR REPLACE FUNCTION public.del_tblusuariopokemon(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblusuariopokemon WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.del_tblusuarios(bigint);

CREATE OR REPLACE FUNCTION public.del_tblusuarios(
	p_codigo_id bigint)
    RETURNS integer
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 0
AS $BODY$
  BEGIN DELETE FROM public.tblusuarios WHERE codigo_id=p_codigo_id; RETURN 1; END; 
$BODY$;

-- DROP FUNCTION public.get_tblataques();

CREATE OR REPLACE FUNCTION public.get_tblataques(
	)
    RETURNS SETOF tblataques 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblataques; END; 
$BODY$;

-- DROP FUNCTION public.get_tblataques(bigint);

CREATE OR REPLACE FUNCTION public.get_tblataques(
	p_agn bigint)
    RETURNS SETOF tblataques 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblataques WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblbatallas();

CREATE OR REPLACE FUNCTION public.get_tblbatallas(
	)
    RETURNS SETOF tblbatallas 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblbatallas; END; 
$BODY$;

-- DROP FUNCTION public.get_tblbatallas(bigint);

CREATE OR REPLACE FUNCTION public.get_tblbatallas(
	p_agn bigint)
    RETURNS SETOF tblbatallas 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblbatallas WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblitems();

CREATE OR REPLACE FUNCTION public.get_tblitems(
	)
    RETURNS SETOF tblitems 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblitems; END; 
$BODY$;

-- DROP FUNCTION public.get_tblitems(bigint);

CREATE OR REPLACE FUNCTION public.get_tblitems(
	p_agn bigint)
    RETURNS SETOF tblitems 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblitems WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblitemsusuario();

CREATE OR REPLACE FUNCTION public.get_tblitemsusuario(
	)
    RETURNS SETOF tblitemsusuario 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblitemsusuario; END; 
$BODY$;

-- DROP FUNCTION public.get_tblitemsusuario(bigint);

CREATE OR REPLACE FUNCTION public.get_tblitemsusuario(
	p_agn bigint)
    RETURNS SETOF tblitemsusuario 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblitemsusuario WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblpokemonataque();

CREATE OR REPLACE FUNCTION public.get_tblpokemonataque(
	)
    RETURNS SETOF tblpokemonataque 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblpokemonataque; END; 
$BODY$;

-- DROP FUNCTION public.get_tblpokemonataque(bigint);

CREATE OR REPLACE FUNCTION public.get_tblpokemonataque(
	p_agn bigint)
    RETURNS SETOF tblpokemonataque 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblpokemonataque WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblpokemones();

CREATE OR REPLACE FUNCTION public.get_tblpokemones(
	)
    RETURNS SETOF tblpokemones 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblpokemones; END; 
$BODY$;

-- DROP FUNCTION public.get_tblpokemones(bigint);

CREATE OR REPLACE FUNCTION public.get_tblpokemones(
	p_agn bigint)
    RETURNS SETOF tblpokemones 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblpokemones WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tbltipo();

CREATE OR REPLACE FUNCTION public.get_tbltipo(
	)
    RETURNS SETOF tbltipo 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tbltipo; END; 
$BODY$;

-- DROP FUNCTION public.get_tbltipo(bigint);

CREATE OR REPLACE FUNCTION public.get_tbltipo(
	p_agn bigint)
    RETURNS SETOF tbltipo 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tbltipo WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tbltipoataque();

CREATE OR REPLACE FUNCTION public.get_tbltipoataque(
	)
    RETURNS SETOF tbltipoataque 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tbltipoataque; END; 
$BODY$;

-- DROP FUNCTION public.get_tbltipoataque(bigint);

CREATE OR REPLACE FUNCTION public.get_tbltipoataque(
	p_agn bigint)
    RETURNS SETOF tbltipoataque 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tbltipoataque WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tbltipopokemon();

CREATE OR REPLACE FUNCTION public.get_tbltipopokemon(
	)
    RETURNS SETOF tbltipopokemon 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tbltipopokemon; END; 
$BODY$;

-- DROP FUNCTION public.get_tbltipopokemon(bigint);

CREATE OR REPLACE FUNCTION public.get_tbltipopokemon(
	p_agn bigint)
    RETURNS SETOF tbltipopokemon 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tbltipopokemon WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblusuariopokemon();

CREATE OR REPLACE FUNCTION public.get_tblusuariopokemon(
	)
    RETURNS SETOF tblusuariopokemon 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblusuariopokemon; END; 
$BODY$;

-- DROP FUNCTION public.get_tblusuariopokemon(bigint);

CREATE OR REPLACE FUNCTION public.get_tblusuariopokemon(
	p_agn bigint)
    RETURNS SETOF tblusuariopokemon 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblusuariopokemon WHERE codigo_id = p_Agn;  END; 
$BODY$;

-- DROP FUNCTION public.get_tblusuarios();

CREATE OR REPLACE FUNCTION public.get_tblusuarios(
	)
    RETURNS SETOF tblusuarios 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblusuarios; END; 
$BODY$;

-- DROP FUNCTION public.get_tblusuarios(bigint);

CREATE OR REPLACE FUNCTION public.get_tblusuarios(
	p_agn bigint)
    RETURNS SETOF tblusuarios 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1000
AS $BODY$
 BEGIN  RETURN QUERY SELECT * FROM public.tblusuarios WHERE codigo_id = p_Agn;  END; 
$BODY$;
