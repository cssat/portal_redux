USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_filter_nbr_placement]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_filter_nbr_placement]') AND type in (N'U'))
DROP TABLE [dbo].[ref_filter_nbr_placement]
GO
/****** Object:  Table [dbo].[ref_filter_nbr_placement]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_filter_nbr_placement](
	[bin_placement_cd] [int] NOT NULL,
	[bin_placement_desc] [varchar](200) NULL,
	[nbr_placement_from] [int] NULL,
	[nbr_placement_thru] [int] NULL,
 CONSTRAINT [PK_ref_filter_nbr_placement] PRIMARY KEY CLUSTERED 
(
	[bin_placement_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
