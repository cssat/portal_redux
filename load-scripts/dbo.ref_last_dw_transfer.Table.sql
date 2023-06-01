USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_last_dw_transfer]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_last_dw_transfer]') AND type in (N'U'))
DROP TABLE [dbo].[ref_last_dw_transfer]
GO
/****** Object:  Table [dbo].[ref_last_dw_transfer]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_last_dw_transfer](
	[cutoff_date] [datetime] NULL
) ON [PRIMARY]
GO
