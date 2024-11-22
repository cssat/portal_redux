USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_cd_discharge_type_exits]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_cd_discharge_type_exits]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_cd_discharge_type_exits]
GO
/****** Object:  Table [dbo].[ref_lookup_cd_discharge_type_exits]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_cd_discharge_type_exits](
	[cd_discharge_type] [int] NULL,
	[discharge_type] [varchar](25) NULL,
	[alt_discharge_type] [varchar](25) NULL
) ON [PRIMARY]
GO
