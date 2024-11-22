USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_county_region]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_county_region]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_county_region]
GO
/****** Object:  Table [dbo].[ref_lookup_county_region]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_county_region](
	[county_cd] [int] NULL,
	[county] [varchar](255) NULL,
	[region_cd] [int] NULL,
	[old_region_cd] [int] NULL,
	[region_6_cd] [smallint] NULL,
	[region_6_tx] [varchar](255) NULL,
	[small_fl] [smallint] NULL
) ON [PRIMARY]
GO
