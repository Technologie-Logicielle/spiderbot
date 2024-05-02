USE [crawler]
GO
/****** Object:  Table [dbo].[attendees]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendees](
	[id] [int] NOT NULL,
	[conference_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[organization] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[registered] [int] NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conference]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conference](
	[conference_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[country] [varchar](255) NOT NULL,
	[city] [varchar](255) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[submit_format] [varchar](255) NOT NULL,
	[description] [varchar](255) NULL,
	[url] [varchar](255) NOT NULL,
	[created_at] [bigint] NOT NULL,
 CONSTRAINT [PK__conferen__3213E83F5F91DBE3] PRIMARY KEY CLUSTERED 
(
	[conference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crawler]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crawler](
	[id] [int] NOT NULL,
	[label] [varchar](255) NOT NULL,
	[config] [nvarchar](max) NOT NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crawler_configuration]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crawler_configuration](
	[id] [int] NOT NULL,
	[crawler_id] [int] NULL,
	[label] [varchar](255) NOT NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[deadline]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[deadline](
	[conference_code] [int] NOT NULL,
	[date] [date] NOT NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[conference_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[links]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[links](
	[link_id] [int] IDENTITY(1,1) NOT NULL,
	[source_page_id] [int] NULL,
	[destination_url] [varchar](255) NULL,
	[link_type] [varchar](50) NULL,
	[available] [bit] NULL,
 CONSTRAINT [PK__links__3213E83FC84724EE] PRIMARY KEY CLUSTERED 
(
	[link_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notification]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notification](
	[conference_code] [int] NULL,
	[data] [varchar](255) NULL,
	[created_at] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pages]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pages](
	[page_id] [int] IDENTITY(1,1) NOT NULL,
	[url] [varchar](255) NOT NULL,
	[title] [varchar](255) NULL,
	[content] [text] NULL,
	[crawled_at_hour] [int] NULL,
	[crawled_at_minute] [int] NULL,
	[crawled_at_second] [int] NULL,
	[available] [bit] NULL,
 CONSTRAINT [PK__pages__3213E83F52C91B60] PRIMARY KEY CLUSTERED 
(
	[page_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[papers]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[papers](
	[id] [int] NOT NULL,
	[conference_id] [int] NOT NULL,
	[title] [varchar](255) NOT NULL,
	[abstract] [text] NULL,
	[accepted] [int] NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[permission_id] [int] NOT NULL,
	[role_id] [int] NULL,
	[permission_name] [text] NULL,
	[description] [varchar](255) NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] NOT NULL,
	[role_name] [text] NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[speakers]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[speakers](
	[id] [int] NOT NULL,
	[conference_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[organization] [varchar](255) NULL,
	[bio] [text] NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_follow_conference]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_follow_conference](
	[conf_code] [int] NOT NULL,
	[user_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_permissions]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_permissions](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] NOT NULL,
	[username] [varchar](255) NOT NULL,
	[hashed_password] [varchar](255) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[created_at] [timestamp] NOT NULL,
	[role] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[websites]    Script Date: 5/2/2024 9:51:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[websites](
	[id] [int] NOT NULL,
	[url] [varchar](255) NOT NULL,
	[name] [varchar](255) NULL,
	[description] [varchar](255) NULL,
	[created_at] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[conference] ON 

INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (1, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Madrid, Spain ', N' Madrid, Spain ', CAST(N'2024-04-24T22:36:21.357' AS DateTime), CAST(N'2024-04-24T22:36:21.357' AS DateTime), N'abc', N'abcd', N'2265395', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (2, N'International Conference On Data Mining, Communications And Information Technology (ICDMCIT) ', N' Washington DC, USA ', N' Washington DC, USA ', CAST(N'2024-04-24T22:36:21.443' AS DateTime), CAST(N'2024-04-24T22:36:21.443' AS DateTime), N'abc', N'abcd', N'2265408', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (3, N'International Conference on Recent Developments in Computer &amp; Information Technology (ICRDCIT) ', N' Freetown, Sierra Leone ', N' Freetown, Sierra Leone ', CAST(N'2024-04-24T22:36:21.450' AS DateTime), CAST(N'2024-04-24T22:36:21.450' AS DateTime), N'abc', N'abcd', N'2267283', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (4, N'International Conference on Aviation Management and Information Technology (ICAMIT) ', N' Leipzig, Germany ', N' Leipzig, Germany ', CAST(N'2024-04-24T22:36:21.457' AS DateTime), CAST(N'2024-04-24T22:36:21.457' AS DateTime), N'abc', N'abcd', N'2267290', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (5, N'International Conference on Recent Developments in Computer &amp; Information Technology (ICRDCIT) ', N' Augusta, USA ', N' Augusta, USA ', CAST(N'2024-04-24T22:36:21.460' AS DateTime), CAST(N'2024-04-24T22:36:21.460' AS DateTime), N'abc', N'abcd', N'2269080', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (6, N'International Conference on Geoinformation Science, Engineering and Technology (ICGSET) ', N' New York, USA ', N' New York, USA ', CAST(N'2024-04-24T22:36:21.463' AS DateTime), CAST(N'2024-04-24T22:36:21.463' AS DateTime), N'abc', N'abcd', N'2347193', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (7, N'INTERNATIONAL CONFERENCE ON RECENT ADVANCE IN ENGINEERING AND TECHNOLOGY (ICRAET) ', N' Odessa, Ukraine ', N' Odessa, Ukraine ', CAST(N'2024-04-24T22:36:21.467' AS DateTime), CAST(N'2024-04-24T22:36:21.467' AS DateTime), N'abc', N'abcd', N'2350879', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (8, N'International Conference on Health Information Technology and Healthcare Efficiency (ICHITHE) ', N' Skopje, Macedonia ', N' Skopje, Macedonia ', CAST(N'2024-04-24T22:36:21.473' AS DateTime), CAST(N'2024-04-24T22:36:21.473' AS DateTime), N'abc', N'abcd', N'2350890', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (9, N'International Conference on Communications and Information Technology (ICCOMIT) ', N' Wuhan, China ', N' Wuhan, China ', CAST(N'2024-04-24T22:36:21.477' AS DateTime), CAST(N'2024-04-24T22:36:21.477' AS DateTime), N'abc', N'abcd', N'2350897', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (10, N'International Conference on Aviation Management and Information Technology (ICAMIT) ', N' Anuradhapura, Sri Lanka ', N' Anuradhapura, Sri Lanka ', CAST(N'2024-04-24T22:36:21.480' AS DateTime), CAST(N'2024-04-24T22:36:21.480' AS DateTime), N'abc', N'abcd', N'2269973', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (11, N'International Conference on Next Gen Information Systems and Technologies (ICNGIST) ', N' Belgrano, Argentina ', N' Belgrano, Argentina ', CAST(N'2024-04-24T22:36:21.483' AS DateTime), CAST(N'2024-04-24T22:36:21.483' AS DateTime), N'abc', N'abcd', N'2269975', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (12, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Burgas, Bulgaria ', N' Burgas, Bulgaria ', CAST(N'2024-04-24T22:36:21.487' AS DateTime), CAST(N'2024-04-24T22:36:21.487' AS DateTime), N'abc', N'abcd', N'2269977', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (13, N'International Conference on Health Information Technology and Healthcare Efficiency (ICHITHE) ', N' Munich, Germany ', N' Munich, Germany ', CAST(N'2024-04-24T22:36:21.490' AS DateTime), CAST(N'2024-04-24T22:36:21.490' AS DateTime), N'abc', N'abcd', N'2350409', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (14, N'International Conference on Computer Science and Information Technology (ICCSIT) ', N' Dublin, Ireland ', N' Dublin, Ireland ', CAST(N'2024-04-24T22:36:21.497' AS DateTime), CAST(N'2024-04-24T22:36:21.497' AS DateTime), N'abc', N'abcd', N'2350470', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (15, N'International Conference on Aviation Management and Information Technology (ICAMIT) ', N' Geneva, Switzerland ', N' Geneva, Switzerland ', CAST(N'2024-04-24T22:36:21.500' AS DateTime), CAST(N'2024-04-24T22:36:21.500' AS DateTime), N'abc', N'abcd', N'2350859', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (16, N'International Conference on Emerging Trends in Information Technology (ICETIT) ', N' Arequipa, Peru ', N' Arequipa, Peru ', CAST(N'2024-04-24T22:36:21.507' AS DateTime), CAST(N'2024-04-24T22:36:21.507' AS DateTime), N'abc', N'abcd', N'2350911', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (17, N'INTERNATIONAL CONFERENCE ON RECENT ADVANCE IN ENGINEERING AND TECHNOLOGY (ICRAET) ', N' Ottawa, Canada ', N' Ottawa, Canada ', CAST(N'2024-04-24T22:36:21.513' AS DateTime), CAST(N'2024-04-24T22:36:21.513' AS DateTime), N'abc', N'abcd', N'2359624', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (18, N'International Conference On Data Mining, Communications And Information Technology (ICDMCIT) ', N' Paris, France ', N' Paris, France ', CAST(N'2024-04-24T22:36:21.520' AS DateTime), CAST(N'2024-04-24T22:36:21.520' AS DateTime), N'abc', N'abcd', N'2359628', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (19, N'International Conference on Communication Technology and New Media (ICCTNM) ', N' Beira, Mozambique ', N' Beira, Mozambique ', CAST(N'2024-04-24T22:36:21.523' AS DateTime), CAST(N'2024-04-24T22:36:21.523' AS DateTime), N'abc', N'abcd', N'2360244', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (20, N'INTERNATIONAL CONFERENCE ON RECENT ADVANCE IN ENGINEERING AND TECHNOLOGY (ICRAET) ', N' Chicago, USA ', N' Chicago, USA ', CAST(N'2024-04-24T22:36:21.533' AS DateTime), CAST(N'2024-04-24T22:36:21.533' AS DateTime), N'abc', N'abcd', N'2265404', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (21, N'International Conference on Emerging Trends in Information Technology (ICETIT) ', N' Perth, Australia ', N' Perth, Australia ', CAST(N'2024-04-24T22:36:21.537' AS DateTime), CAST(N'2024-04-24T22:36:21.537' AS DateTime), N'abc', N'abcd', N'2270024', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (22, N'World Conference on Electrical, Electronics, Computer Science and Information Technology (WCEECSIT) ', N' Seoul, south Korea ', N' Seoul, south Korea ', CAST(N'2024-04-24T22:36:21.550' AS DateTime), CAST(N'2024-04-24T22:36:21.550' AS DateTime), N'abc', N'abcd', N'2306023', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (23, N'International Conference on Communications and Information Technology Security (ICCITS) ', N' Jeddah, Saudi Arabia ', N' Jeddah, Saudi Arabia ', CAST(N'2024-04-24T22:36:21.560' AS DateTime), CAST(N'2024-04-24T22:36:21.560' AS DateTime), N'abc', N'abcd', N'2306523', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (24, N'International Conference on Recent Developments in Computer &amp; Information Technology (ICRDCIT) ', N' Amman, Jordan ', N' Amman, Jordan ', CAST(N'2024-04-24T22:36:21.567' AS DateTime), CAST(N'2024-04-24T22:36:21.567' AS DateTime), N'abc', N'abcd', N'2345389', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (25, N'International Conference on Rural Education and Information Technology (ICREIT) ', N' Karachi, Pakistan ', N' Karachi, Pakistan ', CAST(N'2024-04-24T22:36:21.570' AS DateTime), CAST(N'2024-04-24T22:36:21.570' AS DateTime), N'abc', N'abcd', N'2345407', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (26, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Budapest, Hungary ', N' Budapest, Hungary ', CAST(N'2024-04-24T22:36:21.577' AS DateTime), CAST(N'2024-04-24T22:36:21.577' AS DateTime), N'abc', N'abcd', N'2349040', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (27, N'International Conference on Business Informatics and Information Engineering (ICBIIE) ', N' Chicago, USA ', N' Chicago, USA ', CAST(N'2024-04-24T22:36:21.580' AS DateTime), CAST(N'2024-04-24T22:36:21.580' AS DateTime), N'abc', N'abcd', N'2349858', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (28, N'International Conference on Communication and Information Technology and Engineering (ICCITE) ', N' Vienna, Austria ', N' Vienna, Austria ', CAST(N'2024-04-24T22:36:21.583' AS DateTime), CAST(N'2024-04-24T22:36:21.583' AS DateTime), N'abc', N'abcd', N'2349967', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (29, N'World Conference on Electrical, Electronics, Computer Science and Information Technology (WCEECSIT) ', N' Split, Croatia ', N' Split, Croatia ', CAST(N'2024-04-24T22:36:21.590' AS DateTime), CAST(N'2024-04-24T22:36:21.590' AS DateTime), N'abc', N'abcd', N'2358245', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (30, N'International Conference on Computer Science and Engineering (ICCSAE) ', N' Faisalabad, Pakistan ', N' Faisalabad, Pakistan ', CAST(N'2024-04-24T22:36:21.593' AS DateTime), CAST(N'2024-04-24T22:36:21.593' AS DateTime), N'abc', N'abcd', N'2358757', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (31, N'International Conference on Business Informatics and Information Engineering (ICBIIE) ', N' Amsterdam, Netherlands ', N' Amsterdam, Netherlands ', CAST(N'2024-04-24T22:36:21.597' AS DateTime), CAST(N'2024-04-24T22:36:21.597' AS DateTime), N'abc', N'abcd', N'2359990', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (32, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Freeport, Bahamas ', N' Freeport, Bahamas ', CAST(N'2024-04-24T22:36:21.603' AS DateTime), CAST(N'2024-04-24T22:36:21.603' AS DateTime), N'abc', N'abcd', N'2360126', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (33, N'International Conference on Computer Science (ICCSC) ', N' Skopje, Macedonia ', N' Skopje, Macedonia ', CAST(N'2024-04-24T22:36:21.607' AS DateTime), CAST(N'2024-04-24T22:36:21.607' AS DateTime), N'abc', N'abcd', N'2360139', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (34, N'International Conference on Computer Science and Engineering (ICCSAE) ', N' Abu Dhabi, UAE ', N' Abu Dhabi, UAE ', CAST(N'2024-04-24T22:36:21.610' AS DateTime), CAST(N'2024-04-24T22:36:21.610' AS DateTime), N'abc', N'abcd', N'2360582', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (35, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Moscow, Russia ', N' Moscow, Russia ', CAST(N'2024-04-24T22:36:21.617' AS DateTime), CAST(N'2024-04-24T22:36:21.617' AS DateTime), N'abc', N'abcd', N'2360984', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (36, N'International Conference on Computing and Electronics Engineering (ICCEE) ', N' Barcelona, Spain ', N' Barcelona, Spain ', CAST(N'2024-04-24T22:36:21.620' AS DateTime), CAST(N'2024-04-24T22:36:21.620' AS DateTime), N'abc', N'abcd', N'2360986', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (37, N'International Conference on Computer Science and Engineering (ICCSAE) ', N' Chandigarh, India ', N' Chandigarh, India ', CAST(N'2024-04-24T22:36:21.623' AS DateTime), CAST(N'2024-04-24T22:36:21.623' AS DateTime), N'abc', N'abcd', N'2478387', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (38, N'International Conference on Computer Science and Engineering (ICCSAE) ', N' Jaipur, India ', N' Jaipur, India ', CAST(N'2024-04-24T22:36:21.630' AS DateTime), CAST(N'2024-04-24T22:36:21.630' AS DateTime), N'abc', N'abcd', N'2478436', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (39, N'International Conference on Computer Science and Engineering (ICCSAE) ', N' Mumbai, India ', N' Mumbai, India ', CAST(N'2024-04-24T22:36:21.633' AS DateTime), CAST(N'2024-04-24T22:36:21.633' AS DateTime), N'abc', N'abcd', N'2478447', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (40, N'International Conference on Engineering &amp; Technology (ICET) ', N' Kolkata, India ', N' Kolkata, India ', CAST(N'2024-04-24T22:36:21.637' AS DateTime), CAST(N'2024-04-24T22:36:21.637' AS DateTime), N'abc', N'abcd', N'2480190', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (41, N'International Conference on Engineering &amp; Technology (ICET) ', N' Pune, India ', N' Pune, India ', CAST(N'2024-04-24T22:36:21.643' AS DateTime), CAST(N'2024-04-24T22:36:21.643' AS DateTime), N'abc', N'abcd', N'2480207', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (42, N'International Conference on Engineering &amp; Technology (ICET) ', N' Goa, India ', N' Goa, India ', CAST(N'2024-04-24T22:36:21.650' AS DateTime), CAST(N'2024-04-24T22:36:21.650' AS DateTime), N'abc', N'abcd', N'2480224', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (43, N'International Conference on Engineering &amp; Technology (ICET) ', N' Pondicherry, India ', N' Pondicherry, India ', CAST(N'2024-04-24T22:36:21.653' AS DateTime), CAST(N'2024-04-24T22:36:21.653' AS DateTime), N'abc', N'abcd', N'2480226', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (44, N'National Conference on Bigdata Analysis (NCBA) ', N' Kolkata, India ', N' Kolkata, India ', CAST(N'2024-04-24T22:36:21.657' AS DateTime), CAST(N'2024-04-24T22:36:21.657' AS DateTime), N'abc', N'abcd', N'2481179', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (45, N'National Conference on Internet Of Things (NCIOT) ', N' Raipur, India ', N' Raipur, India ', CAST(N'2024-04-24T22:36:21.663' AS DateTime), CAST(N'2024-04-24T22:36:21.663' AS DateTime), N'abc', N'abcd', N'2481189', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (46, N'National Conference on Advanced Computer Science and Information Technology (NCACSI) ', N' Guwahati, India ', N' Guwahati, India ', CAST(N'2024-04-24T22:36:21.703' AS DateTime), CAST(N'2024-04-24T22:36:21.703' AS DateTime), N'abc', N'abcd', N'2481197', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (47, N'National Conference on Bigdata Analysis (NCBA) ', N' Coimbatore, India ', N' Coimbatore, India ', CAST(N'2024-04-24T22:36:21.707' AS DateTime), CAST(N'2024-04-24T22:36:21.707' AS DateTime), N'abc', N'abcd', N'2481221', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (48, N'National Conference on Internet Of Things (NCIOT) ', N' Patna, India ', N' Patna, India ', CAST(N'2024-04-24T22:36:21.710' AS DateTime), CAST(N'2024-04-24T22:36:21.710' AS DateTime), N'abc', N'abcd', N'2481231', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (49, N'National Conference on Advanced Computer Science and Information Technology (NCACSI) ', N' Coimbatore, India ', N' Coimbatore, India ', CAST(N'2024-04-24T22:36:21.713' AS DateTime), CAST(N'2024-04-24T22:36:21.713' AS DateTime), N'abc', N'abcd', N'2481239', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (50, N'National Conference on Bigdata Analysis (NCBA) ', N' Jaipur, India ', N' Jaipur, India ', CAST(N'2024-04-24T22:36:21.720' AS DateTime), CAST(N'2024-04-24T22:36:21.720' AS DateTime), N'abc', N'abcd', N'2481263', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (51, N'National Conference on Internet Of Things (NCIOT) ', N' Delhi, India ', N' Delhi, India ', CAST(N'2024-04-24T22:36:21.723' AS DateTime), CAST(N'2024-04-24T22:36:21.723' AS DateTime), N'abc', N'abcd', N'2481273', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (52, N'National Conference on Advanced Computer Science and Information Technology (NCACSI) ', N' Jaipur, India ', N' Jaipur, India ', CAST(N'2024-04-24T22:36:21.723' AS DateTime), CAST(N'2024-04-24T22:36:21.723' AS DateTime), N'abc', N'abcd', N'2481281', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (53, N'National Conference on Bigdata Analysis (NCBA) ', N' Ahmedabad, India ', N' Ahmedabad, India ', CAST(N'2024-04-24T22:36:21.730' AS DateTime), CAST(N'2024-04-24T22:36:21.730' AS DateTime), N'abc', N'abcd', N'2481305', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (54, N'National Conference on Internet Of Things (NCIOT) ', N' Goa, India ', N' Goa, India ', CAST(N'2024-04-24T22:36:21.730' AS DateTime), CAST(N'2024-04-24T22:36:21.730' AS DateTime), N'abc', N'abcd', N'2481315', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (55, N'National Conference on Bigdata Analysis (NCBA) ', N' Kolkata, India ', N' Kolkata, India ', CAST(N'2024-04-24T22:36:21.737' AS DateTime), CAST(N'2024-04-24T22:36:21.737' AS DateTime), N'abc', N'abcd', N'2481326', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (56, N'National Conference on Internet Of Things (NCIOT) ', N' Raipur, India ', N' Raipur, India ', CAST(N'2024-04-24T22:36:21.737' AS DateTime), CAST(N'2024-04-24T22:36:21.737' AS DateTime), N'abc', N'abcd', N'2481336', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (57, N'National Conference on Advanced Computer Science and Information Technology (NCACSI) ', N' Guwahati, India ', N' Guwahati, India ', CAST(N'2024-04-24T22:36:21.740' AS DateTime), CAST(N'2024-04-24T22:36:21.740' AS DateTime), N'abc', N'abcd', N'2481344', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (58, N'National Conference on Bigdata Analysis (NCBA) ', N' Coimbatore, India ', N' Coimbatore, India ', CAST(N'2024-04-24T22:36:21.743' AS DateTime), CAST(N'2024-04-24T22:36:21.743' AS DateTime), N'abc', N'abcd', N'2481368', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (59, N'National Conference on Internet Of Things (NCIOT) ', N' Patna, India ', N' Patna, India ', CAST(N'2024-04-24T22:36:21.747' AS DateTime), CAST(N'2024-04-24T22:36:21.747' AS DateTime), N'abc', N'abcd', N'2481378', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (60, N'National Conference on Advanced Computer Science and Information Technology (NCACSI) ', N' Coimbatore, India ', N' Coimbatore, India ', CAST(N'2024-04-24T22:36:21.753' AS DateTime), CAST(N'2024-04-24T22:36:21.753' AS DateTime), N'abc', N'abcd', N'2481386', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (61, N'National Conference on Bigdata Analysis (NCBA) ', N' Jaipur, India ', N' Jaipur, India ', CAST(N'2024-04-24T22:36:21.757' AS DateTime), CAST(N'2024-04-24T22:36:21.757' AS DateTime), N'abc', N'abcd', N'2481410', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (62, N'National Conference on Internet Of Things (NCIOT) ', N' Delhi, India ', N' Delhi, India ', CAST(N'2024-04-24T22:36:21.760' AS DateTime), CAST(N'2024-04-24T22:36:21.760' AS DateTime), N'abc', N'abcd', N'2481420', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (63, N'National Conference on Advanced Computer Science and Information Technology (NCACSI) ', N' Jaipur, India ', N' Jaipur, India ', CAST(N'2024-04-24T22:36:21.763' AS DateTime), CAST(N'2024-04-24T22:36:21.763' AS DateTime), N'abc', N'abcd', N'2481428', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (64, N'National Conference on Bigdata Analysis (NCBA) ', N' Ahmedabad, India ', N' Ahmedabad, India ', CAST(N'2024-04-24T22:36:21.770' AS DateTime), CAST(N'2024-04-24T22:36:21.770' AS DateTime), N'abc', N'abcd', N'2481452', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (65, N'National Conference on Internet Of Things (NCIOT) ', N' Goa, India ', N' Goa, India ', CAST(N'2024-04-24T22:36:21.773' AS DateTime), CAST(N'2024-04-24T22:36:21.773' AS DateTime), N'abc', N'abcd', N'2481462', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (66, N'International Conference on Engineering &amp; Technology (ICET) ', N' Chennai, India ', N' Chennai, India ', CAST(N'2024-04-24T22:36:21.780' AS DateTime), CAST(N'2024-04-24T22:36:21.780' AS DateTime), N'abc', N'abcd', N'2479634', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (67, N'International Conference on Engineering &amp; Technology (ICET) ', N' Delhi, India ', N' Delhi, India ', CAST(N'2024-04-24T22:36:21.783' AS DateTime), CAST(N'2024-04-24T22:36:21.783' AS DateTime), N'abc', N'abcd', N'2479699', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (68, N'International Conference on Engineering &amp; Technology (ICET) ', N' Trivandrum, India ', N' Trivandrum, India ', CAST(N'2024-04-24T22:36:21.787' AS DateTime), CAST(N'2024-04-24T22:36:21.787' AS DateTime), N'abc', N'abcd', N'2479764', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (69, N'International Conference on Business Informatics and Information Engineering (ICBIIE) ', N' Dubai, UAE ', N' Dubai, UAE ', CAST(N'2024-04-24T22:36:21.793' AS DateTime), CAST(N'2024-04-24T22:36:21.793' AS DateTime), N'abc', N'abcd', N'2267602', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (70, N'International Conference on Rural Education and Information Technology (ICREIT) ', N' Barcelona, Spain ', N' Barcelona, Spain ', CAST(N'2024-04-24T22:36:21.800' AS DateTime), CAST(N'2024-04-24T22:36:21.800' AS DateTime), N'abc', N'abcd', N'2307519', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (71, N'International Conference on Business Informatics and Information Engineering (ICBIIE) ', N' Harare, Zimbabwe ', N' Harare, Zimbabwe ', CAST(N'2024-04-24T22:36:21.807' AS DateTime), CAST(N'2024-04-24T22:36:21.807' AS DateTime), N'abc', N'abcd', N'2309273', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (72, N'International Conference on Emerging Trends in Engineering , Science and Technology (ICEST) ', N' Khovd, Mongolia ', N' Khovd, Mongolia ', CAST(N'2024-04-24T22:36:21.810' AS DateTime), CAST(N'2024-04-24T22:36:21.810' AS DateTime), N'abc', N'abcd', N'2309394', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (73, N'International Conference on Engineering &amp; Technology (ICET) ', N' Kampala, Uganda ', N' Kampala, Uganda ', CAST(N'2024-04-24T22:36:21.817' AS DateTime), CAST(N'2024-04-24T22:36:21.817' AS DateTime), N'abc', N'abcd', N'2310290', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (74, N'International Conference on Communication and Information Technology and Engineering (ICCITE) ', N' New York, USA ', N' New York, USA ', CAST(N'2024-04-24T22:36:21.823' AS DateTime), CAST(N'2024-04-24T22:36:21.823' AS DateTime), N'abc', N'abcd', N'2349033', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (75, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Bogra, Bangladesh ', N' Bogra, Bangladesh ', CAST(N'2024-04-24T22:36:21.827' AS DateTime), CAST(N'2024-04-24T22:36:21.827' AS DateTime), N'abc', N'abcd', N'2350445', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (76, N'International Conference on Communications and Information Technology (ICCOMIT) ', N' Kuala Lumpur, Malaysia ', N' Kuala Lumpur, Malaysia ', CAST(N'2024-04-24T22:36:21.830' AS DateTime), CAST(N'2024-04-24T22:36:21.830' AS DateTime), N'abc', N'abcd', N'2360080', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (77, N'International Conference on Communications and Information Technology (ICCOMIT) ', N' Busan, South Korea ', N' Busan, South Korea ', CAST(N'2024-04-24T22:36:21.837' AS DateTime), CAST(N'2024-04-24T22:36:21.837' AS DateTime), N'abc', N'abcd', N'2361002', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (78, N'International Conference on Engineering &amp; Technology (ICET) ', N' Nicosia, Cyprus ', N' Nicosia, Cyprus ', CAST(N'2024-04-24T22:36:21.840' AS DateTime), CAST(N'2024-04-24T22:36:21.840' AS DateTime), N'abc', N'abcd', N'2271790', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (79, N'International Conference on Computer Science, Mechatronics and Information Technology (ICCSMIT) ', N' Brno, Czech Republic ', N' Brno, Czech Republic ', CAST(N'2024-04-24T22:36:21.847' AS DateTime), CAST(N'2024-04-24T22:36:21.847' AS DateTime), N'abc', N'abcd', N'2317209', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (80, N'International Conference on Advanced Computer Science and Information Technology (ICACSIT) ', N' Newcastle, Australia ', N' Newcastle, Australia ', CAST(N'2024-04-24T22:36:21.853' AS DateTime), CAST(N'2024-04-24T22:36:21.853' AS DateTime), N'abc', N'abcd', N'2319478', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (81, N'International Conference on Business Informatics and Information Engineering (ICBIIE) ', N' Bangkok, Thailand ', N' Bangkok, Thailand ', CAST(N'2024-04-24T22:36:21.860' AS DateTime), CAST(N'2024-04-24T22:36:21.860' AS DateTime), N'abc', N'abcd', N'2321214', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (82, N'International Conference on Engineering (ICOE) ', N' Poznan, Poland ', N' Poznan, Poland ', CAST(N'2024-04-24T22:36:21.863' AS DateTime), CAST(N'2024-04-24T22:36:21.863' AS DateTime), N'abc', N'abcd', N'2368302', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (83, N'International Conference on Communications and Information Technology (ICCOMIT) ', N' Banjul, Gambia ', N' Banjul, Gambia ', CAST(N'2024-04-24T22:36:21.870' AS DateTime), CAST(N'2024-04-24T22:36:21.870' AS DateTime), N'abc', N'abcd', N'2368314', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (84, N'INTERNATIONAL CONFERENCE ON RECENT ADVANCE IN ENGINEERING AND TECHNOLOGY (ICRAET) ', N' Bruges, Belgium ', N' Bruges, Belgium ', CAST(N'2024-04-24T22:36:21.877' AS DateTime), CAST(N'2024-04-24T22:36:21.877' AS DateTime), N'abc', N'abcd', N'2377489', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (85, N'International Conference on Computing and Electronics Engineering (ICCEE) ', N' Lyon, France ', N' Lyon, France ', CAST(N'2024-04-24T22:36:21.883' AS DateTime), CAST(N'2024-04-24T22:36:21.883' AS DateTime), N'abc', N'abcd', N'2387987', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (86, N'International Conference on Business Informatics and Information Engineering (ICBIIE) ', N' Riyadh, Saudi Arabia ', N' Riyadh, Saudi Arabia ', CAST(N'2024-04-24T22:36:21.890' AS DateTime), CAST(N'2024-04-24T22:36:21.890' AS DateTime), N'abc', N'abcd', N'2271797', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (87, N'International Conference on Health Information Technology and Future Prospects (ICHITFP) ', N' Thimphu, Bhutan ', N' Thimphu, Bhutan ', CAST(N'2024-04-24T22:36:21.897' AS DateTime), CAST(N'2024-04-24T22:36:21.897' AS DateTime), N'abc', N'abcd', N'2273178', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (88, N'International Conference on Health Information Technology and Healthcare Efficiency (ICHITHE) ', N' Bulawayo, Zimbabwe ', N' Bulawayo, Zimbabwe ', CAST(N'2024-04-24T22:36:21.903' AS DateTime), CAST(N'2024-04-24T22:36:21.903' AS DateTime), N'abc', N'abcd', N'2275041', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (89, N'INTERNATIONAL CONFERENCE ON RECENT ADVANCE IN ENGINEERING AND TECHNOLOGY (ICRAET) ', N' Miami, USA ', N' Miami, USA ', CAST(N'2024-04-24T22:36:21.910' AS DateTime), CAST(N'2024-04-24T22:36:21.910' AS DateTime), N'abc', N'abcd', N'2275474', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (90, N'International Conference on Dependable Computing, Fault Tolerance and Information Technology (ICDCFTITEC) ', N' Las vegas, USA ', N' Las vegas, USA ', CAST(N'2024-04-24T22:36:21.917' AS DateTime), CAST(N'2024-04-24T22:36:21.917' AS DateTime), N'abc', N'abcd', N'2368359', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (91, N'International Conference on Information Science, Engineering and Technology (ICISEAT) ', N' Lisbon, Portugal ', N' Lisbon, Portugal ', CAST(N'2024-04-24T22:36:21.920' AS DateTime), CAST(N'2024-04-24T22:36:21.920' AS DateTime), N'abc', N'abcd', N'2368764', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (92, N'International Conference on Emerging Trends in Information Technology (ICETIT) ', N' Sohar, Oman ', N' Sohar, Oman ', CAST(N'2024-04-24T22:36:21.927' AS DateTime), CAST(N'2024-04-24T22:36:21.927' AS DateTime), N'abc', N'abcd', N'2368776', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (93, N'INTERNATIONAL CONFERENCE ON COMPUTERS, DATA MANAGEMENT AND TECHNOLOGY APPLICATIONS (ICCDTA) ', N' Vienna, Austria ', N' Vienna, Austria ', CAST(N'2024-04-24T22:36:21.953' AS DateTime), CAST(N'2024-04-24T22:36:21.953' AS DateTime), N'abc', N'abcd', N'2368779', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (94, N'International Conference on Recent Developments in Computer &amp; Information Technology (ICRDCIT) ', N' Kunming, China ', N' Kunming, China ', CAST(N'2024-04-24T22:36:21.960' AS DateTime), CAST(N'2024-04-24T22:36:21.960' AS DateTime), N'abc', N'abcd', N'2371988', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (95, N'International Conference on Communications and Information Technology Security (ICCITS) ', N' Freeport, Bahamas ', N' Freeport, Bahamas ', CAST(N'2024-04-24T22:36:21.967' AS DateTime), CAST(N'2024-04-24T22:36:21.967' AS DateTime), N'abc', N'abcd', N'2373323', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (96, N'International Conference on Advanced Computer Science and Information Technology (ICACSIT) ', N' Odessa, Ukraine ', N' Odessa, Ukraine ', CAST(N'2024-04-24T22:36:21.973' AS DateTime), CAST(N'2024-04-24T22:36:21.973' AS DateTime), N'abc', N'abcd', N'2373337', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (97, N'International Conference on Engineering &amp; Technology (ICET) ', N' Kranj, Slovenia ', N' Kranj, Slovenia ', CAST(N'2024-04-24T22:36:21.977' AS DateTime), CAST(N'2024-04-24T22:36:21.977' AS DateTime), N'abc', N'abcd', N'2380651', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (98, N'International Conference on Next Gen Information Systems and Technologies (ICNGIST) ', N' Taipei City, Taiwan ', N' Taipei City, Taiwan ', CAST(N'2024-04-24T22:36:21.983' AS DateTime), CAST(N'2024-04-24T22:36:21.983' AS DateTime), N'abc', N'abcd', N'2380653', 1713998181)
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (99, N'International Conference on Aviation Management and Information Technology (ICAMIT) ', N' Chennai, India ', N' Chennai, India ', CAST(N'2024-04-24T22:36:21.990' AS DateTime), CAST(N'2024-04-24T22:36:21.990' AS DateTime), N'abc', N'abcd', N'2479401', 1713998181)
GO
INSERT [dbo].[conference] ([conference_id], [name], [country], [city], [start_date], [end_date], [submit_format], [description], [url], [created_at]) VALUES (100, N'International Conference on Aviation Management and Information Technology (ICAMIT) ', N' Delhi, India ', N' Delhi, India ', CAST(N'2024-04-24T22:36:21.993' AS DateTime), CAST(N'2024-04-24T22:36:21.993' AS DateTime), N'abc', N'abcd', N'2479409', 1713998181)
SET IDENTITY_INSERT [dbo].[conference] OFF
GO
SET IDENTITY_INSERT [dbo].[pages] ON 

INSERT [dbo].[pages] ([page_id], [url], [title], [content], [crawled_at_hour], [crawled_at_minute], [crawled_at_second], [available]) VALUES (1, N'https://internationalconferencealerts.com/conference/information-technology', N'Upcoming Information Technology Conferences 2024', NULL, 0, 1, 10, 1)
SET IDENTITY_INSERT [dbo].[pages] OFF
GO
INSERT [dbo].[users] ([id], [username], [hashed_password], [first_name], [last_name], [email], [role]) VALUES (1, N'new_username', N'new_password', N'Duc Binh', N'Nguyen', N'abc@gmail.com', N'admin')
INSERT [dbo].[users] ([id], [username], [hashed_password], [first_name], [last_name], [email], [role]) VALUES (2, N'DHHuong', N'123456', N'Hoai Huong', N'Duong', N'bcd@gmail.com', N'Visitor')
INSERT [dbo].[users] ([id], [username], [hashed_password], [first_name], [last_name], [email], [role]) VALUES (3, N'TranDungSy', N'123456', N'Dung Sy', N'Tran', N'cde@gmail.com', N'User')
INSERT [dbo].[users] ([id], [username], [hashed_password], [first_name], [last_name], [email], [role]) VALUES (4, N'TruongHoAnhPha', N'123456', N'Anh Pha', N'Truong Ho', N'def@gmail.com', N'User')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_email]    Script Date: 5/2/2024 9:51:22 AM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC57280CAD400]    Script Date: 5/2/2024 9:51:22 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[attendees] ADD  DEFAULT ((0)) FOR [registered]
GO
ALTER TABLE [dbo].[papers] ADD  DEFAULT ((0)) FOR [accepted]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('visitor') FOR [role]
GO
ALTER TABLE [dbo].[attendees]  WITH CHECK ADD  CONSTRAINT [FK__attendees__confe__3E52440B] FOREIGN KEY([conference_id])
REFERENCES [dbo].[conference] ([conference_id])
GO
ALTER TABLE [dbo].[attendees] CHECK CONSTRAINT [FK__attendees__confe__3E52440B]
GO
ALTER TABLE [dbo].[crawler_configuration]  WITH CHECK ADD FOREIGN KEY([crawler_id])
REFERENCES [dbo].[crawler] ([id])
GO
ALTER TABLE [dbo].[deadline]  WITH CHECK ADD  CONSTRAINT [FK__deadline__confer__412EB0B6] FOREIGN KEY([conference_code])
REFERENCES [dbo].[conference] ([conference_id])
GO
ALTER TABLE [dbo].[deadline] CHECK CONSTRAINT [FK__deadline__confer__412EB0B6]
GO
ALTER TABLE [dbo].[links]  WITH CHECK ADD  CONSTRAINT [FK__links__source_pa__4F7CD00D] FOREIGN KEY([source_page_id])
REFERENCES [dbo].[pages] ([page_id])
GO
ALTER TABLE [dbo].[links] CHECK CONSTRAINT [FK__links__source_pa__4F7CD00D]
GO
ALTER TABLE [dbo].[notification]  WITH CHECK ADD  CONSTRAINT [FK__notificat__confe__4316F928] FOREIGN KEY([conference_code])
REFERENCES [dbo].[conference] ([conference_id])
GO
ALTER TABLE [dbo].[notification] CHECK CONSTRAINT [FK__notificat__confe__4316F928]
GO
ALTER TABLE [dbo].[papers]  WITH CHECK ADD  CONSTRAINT [FK__papers__conferen__3A81B327] FOREIGN KEY([conference_id])
REFERENCES [dbo].[conference] ([conference_id])
GO
ALTER TABLE [dbo].[papers] CHECK CONSTRAINT [FK__papers__conferen__3A81B327]
GO
ALTER TABLE [dbo].[permissions]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[speakers]  WITH CHECK ADD  CONSTRAINT [FK__speakers__confer__36B12243] FOREIGN KEY([conference_id])
REFERENCES [dbo].[conference] ([conference_id])
GO
ALTER TABLE [dbo].[speakers] CHECK CONSTRAINT [FK__speakers__confer__36B12243]
GO
ALTER TABLE [dbo].[user_follow_conference]  WITH CHECK ADD  CONSTRAINT [FK__user_foll__conf___32E0915F] FOREIGN KEY([conf_code])
REFERENCES [dbo].[conference] ([conference_id])
GO
ALTER TABLE [dbo].[user_follow_conference] CHECK CONSTRAINT [FK__user_foll__conf___32E0915F]
GO
ALTER TABLE [dbo].[user_follow_conference]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[user_permissions]  WITH CHECK ADD FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([permission_id])
GO
ALTER TABLE [dbo].[user_permissions]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[links]  WITH CHECK ADD  CONSTRAINT [CK__links__link_type__4E88ABD4] CHECK  (([link_type]='external' OR [link_type]='internal'))
GO
ALTER TABLE [dbo].[links] CHECK CONSTRAINT [CK__links__link_type__4E88ABD4]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='visitor' OR [role]='reader' OR [role]='user' OR [role]='admin'))
GO
