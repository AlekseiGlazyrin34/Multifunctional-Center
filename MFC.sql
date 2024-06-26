USE [Multifunctional Center]
GO
/****** Object:  Table [dbo].[Appointment List]    Script Date: 26.01.2024 0:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment List](
	[Appointment_Id] [int] IDENTITY(1,1) NOT NULL,
	[UserPassportSerie] [int] NULL,
	[UserPassportNumber] [int] NULL,
	[Employee_Id] [int] NULL,
	[Service_Provided] [int] NULL,
	[A_Date] [date] NULL,
	[A_Time] [time](7) NULL,
 CONSTRAINT [PK_Appointment List] PRIMARY KEY CLUSTERED 
(
	[Appointment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 26.01.2024 0:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Employee_Id] [int] NOT NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Job_Title] [int] NULL,
	[Phone_Number] [nvarchar](15) NULL,
	[Address] [nvarchar](max) NULL,
	[Center_Id] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 26.01.2024 0:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Job_Id] [int] NOT NULL,
	[Job_Title] [nvarchar](max) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Job_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Multifunctional Center]    Script Date: 26.01.2024 0:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multifunctional Center](
	[Center_Id] [int] NOT NULL,
	[Center_Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Multifunctional Center] PRIMARY KEY CLUSTERED 
(
	[Center_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registered users]    Script Date: 26.01.2024 0:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registered users](
	[Passport_Serie] [int] NOT NULL,
	[Passport_Number] [int] NOT NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Phone_Number] [nvarchar](15) NULL,
	[Address] [nvarchar](max) NULL,
	[Access] [int] NULL,
 CONSTRAINT [PK_Registered users] PRIMARY KEY CLUSTERED 
(
	[Passport_Serie] ASC,
	[Passport_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services List]    Script Date: 26.01.2024 0:13:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services List](
	[Service_Id] [int] NOT NULL,
	[Service_Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Services List] PRIMARY KEY CLUSTERED 
(
	[Service_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment List]  WITH CHECK ADD  CONSTRAINT [FK_Appointment List_Employees] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employees] ([Employee_Id])
GO
ALTER TABLE [dbo].[Appointment List] CHECK CONSTRAINT [FK_Appointment List_Employees]
GO
ALTER TABLE [dbo].[Appointment List]  WITH CHECK ADD  CONSTRAINT [FK_Appointment List_Registered users1] FOREIGN KEY([UserPassportSerie], [UserPassportNumber])
REFERENCES [dbo].[Registered users] ([Passport_Serie], [Passport_Number])
GO
ALTER TABLE [dbo].[Appointment List] CHECK CONSTRAINT [FK_Appointment List_Registered users1]
GO
ALTER TABLE [dbo].[Appointment List]  WITH CHECK ADD  CONSTRAINT [FK_Appointment List_Services List] FOREIGN KEY([Service_Provided])
REFERENCES [dbo].[Services List] ([Service_Id])
GO
ALTER TABLE [dbo].[Appointment List] CHECK CONSTRAINT [FK_Appointment List_Services List]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Jobs] FOREIGN KEY([Job_Title])
REFERENCES [dbo].[Jobs] ([Job_Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Jobs]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Multifunctional Center] FOREIGN KEY([Center_Id])
REFERENCES [dbo].[Multifunctional Center] ([Center_Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Multifunctional Center]
GO
ALTER TABLE [dbo].[Appointment List]  WITH CHECK ADD  CONSTRAINT [Date] CHECK  (([A_Date]>=getdate()))
GO
ALTER TABLE [dbo].[Appointment List] CHECK CONSTRAINT [Date]
GO
ALTER TABLE [dbo].[Registered users]  WITH CHECK ADD  CONSTRAINT [PassNumber] CHECK  ((len([Passport_Number])=(6)))
GO
ALTER TABLE [dbo].[Registered users] CHECK CONSTRAINT [PassNumber]
GO
ALTER TABLE [dbo].[Registered users]  WITH CHECK ADD  CONSTRAINT [PassSerie] CHECK  ((len([Passport_Serie])=(4)))
GO
ALTER TABLE [dbo].[Registered users] CHECK CONSTRAINT [PassSerie]
GO
ALTER TABLE [dbo].[Registered users]  WITH CHECK ADD  CONSTRAINT [PhoneNumber] CHECK  ((len([Phone_Number])<=(15)))
GO
ALTER TABLE [dbo].[Registered users] CHECK CONSTRAINT [PhoneNumber]
GO
