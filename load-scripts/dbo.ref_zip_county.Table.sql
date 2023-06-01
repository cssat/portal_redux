USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_zip_county]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_zip_county]') AND type in (N'U'))
DROP TABLE [dbo].[ref_zip_county]
GO
/****** Object:  Table [dbo].[ref_zip_county]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_zip_county](
	[zip5] [int] NULL,
	[zip_type] [char](50) NULL,
	[county] [char](200) NULL,
	[county_cd] [int] NULL
) ON [PRIMARY]
GO
