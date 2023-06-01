USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_filter_dependency]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_filter_dependency]') AND type in (N'U'))
DROP TABLE [dbo].[ref_filter_dependency]
GO
/****** Object:  Table [dbo].[ref_filter_dependency]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_filter_dependency](
	[bin_dep_cd] [int] NOT NULL,
	[bin_dep_desc] [char](200) NULL,
	[diff_days_from] [int] NULL,
	[diff_days_thru] [int] NULL,
	[fl_dep_exist] [tinyint] NULL,
	[lag] [int] NULL,
	[min_filter_date] [datetime] NULL,
 CONSTRAINT [PK_ref_filter_dependency] PRIMARY KEY CLUSTERED 
(
	[bin_dep_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
