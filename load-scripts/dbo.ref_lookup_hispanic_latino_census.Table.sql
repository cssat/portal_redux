USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_hispanic_latino_census]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_hispanic_latino_census]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_hispanic_latino_census]
GO
/****** Object:  Table [dbo].[ref_lookup_hispanic_latino_census]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_hispanic_latino_census](
	[census_hispanic_latino_origin_cd] [int] NOT NULL,
	[census_hispanic_latino_origin] [varchar](200) NULL,
	[cd_race_census] [int] NULL,
 CONSTRAINT [PK_ref_lookup_hispanic_latino_census] PRIMARY KEY CLUSTERED 
(
	[census_hispanic_latino_origin_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
