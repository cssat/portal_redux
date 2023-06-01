USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_age_groupings_census]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_age_groupings_census]') AND type in (N'U'))
DROP TABLE [dbo].[ref_age_groupings_census]
GO
/****** Object:  Table [dbo].[ref_age_groupings_census]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_age_groupings_census](
	[age_grouping_cd] [int] NOT NULL,
	[age_begin] [int] NOT NULL,
	[age_lessthan_end] [int] NOT NULL,
	[age_grouping] [char](50) NULL,
 CONSTRAINT [PK_ref_Age_Groupings_census] PRIMARY KEY CLUSTERED 
(
	[age_grouping_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
