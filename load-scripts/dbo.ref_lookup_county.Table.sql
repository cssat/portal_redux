USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_county]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_county]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_county]
GO
/****** Object:  Table [dbo].[ref_lookup_county]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_county](
	[county_cd] [int] NOT NULL,
	[county_desc] [varchar](200) NULL,
	[cd_region] [int] NULL,
	[old_region_cd] [int] NULL,
	[old_region_desc] [varchar](200) NULL,
	[countyfips] [int] NULL,
 CONSTRAINT [PK_ref_lookup_county] PRIMARY KEY CLUSTERED 
(
	[county_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
