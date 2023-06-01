USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_match_allegation]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_match_allegation]') AND type in (N'U'))
DROP TABLE [dbo].[ref_match_allegation]
GO
/****** Object:  Table [dbo].[ref_match_allegation]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_match_allegation](
	[cd_allegation] [int] NOT NULL,
	[filter_allegation] [int] NOT NULL,
	[fl_phys_abuse] [int] NULL,
	[fl_sexual_abuse] [int] NULL,
	[fl_neglect] [int] NULL,
	[fl_any_legal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[filter_allegation] ASC,
	[cd_allegation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
