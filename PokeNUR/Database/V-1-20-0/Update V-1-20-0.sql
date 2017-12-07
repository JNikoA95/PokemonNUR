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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 18 AND @intPatch = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.19. Este script solamente se aplica a la version 1.18',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END
GO

USE [PokeNUR_DB]
GO

/****** Object:  StoredProcedure [dbo].[get_pokemonUsuario]    Script Date: 12/07/2017 03:35:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Obtiene el nombre del pokemon por usuario
-- =============================================
CREATE PROCEDURE [dbo].[get_pokemonUsuario] 
	-- Add the parameters for the stored procedure here
	@idUsuario int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT P.nombre
	FROM tblUsuario U, tblPokemonUsuario PU, tblPokemons P
	WHERE	@idUsuario = U.codigo_id
	AND		U.codigo_id = PU.user_id
	AND     PU.pokemon_id = P.codigo_id;
END

GO

--
[03:59, 7/12/2017] Marcelo Arrázola: CREATE PROCEDURE get_PokemonYtipo 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    select A.nombre as nombre, 
    (Select nombre from tblTipos C where B.tipo_id = c.codigo_id) as tipo
	from tblPokemons A join tblTipoPokemon B 
	on A.codigo_id = B.pokemon_id;
	
END
GO
--
--
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Obtiene el id y el nombre del ataque del pokemon que tiene cada usuario
-- =============================================
CREATE PROCEDURE [dbo].[get_pokemonAtaqueByUsuario] 
	-- Add the parameters for the stored procedure here
	@idUsuario int,
	@idPokemon int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.nombre, A.codigo_id
	FROM tblUsuario U, tblPokemonAtaque PA, tblPokemons P, tblAtaques A, tblPokemonUsuario PU
	WHERE	@idUsuario = U.codigo_id
	AND		U.codigo_id = PA.usuario_id
	AND     A.codigo_id = PA.ataque_id
	AND		@idPokemon = PA.pokemon_id
	AND		U.codigo_id = PU.user_id
	AND     PU.pokemon_id = P.codigo_id;	
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
           ,20
           ,0)
GO