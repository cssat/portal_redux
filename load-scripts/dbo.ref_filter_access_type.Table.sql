USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_filter_access_type]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_filter_access_type]') AND type in (N'U'))
DROP TABLE [dbo].[ref_filter_access_type]
GO
/****** Object:  Table [dbo].[ref_filter_access_type]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_filter_access_type](
	[cd_access_type] [int] NOT NULL,
	[tx_access_type] [varchar](200) NULL,
	[fl_name] [varchar](100) NULL,
	[cd_multiplier] [decimal](18, 0) NULL,
	[filter_access_type] [int] NOT NULL,
	[min_filter_date] [datetime] NULL,
 CONSTRAINT [PK_ref_filter_access_type] PRIMARY KEY CLUSTERED 
(
	[cd_access_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
