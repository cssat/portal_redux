USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_state_discharge_xwalk]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_state_discharge_xwalk]') AND type in (N'U'))
DROP TABLE [dbo].[ref_state_discharge_xwalk]
GO
/****** Object:  Table [dbo].[ref_state_discharge_xwalk]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_state_discharge_xwalk](
	[cd_dsch_rsn] [int] NOT NULL,
	[tx_dsch_rsn] [varchar](200) NULL,
	[state_discharge_reason_code] [int] NULL,
	[cd_discharge_type] [int] NULL,
	[discharge_type] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[cd_dsch_rsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
