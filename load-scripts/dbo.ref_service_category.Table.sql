USE [CA_ODS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ref_servi__fl_br__71BE7026]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ref_service_category] DROP CONSTRAINT [DF__ref_servi__fl_br__71BE7026]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ref_servi__fl_ih__050FA50E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ref_service_category] DROP CONSTRAINT [DF__ref_servi__fl_ih__050FA50E]
END
GO
/****** Object:  Table [dbo].[ref_service_category]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_service_category]') AND type in (N'U'))
DROP TABLE [dbo].[ref_service_category]
GO
/****** Object:  Table [dbo].[ref_service_category]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_service_category](
	[cd_srvc] [int] NOT NULL,
	[tx_srvc] [varchar](40) NULL,
	[cd_subctgry] [int] NULL,
	[tx_subctgry] [varchar](200) NULL,
	[cd_budget_poc_frc] [int] NULL,
	[tx_budget_poc_frc] [varchar](100) NULL,
	[cd_subctgry_poc_frc] [int] NULL,
	[tx_subctgry_poc_frc] [varchar](100) NULL,
	[fl_plc_svc] [int] NOT NULL,
	[fl_prim_plc_svc] [int] NOT NULL,
	[fl_prim_plc_svc_all] [int] NOT NULL,
	[fl_ihs_svc] [int] NULL,
	[fl_pcit] [int] NULL,
	[fl_home_based_svc] [int] NULL,
	[fl_family_preservation_svc] [int] NULL,
	[fl_functional_family_therapy] [int] NULL,
	[fl_alternate_response] [int] NULL,
	[fl_ifps] [int] NULL,
	[fl_brs] [int] NOT NULL,
	[last_update_dt] [datetime] NULL,
 CONSTRAINT [PK_ref_service_category] PRIMARY KEY CLUSTERED 
(
	[cd_srvc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_service_category] ADD  CONSTRAINT [DF__ref_servi__fl_ih__050FA50E]  DEFAULT ((0)) FOR [fl_ihs_svc]
GO
ALTER TABLE [dbo].[ref_service_category] ADD  DEFAULT ((0)) FOR [fl_brs]
GO
