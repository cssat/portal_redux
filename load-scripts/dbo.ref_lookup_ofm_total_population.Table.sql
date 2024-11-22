USE [CA_ODS]
GO
/****** Object:  Table [dbo].[ref_lookup_ofm_total_population]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_lookup_ofm_total_population]') AND type in (N'U'))
DROP TABLE [dbo].[ref_lookup_ofm_total_population]
GO
/****** Object:  Table [dbo].[ref_lookup_ofm_total_population]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_lookup_ofm_total_population](
	[source_census] [int] NULL,
	[fips] [int] NULL,
	[pk_gndr] [int] NULL,
	[cd_race] [float] NULL,
	[measurement_year] [int] NULL,
	[pop_cnt] [float] NULL
) ON [PRIMARY]
GO
