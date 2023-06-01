USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_ethnicity_census]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_ethnicity_census]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_ethnicity_census]
GO
/****** Object:  Table [dbo].[ref_lookup_ethnicity_census]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_ethnicity_census](
	[cd_race_census] [int] NOT NULL,
	[tx_race_census] [varchar](200) NULL,
 CONSTRAINT [ct_pk_cd_race_census] PRIMARY KEY CLUSTERED 
(
	[cd_race_census] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
