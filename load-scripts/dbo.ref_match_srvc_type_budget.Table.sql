USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_match_srvc_type_budget]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_match_srvc_type_budget]') AND type in (N'U'))
DROP TABLE [dbo].[ref_match_srvc_type_budget]
GO
/****** Object:  Table [dbo].[ref_match_srvc_type_budget]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_match_srvc_type_budget](
	[filter_service_budget] [int] NOT NULL,
	[fl_budget_C12] [int] NULL,
	[fl_budget_C14] [int] NULL,
	[fl_budget_C15] [int] NULL,
	[fl_budget_C16] [int] NULL,
	[fl_budget_C18] [int] NULL,
	[fl_budget_C19] [int] NULL,
	[fl_uncat_svc] [int] NULL,
	[cd_budget_poc_frc] [int] NOT NULL,
	[id_service_budget] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[filter_service_budget] ASC,
	[cd_budget_poc_frc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
