Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.16.0'

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_VERSION_GetVersion]') AND type in (N'P', N'PC'))
BEGIN

	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


DECLARE @intVersionMayor int
DECLARE @intVersionMenor int
DECLARE @intPatch int

EXECUTE [dbo].[usp_VERSION_GetVersion] 
   @intVersionMayor OUTPUT
  ,@intVersionMenor OUTPUT
  ,@intPatch OUTPUT

IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL
BEGIN
	
	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 17 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.17. Este script solamente se aplica a la version 1.17',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO


INSERT INTO tblPokemons VALUES ('Charmileon', NULL);
INSERT INTO tblPokemons VALUES ('Charizar', NULL);
INSERT INTO tblPokemons VALUES ('Growlithe', NULL);
INSERT INTO tblPokemons VALUES ('Arcanine', NULL);
INSERT INTO tblPokemons VALUES ('Magmar', NULL);
INSERT INTO tblPokemons VALUES ('Wartortle', NULL);
INSERT INTO tblPokemons VALUES ('Starmie', NULL);
INSERT INTO tblPokemons VALUES ('Staryu', NULL);
INSERT INTO tblPokemons VALUES ('Blastoise', NULL);
INSERT INTO tblPokemons VALUES ('Lapras', NULL);
INSERT INTO tblPokemons VALUES ('Ivysaur', NULL);
INSERT INTO tblPokemons VALUES ('Venasaur', NULL);
INSERT INTO tblPokemons VALUES ('Oddish', NULL);
INSERT INTO tblPokemons VALUES ('Gloom', NULL);
INSERT INTO tblPokemons VALUES ('Vileplume', NULL);
INSERT INTO tblPokemons VALUES ('Pikachu', NULL);
INSERT INTO tblPokemons VALUES ('Raichu', NULL);
INSERT INTO tblPokemons VALUES ('Magnemite', NULL);
INSERT INTO tblPokemons VALUES ('Magneton', NULL);
INSERT INTO tblPokemons VALUES ('Voltorb', NULL);
INSERT INTO tblPokemons VALUES ('Electrode', NULL);
INSERT INTO tblPokemons VALUES ('Geodude', NULL);
INSERT INTO tblPokemons VALUES ('Graveler', NULL);
INSERT INTO tblPokemons VALUES ('Golem', NULL);
INSERT INTO tblPokemons VALUES ('Sandshrew', NULL);
INSERT INTO tblPokemons VALUES ('Sandslash', NULL);
INSERT INTO tblPokemons VALUES ('Onix', NULL);
INSERT INTO tblPokemons VALUES ('Pidgey', NULL);
INSERT INTO tblPokemons VALUES ('Pidgeotto', NULL);
INSERT INTO tblPokemons VALUES ('Pidgeot', NULL);
INSERT INTO tblPokemons VALUES ('Spearow', NULL);
INSERT INTO tblPokemons VALUES ('Fearow', NULL);
INSERT INTO tblPokemons VALUES ('Abra', NULL);
INSERT INTO tblPokemons VALUES ('Kadabra', NULL);
INSERT INTO tblPokemons VALUES ('Alakazam', NULL);
INSERT INTO tblPokemons VALUES ('Psyduck', NULL);
INSERT INTO tblPokemons VALUES ('Golduck', NULL);
INSERT INTO tblPokemons VALUES ('Gastly', NULL);
INSERT INTO tblPokemons VALUES ('Haunter', NULL);
INSERT INTO tblPokemons VALUES ('Gengar', NULL);
INSERT INTO tblPokemons VALUES ('Caterpie',NULL);
INSERT INTO tblPokemons VALUES ('Metapod', NULL);
INSERT INTO tblPokemons VALUES ('Butterfree', NULL);
INSERT INTO tblPokemons VALUES ('Paras', NULL);
INSERT INTO tblPokemons VALUES ('Parasect', NULL);


DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,17
           ,1)
GO