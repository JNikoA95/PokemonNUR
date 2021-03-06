Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.5.0'

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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 4)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.4. Este script solamente se aplica a la version 1.4',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO


USE [PokeNUR_DB]
GO

/****** Object:  StoredProcedure [dbo].[get_tblUsuarioByCorre_nickName]    Script Date: 09/22/2017 16:11:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Nicolas Andrade
-- Create date: 
-- Description:	Procedimiento para obtener un usuario por correo y nickname
-- =============================================
CREATE PROCEDURE [dbo].[get_tblUsuarioByCorre_nickName]
	@prmCorreo varchar(250),
	@prmNickName varchar(250)
AS
BEGIN
	
	SELECT * FROM tblUsuario
	WHERE correo = @prmCorreo
	AND nickName = @prmNickName
	
END

GO

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,5
           ,0)
GO
