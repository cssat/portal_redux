USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_service_cd_budget_poc_frc]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_service_cd_budget_poc_frc]') AND type in (N'U'))
DROP TABLE [dbo].[ref_service_cd_budget_poc_frc]
GO
/****** Object:  Table [dbo].[ref_service_cd_budget_poc_frc]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_service_cd_budget_poc_frc](
	[cd_budget_poc_frc] [int] NOT NULL,
	[tx_budget_poc_frc] [varchar](100) NULL,
	[fl_name] [varchar](200) NULL,
	[multiplier] [numeric](38, 0) NULL,
	[power_10] [int] NULL,
	[fl_plc_svc] [int] NULL,
	[fl_ihs_svc] [int] NULL,
 CONSTRAINT [PK_ref_service_cd_budget_poc_frc] PRIMARY KEY CLUSTERED 
(
	[cd_budget_poc_frc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
