USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_filter_los]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_filter_los]') AND type in (N'U'))
DROP TABLE [dbo].[ref_filter_los]
GO
/****** Object:  Table [dbo].[ref_filter_los]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_filter_los](
	[bin_los_cd] [int] NOT NULL,
	[bin_los_desc] [char](200) NULL,
	[dur_days_from] [int] NULL,
	[dur_days_thru] [int] NULL,
	[lag] [int] NULL,
 CONSTRAINT [PK_ref_filter_los] PRIMARY KEY CLUSTERED 
(
	[bin_los_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
