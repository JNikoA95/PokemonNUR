Use [Master]
GO 

IF  NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'PokeNUR_DB')
	RAISERROR('La base de datos ''PokeNUR_DB'' no existe. Cree la base de datos primero',16,127)
GO

USE [PokeNUR_DB]
GO

PRINT 'Actualizando a la version 1.2.0'

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


/****** Object:  Table [dbo].[tblCodigoRecuperacion]    Script Date: 09/16/2017 22:24:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tblCodigoRecuperacion]') AND type in (N'U'))
BEGIN

	SET ANSI_NULLS ON;


	SET QUOTED_IDENTIFIER ON;


	CREATE TABLE [dbo].[tblCodigoRecuperacion](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[usuario_id] [int] NOT NULL,
	[codigoRecuperacion] [varchar](20) NOT NULL,
	[tiempo] [datetime] NOT NULL,
 CONSTRAINT [PK_tblCodigoRecuperacion] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

ALTER TABLE [dbo].[tblCodigoRecuperacion]  WITH CHECK ADD  CONSTRAINT [FK_tblCodigoRecuperacion_tblUsuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO

ALTER TABLE [dbo].[tblCodigoRecuperacion] CHECK CONSTRAINT [FK_tblCodigoRecuperacion_tblUsuario]
GO


-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 14/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[mk_tblCodRecuperacion]
	@prmUsuario int,
	@prmCodRecuperacion varchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [PokeNUR_DB].[dbo].[tblCodigoRecuperacion]
           ([usuario_id]
           ,[codigoRecuperacion]
           ,[tiempo])
     VALUES
     
           (@prmUsuario
           ,@prmCodRecuperacion
           ,GETDATE())
END
GO

-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 14/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[val_CodRecuperacion]

	@prmUsuario int,
	@prmCodigo varchar(20),
	@prmDiferencia int OUTPUT
	
AS
DECLARE

	@prmTiempo datetime
	 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT @prmTiempo = CR.tiempo 
	FROM tblCodigoRecuperacion CR
	WHERE CR.codigoRecuperacion = @prmCodigo AND
			CR.usuario_id = @prmUsuario;
	
	SET @prmDiferencia = (SELECT DATEDIFF(minute, @prmTiempo, GETDATE()));
    
END
GO

-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 16/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getIdByCorreo_tblUsuarios]

	@prmCorreo varchar(150),
	@prmIdUsuario int OUTPUT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT @prmIdUsuario = U.codigo_id 
    FROM tblUsuario U
    WHERE U.correo = @prmCorreo;
END
GO

-- =============================================
-- Author:		Alejandra Sapiain
-- Create date: 10/09/2017
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[upd_password_tblUsuarios]
	@prmCodigo_id int,
	@prmPassword varchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [PokeNUR_DB].[dbo].[tblUsuario]
	   SET [password] = @prmPassword
	 WHERE codigo_id = @prmCodigo_id
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
           ,2
           ,0)
GO