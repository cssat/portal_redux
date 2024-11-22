USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_gender]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_gender]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_gender]
GO
/****** Object:  Table [dbo].[ref_lookup_gender]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_gender](
	[pk_gndr] [int] NOT NULL,
	[cd_gndr] [varchar](1) NOT NULL,
	[tx_gndr] [varchar](10) NOT NULL,
 CONSTRAINT [ct_pk_gndr] PRIMARY KEY CLUSTERED 
(
	[pk_gndr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
