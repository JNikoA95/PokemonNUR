Use [Master] 
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.26.0'

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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 25 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.25.0. Este script solamente se aplica a la version 1.25.0',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO


/****** Object:  Table [dbo].[tblBatallaAtaque]    Script Date: 12/12/2017 11:10:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblBatallaAtaque](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[idBatalla] [int] NOT NULL,
	[idPokemonAtaque] [int] NOT NULL,
 CONSTRAINT [PK_tblBatallaAtaque] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblBatallaAtaque]  WITH CHECK ADD  CONSTRAINT [FK_tblBatallaAtaque_tblBatallas] FOREIGN KEY([idBatalla])
REFERENCES [dbo].[tblBatallas] ([codio_id])
GO

ALTER TABLE [dbo].[tblBatallaAtaque] CHECK CONSTRAINT [FK_tblBatallaAtaque_tblBatallas]
GO

ALTER TABLE [dbo].[tblBatallaAtaque]  WITH CHECK ADD  CONSTRAINT [FK_tblBatallaAtaque_TblPokemonAtaque] FOREIGN KEY([codigo_id])
REFERENCES [dbo].[TblPokemonAtaque] ([codigo_id])
GO

ALTER TABLE [dbo].[tblBatallaAtaque] CHECK CONSTRAINT [FK_tblBatallaAtaque_TblPokemonAtaque]
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE mk_tblBatallaAtaque 
	-- Add the parameters for the stored procedure here
	@idBatalla INT,
	@idPokemonAtaque INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [PokeNUR_DB].[dbo].[tblBatallaAtaque]
           ([idBatalla]
           ,[idPokemonAtaque])
     VALUES
           (@idBatalla
           ,@idPokemonAtaque);

END
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE get_tblPokemonAtaqueByUser 
	-- Add the parameters for the stored procedure here
	@idUsuario INT,
	@idPokemon INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [codigo_id]
      ,[ataque_id]
      ,[pokemon_id]
      ,[usuario_id]
  FROM [PokeNUR_DB].[dbo].[TblPokemonAtaque]
  WHERE @idUsuario = usuario_id AND @idPokemon = pokemon_id;

END
GO

DELETE FROM tbl_Version

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,26
           ,0)
GO

