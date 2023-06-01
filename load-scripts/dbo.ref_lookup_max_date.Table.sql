USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_max_date]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_max_date]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_max_date]
GO
/****** Object:  Table [dbo].[ref_lookup_max_date]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_max_date](
	[id] [int] NOT NULL,
	[procedure_name] [nvarchar](200) NULL,
	[max_date_all] [datetime] NULL,
	[max_date_any] [datetime] NULL,
	[max_date_qtr] [datetime] NULL,
	[max_date_yr] [datetime] NULL,
	[min_date_any] [datetime] NULL,
	[is_current] [int] NULL,
 CONSTRAINT [PK_ref_lookup_max_date] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
