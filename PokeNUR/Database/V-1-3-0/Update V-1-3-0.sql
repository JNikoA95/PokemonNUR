Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.3.0'

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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 1)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.1. Este script solamente se aplica a la version 1.1',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END


/****** Object:  StoredProcedure [dbo].[get_usuarioByNickName]    Script Date: 09/17/2017 22:24:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[get_usuarioByNickName] ') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


-- =============================================
-- Author:		<Isabel Balderrama>
-- Create date: <17/09/2017>
-- Description:	<Obtiene el usuario segun su nick>
-- =============================================
CREATE PROCEDURE [dbo].[get_usuarioByNickName] 
	-- Add the parameters for the stored procedure here
	@pNick varchar(100)
	
AS
BEGIN
	
	SET NOCOUNT ON;
	
	
	SELECT [codigo_id],
			[nombre],
			[nickName],
			[correo],
			[password]
	FROM  [PokeNUR_DB].[dbo].[tblUsuario]
	WHERE [nickName]=@pNick;
	
	
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
           ,3
           ,0)
GO