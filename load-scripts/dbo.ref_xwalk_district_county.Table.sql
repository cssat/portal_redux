USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_xwalk_district_county]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_xwalk_district_county]') AND type in (N'U'))
DROP TABLE [dbo].[ref_xwalk_district_county]
GO
/****** Object:  Table [dbo].[ref_xwalk_district_county]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_xwalk_district_county](
	[esd_cd] [varchar](255) NULL,
	[school_district] [varchar](255) NULL,
	[county_cd] [int] NULL,
	[county] [varchar](255) NULL
) ON [PRIMARY]
GO
