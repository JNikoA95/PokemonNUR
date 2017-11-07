Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.8.1'

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

IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR @intPatch IS NULL
BEGIN
	
	RAISERROR('La base de datos no esta inicializada',16,127)
	RETURN;

END


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 8 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.8.0. Este script solamente se aplica a la version 1.8.0',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

-- Inicialize Tipos

INSERT INTO tbltipos VALUES ('Fuego');    
INSERT INTO tbltipos VALUES ('Agua');    
INSERT INTO tbltipos VALUES ('Planta');    
INSERT INTO tbltipos VALUES ('Electrico');    
INSERT INTO tbltipos VALUES ('Tierra');    
INSERT INTO tbltipos VALUES ('Aire');    
INSERT INTO tbltipos VALUES ('Psiquico');    
INSERT INTO tbltipos VALUES ('Fantasma');    
INSERT INTO tbltipos VALUES ('Bicho');    
INSERT INTO tbltipos VALUES ('Normal');    

-- inicialize Ataques

INSERT INTO tblataques VALUES ('Ascuas', 1, 40);
INSERT INTO tblataques VALUES ('Llamarada', 1, 80);
INSERT INTO tblataques VALUES ('Giro Fuego', 1, 60);
INSERT INTO tblataques VALUES ('V de Fuego', 1, 90);
INSERT INTO tblataques VALUES ('Buseo', 2, 40);
INSERT INTO tblataques VALUES ('Burbujas', 2, 60);
INSERT INTO tblataques VALUES ('Hidrobomba', 2, 90);
INSERT INTO tblataques VALUES ('Surf', 2, 80);
INSERT INTO tblataques VALUES ('Hojas Navaja', 3, 80);
INSERT INTO tblataques VALUES ('Latigo Sepa', 3, 40);
INSERT INTO tblataques VALUES ('Rayo Solar', 3, 90);
INSERT INTO tblataques VALUES ('Semillas Drenadoras', 3, 40);
INSERT INTO tblataques VALUES ('Impac Trueno', 4, 40);
INSERT INTO tblataques VALUES ('Atack Trueno', 4, 60);
INSERT INTO tblataques VALUES ('Trueno', 4, 80);
INSERT INTO tblataques VALUES ('Tacleada De Voltios', 4, 90);
INSERT INTO tblataques VALUES ('Ataque Arena', 5, 20);
INSERT INTO tblataques VALUES ('Excavar', 5, 70);
INSERT INTO tblataques VALUES ('Fisura', 5, 90);
INSERT INTO tblataques VALUES ('Terremoto', 5, 80);
INSERT INTO tblataques VALUES ('Vuelo', 6, 60);
INSERT INTO tblataques VALUES ('Golpe Aereo', 6, 40);
INSERT INTO tblataques VALUES ('Ataque de Ala', 6, 60);
INSERT INTO tblataques VALUES ('Tornado', 6, 60);
INSERT INTO tblataques VALUES ('Hiponosis', 7, 0);
INSERT INTO tblataques VALUES ('Rayo Psiquico', 7, 80);
INSERT INTO tblataques VALUES ('Come Sueños', 7, 100);
INSERT INTO tblataques VALUES ('Confusion', 7, 70);
INSERT INTO tblataques VALUES ('Bola De Sombras', 8, 70);
INSERT INTO tblataques VALUES ('Lenguetazo', 8, 30);
INSERT INTO tblataques VALUES ('Puno de sombras', 8, 70);
INSERT INTO tblataques VALUES ('Tinieblas', 8, 80);
INSERT INTO tblataques VALUES ('Polvo Venenoso', 9, 30);
INSERT INTO tblataques VALUES ('Aguijon', 9, 50);
INSERT INTO tblataques VALUES ('Guadana Venenosa', 9, 70);
INSERT INTO tblataques VALUES ('Chupa Vidas', 9, 50);
INSERT INTO tblataques VALUES ('Golpe Furia', 10, 20);
INSERT INTO tblataques VALUES ('Embestida', 10, 50);
INSERT INTO tblataques VALUES ('MoVimiento Sismico', 10, 60);
INSERT INTO tblataques VALUES ('Placaje', 10, 40);

DELETE FROM tbl_Version

INSERT INTO [PokeNUR_DB].[dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,8
           ,1)
GO

