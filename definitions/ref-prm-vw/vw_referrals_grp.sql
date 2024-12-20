-- create vw_referrals_grp view
CREATE  view [portal_redux].[vw_referrals_grp] as 


	select		distinct
				2 as qry_type -- unique
				,date_type  as date_type --month
				,startDate  cohort_entry_date
				,endDate 
				,tce.id_case
				,grp_filters.grp_id_case
				,iif(tce.id_case<=0,tce.rfrd_date,tce.first_intake_date) first_intake_date
				,iif(tce.id_case<=0,tce.rfrd_date,tce.latest_intake_date) latest_intake_date
				, tce.id_intake_fact
				,grp.intake_grouper
				,grp.intk_grp_seq_nbr
				,grp_filters.intk_grp_id_intake_fact  "grp_id_intake_fact"
				,coalesce(grp_filters.rfrd_date ,tce.rfrd_date) "grp_rfrd_date"
				, case 	when coalesce( grp_filters.intk_grp_fl_cps_invs,fl_cps_invs)>0 then 1
							when coalesce( grp_filters.intk_grp_fl_risk_only,fl_risk_only)>0 then 4
							when coalesce( grp_filters.intk_grp_fl_far,fl_far)>0 then 6
							when coalesce( grp_filters.intk_grp_fl_alternate_intervention,fl_alternate_intervention)>0 then 2
							when coalesce( grp_filters.intk_grp_fl_frs,fl_frs)>0 then 3
							when coalesce( grp_filters.intk_grp_fl_cfws,fl_cfws)>0 then 5
							when coalesce( grp_filters.intk_grp_fl_dlr,fl_dlr) >0 then 7
							when tce.cd_access_type=4 
											and tx_spvr_rsn in ('Risk Only' ,'CPS-Risk Only','Victim move out of Subject home' ) then 4
							when tce.cd_access_type=1 
									and tx_spvr_rsn in ('Referred to Tribal Jurisdiction'
																	,'Other'
																	,'Third Party-Referred to Law Enforcement'
																	,'No specific CA/N allegation or Risk'
																	,'CPS-Investigation') then 1
							when tce.cd_access_type=1
									and tx_spvr_rsn = 'Anonymous Referrer-Risk Low' then 4
							when tce.cd_access_type=2 and tx_spvr_rsn='Child Family Welfare Services' then 5
							when tce.cd_access_type in (1,4) 
									and charindex('DLR',tx_spvr_rsn)>0 then 7
							when tce.cd_access_type=2 and tx_asgn_type='FRS' then 3
							when tce.cd_access_type=2 and tx_asgn_type='CFWS' then 5
							end  		 [entry_point]
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_cps_invs>=1,1,0) intk_grp_fl_cps_invs
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_far>=1,1,0) intk_grp_fl_far
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_risk_only>=1,1,0) intk_grp_fl_risk_only
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_cfws>=1,1,0)  intk_grp_fl_cfws
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_dlr>=1,1,0)  fl_dlr
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_alternate_intervention>=1,1,0)  intk_grp_fl_alternate_intervention
				,iif(grp_filters.intake_grouper is not null and grp_filters.intk_grp_fl_frs>=1,1,0)  intk_grp_fl_frs
				,iif(grp_filters.intake_grouper is null,tce.cd_access_type,grp_filters.intk_grp_cd_access_type) cd_access_type
				,case
					when grp_filters.intake_grouper is null then iif(tce.intake_county_cd=0,-99,tce.intake_county_cd)
					else iif(grp_filters.intk_grp_intake_county_cd=0,-99,grp_filters.intk_grp_intake_county_cd)
				end intake_county_cd
				,iif(grp_filters.intake_grouper is null,tce.inv_ass_start,grp_filters.intk_grp_inv_ass_start) inv_ass_start
				,iif(grp_filters.intake_grouper is null,tce.rfrd_date,grp_filters.rfrd_date) rfrd_date
				,case when grp_filters.intake_grouper is null then tce.fl_phys_abuse else iif(grp_filters.cnt_intk_grp_phys_abuse>0,1,0) end fl_phys_abuse
				,case when grp_filters.intake_grouper is null then tce.fl_sexual_abuse else iif(grp_filters.cnt_intk_grp_sexual_abuse>0,1,0) end fl_sexual_abuse
				,case when grp_filters.intake_grouper is null then tce.fl_neglect else iif(grp_filters.cnt_intk_grp_neglect>0,1,0) end fl_neglect
				,case
					when grp_filters.intake_grouper is null then
						case
							when tce.fl_phys_abuse>0 or tce.fl_sexual_abuse>0 or tce.fl_neglect>0 then 1
							else 0
						end
					else
						case
							when grp_filters.cnt_intk_grp_phys_abuse>0 or grp_filters.cnt_intk_grp_sexual_abuse>0 or grp_filters.cnt_intk_grp_neglect>0 then 1
							else 0
						end
				end [fl_any_legal]
				,case when grp_filters.intake_grouper is null then tce.fl_founded_phys_abuse else iif(cnt_intk_grp_founded_phys_abuse>0,1,0) end fl_founded_phys_abuse
				,case when grp_filters.intake_grouper is null then tce.fl_founded_sexual_abuse else iif(cnt_intk_grp_founded_sexual_abuse>0,1,0) end fl_founded_sexual_abuse
				,case when grp_filters.intake_grouper is null then tce.fl_founded_neglect else iif(cnt_intk_grp_founded_neglect>0,1,0) end fl_founded_neglect
				,case when grp_filters.intake_grouper is null then tce.fl_founded_any_legal else iif(cnt_intk_grp_founded_any_legal>0,1,0) end fl_founded_any_legal
				, 0 as fl_initref_cohort_date
				,iif(grp_filters.intake_grouper is null,tce.cd_final_decision,grp_filters.grp_cd_final_decision) cd_final_decision
				,case when grp_filters.intake_grouper is not null then grp_filters.fl_hh_under_18 when hh_under_18_ng.id_intake_fact is not null then 1 else 0 end hh_with_children_under_18
				,case when grp_filters.intake_grouper is not null then grp_filters.fl_hh_under_12 when hh_under_12_ng.id_intake_fact is not null then 1 else 0 end hh_with_children_under_12
				,case when grp_filters.intake_grouper is not null then grp_filters.fl_hh_under_2 when hh_under_2_ng.id_intake_fact is not null then 1 else 0 end hh_with_children_under_2
				,DENSE_RANK() over (partition by coalesce(grp_filters.grp_id_case,tce.id_case) 
																order by coalesce(grp_filters.rfrd_date,tce.rfrd_date)
																				,coalesce(grp.intake_grouper,tce.id_intake_fact )asc) case_nth_order
		from portal_redux.tbl_intakes  tce 
		left join portal_redux.tbl_intake_grouper grp on grp.id_intake_fact=tce.id_intake_fact
		left join (select grp.intake_grouper
								, max(iif(grp.intk_grp_seq_nbr=1,grp.id_case,null)) grp_id_case
								, max(iif(grp.intk_grp_seq_nbr=1,rfrd_date,null)) rfrd_date
								, sum(coalesce(fl_cps_invs,0)) intk_grp_fl_cps_invs
								, sum(coalesce(fl_risk_only,0)) intk_grp_fl_risk_only
								, sum(coalesce(fl_far,0)) intk_grp_fl_far
								, sum(coalesce(fl_dlr,0)) intk_grp_fl_dlr
								, sum(coalesce(fl_alternate_intervention,0)) intk_grp_fl_alternate_intervention
								, sum(coalesce(fl_cfws,0)) intk_grp_fl_cfws
								, sum(coalesce(fl_frs,0)) intk_grp_fl_frs
								,  min(coalesce(intk.cd_access_type,0)) intk_grp_cd_access_type
								, max(iif(grp.intk_grp_seq_nbr=1,cd_reporter,0)) intk_grp_cd_reporter_type
								, max(iif(grp.intk_grp_seq_nbr=1,cd_race_census,0)) intk_grp_cd_race_census
								,max(iif(grp.intk_grp_seq_nbr=1,census_hispanic_latino_origin_cd,0)) intk_grp_census_hispanic_latino_origin_cd
								,max(iif(grp.intk_grp_seq_nbr=1,cd_sib_age_grp,0)) intk_grp_cd_sib_age_grp
								,max(iif(grp.intk_grp_seq_nbr=1,intake_county_cd,0)) intk_grp_intake_county_cd
								,max(iif(grp.intk_grp_seq_nbr=1,inv_ass_start,null)) intk_grp_inv_ass_start
								,max(iif(grp.intk_grp_seq_nbr=1,inv_ass_stop,null)) intk_grp_inv_ass_stop
								,max(iif(grp.intk_grp_seq_nbr=1,grp.id_intake_fact,null)) intk_grp_id_intake_fact
								, SUM(fl_phys_abuse) as cnt_intk_grp_phys_abuse
								, SUM(fl_sexual_abuse) as cnt_intk_grp_sexual_abuse
								, SUM(fl_neglect) as cnt_intk_grp_neglect
								, SUM(fl_other_maltreatment) as cnt_intk_grp_other_maltreatment
								, SUM(fl_allegation_any) as cnt_intk_grp_allegation_any
								, SUM(fl_founded_phys_abuse) as cnt_intk_grp_founded_phys_abuse
								, SUM(fl_founded_sexual_abuse) as cnt_intk_grp_founded_sexual_abuse
								, SUM(fl_founded_neglect) as cnt_intk_grp_founded_neglect
								, SUM(fl_founded_other_maltreatment) as cnt_intk_grp_founded_other_maltreatment
								, SUM(fl_founded_any_legal) as cnt_intk_grp_founded_any_legal
								, SUM(fl_prior_phys_abuse) as cnt_intk_grp_prior_phys_abuse
								, SUM(fl_prior_sexual_abuse) as cnt_intk_grp_prior_sexual_abuse
								, SUM(fl_prior_neglect)as cnt_intk_grp_prior_neglect
								, SUM(fl_prior_other_maltreatment)as cnt_intk_grp_prior_other_maltreatment
								, SUM(fl_prior_allegation_any)as cnt_intk_grp_prior_allegation_any
								, SUM(fl_founded_prior_phys_abuse)as cnt_intk_grp_founded_prior_phys_abuse
								, SUM(fl_founded_prior_sexual_abuse)as cnt_intk_grp_founded_prior_sexual_abuse
								, SUM(fl_founded_prior_neglect)as cnt_intk_grp_founded_prior_negelect
								, SUM(fl_founded_prior_other_maltreatment) as cnt_intk_grp_founded_prior_other_maltreatment
								, SUM(fl_founded_prior_any_legal) as cnt_intk_grp_founded_prior_any_legal
								, MAX(IIF(hh_under_18.id_intake_fact is not null,1,0)) fl_hh_under_18
								, MAX(IIF(hh_under_12.id_intake_fact is not null,1,0)) fl_hh_under_12
								, MAX(IIF(hh_under_2.id_intake_fact is not null,1,0)) fl_hh_under_2
								, MIN(iif(cd_final_decision=1,1,2))  as grp_cd_final_decision
					 from portal_redux.tbl_intake_grouper grp
					join portal_redux.tbl_intakes intk on grp.id_intake_fact=intk.id_intake_fact 
					left join (select distinct id_intake_fact from portal_redux.tbl_household_children where age_at_referral_dt<18
										) hh_under_18 on hh_under_18.id_intake_fact=intk.id_intake_fact
					left join (select distinct id_intake_fact from portal_redux.tbl_household_children where age_at_referral_dt<5
										) hh_under_12 on hh_under_12.id_intake_fact=intk.id_intake_fact
					left join (select distinct id_intake_fact from portal_redux.tbl_household_children where age_at_referral_dt<2
										) hh_under_2 on hh_under_2.id_intake_fact=intk.id_intake_fact
					group by grp.intake_grouper
					) grp_filters on grp.intake_grouper=grp_filters.intake_grouper
		join (select distinct 0 date_type,[month]startDate,EOMONTH([month]) endDate
					from portal_redux.calendar_dim cd
					,ref_last_dw_transfer
					where cd.MONTH>='1999-07-01' and ([month]) <= cutoff_date
				) md on tce.inv_ass_start between  md.startDate and md.endDate
			left join (select distinct id_intake_fact from portal_redux.tbl_household_children where age_at_referral_dt<18
										) hh_under_18_ng  on hh_under_18_ng.id_intake_fact=tce.id_intake_fact
			left join (select distinct id_intake_fact from portal_redux.tbl_household_children where age_at_referral_dt<5
										) hh_under_12_ng  on hh_under_12_ng.id_intake_fact=tce.id_intake_fact
			left join (select distinct id_intake_fact from portal_redux.tbl_household_children where age_at_referral_dt<2
										) hh_under_2_ng  on hh_under_2_ng.id_intake_fact=tce.id_intake_fact

			where tce.id_case>0 
					and tce.tx_spvr_rsn not in (
							'*INVALID*'
							,'Failed'
							,'Provider Infraction'
							,'Information Only'
							,'Child Fatality-DLR/DEL Related',
							'Child Fatality',
							'LE Placement Request - Youth not Placed',
							'Unborn Victim',
							'Private Adoption - ASP',
							'-',
							'Allegation documented in previous intake',
							'Re-Open Closed Case',
							'Home Study',
							'Family Voluntary Services',
							'Adoption - ICAMA',
							'ICPC');