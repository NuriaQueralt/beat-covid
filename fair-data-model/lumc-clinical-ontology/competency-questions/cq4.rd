# QC4 - What are the severity score measurements of a patient and which measurement method was used? 

# person_ has_role person_patient_role; 
# person_patient_role is_realized_in severity_score_evaluation_process_; 
  
# severity_score_evaluation_process_ has_output_ severity_score_answer; 
# severity_score_evaluation_process_ has_quality severity_score_evaluation_process_date_; 
  
# severity_score_evaluation_process_ has_input severity_score_measurement_method_; 
# severity_score_measurement_method_ has_version severity_score_measurement_version_; 
# severity_score_measurement_version_ has_value “1.0” ; 
# severity_score_measurement_method_ has_scale severity_score_result_scale_ ; 
 
# severity_score_result_scale_ has_minimal_value “0” ; 
# severity_score_result_scale_ has_maximal_value “1” ; 

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

SELECT ?patient_id ?severity_score_answer ?severity_score_measurement_method ?severity_score_measurement_version ?scale_min ?scale_max WHERE {
    ?person a sio:SIO_000498 ;
              sio:SIO_000228 ?person_patient_role .

    ?person_patient_role a sio:SIO_000715 ;
                         sio:SIO_000356 ?severity_score_evaluation_process  .
    
    ?patient_id a lco:clinical_id  ;
                  obo:IAO_0000219 ?person_patient_role .

    ?severity_score_evaluation_process a obo:NCIT_C25214 ;
                                         sio:SIO_000229 ?severity_score_answer ;
                                         dc:conformsTo ?severity_score_measurement_method ;
									     sio:SIO_000217 ?severity_score_evaluation_process_date .

    ?severity_score_evaluation_process_date a obo:NCIT_C25164 .

    ?severity_score_measurement_method a obo:NCIT_C81265 ;
                                         dc:hasVersion ?severity_score_measurement_version ;
                                         om:hasScale ?severity_score_result_scale .

    ?severity_score_answer a obo:CMO:0001109 .

    ?severity_score_result_scale a obo:NCIT:C25664 ;
                                   obo:LABO_0000118 ?scale_min ;
							       obo:LABO_0000119 ?scale_max .
} 
