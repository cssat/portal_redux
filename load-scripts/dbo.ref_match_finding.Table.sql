USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_match_finding]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_match_finding]') AND type in (N'U'))
DROP TABLE [dbo].[ref_match_finding]
GO
/****** Object:  Table [dbo].[ref_match_finding]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_match_finding](
	[filter_finding] [decimal](18, 0) NULL,
	[fl_founded_phys_abuse] [int] NULL,
	[fl_founded_sexual_abuse] [int] NULL,
	[fl_founded_neglect] [int] NULL,
	[fl_any_finding_legal] [int] NULL,
	[cd_finding] [int] NULL
) ON [PRIMARY]
GO
