USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_xwalk_race_origin]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_xwalk_race_origin]') AND type in (N'U'))
DROP TABLE [dbo].[ref_xwalk_race_origin]
GO
/****** Object:  Table [dbo].[ref_xwalk_race_origin]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_xwalk_race_origin](
	[cd_race_census] [int] NOT NULL,
	[census_hispanic_latino_origin_cd] [int] NOT NULL,
 CONSTRAINT [PK_ref_xwalk_race_origin] PRIMARY KEY CLUSTERED 
(
	[cd_race_census] ASC,
	[census_hispanic_latino_origin_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
