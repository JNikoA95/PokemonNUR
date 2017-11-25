USE [ChatDB]
GO

/****** Object:  Table [dbo].[tbl_Chat]    Script Date: 11/17/2017 15:18:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Chat](
	[chatId] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[mensaje] [nvarchar](max) NOT NULL,
	[conversacionId] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_Chat] PRIMARY KEY CLUSTERED 
(
	[chatId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[tbl_Conversacion]    Script Date: 11/17/2017 15:18:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tbl_Conversacion](
	[conversacionId] [int] IDENTITY(1,1) NOT NULL,
	[user1] [varchar](50) NOT NULL,
	[user2] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Conversacion] PRIMARY KEY CLUSTERED 
(
	[conversacionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tbl_Chat]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Chat_tbl_Conversacion] FOREIGN KEY([conversacionId])
REFERENCES [dbo].[tbl_Conversacion] ([conversacionId])
GO

ALTER TABLE [dbo].[tbl_Chat] CHECK CONSTRAINT [FK_tbl_Chat_tbl_Conversacion]
GO


USE [ChatDB]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetChatsConversacion]    Script Date: 11/17/2017 15:18:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetChatsConversacion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetChatsConversacion]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetConversaciones]    Script Date: 11/17/2017 15:18:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_GetConversaciones]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_GetConversaciones]
GO

/****** Object:  StoredProcedure [dbo].[usp_InsertChat]    Script Date: 11/17/2017 15:18:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_InsertChat]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_InsertChat]
GO

/****** Object:  StoredProcedure [dbo].[usp_CrearConversacion]    Script Date: 11/17/2017 15:18:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_CrearConversacion]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_CrearConversacion]
GO

USE [ChatDB]
GO

/****** Object:  StoredProcedure [dbo].[usp_GetChatsConversacion]    Script Date: 11/17/2017 15:18:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetChatsConversacion]
	@intConversacionId	INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [chatId]
		  ,[username]
		  ,[mensaje]
		  ,[conversacionId]
		  ,[fecha]
	FROM [dbo].[tbl_Chat]
	WHERE [conversacionId] = @intConversacionId
	ORDER BY [fecha] ASC

END

GO

/****** Object:  StoredProcedure [dbo].[usp_GetConversaciones]    Script Date: 11/17/2017 15:18:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetConversaciones]
	@varUser	VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [conversacionId]
		  ,[user1]
		  ,[user2]
	FROM [dbo].[tbl_Conversacion]
	WHERE [user1] = @varUser OR [user2] = @varUser


END

GO

/****** Object:  StoredProcedure [dbo].[usp_InsertChat]    Script Date: 11/17/2017 15:18:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_InsertChat]
	@varUser	VARCHAR(50),
	@varMsg		NVARCHAR(MAX),
	@intConversacionId	INT,
	@intChatId		INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[tbl_Chat]
           ([username]
           ,[mensaje]
           ,[conversacionId]
           ,[fecha])
     VALUES
           (@varUser
           ,@varMsg
           ,@intConversacionId
           ,GETDATE())

	SET @intChatId = SCOPE_IDENTITY()

END

GO

/****** Object:  StoredProcedure [dbo].[usp_CrearConversacion]    Script Date: 11/17/2017 15:18:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CrearConversacion]
	@varUser1	VARCHAR(50),
	@varUser2	VARCHAR(50),
	@intConversacionId	INT OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT @intConversacionId = [conversacionId]
	FROM [dbo].[tbl_Conversacion]
	WHERE ([user1] = @varUser1 AND [user2] = @varUser2)
		OR ([user1] = @varUser2 OR [user2] = @varUser1)
	
	IF(@intConversacionId IS NULL OR @intConversacionId = 0)
	BEGIN

		INSERT INTO [dbo].[tbl_Conversacion]
			   ([user1]
			   ,[user2])
		 VALUES
			   (@varUser1
			   ,@varUser2)

		SET @intConversacionId = SCOPE_IDENTITY()

	END
	
END

GO

