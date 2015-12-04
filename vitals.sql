select 
	t1.uuid as visit_uuid,
	t2.uuid as encounter_uuid,
	t3.value_numeric,
	t3.value_text,
	t4.name
	from amrs.visit t1
	left join amrs.encounter t2
		on t1.patient_id = t2.patient_id
	left join amrs.obs t3
		on t2.encounter_id = t3.encounter_id
	left join amrs.field t4
		on t4.concept_id = t3.concept_id
	where t1.uuid = "0d7cc5fb-c75f-4c2d-980a-afeaa917e0df" 
	and date_format(t2.encounter_datetime,'%dd/%mm/%YYYY')=date_format(t1.date_started,'%dd/%mm/%YYYY')
	group by t3.uuid
	order by t2.encounter_id;
