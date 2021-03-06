# QC6 - What are the severity score measurement and age of each patient? 

# person has_role person_study_role 
# person_study_role is realized in measurement_process_; 
  
# measurement_process has_target trait_cytokine_; 
# measurement_process has_quality measurement_process_date_; 
  
# trait_cytokine is_encoded_by cytokine_; 
# trait_cytokine has_measurment_value lum_CCL21_1; 
  
# person has_role person_patient_role_; 
# person_patient_role is realized in severity_score_evaluation_process_; 
  
# severity_score_evaluation_process_ has_input severity_score_measurement_method_; 
# severity_score_measurement_method has_value “Leiden Severity Score”; 
  
# severity_score_evaluation_process_ has_output severity_score_answer_; 
# severity_score_evaluation_process has_quality severity_score_evaluation_process_date_;  

# LUMC prefixes
PREFIX rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd:     <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl:     <http://www.w3.org/2002/07/owl#> 
PREFIX dc:     <http://purl.org/dc/terms/> 
PREFIX obo:     <http://purl.obolibrary.org/obo/>
PREFIX ncit:    <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#> 
PREFIX sio:     <http://semanticscience.org/resource/> 
PREFIX prov:    <http://http://http://www.w3.org/ns/prov#>
PREFIX bc:      <https://rdf.biosemantics.org/resources/beat-covid/>
PREFIX lco:     <http://purl.org/beat-covid/lco.owl#>
PREFIX om:      <http://www.ontology-of-units-of-measure.org/resource/om-2/>

SELECT ?patient_id ?person_age ?severity_score_answer ?severity_score_evaluation_process_date  WHERE {
    ?person a sio:SIO_000498 ;
              sio:SIO_000228 ?person_patient_role ;
              sio:SIO_000228 ?person_study_role .

    ?person_age a sio:SIO_001013 ;
                   sio:SIO_000001 ?person_study_role .
              

    ?person_patient_role a sio:SIO_000715 ;
                         sio:SIO_000356 ?severity_score_evaluation_process  .

  
    ?patient_id a lco:clinical_id  ;
                  obo:IAO_0000219 ?person_patient_role .

    ?measurement_process a obo:OBI_0000070 ;
                           sio:SIO_000008 ?measurement_process_date .
    
    ?measurement_process_date_ a obo:NCIT_C25164 .

    ?severity_score_evaluation_process a obo:NCIT_C25214 ;
                                         sio:SIO_000229 ?severity_score_answer ;
                                         dc:conformsTo ?severity_score_measurement_method ;
									     sio:SIO_000217 ?severity_score_evaluation_process_date .

    ?severity_score_evaluation_process_date a obo:NCIT_C25164 .

    ?severity_score_measurement_method a obo:NCIT_C81265 ;
                                         dc:hasVersion ?severity_score_measurement_version ;
                                         om:hasScale ?severity_score_result_scale .

    ?severity_score_answer a obo:CMO:0001109 .

    FILTER(?patient_id = "")
} 
