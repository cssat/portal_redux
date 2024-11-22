USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_custody]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_custody]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_custody]
GO
/****** Object:  Table [dbo].[ref_lookup_custody]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_custody](
	[custody_id] [tinyint] NOT NULL,
	[custody_desc] [varchar](50) NULL
) ON [PRIMARY]
GO
