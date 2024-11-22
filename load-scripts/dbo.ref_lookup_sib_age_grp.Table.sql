USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_sib_age_grp]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_sib_age_grp]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_sib_age_grp]
GO
/****** Object:  Table [dbo].[ref_lookup_sib_age_grp]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_sib_age_grp](
	[cd_sib_age_grp] [int] NOT NULL,
	[tx_sib_age_grp] [varchar](200) NULL,
 CONSTRAINT [PK_ref_lookup_sib_age_grp] PRIMARY KEY CLUSTERED 
(
	[cd_sib_age_grp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
