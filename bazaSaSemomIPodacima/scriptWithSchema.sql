USE [shopNikolaAsp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cenovnici]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cenovnici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IdProizvod] [int] NOT NULL,
	[CenaProizvod] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Cenovnici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetaljiPorudzbina]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetaljiPorudzbina](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[NazivProizvoda] [nvarchar](max) NULL,
	[Kolicina] [int] NOT NULL,
	[Cena] [decimal](18, 2) NOT NULL,
	[IdPorudzbina] [int] NOT NULL,
	[IdProizvod] [int] NULL,
 CONSTRAINT [PK_DetaljiPorudzbina] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategorije]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorije](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kategorije] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Ime] [nvarchar](25) NOT NULL,
	[Prezime] [nvarchar](25) NOT NULL,
	[Jmbg] [bigint] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](130) NOT NULL,
	[IdUloga] [int] NOT NULL,
 CONSTRAINT [PK_Korisnici] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KorisnikUseCases]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KorisnikUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdKorisnik] [int] NOT NULL,
	[IdUseCase] [int] NOT NULL,
 CONSTRAINT [PK_KorisnikUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Porudzbine]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Porudzbine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[DatumPorudzbine] [datetime2](7) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[StatusPorudzbine] [int] NOT NULL,
	[NacinPlacanja] [int] NOT NULL,
	[IdKorisnik] [int] NOT NULL,
 CONSTRAINT [PK_Porudzbine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Kolicina] [int] NOT NULL,
	[Slika] [nvarchar](100) NOT NULL,
	[Opis] [nvarchar](250) NOT NULL,
	[IdKat] [int] NOT NULL,
 CONSTRAINT [PK_Proizvodi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slike]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slike](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Putanja] [nvarchar](100) NOT NULL,
	[IdProizvod] [int] NOT NULL,
 CONSTRAINT [PK_Slike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uloge]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uloge](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Naziv] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Uloge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 7/1/2020 4:50:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NazivUseCase] [nvarchar](max) NULL,
	[Datum] [datetime2](7) NOT NULL,
	[Podaci] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625164103_new_database_with_Proizvodi_Korisnici_Uloge_Kategorije', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625201920_added_Cenovnik_table', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625203848_added_Slika_table', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625213941_added_Porudzbine_DetaljiPorudzbine_tables', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200626133034_corect_Cenovnici_table', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627131507_added_KorisnikUseCases_table_and_fixed_all_configuration', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627133516_chage_KorisnikUseCase_Table', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627192128_create_UseCaseLogs_table', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630114455_change_number_of_character_in_Uloge_table_for_naziv', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Cenovnici] ON 

INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (19, CAST(N'2020-07-01T14:01:14.3038878' AS DateTime2), 0, NULL, NULL, 1, 44, CAST(17500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (20, CAST(N'2020-07-01T14:02:40.8489912' AS DateTime2), 0, NULL, NULL, 1, 45, CAST(10000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (21, CAST(N'2020-07-01T14:03:53.4046642' AS DateTime2), 0, NULL, NULL, 1, 46, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (22, CAST(N'2020-07-01T14:04:54.7095407' AS DateTime2), 0, NULL, NULL, 1, 47, CAST(17000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (23, CAST(N'2020-07-01T14:05:33.4565757' AS DateTime2), 0, NULL, NULL, 1, 48, CAST(23500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (24, CAST(N'2020-07-01T14:06:44.6711318' AS DateTime2), 0, NULL, NULL, 1, 49, CAST(27300.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (25, CAST(N'2020-07-01T14:07:21.5756377' AS DateTime2), 0, NULL, NULL, 1, 50, CAST(14500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (26, CAST(N'2020-07-01T14:08:49.1755711' AS DateTime2), 0, NULL, NULL, 1, 51, CAST(3500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (27, CAST(N'2020-07-01T14:09:32.6600690' AS DateTime2), 0, NULL, NULL, 1, 52, CAST(3800.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (28, CAST(N'2020-07-01T14:09:49.2367338' AS DateTime2), 0, NULL, NULL, 1, 53, CAST(4250.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (29, CAST(N'2020-07-01T14:10:04.6429637' AS DateTime2), 0, NULL, NULL, 1, 54, CAST(2500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (30, CAST(N'2020-07-01T14:10:20.9426278' AS DateTime2), 0, NULL, NULL, 1, 55, CAST(3250.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (31, CAST(N'2020-07-01T14:10:55.8726587' AS DateTime2), 0, NULL, NULL, 1, 56, CAST(1850.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (32, CAST(N'2020-07-01T14:11:18.9083541' AS DateTime2), 0, NULL, NULL, 1, 57, CAST(1500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (33, CAST(N'2020-07-01T14:22:47.7861094' AS DateTime2), 0, NULL, NULL, 1, 58, CAST(3300.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (34, CAST(N'2020-07-01T14:23:10.1698191' AS DateTime2), 0, NULL, NULL, 1, 59, CAST(2900.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (35, CAST(N'2020-07-01T14:23:31.7014313' AS DateTime2), 0, NULL, NULL, 1, 60, CAST(2400.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (36, CAST(N'2020-07-01T14:23:49.0894747' AS DateTime2), 0, NULL, NULL, 1, 61, CAST(5500.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (37, CAST(N'2020-07-01T14:24:40.3305448' AS DateTime2), 0, NULL, NULL, 1, 62, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (38, CAST(N'2020-07-01T14:24:53.8435358' AS DateTime2), 0, NULL, NULL, 1, 63, CAST(2450.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (39, CAST(N'2020-07-01T14:25:27.9050243' AS DateTime2), 0, NULL, NULL, 1, 64, CAST(2000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (40, CAST(N'2020-07-01T14:25:55.3090383' AS DateTime2), 1, CAST(N'2020-07-01T14:41:28.8199618' AS DateTime2), NULL, 0, 65, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (41, CAST(N'2020-07-01T14:40:12.6464423' AS DateTime2), 1, CAST(N'2020-07-01T14:41:28.8200653' AS DateTime2), NULL, 0, 65, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[Cenovnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [IdProizvod], [CenaProizvod]) VALUES (42, CAST(N'2020-07-01T14:51:25.2730201' AS DateTime2), 0, NULL, NULL, 1, 66, CAST(100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Cenovnici] OFF
GO
SET IDENTITY_INSERT [dbo].[DetaljiPorudzbina] ON 

INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (12, CAST(N'2020-07-01T14:49:50.1742906' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE BENASSI SOLARSOFT ', 10, CAST(4250.00 AS Decimal(18, 2)), 17, 53)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (13, CAST(N'2020-07-01T15:01:18.9743384' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE 200 M ', 10, CAST(2500.00 AS Decimal(18, 2)), 18, 54)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (14, CAST(N'2020-07-01T15:03:15.1692215' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE RIDER BAY VIII', 10, CAST(1850.00 AS Decimal(18, 2)), 19, 56)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (15, CAST(N'2020-07-01T15:03:24.9283885' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE RIDER INFINITY', 10, CAST(1500.00 AS Decimal(18, 2)), 20, 57)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (16, CAST(N'2020-07-01T15:03:32.4605426' AS DateTime2), 0, NULL, NULL, 1, N'Sandale na debelom djonom', 10, CAST(3300.00 AS Decimal(18, 2)), 21, 58)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (17, CAST(N'2020-07-01T15:04:33.6669504' AS DateTime2), 0, NULL, NULL, 1, N'Sandale na debelom djonom', 10, CAST(3300.00 AS Decimal(18, 2)), 22, 58)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (18, CAST(N'2020-07-01T15:04:33.6669510' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE RIDER INFINITY', 10, CAST(1500.00 AS Decimal(18, 2)), 22, 57)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (19, CAST(N'2020-07-01T15:04:46.5267969' AS DateTime2), 0, NULL, NULL, 1, N'Ravne sandale S408 ', 10, CAST(2900.00 AS Decimal(18, 2)), 23, 59)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (20, CAST(N'2020-07-01T15:05:11.6021750' AS DateTime2), 0, NULL, NULL, 1, N'Kožne ravne sandale ', 10, CAST(2400.00 AS Decimal(18, 2)), 24, 60)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (21, CAST(N'2020-07-01T15:08:08.6334505' AS DateTime2), 0, NULL, NULL, 1, N'Elegantne sandale na štiklu', 10, CAST(5500.00 AS Decimal(18, 2)), 25, 61)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (22, CAST(N'2020-07-01T15:08:20.5251151' AS DateTime2), 0, NULL, NULL, 1, N'Ravne sandale LS020574', 10, CAST(2000.00 AS Decimal(18, 2)), 26, 62)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (23, CAST(N'2020-07-01T15:08:48.4803889' AS DateTime2), 0, NULL, NULL, 1, N'Udobne sportske sandale S482 ', 10, CAST(2450.00 AS Decimal(18, 2)), 27, 63)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (24, CAST(N'2020-07-01T15:09:01.0052920' AS DateTime2), 0, NULL, NULL, 1, N'Ravne sandale LS020586', 10, CAST(2000.00 AS Decimal(18, 2)), 28, 64)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (25, CAST(N'2020-07-01T15:10:12.6451014' AS DateTime2), 0, NULL, NULL, 1, N'Nesto', 10, CAST(100.00 AS Decimal(18, 2)), 29, 66)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (26, CAST(N'2020-07-01T15:11:45.6176064' AS DateTime2), 0, NULL, NULL, 1, N'Kožne ravne sandale ', 13, CAST(2400.00 AS Decimal(18, 2)), 30, 60)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (27, CAST(N'2020-07-01T15:11:56.6038082' AS DateTime2), 0, NULL, NULL, 1, N'Elegantne sandale na štiklu', 13, CAST(5500.00 AS Decimal(18, 2)), 31, 61)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (28, CAST(N'2020-07-01T15:13:36.7105020' AS DateTime2), 0, NULL, NULL, 1, N'Air Max 1', 13, CAST(17500.00 AS Decimal(18, 2)), 32, 44)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (29, CAST(N'2020-07-01T15:13:49.4111909' AS DateTime2), 0, NULL, NULL, 1, N'Adidas SUPERSTAR', 13, CAST(10000.00 AS Decimal(18, 2)), 33, 45)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (30, CAST(N'2020-07-01T15:14:15.8598335' AS DateTime2), 0, NULL, NULL, 1, N'Air Jordan 5', 13, CAST(25000.00 AS Decimal(18, 2)), 34, 46)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (31, CAST(N'2020-07-01T15:14:26.6507635' AS DateTime2), 0, NULL, NULL, 1, N'NIKE MX-720-818', 13, CAST(17000.00 AS Decimal(18, 2)), 35, 47)
INSERT [dbo].[DetaljiPorudzbina] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [NazivProizvoda], [Kolicina], [Cena], [IdPorudzbina], [IdProizvod]) VALUES (32, CAST(N'2020-07-01T15:14:29.7285659' AS DateTime2), 0, NULL, NULL, 1, N'NIKE MX-720-818', 13, CAST(17000.00 AS Decimal(18, 2)), 36, 47)
SET IDENTITY_INSERT [dbo].[DetaljiPorudzbina] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategorije] ON 

INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (10, CAST(N'2020-07-01T13:18:37.2221488' AS DateTime2), 0, NULL, NULL, 1, N'Patike')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (11, CAST(N'2020-07-01T13:18:42.8828052' AS DateTime2), 0, NULL, NULL, 1, N'Papuce')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (12, CAST(N'2020-07-01T13:19:21.2332627' AS DateTime2), 0, NULL, NULL, 1, N'Sandale')
INSERT [dbo].[Kategorije] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (13, CAST(N'2020-07-01T13:21:17.7628973' AS DateTime2), 1, CAST(N'2020-07-01T13:22:15.8013052' AS DateTime2), CAST(N'2020-07-01T13:21:53.5850091' AS DateTime2), 0, N'Jadranke')
SET IDENTITY_INSERT [dbo].[Kategorije] OFF
GO
SET IDENTITY_INSERT [dbo].[Korisnici] ON 

INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (22, CAST(N'2020-07-01T13:33:53.8481615' AS DateTime2), 0, NULL, NULL, 1, N'Nikola', N'Riorovic', 1105998761034, N'nikolariorovic@gmail.com', N'c7c3b43a731dd340884d55c2361cf0c6', 17)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (23, CAST(N'2020-07-01T13:36:33.0484364' AS DateTime2), 0, NULL, NULL, 1, N'Danijel', N'Biukovic', 2711998761019, N'danijelbiukovic98@gmail.com', N'acbe71bd2951789b6aa2d6b95802520c', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (24, CAST(N'2020-07-01T13:37:46.1228295' AS DateTime2), 0, NULL, NULL, 1, N'Milan', N'Milosavljevic', 1236554761827, N'milanmilosavljevic@gmail.com', N'351ffbf2e929a30738bdd441331dd5de', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (25, CAST(N'2020-07-01T13:39:44.4761880' AS DateTime2), 0, NULL, NULL, 1, N'Vasilije', N'Vasilijevic', 17827763782392, N'vasilijevasilijevic@gmail.com', N'256e06b5439711238fc5ad4c279bd3a3', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (26, CAST(N'2020-07-01T13:40:43.1061697' AS DateTime2), 0, NULL, NULL, 1, N'Milos', N'Petrovic', 1782943938475, N'milospetrovic@gmail.com', N'8eab546cebe6a0654ce01879b87539f8', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (27, CAST(N'2020-07-01T13:41:34.8847523' AS DateTime2), 0, NULL, NULL, 1, N'Stevan', N'Sremac', 1728590989075, N'stevansremac@gmail.com', N'868ecd0a30cded27ecb6e7da62de94ed', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (28, CAST(N'2020-07-01T13:41:57.6237766' AS DateTime2), 0, NULL, NULL, 1, N'Lazar', N'Lazarevic', 2859483729870, N'lazarLazarevic@gmail.com', N'd9351de8cc020d71c0656e26e0e12934', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (29, CAST(N'2020-07-01T13:42:19.9801770' AS DateTime2), 0, NULL, NULL, 1, N'Pera', N'Peric', 1230098978935, N'peraperic@gmail.com', N'fb92702dbf43de7771c528a1954612eb', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (30, CAST(N'2020-07-01T13:42:40.3709734' AS DateTime2), 0, NULL, NULL, 1, N'Zika', N'Zikic', 2378392057489, N'zikazikic@gmail.com', N'bf2157f5a4bae3598a7f781db650dcc1', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (31, CAST(N'2020-07-01T13:43:21.8481224' AS DateTime2), 0, NULL, NULL, 1, N'Ana', N'Majstorovic', 3859285700989, N'anamajstorovic@gmail.com', N'0f4c27942d973c2cd487fecfce26b0bf', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (32, CAST(N'2020-07-01T13:43:58.3137395' AS DateTime2), 1, CAST(N'2020-07-01T13:51:45.6997528' AS DateTime2), CAST(N'2020-07-01T13:49:58.0564681' AS DateTime2), 0, N'Nestoo', N'Nesticc', 1234567890098, N'nestonesticcc@gmail.com', N'db6c39ad02bc2d737803a8d89a8c049d', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (33, CAST(N'2020-07-01T16:04:40.0172259' AS DateTime2), 0, NULL, NULL, 1, N'Nadica', N'Petrovic', 2859403786574, N'nadicapetrovic@gmail.com', N'1f6f7e3ec80d9225389d058d5949dd1c', 18)
INSERT [dbo].[Korisnici] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Ime], [Prezime], [Jmbg], [Email], [Password], [IdUloga]) VALUES (34, CAST(N'2020-07-01T16:34:29.0361462' AS DateTime2), 0, NULL, NULL, 1, N'Ljuba', N'Ljubicic', 1274590438273, N'ljubaljubicic@gmail.com', N'a77e54223d85f46843f0c1663739da79', 18)
SET IDENTITY_INSERT [dbo].[Korisnici] OFF
GO
SET IDENTITY_INSERT [dbo].[KorisnikUseCases] ON 

INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (29, 22, 1)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (30, 22, 4)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (31, 22, 5)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (32, 22, 6)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (33, 22, 7)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (34, 22, 8)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (35, 22, 9)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (36, 22, 10)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (37, 22, 11)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (38, 22, 12)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (39, 22, 13)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (40, 22, 14)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (41, 22, 15)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (42, 22, 16)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (43, 22, 17)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (44, 22, 18)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (45, 22, 19)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (46, 22, 20)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (47, 22, 21)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (48, 22, 22)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (49, 22, 23)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (50, 22, 24)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (51, 22, 25)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (52, 22, 26)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (53, 22, 27)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (54, 22, 28)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (58, 33, 23)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (59, 33, 26)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (60, 33, 3)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (61, 34, 3)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (62, 34, 23)
INSERT [dbo].[KorisnikUseCases] ([Id], [IdKorisnik], [IdUseCase]) VALUES (63, 34, 26)
SET IDENTITY_INSERT [dbo].[KorisnikUseCases] OFF
GO
SET IDENTITY_INSERT [dbo].[Porudzbine] ON 

INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (17, CAST(N'2020-07-01T14:49:50.1739189' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-02T00:00:00.0000000' AS DateTime2), N'Ulica 12', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (18, CAST(N'2020-07-01T15:01:18.9739586' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-12T00:00:00.0000000' AS DateTime2), N'Ulica 13', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (19, CAST(N'2020-07-01T15:03:15.1691987' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), N'Ulica 14', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (20, CAST(N'2020-07-01T15:03:24.9283393' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), N'Ulica 15', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (21, CAST(N'2020-07-01T15:03:32.4605348' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), N'Ulica 16', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (22, CAST(N'2020-07-01T15:04:33.6669461' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), N'Ulica 16', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (23, CAST(N'2020-07-01T15:04:46.5267762' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-09T00:00:00.0000000' AS DateTime2), N'Ulica 17', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (24, CAST(N'2020-07-01T15:05:11.6021603' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-15T00:00:00.0000000' AS DateTime2), N'Ulica 17', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (25, CAST(N'2020-07-01T15:08:08.6334366' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-04T00:00:00.0000000' AS DateTime2), N'Ulica 18', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (26, CAST(N'2020-07-01T15:08:20.5251066' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-06T00:00:00.0000000' AS DateTime2), N'Ulica 19', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (27, CAST(N'2020-07-01T15:08:48.4803840' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-17T00:00:00.0000000' AS DateTime2), N'Ulica 29', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (28, CAST(N'2020-07-01T15:09:01.0052885' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-25T00:00:00.0000000' AS DateTime2), N'Ulica 30', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (29, CAST(N'2020-07-01T15:10:12.6449938' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-11T00:00:00.0000000' AS DateTime2), N'Ulica 32', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (30, CAST(N'2020-07-01T15:11:45.6176024' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-26T00:00:00.0000000' AS DateTime2), N'Ulica 33', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (31, CAST(N'2020-07-01T15:11:56.6038034' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-27T00:00:00.0000000' AS DateTime2), N'Ulica 34', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (32, CAST(N'2020-07-01T15:13:36.7104982' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-15T00:00:00.0000000' AS DateTime2), N'Ulica 35', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (33, CAST(N'2020-07-01T15:13:49.4111818' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-17T00:00:00.0000000' AS DateTime2), N'Ulica 36', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (34, CAST(N'2020-07-01T15:14:15.8598296' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-17T00:00:00.0000000' AS DateTime2), N'Ulica 37', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (35, CAST(N'2020-07-01T15:14:26.6507600' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-19T00:00:00.0000000' AS DateTime2), N'Ulica 38', 0, 0, 23)
INSERT [dbo].[Porudzbine] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [DatumPorudzbine], [Adresa], [StatusPorudzbine], [NacinPlacanja], [IdKorisnik]) VALUES (36, CAST(N'2020-07-01T15:14:29.7285627' AS DateTime2), 0, NULL, NULL, 1, CAST(N'2020-07-14T00:00:00.0000000' AS DateTime2), N'Ulica 38', 0, 0, 23)
SET IDENTITY_INSERT [dbo].[Porudzbine] OFF
GO
SET IDENTITY_INSERT [dbo].[Proizvodi] ON 

INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (44, CAST(N'2020-07-01T14:01:14.2390178' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:13:36.7105025' AS DateTime2), 1, N'Air Max 1', 43, N'9a64787c-6cde-44b8-b51f-da0e6ca4afcf.jpg', N'Udobna Patika!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (45, CAST(N'2020-07-01T14:02:40.8411501' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:13:49.4111915' AS DateTime2), 1, N'Adidas SUPERSTAR', 87, N'f48bcf81-7f47-45b1-be8a-09460e415f27.jpg', N'Elegantna patika!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (46, CAST(N'2020-07-01T14:03:53.3965330' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:14:15.8598340' AS DateTime2), 1, N'Air Jordan 5', 87, N'a6201ae9-13cd-413e-babc-9568c4e36957.jpg', N'Patika za kosarku!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (47, CAST(N'2020-07-01T14:04:54.7042620' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:14:29.7285665' AS DateTime2), 1, N'NIKE MX-720-818', 74, N'026f43d1-7fcf-46b0-8c00-58e477ac06cb.jpg', N'Odlicna patika!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (48, CAST(N'2020-07-01T14:05:33.4469906' AS DateTime2), 0, NULL, NULL, 1, N'JORDAN AIR LATITUDE 720', 100, N'9d1352ce-8c42-400b-992c-722bb1333643.jpg', N'Odlicna patika!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (49, CAST(N'2020-07-01T14:06:44.6626340' AS DateTime2), 0, NULL, NULL, 1, N'Air Jordan 3 RETRO', 100, N'c71d4bfa-7f9b-406a-bb88-6d9b2ff34593.jpg', N'Odlicna patika!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (50, CAST(N'2020-07-01T14:07:21.5688098' AS DateTime2), 0, NULL, NULL, 1, N'NIKE AIR BARRAGE LOW', 100, N'8b78a365-4967-4356-8b80-6c278297fced.jpg', N'Odlicna patika!', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (51, CAST(N'2020-07-01T14:08:49.0590367' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE ADISSAGE TND', 100, N'83b81471-7636-47c1-a9b0-83b9b13fba25.jpg', N'Odlicne papuce!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (52, CAST(N'2020-07-01T14:09:32.6506527' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE ADILETTE COMFORT', 100, N'5e363a85-b286-4fd4-bab8-9fa7ab5ba571.jpg', N'Odlicne papuce!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (53, CAST(N'2020-07-01T14:09:49.2291353' AS DateTime2), 0, NULL, CAST(N'2020-07-01T14:49:50.1743546' AS DateTime2), 1, N'PAPUCE BENASSI SOLARSOFT ', 90, N'e81fa544-5a54-4d7c-99f4-6a004421f6fa.jpg', N'Odlicne papuce!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (54, CAST(N'2020-07-01T14:10:04.6377507' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:01:18.9744037' AS DateTime2), 1, N'PAPUCE 200 M ', 90, N'd62f23af-4d0b-4477-a8ce-61e89b44460b.jpg', N'Odlicne papuce!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (55, CAST(N'2020-07-01T14:10:20.9362127' AS DateTime2), 0, NULL, NULL, 1, N'PAPUCE BENASSI JDI', 100, N'5de91e01-bd1f-439f-b250-4f65e89b3481.jpg', N'Odlicne papuce!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (56, CAST(N'2020-07-01T14:10:55.8673489' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:03:15.1692224' AS DateTime2), 1, N'PAPUCE RIDER BAY VIII', 90, N'01a36c48-5176-4362-8ae5-1be39c9a5ea2.jpg', N'Odlicne papuce po niskoj ceni!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (57, CAST(N'2020-07-01T14:11:18.8987193' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:04:33.6669523' AS DateTime2), 1, N'PAPUCE RIDER INFINITY', 80, N'43ad0562-8df8-46a2-894a-43017fce5752.jpg', N'Odlicne papuce po niskoj ceni!', 11)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (58, CAST(N'2020-07-01T14:22:47.7810664' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:04:33.6669515' AS DateTime2), 1, N'Sandale na debelom djonom', 80, N'ca78e4ca-aee5-49f8-89f9-f9c2c1e70db4.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (59, CAST(N'2020-07-01T14:23:10.1401483' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:04:46.5268096' AS DateTime2), 1, N'Ravne sandale S408 ', 90, N'6e0c24d0-b5ca-468b-aa4b-29cd7c8e0a6f.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (60, CAST(N'2020-07-01T14:23:31.6954723' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:11:45.6176070' AS DateTime2), 1, N'Kožne ravne sandale ', 77, N'd6836345-d1c1-4f0d-b765-4e6003edd565.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (61, CAST(N'2020-07-01T14:23:49.0852542' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:11:56.6038088' AS DateTime2), 1, N'Elegantne sandale na štiklu', 77, N'7369d9e1-ed40-4ba7-bf3c-7976161b2ea6.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (62, CAST(N'2020-07-01T14:24:40.3223149' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:08:20.5251158' AS DateTime2), 1, N'Ravne sandale LS020574', 90, N'770ad8bb-32da-497d-8288-df6c41cf8448.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (63, CAST(N'2020-07-01T14:24:53.8413452' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:08:48.4803908' AS DateTime2), 1, N'Udobne sportske sandale S482 ', 90, N'343bd065-d06a-4bf5-bf83-e2582eb2a119.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (64, CAST(N'2020-07-01T14:25:27.8954983' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:09:01.0052926' AS DateTime2), 1, N'Ravne sandale LS020586', 90, N'a6136a3e-0b2d-4610-9f5c-0629102965b0.jpg', N'Odlicne sandale!', 12)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (65, CAST(N'2020-07-01T14:25:55.3068747' AS DateTime2), 1, CAST(N'2020-07-01T14:41:28.8454402' AS DateTime2), CAST(N'2020-07-01T14:40:12.6020191' AS DateTime2), 0, N'Nestooo', 120, N'f643a4da-164f-4a9d-a0eb-53f0497f13ee.jpg', N'Nestoooo', 10)
INSERT [dbo].[Proizvodi] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv], [Kolicina], [Slika], [Opis], [IdKat]) VALUES (66, CAST(N'2020-07-01T14:51:25.2504449' AS DateTime2), 0, NULL, CAST(N'2020-07-01T15:10:12.6451052' AS DateTime2), 1, N'Nesto', 90, N'4762e084-277f-4fe9-b3f0-4e4f156d16ce.jpg', N'Nesto opis', 13)
SET IDENTITY_INSERT [dbo].[Proizvodi] OFF
GO
SET IDENTITY_INSERT [dbo].[Slike] ON 

INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (29, CAST(N'2020-07-01T14:01:14.2753703' AS DateTime2), 0, NULL, NULL, 1, N'd8e72cf0-4b68-4ad8-8ac8-a203abb34a80.jpg', 44)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (30, CAST(N'2020-07-01T14:01:14.2836150' AS DateTime2), 0, NULL, NULL, 1, N'adf4a157-2660-4f7c-b9ea-e071ffb7f254.jpg', 44)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (31, CAST(N'2020-07-01T14:01:14.2860197' AS DateTime2), 0, NULL, NULL, 1, N'1f67727c-aaa8-487e-acba-12b16ccc74fe.jpg', 44)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (32, CAST(N'2020-07-01T14:02:40.8460499' AS DateTime2), 0, NULL, NULL, 1, N'304e6880-a6c5-413f-a1b8-8079689bcc84.jpg', 45)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (33, CAST(N'2020-07-01T14:03:53.4007844' AS DateTime2), 0, NULL, NULL, 1, N'7df90aa2-efa4-4012-9e8e-dac24e0fb5d3.jpg', 46)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (34, CAST(N'2020-07-01T14:04:54.7073148' AS DateTime2), 0, NULL, NULL, 1, N'b3385b0e-bf8a-4e1f-a97b-8f81c8180a4d.jpg', 47)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (35, CAST(N'2020-07-01T14:05:33.4522239' AS DateTime2), 0, NULL, NULL, 1, N'43895c8b-7560-4ce8-8375-8557f4d4cc7c.jpg', 48)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (36, CAST(N'2020-07-01T14:06:44.6670874' AS DateTime2), 0, NULL, NULL, 1, N'4dffea67-700c-4209-8f95-bc3e1674a88d.jpg', 49)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (37, CAST(N'2020-07-01T14:07:21.5725477' AS DateTime2), 0, NULL, NULL, 1, N'7f76c92c-6c5d-46b3-82cc-9a53e0be53e5.jpg', 50)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (38, CAST(N'2020-07-01T14:08:49.1729060' AS DateTime2), 0, NULL, NULL, 1, N'7cd8e1b8-b492-4b7c-953f-22fe84f125eb.jpg', 51)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (39, CAST(N'2020-07-01T14:09:32.6559328' AS DateTime2), 0, NULL, NULL, 1, N'62cb26e1-3592-432a-8ba1-b483b94675aa.jpg', 52)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (40, CAST(N'2020-07-01T14:09:49.2353700' AS DateTime2), 0, NULL, NULL, 1, N'18cf3ad5-bde1-4c2f-b7a4-95ba1c78487f.jpg', 53)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (41, CAST(N'2020-07-01T14:10:04.6407890' AS DateTime2), 0, NULL, NULL, 1, N'6be22d91-0e62-4f87-b377-28cf6549c8a4.jpg', 54)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (42, CAST(N'2020-07-01T14:10:20.9397987' AS DateTime2), 0, NULL, NULL, 1, N'8800ca3a-4829-45a7-9074-8bc5b70a822d.jpg', 55)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (43, CAST(N'2020-07-01T14:10:55.8702574' AS DateTime2), 0, NULL, NULL, 1, N'f5346877-f394-4f88-964e-e8f0df543174.jpg', 56)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (44, CAST(N'2020-07-01T14:11:18.9024054' AS DateTime2), 0, NULL, NULL, 1, N'392f44ae-40c9-46b4-be5b-40d73c813d52.jpg', 57)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (45, CAST(N'2020-07-01T14:22:47.7838291' AS DateTime2), 0, NULL, NULL, 1, N'96d20f58-e14d-4d50-a5d0-3377e585d766.jpg', 58)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (46, CAST(N'2020-07-01T14:23:10.1675826' AS DateTime2), 0, NULL, NULL, 1, N'c2b8e0e4-3b02-414c-986a-7f0d9217eac9.jpg', 59)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (47, CAST(N'2020-07-01T14:23:31.6981824' AS DateTime2), 0, NULL, NULL, 1, N'0a84741a-b15c-4ddf-8873-299ef4714764.jpg', 60)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (48, CAST(N'2020-07-01T14:23:49.0871229' AS DateTime2), 0, NULL, NULL, 1, N'a3f33093-347f-46de-ab55-a6db925bcae3.jpg', 61)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (49, CAST(N'2020-07-01T14:24:40.3276236' AS DateTime2), 0, NULL, NULL, 1, N'95c0a83b-36ad-4ba0-b0a8-1fe74825e97c.jpg', 62)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (50, CAST(N'2020-07-01T14:24:53.8426264' AS DateTime2), 0, NULL, NULL, 1, N'f30147c1-901a-4774-b384-a0ff6bdc7114.jpg', 63)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (51, CAST(N'2020-07-01T14:25:27.9026996' AS DateTime2), 0, NULL, NULL, 1, N'f77a88e1-36a1-4f62-b47e-6f0f4f81eeb2.jpg', 64)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (52, CAST(N'2020-07-01T14:25:55.3081594' AS DateTime2), 1, CAST(N'2020-07-01T14:41:28.8392531' AS DateTime2), NULL, 0, N'65e2b9f2-7fc2-4a72-a031-aa79061096a2.jpg', 65)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (53, CAST(N'2020-07-01T14:43:42.2334926' AS DateTime2), 1, CAST(N'2020-07-01T14:44:34.0863083' AS DateTime2), NULL, 0, N'fd9f460a-fd5f-46b6-ba87-a6619589dea6.jpg', 44)
INSERT [dbo].[Slike] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Putanja], [IdProizvod]) VALUES (54, CAST(N'2020-07-01T14:51:25.2662938' AS DateTime2), 0, NULL, NULL, 1, N'a4e5ca7d-2386-4b9c-8a24-becdc35605e6.jpg', 66)
SET IDENTITY_INSERT [dbo].[Slike] OFF
GO
SET IDENTITY_INSERT [dbo].[Uloge] ON 

INSERT [dbo].[Uloge] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (17, CAST(N'2020-07-01T13:27:12.1730802' AS DateTime2), 0, NULL, NULL, 1, N'Administrator')
INSERT [dbo].[Uloge] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (18, CAST(N'2020-07-01T13:27:47.8122862' AS DateTime2), 0, NULL, NULL, 1, N'Autorizovani korisnik')
INSERT [dbo].[Uloge] ([Id], [CreatedAt], [IsDeleted], [DeletedAt], [ModifiedAt], [IsActive], [Naziv]) VALUES (19, CAST(N'2020-07-01T13:28:25.9680103' AS DateTime2), 1, CAST(N'2020-07-01T13:31:37.1284618' AS DateTime2), CAST(N'2020-07-01T13:31:13.6700794' AS DateTime2), 1, N'PromenjenNaziv')
SET IDENTITY_INSERT [dbo].[Uloge] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (466, N'Kreiranje nove kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:18:35.3924492' AS DateTime2), N'{"Naziv":"Patike"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (467, N'Kreiranje nove kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:18:42.8702559' AS DateTime2), N'{"Naziv":"Papuce"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (468, N'Kreiranje nove kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:19:21.2150223' AS DateTime2), N'{"Naziv":"Sandale"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (469, N'Pretraga kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:19:39.4698224' AS DateTime2), N'{"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (470, N'Pretraga kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:19:47.4854794' AS DateTime2), N'{"Naziv":"Pat","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (471, N'Pretraga kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:19:51.6055571' AS DateTime2), N'{"Naziv":"Pa","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (472, N'Pretraga kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:19:55.6807078' AS DateTime2), N'{"Naziv":"sa","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (473, N'Pretraga jedne kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:20:46.7990322' AS DateTime2), N'10', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (474, N'Pretraga jedne kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:20:49.4049367' AS DateTime2), N'11', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (475, N'Pretraga jedne kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:20:52.3635046' AS DateTime2), N'12', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (476, N'Kreiranje nove kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:21:17.7552521' AS DateTime2), N'{"Naziv":"Nesto"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (477, N'Update kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:21:36.6579490' AS DateTime2), N'{"Id":1332,"Naziv":null}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (478, N'Update kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:21:43.3473672' AS DateTime2), N'{"Id":13,"Naziv":null}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (479, N'Update kategorija koriscenjem Ef-a', CAST(N'2020-07-01T11:21:53.5716706' AS DateTime2), N'{"Id":13,"Naziv":"Jadranke"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (480, N'Brisanje kategorije koriscenjem Ef-a', CAST(N'2020-07-01T11:22:15.7757149' AS DateTime2), N'13', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (481, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:24:37.0661719' AS DateTime2), N'{"Email":null,"DatumOd":"0001-01-01T00:00:00","DatumDo":"0001-01-01T00:00:00","Naziv":null,"NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (482, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:25:16.0750809' AS DateTime2), N'{"Email":"nikolariorovic@gmail.com","DatumOd":"0001-01-01T00:00:00","DatumDo":"0001-01-01T00:00:00","Naziv":null,"NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (483, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:25:25.6695001' AS DateTime2), N'{"Email":null,"DatumOd":"0001-01-01T00:00:00","DatumDo":"0001-01-01T00:00:00","Naziv":"Kategorije","NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (484, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:25:47.4456386' AS DateTime2), N'{"Email":null,"DatumOd":"2020-07-01T00:00:00","DatumDo":"2020-07-01T00:00:00","Naziv":"Kategorije","NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (485, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:25:56.8985336' AS DateTime2), N'{"Email":null,"DatumOd":"2020-07-01T00:00:00","DatumDo":"2020-07-01T00:00:00","Naziv":null,"NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (486, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:26:06.1526587' AS DateTime2), N'{"Email":null,"DatumOd":"2020-01-07T00:00:00","DatumDo":"2020-01-07T00:00:00","Naziv":null,"NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (487, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:26:28.2484358' AS DateTime2), N'{"Email":null,"DatumOd":"2020-07-01T00:00:00","DatumDo":"2020-07-01T00:00:00","Naziv":null,"NotAutorizedActor":false,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (488, N'Pretraga usecase koriscenjem Ef-a', CAST(N'2020-07-01T11:26:35.9816793' AS DateTime2), N'{"Email":null,"DatumOd":"2020-07-01T00:00:00","DatumDo":"2020-07-01T00:00:00","Naziv":null,"NotAutorizedActor":true,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (489, N'Kreiranje nove uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:27:12.1054660' AS DateTime2), N'{"Naziv":"Administrator"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (490, N'Kreiranje nove uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:27:47.8043508' AS DateTime2), N'{"Naziv":"Autorizovani korisnik"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (491, N'Kreiranje nove uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:28:25.9523370' AS DateTime2), N'{"Naziv":"Neka Uloga"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (492, N'Pretraga uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:29:38.0459870' AS DateTime2), N'{"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (493, N'Pretraga uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:29:46.8420723' AS DateTime2), N'{"Naziv":"ad","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (494, N'Pretraga uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:29:50.8631323' AS DateTime2), N'{"Naziv":"au","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (495, N'Pretraga uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:29:55.1379555' AS DateTime2), N'{"Naziv":"ne","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (496, N'Pretraga uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:30:01.4822548' AS DateTime2), N'{"Naziv":"ne","PoStrani":10,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (497, N'Pretraga jedne uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:30:26.5535119' AS DateTime2), N'17', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (498, N'Pretraga jedne uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:30:30.5371844' AS DateTime2), N'18', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (499, N'Pretraga jedne uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:30:33.8910520' AS DateTime2), N'19', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (500, N'Update uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:30:46.2731326' AS DateTime2), N'{"IdUloga":123,"NazivUloga":null}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (501, N'Update uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:30:57.4156045' AS DateTime2), N'{"IdUloga":17,"NazivUloga":null}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (502, N'Update uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:31:03.2294932' AS DateTime2), N'{"IdUloga":19,"NazivUloga":null}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (503, N'Update uloga koriscenjem Ef-a', CAST(N'2020-07-01T11:31:13.6527277' AS DateTime2), N'{"IdUloga":19,"NazivUloga":"PromenjenNaziv"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (504, N'Brisanje uloge koriscenjem Ef-a', CAST(N'2020-07-01T11:31:37.1102988' AS DateTime2), N'19', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (505, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:33:53.7797748' AS DateTime2), N'{"Ime":"Nikola","Prezime":"Riorovic","Jmbg":1105998761034,"Email":"nikolariorovic@gmail.com","Password":"nikola98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (506, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:36:33.0392484' AS DateTime2), N'{"Ime":"Danijel","Prezime":"Biukovic","Jmbg":2711998761019,"Email":"danijelbiukovic98@gmail.com","Password":"danijel98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (507, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:37:46.1096702' AS DateTime2), N'{"Ime":"Milan","Prezime":"Milosavljevic","Jmbg":1236554761827,"Email":"milanmilosavljevic@gmail.com","Password":"milan98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (508, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:39:44.4680163' AS DateTime2), N'{"Ime":"Vasilije","Prezime":"Vasilijevic","Jmbg":17827763782392,"Email":"vasilijevasilijevic@gmail.com","Password":"vasilije98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (509, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:40:43.0934698' AS DateTime2), N'{"Ime":"Milos","Prezime":"Petrovic","Jmbg":1782943938475,"Email":"milospetrovic@gmail.com","Password":"milos98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (510, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:41:34.8655392' AS DateTime2), N'{"Ime":"Stevan","Prezime":"Sremac","Jmbg":1728590989075,"Email":"stevansremac@gmail.com","Password":"stevan98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (511, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:41:57.6012340' AS DateTime2), N'{"Ime":"Lazar","Prezime":"Lazarevic","Jmbg":2859483729870,"Email":"lazarLazarevic@gmail.com","Password":"lazar98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (512, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:42:19.7957646' AS DateTime2), N'{"Ime":"Pera","Prezime":"Peric","Jmbg":1230098978935,"Email":"peraperic@gmail.com","Password":"pera98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (513, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:42:40.3612418' AS DateTime2), N'{"Ime":"Zika","Prezime":"Zikic","Jmbg":2378392057489,"Email":"zikazikic@gmail.com","Password":"zika98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (514, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:43:21.8357454' AS DateTime2), N'{"Ime":"Ana","Prezime":"Majstorovic","Jmbg":3859285700989,"Email":"anamajstorovic@gmail.com","Password":"ana98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (515, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:43:58.3015739' AS DateTime2), N'{"Ime":"Nesto","Prezime":"Nestic","Jmbg":1234567890098,"Email":"nestonestic@gmail.com","Password":"nesto98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (516, N'Pretraga korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:44:04.7978360' AS DateTime2), N'{"SearchZaKorisnike":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (517, N'Pretraga korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:44:11.5986111' AS DateTime2), N'{"SearchZaKorisnike":"ni","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (518, N'Pretraga korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:44:17.1913880' AS DateTime2), N'{"SearchZaKorisnike":"ne","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (519, N'Pretraga korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:44:29.1539758' AS DateTime2), N'{"SearchZaKorisnike":"an","PoStrani":10,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (520, N'Pretraga jednog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:45:02.4394983' AS DateTime2), N'23', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (521, N'Pretraga jednog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:45:09.1708082' AS DateTime2), N'22', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (522, N'Pretraga jednog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:45:12.8652348' AS DateTime2), N'27', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (523, N'Pretraga jednog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:45:14.5197586' AS DateTime2), N'272', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (524, N'Pretraga jednog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:45:33.7177259' AS DateTime2), N'27', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (525, N'Update korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:49:44.8817258' AS DateTime2), N'{"Id":3212,"Ime":"Nestoo","Prezime":"Nesticc","Email":"nestonesticcc@gmail.com","Password":"nesto988","IdUloga":18}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (526, N'Update korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:49:52.6473780' AS DateTime2), N'{"Id":32,"Ime":null,"Prezime":"Nesticc","Email":"nestonesticcc@gmail.com","Password":"nesto988","IdUloga":18}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (527, N'Update korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:49:58.0466093' AS DateTime2), N'{"Id":32,"Ime":"Nestoo","Prezime":"Nesticc","Email":"nestonesticcc@gmail.com","Password":"nesto988","IdUloga":18}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (528, N'Brisanje korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:51:31.4737208' AS DateTime2), N'123', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (529, N'Brisanje korisnika koriscenjem Ef-a', CAST(N'2020-07-01T11:51:45.6819554' AS DateTime2), N'32', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (530, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:01:12.4865054' AS DateTime2), N'{"Naziv":"Air Max 1","Kolicina":56,"Cena":17500.0,"Opis":"Udobna Patika!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"img_1.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584475439img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584475439img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584475439img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (531, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:02:40.8136121' AS DateTime2), N'{"Naziv":"Adidas SUPERSTAR","Kolicina":100,"Cena":10000.0,"Opis":"Elegantna patika!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (532, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:03:53.3689746' AS DateTime2), N'{"Naziv":"Air Jordan 5","Kolicina":100,"Cena":25000.0,"Opis":"Patika za kosarku!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (533, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:04:54.6690903' AS DateTime2), N'{"Naziv":"NIKE MX-720-818","Kolicina":100,"Cena":17000.0,"Opis":"Odlicna patika!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (534, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:05:33.4079530' AS DateTime2), N'{"Naziv":"JORDAN AIR LATITUDE 720","Kolicina":100,"Cena":23500.0,"Opis":"Odlicna patika!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (535, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:06:44.6210516' AS DateTime2), N'{"Naziv":"Air Jordan 3 RETRO","Kolicina":100,"Cena":27300.0,"Opis":"Odlicna patika!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (536, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:07:21.5314927' AS DateTime2), N'{"Naziv":"NIKE AIR BARRAGE LOW","Kolicina":100,"Cena":14500.0,"Opis":"Odlicna patika!","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (537, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:08:49.0225359' AS DateTime2), N'{"Naziv":"PAPUCE ADISSAGE TND","Kolicina":100,"Cena":3500.0,"Opis":"Odlicne papuce!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (538, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:09:32.6251564' AS DateTime2), N'{"Naziv":"PAPUCE ADILETTE COMFORT","Kolicina":100,"Cena":3800.0,"Opis":"Odlicne papuce!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (539, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:09:49.2054385' AS DateTime2), N'{"Naziv":"PAPUCE BENASSI SOLARSOFT ","Kolicina":100,"Cena":4250.0,"Opis":"Odlicne papuce!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (540, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:10:04.6130981' AS DateTime2), N'{"Naziv":"PAPUCE 200 M ","Kolicina":100,"Cena":2500.0,"Opis":"Odlicne papuce!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (541, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:10:20.9175566' AS DateTime2), N'{"Naziv":"PAPUCE BENASSI JDI","Kolicina":100,"Cena":3250.0,"Opis":"Odlicne papuce!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (542, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:10:55.8414529' AS DateTime2), N'{"Naziv":"PAPUCE RIDER BAY VIII","Kolicina":100,"Cena":1850.0,"Opis":"Odlicne papuce po niskoj ceni!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (543, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:11:18.8699305' AS DateTime2), N'{"Naziv":"PAPUCE RIDER INFINITY","Kolicina":100,"Cena":1500.0,"Opis":"Odlicne papuce po niskoj ceni!","IdKat":11,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (544, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:22:47.7515486' AS DateTime2), N'{"Naziv":"Sandale na debelom djonom","Kolicina":100,"Cena":3300.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (545, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:23:10.1079883' AS DateTime2), N'{"Naziv":"Ravne sandale S408 ","Kolicina":100,"Cena":2900.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (546, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:23:31.6793922' AS DateTime2), N'{"Naziv":"Kožne ravne sandale ","Kolicina":100,"Cena":2400.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (547, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:23:49.0563126' AS DateTime2), N'{"Naziv":"Elegantne sandale na štiklu","Kolicina":100,"Cena":5500.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (548, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:24:40.2954546' AS DateTime2), N'{"Naziv":"Ravne sandale LS020574","Kolicina":100,"Cena":2000.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (549, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:24:53.8108064' AS DateTime2), N'{"Naziv":"Udobne sportske sandale S482 ","Kolicina":100,"Cena":2450.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (550, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:25:27.8655005' AS DateTime2), N'{"Naziv":"Ravne sandale LS020586","Kolicina":100,"Cena":2000.0,"Opis":"Odlicne sandale!","IdKat":12,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (551, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:25:55.2811170' AS DateTime2), N'{"Naziv":"Nesto","Kolicina":100,"Cena":100.0,"Opis":"Nesto opis","IdKat":10,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (552, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:26:14.0432416' AS DateTime2), N'{"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (553, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:28:28.1773149' AS DateTime2), N'{"Naziv":null,"PoStrani":3,"Strana":8}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (554, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:29:15.1899757' AS DateTime2), N'123', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (555, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:29:21.6595374' AS DateTime2), N'56', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (556, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:29:47.8895630' AS DateTime2), N'58', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (557, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:30:44.4664002' AS DateTime2), N'50', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (558, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:33:29.2516385' AS DateTime2), N'50', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (559, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:39:13.9375351' AS DateTime2), N'555', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (560, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:39:18.9457311' AS DateTime2), N'55', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (561, N'Update Proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:40:09.1530635' AS DateTime2), N'{"Id":65,"Naziv":"Nestooo","Opis":"Nestoooo","Slika":{"ContentDisposition":"form-data; name=\"Slika\"; filename=\"autor.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slika\"; filename=\"autor.jpg\""],"Content-Type":["image/jpeg"]},"Length":58226,"Name":"Slika","FileName":"autor.jpg"},"Kolicina":20,"Cena":120000.0}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (562, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:40:49.7457218' AS DateTime2), N'65', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (563, N'Brisanje proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:41:18.3740838' AS DateTime2), N'12312', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (564, N'Brisanje proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:41:28.7956728' AS DateTime2), N'65', N'Not authorized actor')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (565, N'Brisanje proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:41:37.2175799' AS DateTime2), N'65', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (566, N'Pretraga svih slika za jedan proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:42:19.3203687' AS DateTime2), N'123', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (567, N'Pretraga svih slika za jedan proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:42:23.8883466' AS DateTime2), N'44', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (568, N'Pretraga svih slika za jedan proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:42:57.4697477' AS DateTime2), N'45', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (569, N'Pretraga svih slika za jedan proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:42:59.5365071' AS DateTime2), N'46', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (570, N'Kreiranje nove slike proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:43:24.2104966' AS DateTime2), N'{"Putanje":null,"IdProizvod":123123}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (571, N'Kreiranje nove slike proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:43:42.2095623' AS DateTime2), N'{"Putanje":[{"ContentDisposition":"form-data; name=\"Putanje\"; filename=\"15845826631584582623img_bg_3.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Putanje\"; filename=\"15845826631584582623img_bg_3.jpg\""],"Content-Type":["image/jpeg"]},"Length":62561,"Name":"Putanje","FileName":"15845826631584582623img_bg_3.jpg"}],"IdProizvod":44}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (572, N'Pretraga svih slika za jedan proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:43:59.3562525' AS DateTime2), N'44', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (573, N'Brisanje slika za odredjeni proizvod koriscenjem Ef-a', CAST(N'2020-07-01T12:44:34.0699815' AS DateTime2), N'[{"Id":53,"IdProizvod":44,"PutanjaSlike":"fd9f460a-fd5f-46b6-ba87-a6619589dea6.jpg"}]', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (574, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T12:46:30.0150989' AS DateTime2), N'{"DatumPorudzbine":"2020-07-02T00:00:00","Adresa":"Ulica 12","Stavke":[{"IdProduct":53,"IdCenovnik":28,"Kolicina":10}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (575, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T12:47:07.4871931' AS DateTime2), N'{"DatumPorudzbine":"2020-07-02T00:00:00","Adresa":"Ulica 12","Stavke":[{"IdProduct":53,"IdCenovnik":28,"Kolicina":10}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (576, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T12:47:51.6185631' AS DateTime2), N'{"DatumPorudzbine":"2020-07-02T00:00:00","Adresa":"Ulica 12","Stavke":[{"IdProduct":53,"IdCenovnik":28,"Kolicina":10}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (577, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T12:49:47.4308714' AS DateTime2), N'{"DatumPorudzbine":"2020-07-02T00:00:00","Adresa":"Ulica 12","Stavke":[{"IdProduct":53,"IdCenovnik":28,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (578, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:51:25.2070081' AS DateTime2), N'{"Naziv":"Nesto","Kolicina":100,"Cena":100.0,"Opis":"Nesto opis","IdKat":13,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (579, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:58:49.5968096' AS DateTime2), N'{"Naziv":"Nesto","Kolicina":100,"Cena":100.0,"Opis":"Nesto opis","IdKat":13,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (580, N'Kreiranje novog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T12:59:41.3035543' AS DateTime2), N'{"Naziv":"Nesto","Kolicina":100,"Cena":100.0,"Opis":"Nesto opis","IdKat":13,"Slike":[{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1581369526img_6.jpg\""],"Content-Type":["image/jpeg"]},"Length":55605,"Name":"Slike","FileName":"1581369526img_6.jpg"},{"ContentDisposition":"form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Slike\"; filename=\"1584473423img_1.jpg\""],"Content-Type":["image/jpeg"]},"Length":65070,"Name":"Slike","FileName":"1584473423img_1.jpg"}]}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (581, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:01:15.5310878' AS DateTime2), N'{"DatumPorudzbine":"2020-07-12T00:00:00","Adresa":"Ulica 13","Stavke":[{"IdProduct":54,"IdCenovnik":29,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (582, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:03:15.1245018' AS DateTime2), N'{"DatumPorudzbine":"2020-07-09T00:00:00","Adresa":"Ulica 14","Stavke":[{"IdProduct":56,"IdCenovnik":31,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (583, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:03:24.9150799' AS DateTime2), N'{"DatumPorudzbine":"2020-07-09T00:00:00","Adresa":"Ulica 15","Stavke":[{"IdProduct":57,"IdCenovnik":32,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (584, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:03:32.4458139' AS DateTime2), N'{"DatumPorudzbine":"2020-07-09T00:00:00","Adresa":"Ulica 16","Stavke":[{"IdProduct":58,"IdCenovnik":33,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (585, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:04:33.6392501' AS DateTime2), N'{"DatumPorudzbine":"2020-07-09T00:00:00","Adresa":"Ulica 16","Stavke":[{"IdProduct":58,"IdCenovnik":33,"Kolicina":10},{"IdProduct":57,"IdCenovnik":32,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (586, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:04:46.5011647' AS DateTime2), N'{"DatumPorudzbine":"2020-07-09T00:00:00","Adresa":"Ulica 17","Stavke":[{"IdProduct":59,"IdCenovnik":34,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (587, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:05:11.5823388' AS DateTime2), N'{"DatumPorudzbine":"2020-07-15T00:00:00","Adresa":"Ulica 17","Stavke":[{"IdProduct":60,"IdCenovnik":35,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (588, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:08:08.5918468' AS DateTime2), N'{"DatumPorudzbine":"2020-07-04T00:00:00","Adresa":"Ulica 18","Stavke":[{"IdProduct":61,"IdCenovnik":36,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (589, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:08:20.5046864' AS DateTime2), N'{"DatumPorudzbine":"2020-07-06T00:00:00","Adresa":"Ulica 19","Stavke":[{"IdProduct":62,"IdCenovnik":37,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (590, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:08:48.4734476' AS DateTime2), N'{"DatumPorudzbine":"2020-07-17T00:00:00","Adresa":"Ulica 29","Stavke":[{"IdProduct":63,"IdCenovnik":38,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (591, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:09:00.9994424' AS DateTime2), N'{"DatumPorudzbine":"2020-07-25T00:00:00","Adresa":"Ulica 30","Stavke":[{"IdProduct":64,"IdCenovnik":39,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (592, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:09:23.0540404' AS DateTime2), N'{"DatumPorudzbine":"2020-07-22T00:00:00","Adresa":"Ulica 31","Stavke":[{"IdProduct":65,"IdCenovnik":40,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (593, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:10:12.6286434' AS DateTime2), N'{"DatumPorudzbine":"2020-07-11T00:00:00","Adresa":"Ulica 32","Stavke":[{"IdProduct":66,"IdCenovnik":42,"Kolicina":10}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (594, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:11:45.5886420' AS DateTime2), N'{"DatumPorudzbine":"2020-07-26T00:00:00","Adresa":"Ulica 33","Stavke":[{"IdProduct":60,"IdCenovnik":35,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (595, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:11:56.5979123' AS DateTime2), N'{"DatumPorudzbine":"2020-07-27T00:00:00","Adresa":"Ulica 34","Stavke":[{"IdProduct":61,"IdCenovnik":36,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (596, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:13:36.6914624' AS DateTime2), N'{"DatumPorudzbine":"2020-07-15T00:00:00","Adresa":"Ulica 35","Stavke":[{"IdProduct":44,"IdCenovnik":19,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (597, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:13:49.3959392' AS DateTime2), N'{"DatumPorudzbine":"2020-07-17T00:00:00","Adresa":"Ulica 36","Stavke":[{"IdProduct":45,"IdCenovnik":20,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (598, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:14:15.8508677' AS DateTime2), N'{"DatumPorudzbine":"2020-07-17T00:00:00","Adresa":"Ulica 37","Stavke":[{"IdProduct":46,"IdCenovnik":21,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (599, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:14:26.6456340' AS DateTime2), N'{"DatumPorudzbine":"2020-07-19T00:00:00","Adresa":"Ulica 38","Stavke":[{"IdProduct":47,"IdCenovnik":22,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (600, N'Kreiranje nove porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:14:29.7233446' AS DateTime2), N'{"DatumPorudzbine":"2020-07-14T00:00:00","Adresa":"Ulica 38","Stavke":[{"IdProduct":47,"IdCenovnik":22,"Kolicina":13}]}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (601, N'Promena statusa porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:17:49.9978963' AS DateTime2), N'{"IdPorudzbine":1234,"Status":0}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (602, N'Promena statusa porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:18:17.9992008' AS DateTime2), N'{"IdPorudzbine":1234,"Status":0}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (603, N'Promena statusa porudzbine koriscenjem Ef-a', CAST(N'2020-07-01T13:19:29.0305200' AS DateTime2), N'{"IdPorudzbine":1234,"Status":0}', N'nikolariorovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (604, N'Update korisnika koriscenjem Ef-a', CAST(N'2020-07-01T13:27:58.3320585' AS DateTime2), N'{"Id":31,"Ime":"Nestoo","Prezime":"Nesticc","Email":"nestonesticcc@gmail.com","Password":"nesto988","IdUloga":17}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (605, N'Update korisnika koriscenjem Ef-a', CAST(N'2020-07-01T13:28:16.7408636' AS DateTime2), N'{"Id":31,"Ime":"Nestoo","Prezime":"Nesticc","Email":"nestonesticcc@gmail.com","Password":"nesto988","IdUloga":17}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (606, N'Update korisnika koriscenjem Ef-a', CAST(N'2020-07-01T13:29:09.7155434' AS DateTime2), N'{"Id":31,"Ime":"Nestoo","Prezime":"Nesticc","Email":"nestonesticcc@gmail.com","Password":"nesto988","IdUloga":17}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (607, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:37:46.3633587' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (608, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:38:04.7115853' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (609, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:40:53.6659498' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (610, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:44:16.1241395' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (611, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:44:40.4677159' AS DateTime2), N'{"IdKat":10,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (612, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:44:57.2023254' AS DateTime2), N'{"IdKat":16,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (613, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T13:45:11.1261862' AS DateTime2), N'{"IdKat":10,"Naziv":"Air","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (614, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T14:04:38.3294192' AS DateTime2), N'{"Ime":"Nadica","Prezime":"Petrovic","Jmbg":2859403786574,"Email":"nadicapetrovic@gmail.com","Password":"nadica98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (615, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:05:45.7467855' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'nadicapetrovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (616, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:06:25.3712345' AS DateTime2), N'56', N'nadicapetrovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (617, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:06:28.7273171' AS DateTime2), N'2323', N'nadicapetrovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (618, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:06:36.1884258' AS DateTime2), N'56', N'nadicapetrovic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (619, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:33:15.4775088' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (620, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:33:23.0477556' AS DateTime2), N'{"IdKat":0,"Naziv":"AS","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (621, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:33:34.1604976' AS DateTime2), N'123', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (622, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:33:39.6416775' AS DateTime2), N'55', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (623, N'Kreiranje novog korisnika koriscenjem Ef-a', CAST(N'2020-07-01T14:34:28.9585753' AS DateTime2), N'{"Ime":"Ljuba","Prezime":"Ljubicic","Jmbg":1274590438273,"Email":"ljubaljubicic@gmail.com","Password":"ljuba98"}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (624, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:43:00.8044121' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (625, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:43:17.2923871' AS DateTime2), N'{"IdKat":11,"Naziv":"AS","PoStrani":3,"Strana":1}', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (626, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:43:28.7328970' AS DateTime2), N'55', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (627, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:43:37.2100905' AS DateTime2), N'57', N'Not authorized actor')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (628, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:44:38.7828373' AS DateTime2), N'{"IdKat":11,"Naziv":"AS","PoStrani":3,"Strana":1}', N'ljubaljubicic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (629, N'Pretraga proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:44:41.8035684' AS DateTime2), N'{"IdKat":0,"Naziv":null,"PoStrani":3,"Strana":1}', N'ljubaljubicic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (630, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:44:44.1647331' AS DateTime2), N'57', N'ljubaljubicic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (631, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:44:47.5457635' AS DateTime2), N'50', N'ljubaljubicic@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [NazivUseCase], [Datum], [Podaci], [Actor]) VALUES (632, N'Pretraga jednog proizvoda koriscenjem Ef-a', CAST(N'2020-07-01T14:46:27.6983513' AS DateTime2), N'60', N'ljubaljubicic@gmail.com')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
ALTER TABLE [dbo].[Cenovnici] ADD  DEFAULT ((0.0)) FOR [CenaProizvod]
GO
ALTER TABLE [dbo].[Porudzbine] ADD  DEFAULT ((0)) FOR [StatusPorudzbine]
GO
ALTER TABLE [dbo].[Porudzbine] ADD  DEFAULT ((0)) FOR [NacinPlacanja]
GO
ALTER TABLE [dbo].[Cenovnici]  WITH CHECK ADD  CONSTRAINT [FK_Cenovnici_Proizvodi_IdProizvod] FOREIGN KEY([IdProizvod])
REFERENCES [dbo].[Proizvodi] ([Id])
GO
ALTER TABLE [dbo].[Cenovnici] CHECK CONSTRAINT [FK_Cenovnici_Proizvodi_IdProizvod]
GO
ALTER TABLE [dbo].[DetaljiPorudzbina]  WITH CHECK ADD  CONSTRAINT [FK_DetaljiPorudzbina_Porudzbine_IdPorudzbina] FOREIGN KEY([IdPorudzbina])
REFERENCES [dbo].[Porudzbine] ([Id])
GO
ALTER TABLE [dbo].[DetaljiPorudzbina] CHECK CONSTRAINT [FK_DetaljiPorudzbina_Porudzbine_IdPorudzbina]
GO
ALTER TABLE [dbo].[DetaljiPorudzbina]  WITH CHECK ADD  CONSTRAINT [FK_DetaljiPorudzbina_Proizvodi_IdProizvod] FOREIGN KEY([IdProizvod])
REFERENCES [dbo].[Proizvodi] ([Id])
GO
ALTER TABLE [dbo].[DetaljiPorudzbina] CHECK CONSTRAINT [FK_DetaljiPorudzbina_Proizvodi_IdProizvod]
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD  CONSTRAINT [FK_Korisnici_Uloge_IdUloga] FOREIGN KEY([IdUloga])
REFERENCES [dbo].[Uloge] ([Id])
GO
ALTER TABLE [dbo].[Korisnici] CHECK CONSTRAINT [FK_Korisnici_Uloge_IdUloga]
GO
ALTER TABLE [dbo].[KorisnikUseCases]  WITH CHECK ADD  CONSTRAINT [FK_KorisnikUseCases_Korisnici_IdKorisnik] FOREIGN KEY([IdKorisnik])
REFERENCES [dbo].[Korisnici] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KorisnikUseCases] CHECK CONSTRAINT [FK_KorisnikUseCases_Korisnici_IdKorisnik]
GO
ALTER TABLE [dbo].[Porudzbine]  WITH CHECK ADD  CONSTRAINT [FK_Porudzbine_Korisnici_IdKorisnik] FOREIGN KEY([IdKorisnik])
REFERENCES [dbo].[Korisnici] ([Id])
GO
ALTER TABLE [dbo].[Porudzbine] CHECK CONSTRAINT [FK_Porudzbine_Korisnici_IdKorisnik]
GO
ALTER TABLE [dbo].[Proizvodi]  WITH CHECK ADD  CONSTRAINT [FK_Proizvodi_Kategorije_IdKat] FOREIGN KEY([IdKat])
REFERENCES [dbo].[Kategorije] ([Id])
GO
ALTER TABLE [dbo].[Proizvodi] CHECK CONSTRAINT [FK_Proizvodi_Kategorije_IdKat]
GO
ALTER TABLE [dbo].[Slike]  WITH CHECK ADD  CONSTRAINT [FK_Slike_Proizvodi_IdProizvod] FOREIGN KEY([IdProizvod])
REFERENCES [dbo].[Proizvodi] ([Id])
GO
ALTER TABLE [dbo].[Slike] CHECK CONSTRAINT [FK_Slike_Proizvodi_IdProizvod]
GO
