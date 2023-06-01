USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_filter_finding]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_filter_finding]') AND type in (N'U'))
DROP TABLE [dbo].[ref_filter_finding]
GO
/****** Object:  Table [dbo].[ref_filter_finding]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_filter_finding](
	[cd_finding] [int] NOT NULL,
	[tx_finding] [varchar](200) NULL,
	[cd_multiplier] [numeric](9, 0) NULL,
	[fl_name] [varchar](100) NULL,
	[min_filter_date] [datetime] NULL,
 CONSTRAINT [PK_ref_filter_finding] PRIMARY KEY CLUSTERED 
(
	[cd_finding] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
