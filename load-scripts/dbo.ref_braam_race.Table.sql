USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_braam_race]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_braam_race]') AND type in (N'U'))
DROP TABLE [dbo].[ref_braam_race]
GO
/****** Object:  Table [dbo].[ref_braam_race]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_braam_race](
	[cd_braam_race] [int] NOT NULL,
	[tx_braam_race] [varchar](200) NULL,
	[cd_ethinicty] [int] NULL
) ON [PRIMARY]
GO
