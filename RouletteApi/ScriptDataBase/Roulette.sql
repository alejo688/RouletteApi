USE [master]
GO
/****** Object:  Database [Roulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
CREATE DATABASE [Roulette]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Roulette', FILENAME = N'D:\Microsoft SQL Server\mdf\Roulette.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Roulette_log', FILENAME = N'D:\Microsoft SQL Server\Log\Roulette_log.ldf' , SIZE = 8192KB , MAXSIZE = 2097152KB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Roulette] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Roulette].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Roulette] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Roulette] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Roulette] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Roulette] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Roulette] SET ARITHABORT OFF 
GO
ALTER DATABASE [Roulette] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Roulette] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Roulette] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Roulette] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Roulette] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Roulette] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Roulette] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Roulette] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Roulette] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Roulette] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Roulette] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Roulette] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Roulette] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Roulette] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Roulette] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Roulette] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Roulette] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Roulette] SET RECOVERY FULL 
GO
ALTER DATABASE [Roulette] SET  MULTI_USER 
GO
ALTER DATABASE [Roulette] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Roulette] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Roulette] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Roulette] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Roulette] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Roulette', N'ON'
GO
ALTER DATABASE [Roulette] SET QUERY_STORE = OFF
GO
USE [Roulette]
GO
/****** Object:  Table [dbo].[bet]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bet](
	[id_bet] [int] IDENTITY(1,1) NOT NULL,
	[Id_Roulette] [int] NOT NULL,
	[Id_User] [int] NOT NULL,
	[number] [int] NOT NULL,
	[color] [nvarchar](50) NOT NULL,
	[bet] [numeric](18, 2) NOT NULL,
	[date_bet] [datetime] NOT NULL,
	[winner] [smallint] NULL,
	[date_play] [datetime] NULL,
 CONSTRAINT [PK_bet] PRIMARY KEY CLUSTERED 
(
	[id_bet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Crupier]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crupier](
	[id_crupier] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[ApiKey] [nvarchar](100) NOT NULL,
	[state] [bit] NOT NULL,
 CONSTRAINT [PK_Crupier] PRIMARY KEY CLUSTERED 
(
	[id_crupier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roulette](
	[Id_Roulette] [int] IDENTITY(1,1) NOT NULL,
	[id_crupier] [int] NOT NULL,
	[create_date] [datetime] NOT NULL,
	[number] [int] NULL,
	[color] [nvarchar](50) NULL,
	[closed_date] [datetime] NULL,
	[State] [smallint] NOT NULL,
 CONSTRAINT [PK_Roulette] PRIMARY KEY CLUSTERED 
(
	[Id_Roulette] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id_User] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Money] [numeric](18, 2) NOT NULL,
	[ApiKey] [nvarchar](100) NOT NULL,
	[State] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bet] ON 

INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1, 1, 3, 23, N'red', CAST(500.00 AS Numeric(18, 2)), CAST(N'2020-10-02T11:28:34.437' AS DateTime), 0, CAST(N'2020-10-02T12:03:35.100' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (2, 1, 4, 12, N'black', CAST(600.00 AS Numeric(18, 2)), CAST(N'2020-10-02T11:28:57.400' AS DateTime), 2, CAST(N'2020-10-02T12:03:35.100' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (3, 2, 4, 12, N'black', CAST(600.00 AS Numeric(18, 2)), CAST(N'2020-10-02T12:12:35.000' AS DateTime), 2, CAST(N'2020-10-02T12:13:31.623' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (4, 2, 3, 15, N'red', CAST(800.00 AS Numeric(18, 2)), CAST(N'2020-10-02T12:13:07.200' AS DateTime), 0, CAST(N'2020-10-02T12:13:31.623' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (5, 2, 2, 3, N'black', CAST(1500.00 AS Numeric(18, 2)), CAST(N'2020-10-02T12:13:22.857' AS DateTime), 2, CAST(N'2020-10-02T12:13:31.623' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (6, 3, 2, 3, N'black', CAST(1500.00 AS Numeric(18, 2)), CAST(N'2020-10-02T12:20:12.800' AS DateTime), 0, CAST(N'2020-10-02T12:21:08.223' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (7, 3, 3, 15, N'red', CAST(2500.00 AS Numeric(18, 2)), CAST(N'2020-10-02T12:20:37.960' AS DateTime), 2, CAST(N'2020-10-02T12:21:08.223' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (8, 3, 4, 32, N'black', CAST(3000.00 AS Numeric(18, 2)), CAST(N'2020-10-02T12:20:57.807' AS DateTime), 0, CAST(N'2020-10-02T12:21:08.223' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1006, 1003, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T12:51:06.767' AS DateTime), 2, CAST(N'2020-10-06T12:57:57.507' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1007, 1004, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T13:00:14.003' AS DateTime), 2, CAST(N'2020-10-06T13:01:38.110' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1008, 1006, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T16:56:47.387' AS DateTime), 2, CAST(N'2020-10-06T16:57:05.943' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1009, 1005, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T16:57:51.527' AS DateTime), 2, CAST(N'2020-10-06T16:58:21.460' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1010, 1007, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T16:59:30.290' AS DateTime), 2, CAST(N'2020-10-06T16:59:53.470' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1011, 1008, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T17:01:49.087' AS DateTime), 2, CAST(N'2020-10-06T17:02:01.337' AS DateTime))
INSERT [dbo].[bet] ([id_bet], [Id_Roulette], [Id_User], [number], [color], [bet], [date_bet], [winner], [date_play]) VALUES (1012, 1009, 2, 12, N'red', CAST(300.00 AS Numeric(18, 2)), CAST(N'2020-10-06T17:06:05.870' AS DateTime), 0, CAST(N'2020-10-06T17:06:20.873' AS DateTime))
SET IDENTITY_INSERT [dbo].[bet] OFF
GO
SET IDENTITY_INSERT [dbo].[Crupier] ON 

INSERT [dbo].[Crupier] ([id_crupier], [username], [ApiKey], [state]) VALUES (1, N'Luisa', N'43fDS45ga67YTc3&ds43', 1)
SET IDENTITY_INSERT [dbo].[Crupier] OFF
GO
SET IDENTITY_INSERT [dbo].[Roulette] ON 

INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1, 1, CAST(N'2020-10-02T11:03:15.150' AS DateTime), NULL, NULL, NULL, 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (2, 1, CAST(N'2020-10-02T11:03:24.930' AS DateTime), NULL, NULL, NULL, 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (3, 1, CAST(N'2020-10-02T12:19:52.663' AS DateTime), 10, N'red', CAST(N'2020-10-02T12:21:08.223' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1003, 1, CAST(N'2020-10-06T12:04:57.990' AS DateTime), 8, N'red', CAST(N'2020-10-06T12:57:57.510' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1004, 1, CAST(N'2020-10-06T12:12:40.263' AS DateTime), 10, N'red', CAST(N'2020-10-06T13:01:38.110' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1005, 1, CAST(N'2020-10-06T16:55:32.537' AS DateTime), 28, N'red', CAST(N'2020-10-06T16:58:21.460' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1006, 1, CAST(N'2020-10-06T16:56:19.090' AS DateTime), 16, N'red', CAST(N'2020-10-06T16:57:05.943' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1007, 1, CAST(N'2020-10-06T16:59:12.027' AS DateTime), 2, N'red', CAST(N'2020-10-06T16:59:53.470' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1008, 1, CAST(N'2020-10-06T17:01:34.067' AS DateTime), 28, N'red', CAST(N'2020-10-06T17:02:01.340' AS DateTime), 2)
INSERT [dbo].[Roulette] ([Id_Roulette], [id_crupier], [create_date], [number], [color], [closed_date], [State]) VALUES (1009, 1, CAST(N'2020-10-06T17:05:49.140' AS DateTime), 33, N'black', CAST(N'2020-10-06T17:06:20.877' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Roulette] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id_User], [Username], [Money], [ApiKey], [State]) VALUES (2, N'Pedro', CAST(54140.00 AS Numeric(18, 2)), N'SD546FS3WQ342', 1)
INSERT [dbo].[User] ([Id_User], [Username], [Money], [ApiKey], [State]) VALUES (3, N'Luis', CAST(33200.00 AS Numeric(18, 2)), N'DFw2213dsad34f', 1)
INSERT [dbo].[User] ([Id_User], [Username], [Money], [ApiKey], [State]) VALUES (4, N'Jaime', CAST(39160.00 AS Numeric(18, 2)), N'Tr54aSf26#@fasf', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[bet] ADD  CONSTRAINT [DF_Roulette_User_date_bet]  DEFAULT (getdate()) FOR [date_bet]
GO
ALTER TABLE [dbo].[Crupier] ADD  CONSTRAINT [DF__Crupier__state__36B12243]  DEFAULT ((1)) FOR [state]
GO
ALTER TABLE [dbo].[Roulette] ADD  CONSTRAINT [DF_Roulette_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Roulette] ADD  CONSTRAINT [DF_Roulette_State]  DEFAULT ((0)) FOR [State]
GO
ALTER TABLE [dbo].[bet]  WITH CHECK ADD  CONSTRAINT [FK_Roulette] FOREIGN KEY([Id_Roulette])
REFERENCES [dbo].[Roulette] ([Id_Roulette])
GO
ALTER TABLE [dbo].[bet] CHECK CONSTRAINT [FK_Roulette]
GO
ALTER TABLE [dbo].[bet]  WITH CHECK ADD  CONSTRAINT [FK_User] FOREIGN KEY([Id_User])
REFERENCES [dbo].[User] ([Id_User])
GO
ALTER TABLE [dbo].[bet] CHECK CONSTRAINT [FK_User]
GO
ALTER TABLE [dbo].[Roulette]  WITH CHECK ADD  CONSTRAINT [FK_Roulette_crupier] FOREIGN KEY([id_crupier])
REFERENCES [dbo].[Crupier] ([id_crupier])
GO
ALTER TABLE [dbo].[Roulette] CHECK CONSTRAINT [FK_Roulette_crupier]
GO
/****** Object:  StoredProcedure [dbo].[ActivateRoulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ActivateRoulette]
	@ApiKey nvarchar(100),
	@RouletteId int,
	@Status int OUTPUT
AS
BEGIN
	DECLARE @idCrupier INT,
		@StateRoulette INT

	EXECUTE @idCrupier = [dbo].[ValitadeApiKeyCrupier] @ApiKey

	IF @idCrupier = 0
		BEGIN
			SET @Status = 0
		END
	ELSE
		BEGIN

			SELECT @StateRoulette = [State]
			FROM [dbo].[Roulette] WITH(NOLOCK)
			WHERE [Id_Roulette] = @RouletteId

			IF @StateRoulette = 0
				BEGIN
					UPDATE [dbo].[Roulette]
					SET [State] = 1
					WHERE [Id_Roulette] = @RouletteId

					SET @Status = 1
				END
			ELSE
				BEGIN
					SET @Status = -1
				END
		END
	
	RETURN @Status
END
GO
/****** Object:  StoredProcedure [dbo].[BetRoulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[BetRoulette]
	@ApiKey nvarchar(100),
	@RouletteId int,
	@Number int,
	@Color nvarchar(50),
	@Bet numeric(18,2),
	@Status int OUTPUT
AS
BEGIN
	DECLARE @idUser INT,
		@StateRoulette int

	EXECUTE @idUser = [dbo].[ValitadeApiKey] @ApiKey

	IF @idUser = 0
		BEGIN
			SET @Status = 0
		END
	ELSE
		BEGIN

			SELECT @StateRoulette = [State]
			FROM [dbo].[Roulette] WITH(NOLOCK)
			WHERE [Id_Roulette] = @RouletteId

			IF @StateRoulette = 1
				BEGIN

					IF @Number < 0 OR @NUMBER > 36
						BEGIN
							SET @Status = -2
						END
					ELSE IF @Bet < 0 OR @Bet > 10000
						BEGIN 
							SET @Status = -3
						END
					ELSE IF LOWER(@Color) != 'black' AND LOWER(@Color) != 'red'
						BEGIN 
							SET @Status = -4
						END
					ELSE
						BEGIN
							INSERT INTO [dbo].[bet] ([Id_Roulette], [Id_User], [number], [color], [bet])
							VALUES (@RouletteId, @idUser, @Number, LOWER(@Color), @Bet)

							SELECT @Status = @@IDENTITY

						END
				END
			ELSE
				BEGIN
					SET @Status = -5
				END
		END

	RETURN @Status
	
END
GO
/****** Object:  StoredProcedure [dbo].[CloseRoulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CloseRoulette]
	@ApiKey nvarchar(100),
	@RouletteId int,
	@Status int OUTPUT
AS
BEGIN
	DECLARE @idCrupier int,
		@StateRoulette int,
		@numberRoulette int,
		@ColorRoulette nvarchar(50)

	EXECUTE @idCrupier = [dbo].[ValitadeApiKeyCrupier] @ApiKey

	IF @idCrupier = 0
		BEGIN
			SET @Status = 0
		END
	ELSE
		BEGIN

			SELECT @StateRoulette = [State]
			FROM [dbo].[Roulette] WITH(NOLOCK)
			WHERE [Id_Roulette] = @RouletteId

			IF @StateRoulette = 1
				BEGIN

					SELECT @numberRoulette = FLOOR(RAND()*(36-0+1)+0)
					select @ColorRoulette = IIF(@numberRoulette % 2 = 0, 'red', 'black')

					UPDATE [dbo].[bet]
					SET [winner] = 0,
						[date_play] = GETDATE()
					WHERE [Id_Roulette] = @RouletteId

					UPDATE [dbo].[bet]
					SET [winner] = 1
					WHERE [number] = @numberRoulette
					AND [Id_Roulette] = @RouletteId

					UPDATE [dbo].[bet]
					SET [winner] = 2
					WHERE [color] = @ColorRoulette
					AND [Id_Roulette] = @RouletteId
					AND [winner] = 0

					UPDATE B
					SET B.[Money] = B.[Money] - A.[bet]
					FROM [dbo].[bet] A
					INNER JOIN [dbo].[User] B ON A.[Id_User] = B.[Id_User]
					WHERE A.[Id_Roulette] = @RouletteId
					AND A.[winner] = 0

					UPDATE B
					SET B.[Money] = B.[Money] + (A.[bet] * 5)
					FROM [dbo].[bet] A
					INNER JOIN [dbo].[User] B ON A.[Id_User] = B.[Id_User]
					WHERE A.[Id_Roulette] = @RouletteId
					AND A.[winner] = 1

					UPDATE B
					SET B.[Money] = B.[Money] + (A.[bet] * 1.8)
					FROM [dbo].[bet] A
					INNER JOIN [dbo].[User] B ON A.[Id_User] = B.[Id_User]
					WHERE A.[Id_Roulette] = @RouletteId
					AND A.[winner] = 2

					UPDATE [dbo].[Roulette]
					SET [State] = 2,
						[number] = @numberRoulette,
						[color] = @ColorRoulette,
						[closed_date] = getdate()
					WHERE [Id_Roulette] = @RouletteId

					SET NOCOUNT ON;
					SELECT B.[Username],
					A.[number],
					A.[color],
					@numberRoulette [numberWinner],
					@ColorRoulette [colorWinner],
					IIF(A.[winner] = 0, 'No', 'Yes') [winner]
					FROM [dbo].[bet] A WITH(NOLOCK)
					INNER JOIN [dbo].[User] B WITH(NOLOCK) ON A.[Id_User] = B.[Id_User]
					WHERE A.[Id_Roulette] = @RouletteId

					SET @Status = 1

				END
			ELSE
				BEGIN
					SET @Status = -5
				END
		END
	
	RETURN @Status
END
GO
/****** Object:  StoredProcedure [dbo].[CreateRoulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CreateRoulette]
	@ApiKey nvarchar(100),
	@id int OUTPUT
AS
BEGIN
	DECLARE @idCrupier int

	EXECUTE @idCrupier = [dbo].[ValitadeApiKeyCrupier] @ApiKey

	IF @idCrupier = 0
		BEGIN
			SET @id = 0
		END
	ELSE
		BEGIN
			INSERT INTO [dbo].[Roulette] ([id_crupier])
			VALUES (@idCrupier)

			SELECT @id = @@IDENTITY

		END

	RETURN @Id	
END
GO
/****** Object:  StoredProcedure [dbo].[ListRoulette]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[ListRoulette]
	@ApiKey nvarchar(100),
	@Status int OUTPUT
AS
BEGIN
	DECLARE @idCrupier INT

	EXECUTE @idCrupier = [dbo].[ValitadeApiKeyCrupier] @ApiKey

	IF @idCrupier = 0
		BEGIN
			SET @Status = 0
		END
	ELSE
		BEGIN
			SET NOCOUNT ON;
			SELECT [Id_Roulette],
				[create_date],
				[number],
				[color],
				[closed_date],
				CASE [State]
					WHEN 0 THEN 'CREATED'
					WHEN 1 THEN 'ACTIVATED'
					ELSE 'CLOSED'
				END [State]
			FROM [dbo].[Roulette] WITH(NOLOCK)

			SET @Status = 1
		END
	
	RETURN @Status
END
GO
/****** Object:  StoredProcedure [dbo].[ValitadeApiKey]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ValitadeApiKey]
	@ApiKey [nvarchar](100)
AS
BEGIN
	DECLARE @state INT,
		@id INT

	SELECT @state = COUNT(1)
	FROM [dbo].[User]
	WHERE [ApiKey] = @ApiKey

	IF @state = 1
		BEGIN
			SELECT @id = [id_user]
			FROM [dbo].[User]
			WHERE [ApiKey] = @ApiKey

			RETURN @id
		END
	ELSE
		BEGIN
			RETURN(0)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ValitadeApiKeyCrupier]    Script Date: 6/10/2020 6:10:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ValitadeApiKeyCrupier]
	@ApiKey [nvarchar](100)
AS
BEGIN
	DECLARE @state INT,
		@id INT

	SELECT @state = COUNT(1)
	FROM [dbo].[Crupier]
	WHERE [ApiKey] = @ApiKey

	IF @state = 1
		BEGIN
			SELECT @id = [id_crupier]
			FROM [dbo].[Crupier]
			WHERE [ApiKey] = @ApiKey

			RETURN @id
		END
	ELSE
		BEGIN
			RETURN(0)
		END
END
GO
USE [master]
GO
ALTER DATABASE [Roulette] SET  READ_WRITE 
GO
