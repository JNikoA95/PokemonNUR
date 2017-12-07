USE [PokeNUR_DB]
GO

/****** Object:  Table [dbo].[tblDetalleBatalla]    Script Date: 12/07/2017 06:52:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblDetalleBatalla](
	[codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[batalla_id] [int] NOT NULL,
	[jugador_id] [int] NOT NULL,
	[ataque_id] [int] NOT NULL,
	[pokemon_id] [int] NOT NULL,
	[daño] [int] NOT NULL,
 CONSTRAINT [PK_tblDetalleBatalla] PRIMARY KEY CLUSTERED 
(
	[codigo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblDetalleBatalla]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleBatalla_tblAtaques] FOREIGN KEY([ataque_id])
REFERENCES [dbo].[tblAtaques] ([codigo_id])
GO

ALTER TABLE [dbo].[tblDetalleBatalla] CHECK CONSTRAINT [FK_tblDetalleBatalla_tblAtaques]
GO

ALTER TABLE [dbo].[tblDetalleBatalla]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleBatalla_tblBatallas] FOREIGN KEY([batalla_id])
REFERENCES [dbo].[tblBatallas] ([codio_id])
GO

ALTER TABLE [dbo].[tblDetalleBatalla] CHECK CONSTRAINT [FK_tblDetalleBatalla_tblBatallas]
GO

ALTER TABLE [dbo].[tblDetalleBatalla]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleBatalla_tblPokemons] FOREIGN KEY([pokemon_id])
REFERENCES [dbo].[tblPokemons] ([codigo_id])
GO

ALTER TABLE [dbo].[tblDetalleBatalla] CHECK CONSTRAINT [FK_tblDetalleBatalla_tblPokemons]
GO

ALTER TABLE [dbo].[tblDetalleBatalla]  WITH CHECK ADD  CONSTRAINT [FK_tblDetalleBatalla_tblUsuario] FOREIGN KEY([jugador_id])
REFERENCES [dbo].[tblUsuario] ([codigo_id])
GO

ALTER TABLE [dbo].[tblDetalleBatalla] CHECK CONSTRAINT [FK_tblDetalleBatalla_tblUsuario]
GO

-------------------------------

USE [PokeNUR_DB]
GO

/****** Object:  StoredProcedure [dbo].[get_tblDetalleBatalla]    Script Date: 12/07/2017 06:53:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[get_tblDetalleBatalla]
AS
	SET NOCOUNT ON;
SELECT codigo_id, batalla_id, jugador_id, ataque_id, pokemon_id, daño
FROM     tblDetalleBatalla
GO

-------------------------------------

USE [PokeNUR_DB]
GO

/****** Object:  StoredProcedure [dbo].[mk_tblDetalleBatalla]    Script Date: 12/07/2017 06:53:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[mk_tblDetalleBatalla]
(
	@batalla_id int,
	@jugador_id int,
	@ataque_id int,
	@pokemon_id int,
	@daño int
)
AS
	SET NOCOUNT OFF;
INSERT INTO [tblDetalleBatalla] ([batalla_id], [jugador_id], [ataque_id], [pokemon_id], [daño]) VALUES (@batalla_id, @jugador_id, @ataque_id, @pokemon_id, @daño)
GO

