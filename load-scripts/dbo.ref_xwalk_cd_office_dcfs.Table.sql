USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_xwalk_cd_office_dcfs]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_xwalk_cd_office_dcfs]') AND type in (N'U'))
DROP TABLE [dbo].[ref_xwalk_cd_office_dcfs]
GO
/****** Object:  Table [dbo].[ref_xwalk_cd_office_dcfs]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_xwalk_cd_office_dcfs](
	[cd_office] [int] NOT NULL,
	[tx_office] [varchar](255) NULL,
	[cd_office_collapse] [int] NOT NULL,
	[tx_office_collapse] [varchar](200) NULL,
	[cd_office_coll_cnty_srv] [int] NOT NULL,
	[tx_office_coll_cnty_srv] [varchar](255) NULL,
	[cd_office_coll_cmn_cnty] [int] NOT NULL,
	[tx_office_coll_cmn_cnty] [varchar](255) NULL,
	[cd_region] [int] NULL,
	[tx_region] [varchar](255) NULL,
	[cd_office_county_grp] [int] NULL,
	[tx_office_county_grp] [varchar](200) NULL,
	[old_region_cd] [int] NULL
) ON [PRIMARY]
GO
