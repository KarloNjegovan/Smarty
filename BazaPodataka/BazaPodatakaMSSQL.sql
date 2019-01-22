USE [testAplikacija]
GO
/****** Object:  Table [dbo].[Korisnik]    Script Date: 22/01/2019 19:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnik](
	[korisnik_id] [int] IDENTITY(1,1) NOT NULL,
	[kor_ime] [varchar](50) NOT NULL,
	[lozinka] [varchar](50) NOT NULL,
	[ime] [varchar](50) NOT NULL,
	[prezime] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Korisnik] PRIMARY KEY CLUSTERED 
(
	[korisnik_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mjerenje_Dan]    Script Date: 22/01/2019 19:30:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mjerenje_Dan](
	[stanica] [int] NOT NULL,
	[temperatura] [int] NOT NULL,
	[vlaznost] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mjerenje_sat]    Script Date: 22/01/2019 19:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mjerenje_sat](
	[stanica] [int] NOT NULL,
	[temperatura] [int] NOT NULL,
	[vlaznost] [int] NOT NULL,
 CONSTRAINT [PK_Mjerenje_sekunde] PRIMARY KEY CLUSTERED 
(
	[stanica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mjerenje_tjedan]    Script Date: 22/01/2019 19:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mjerenje_tjedan](
	[stanica] [int] NOT NULL,
	[temperatura] [int] NOT NULL,
	[vlaznost] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stanica]    Script Date: 22/01/2019 19:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stanica](
	[stanica_id] [int] IDENTITY(1,1) NOT NULL,
	[naziv] [varchar](50) NOT NULL,
	[lokacija] [varchar](50) NOT NULL,
	[al_temp] [int] NOT NULL,
	[al_vlaz] [int] NOT NULL,
 CONSTRAINT [PK_Stanica] PRIMARY KEY CLUSTERED 
(
	[stanica_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mjerenje_Dan]  WITH CHECK ADD  CONSTRAINT [FK_Mjerenje_Sat_Stanica] FOREIGN KEY([stanica])
REFERENCES [dbo].[Stanica] ([stanica_id])
GO
ALTER TABLE [dbo].[Mjerenje_Dan] CHECK CONSTRAINT [FK_Mjerenje_Sat_Stanica]
GO
ALTER TABLE [dbo].[Mjerenje_sat]  WITH CHECK ADD  CONSTRAINT [FK_Mjerenje_sekunde_Stanica] FOREIGN KEY([stanica])
REFERENCES [dbo].[Stanica] ([stanica_id])
GO
ALTER TABLE [dbo].[Mjerenje_sat] CHECK CONSTRAINT [FK_Mjerenje_sekunde_Stanica]
GO
ALTER TABLE [dbo].[Mjerenje_tjedan]  WITH CHECK ADD  CONSTRAINT [FK_Mjerenje_tjedan_Stanica] FOREIGN KEY([stanica])
REFERENCES [dbo].[Stanica] ([stanica_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Mjerenje_tjedan] CHECK CONSTRAINT [FK_Mjerenje_tjedan_Stanica]
GO
