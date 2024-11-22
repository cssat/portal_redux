USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_placement_event]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_placement_event]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_placement_event]
GO
/****** Object:  Table [dbo].[ref_lookup_placement_event]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_placement_event](
	[id_plcmnt_evnt] [int] NOT NULL,
	[cd_plcmnt_evnt] [char](3) NOT NULL,
	[cd_plcmnt_evnt_desc] [varchar](200) NULL,
	[cd_plcm_setng] [int] NULL
) ON [PRIMARY]
GO
