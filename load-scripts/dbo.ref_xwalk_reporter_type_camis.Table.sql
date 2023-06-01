USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_xwalk_reporter_type_camis]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_xwalk_reporter_type_camis]') AND type in (N'U'))
DROP TABLE [dbo].[ref_xwalk_reporter_type_camis]
GO
/****** Object:  Table [dbo].[ref_xwalk_reporter_type_camis]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_xwalk_reporter_type_camis](
	[dcfref_rfrnt_type_code] [int] NULL,
	[cd_reporter_famlink] [int] NULL
) ON [PRIMARY]
GO
