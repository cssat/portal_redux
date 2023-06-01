USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_service_cd_subctgry_poc]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_service_cd_subctgry_poc]') AND type in (N'U'))
DROP TABLE [dbo].[ref_service_cd_subctgry_poc]
GO
/****** Object:  Table [dbo].[ref_service_cd_subctgry_poc]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_service_cd_subctgry_poc](
	[cd_subctgry_poc_frc] [int] NOT NULL,
	[tx_subctgry_poc_frc] [varchar](100) NULL,
	[fl_name] [varchar](200) NULL,
	[multiplier] [numeric](38, 0) NULL,
	[power_10] [int] NULL,
	[ordering] [smallint] NULL,
	[fl_plc_svc] [int] NULL,
	[fl_ihs_svc] [int] NULL
) ON [PRIMARY]
GO
