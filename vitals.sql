USE amrs;
select 
	t4.uuid as visit_uuid,
    t1.uuid as encounter_uuid,
	t1.encounter_datetime,
	t1.encounter_type,
	t1.location_id,
    t2.concept_id,
    t2.value_numeric,
    t3.name
	from encounter t1
    LEFT JOIN obs t2
	ON t1.encounter_id=t2.encounter_id
    LEFT JOIN field t3
    ON t2.concept_id=t3.concept_id
	LEFT JOIN visit t4
    ON t1.visit_id=t4.visit_id
    where t1.encounter_type in (1,2,3,4,10,13,14,15,17,19,22,23,26,32,33,43,47,21)
    and t3.concept_id IN (5089, 5088 , 5090,1342,5085,5087)
