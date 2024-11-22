USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_federal_discharge_reason_xwalk]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_federal_discharge_reason_xwalk]') AND type in (N'U'))
DROP TABLE [dbo].[ref_federal_discharge_reason_xwalk]
GO
/****** Object:  Table [dbo].[ref_federal_discharge_reason_xwalk]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_federal_discharge_reason_xwalk](
	[state_discharge_reason_code] [int] NOT NULL,
	[state_discharge_reason] [varchar](255) NULL,
	[federal_discharge_reason_code] [int] NULL,
	[federal_category_label] [varchar](255) NULL
) ON [PRIMARY]
GO
