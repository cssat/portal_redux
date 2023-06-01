USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_sibling_groups]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_sibling_groups]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_sibling_groups]
GO
/****** Object:  Table [dbo].[ref_lookup_sibling_groups]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_sibling_groups](
	[nbr_siblings] [int] NOT NULL,
	[sibling_group_name] [varchar](50) NULL,
 CONSTRAINT [PK_ref_lookup_sibling_groups] PRIMARY KEY CLUSTERED 
(
	[nbr_siblings] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
