USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_plcm_discharge_reason_xwalk]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_plcm_discharge_reason_xwalk]') AND type in (N'U'))
DROP TABLE [dbo].[ref_plcm_discharge_reason_xwalk]
GO
/****** Object:  Table [dbo].[ref_plcm_discharge_reason_xwalk]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_plcm_discharge_reason_xwalk](
	[cd_plcm_dsch_rsn] [int] NULL,
	[removal_plcm_discharge_reason_cd] [int] NULL,
	[placement_discharge_type_cd] [int] NULL,
	[placement_discharge_type] [varchar](200) NULL
) ON [PRIMARY]
GO
