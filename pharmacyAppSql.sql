USE [Pharmacy]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AdminEmail] [nvarchar](50) NOT NULL,
	[AdminPassword] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firms]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Firms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Barcode] [int] NOT NULL,
	[ProductionDate] [date] NOT NULL,
	[ExperienceDate] [date] NOT NULL,
	[Withreceipt] [bit] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine_To_Firms]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine_To_Firms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirmId] [int] NOT NULL,
	[MedicineId] [int] NOT NULL,
 CONSTRAINT [PK_Medicine_To_Firms] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine_To_Tags]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine_To_Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TagID] [int] NOT NULL,
	[MedicineID] [int] NOT NULL,
 CONSTRAINT [PK_Medicine_To_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkerID] [int] NOT NULL,
	[MedicineID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 10/13/2020 11:18:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicine_To_Firms]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_To_Firms_Firms] FOREIGN KEY([FirmId])
REFERENCES [dbo].[Firms] ([ID])
GO
ALTER TABLE [dbo].[Medicine_To_Firms] CHECK CONSTRAINT [FK_Medicine_To_Firms_Firms]
GO
ALTER TABLE [dbo].[Medicine_To_Firms]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_To_Firms_Medicine] FOREIGN KEY([MedicineId])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[Medicine_To_Firms] CHECK CONSTRAINT [FK_Medicine_To_Firms_Medicine]
GO
ALTER TABLE [dbo].[Medicine_To_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_To_Tags_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[Medicine_To_Tags] CHECK CONSTRAINT [FK_Medicine_To_Tags_Medicine]
GO
ALTER TABLE [dbo].[Medicine_To_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_To_Tags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[Medicine_To_Tags] CHECK CONSTRAINT [FK_Medicine_To_Tags_Tags]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Medicine] FOREIGN KEY([MedicineID])
REFERENCES [dbo].[Medicine] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Medicine]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Workers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[Workers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Workers]
GO
