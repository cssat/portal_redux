USE [CA_ODS]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ref_match__cd_su__4BB8C2CF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ref_match_srvc_type_category_old] DROP CONSTRAINT [DF__ref_match__cd_su__4BB8C2CF]
END
GO
/****** Object:  Table [dbo].[ref_match_srvc_type_category_old]    Script Date: 5/25/2023 12:44:17 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ref_match_srvc_type_category_old]') AND type in (N'U'))
DROP TABLE [dbo].[ref_match_srvc_type_category_old]
GO
/****** Object:  Table [dbo].[ref_match_srvc_type_category_old]    Script Date: 5/25/2023 12:44:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ref_match_srvc_type_category_old](
	[filter_srvc_type] [decimal](18, 0) NOT NULL,
	[fl_family_focused_services] [int] NOT NULL,
	[fl_child_care] [int] NOT NULL,
	[fl_therapeutic_services] [int] NOT NULL,
	[fl_mh_services] [int] NOT NULL,
	[fl_receiving_care] [int] NOT NULL,
	[fl_family_home_placements] [int] NOT NULL,
	[fl_behavioral_rehabiliation_services] [int] NOT NULL,
	[fl_other_therapeutic_living_situations] [int] NOT NULL,
	[fl_specialty_adolescent_services] [int] NOT NULL,
	[fl_respite] [int] NOT NULL,
	[fl_transportation] [int] NOT NULL,
	[fl_clothing_incidentals] [int] NOT NULL,
	[fl_sexually_aggressive_youth] [int] NOT NULL,
	[fl_adoption_support] [int] NOT NULL,
	[fl_various] [int] NOT NULL,
	[fl_medical] [int] NOT NULL,
	[cd_subctgry_poc_fr] [int] NOT NULL,
	[id_service_category] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[filter_srvc_type] ASC,
	[cd_subctgry_poc_fr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ref_match_srvc_type_category_old] ADD  DEFAULT ((0)) FOR [cd_subctgry_poc_fr]
GO
