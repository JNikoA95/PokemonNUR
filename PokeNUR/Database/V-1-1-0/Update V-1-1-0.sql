Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.1.0'

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


IF @intVersionMayor IS NULL OR @intVersionMenor IS NULL OR NOT (@intVersionMayor = 1 AND @intVersionMenor = 0)
BEGIN
	
	RAISERROR('La base de datos no esta en la version 1.0. Este script solamente se apllica a la version 1.0',16,127)
	RETURN;

END
ELSE
BEGIN
	
	PRINT 'Version OK'

END


IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPokemons]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblPokemons](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblPokemons] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItems]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblItems](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio] [int] NOT NULL,
	[funcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_tblItems] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblUsuario]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblUsuario](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[nickName] [varchar](100) NOT NULL,
	[correo] [varchar](150) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblUsuario] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTipos]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblTipos](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblTipos] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

-- =============================================
-- Author:		Nicolas Andrade
-- Create date: 10/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_tblUsuarios]
	@prmCodigo_id int,
	@prmNombre varchar(200),
	@prmNickName varchar(100),
	@prmCorreo varchar(150),
	@prmPassword varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [PokeNUR_DB].[dbo].[tblUsuario]
	   SET [nombre] = @prmNombre
		  ,[nickName] = @prmNickName
		  ,[correo] = @prmCorreo
		  ,[password] = @prmPassword
	 WHERE codigo_id = @prmCodigo_id
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblItemUsuario]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblItemUsuario](
	[item_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_tblItemUsuario] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblTipoPokemon]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblTipoPokemon](
	[tipo_id] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
 CONSTRAINT [PK_tblTipoPokemon] PRIMARY KEY CLUSTERED 
(
	[tipo_id] ASC,
	[pokemon_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPokemonUsuario]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblPokemonUsuario](
	[user_id] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
 CONSTRAINT [PK_tblPokemonUsuario] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[pokemon_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblAtaques]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblAtaques](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[tipo_id] [int] NOT NULL,
 CONSTRAINT [PK_tblAtaques] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

-- =============================================
-- Author:		Nicolas Andrade
-- Create date: 10/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mk_tblUsuarios]
	@prmNombre varchar(200),
	@prmNickName varchar(100),
	@prmCorreo varchar(150),
	@prmPassword varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [PokeNUR_DB].[dbo].[tblUsuario]
           ([nombre]
           ,[nickName]
           ,[correo]
           ,[password])
     VALUES
           (@prmNombre
           ,@prmNickName
           ,@prmCorreo
           ,@prmPassword)
END
GO

-- =============================================
-- Author:		Nicolas Andrade
-- Create date: 10/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[get_tblUsuarios]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM tblUsuario
END
GO


-- =============================================
-- Author:		Nicolas Andrade
-- Create date: 10/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[del_tblUsuarios]
	@prmCodigo_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM tblUsuario WHERE codigo_id = @prmCodigo_id
END
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblPokemonAtaque]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblPokemonAtaque](
	[ataque_id] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
 CONSTRAINT [PK_tblPokemonAtaque] PRIMARY KEY CLUSTERED 
(
	[ataque_id] ASC,
	[pokemon_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO


ALTER TABLE [dbo].[tblItemUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblItemUsuario_tblItemUsuario] FOREIGN KEY([item_id])
REFERENCES [dbo].[tblItems] ([codigo_id])
GO
ALTER TABLE [dbo].[tblItemUsuario] CHECK CONSTRAINT [FK_tblItemUsuario_tblItemUsuario]
GO
/****** Object:  ForeignKey [FK_tblItemUsuario_tblUsuario]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblItemUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblItemUsuario_tblUsuario] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO
ALTER TABLE [dbo].[tblItemUsuario] CHECK CONSTRAINT [FK_tblItemUsuario_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblTipoPokemon_tblPokemons]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblTipoPokemon]  WITH CHECK ADD  CONSTRAINT [FK_tblTipoPokemon_tblPokemons] FOREIGN KEY([pokemon_id])
REFERENCES [dbo].[tblPokemons] ([codigo_id])
GO
ALTER TABLE [dbo].[tblTipoPokemon] CHECK CONSTRAINT [FK_tblTipoPokemon_tblPokemons]
GO
/****** Object:  ForeignKey [FK_tblTipoPokemon_tblTipos]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblTipoPokemon]  WITH CHECK ADD  CONSTRAINT [FK_tblTipoPokemon_tblTipos] FOREIGN KEY([tipo_id])
REFERENCES [dbo].[tblTipos] ([codigo_id])
GO
ALTER TABLE [dbo].[tblTipoPokemon] CHECK CONSTRAINT [FK_tblTipoPokemon_tblTipos]
GO
/****** Object:  ForeignKey [FK_tblPokemonUsuario_tblPokemons]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblPokemonUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblPokemonUsuario_tblPokemons] FOREIGN KEY([pokemon_id])
REFERENCES [dbo].[tblPokemons] ([codigo_id])
GO
ALTER TABLE [dbo].[tblPokemonUsuario] CHECK CONSTRAINT [FK_tblPokemonUsuario_tblPokemons]
GO
/****** Object:  ForeignKey [FK_tblPokemonUsuario_tblUsuario]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblPokemonUsuario]  WITH CHECK ADD  CONSTRAINT [FK_tblPokemonUsuario_tblUsuario] FOREIGN KEY([user_id])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO
ALTER TABLE [dbo].[tblPokemonUsuario] CHECK CONSTRAINT [FK_tblPokemonUsuario_tblUsuario]
GO
/****** Object:  ForeignKey [FK_tblAtaques_tblTipos]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblAtaques]  WITH NOCHECK ADD  CONSTRAINT [FK_tblAtaques_tblTipos] FOREIGN KEY([tipo_id])
REFERENCES [dbo].[tblTipos] ([codigo_id])
GO
ALTER TABLE [dbo].[tblAtaques] CHECK CONSTRAINT [FK_tblAtaques_tblTipos]
GO
/****** Object:  ForeignKey [FK_tblPokemonAtaque_tblAtaques]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblPokemonAtaque]  WITH CHECK ADD  CONSTRAINT [FK_tblPokemonAtaque_tblAtaques] FOREIGN KEY([ataque_id])
REFERENCES [dbo].[tblAtaques] ([codigo_id])
GO
ALTER TABLE [dbo].[tblPokemonAtaque] CHECK CONSTRAINT [FK_tblPokemonAtaque_tblAtaques]
GO
/****** Object:  ForeignKey [FK_tblPokemonAtaque_tblPokemons]    Script Date: 09/15/2017 15:15:29 ******/
ALTER TABLE [dbo].[tblPokemonAtaque]  WITH CHECK ADD  CONSTRAINT [FK_tblPokemonAtaque_tblPokemons] FOREIGN KEY([pokemon_id])
REFERENCES [dbo].[tblPokemons] ([codigo_id])
GO
ALTER TABLE [dbo].[tblPokemonAtaque] CHECK CONSTRAINT [FK_tblPokemonAtaque_tblPokemons]
GO

DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,1
           ,0)
GO

