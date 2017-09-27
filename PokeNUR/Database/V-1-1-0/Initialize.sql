INSERT INTO [PokeNUR_DB].[dbo].[tblPokemons]
           ([nombre])
     VALUES
           ('Charmander')
GO

INSERT INTO [PokeNUR_DB].[dbo].[tblPokemons]
           ([nombre])
     VALUES
           ('Bulbasaur')
GO

INSERT INTO [PokeNUR_DB].[dbo].[tblPokemons]
           ([nombre])
     VALUES
           ('Squirtle')
GO


DELETE FROM [dbo].[tbl_Version]
GO

INSERT INTO [dbo].[tbl_Version]
           ([versionMayor]
           ,[versionMenor]
           ,[patch])
     VALUES
           (1
           ,7
           ,1)
GO