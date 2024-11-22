USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_filter_ihs_services]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_filter_ihs_services]') AND type in (N'U'))
DROP TABLE [dbo].[ref_filter_ihs_services]
GO
/****** Object:  Table [dbo].[ref_filter_ihs_services]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_filter_ihs_services](
	[bin_ihs_svc_cd] [int] NOT NULL,
	[bin_ihs_svc_tx] [varchar](100) NULL,
	[min_display_date] [datetime] NULL,
 CONSTRAINT [PK_ref_filter_ihs_services] PRIMARY KEY CLUSTERED 
(
	[bin_ihs_svc_cd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
