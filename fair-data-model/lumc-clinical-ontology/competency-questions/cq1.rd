# QC1 – What are all the samples (and its annotations) that were collected from a patient? 

# LUMC prefixes
PREFIX rdf:     <http://www.w3.org/1999/02/22-rdf-syntax-ns#> 
PREFIX rdfs:    <http://www.w3.org/2000/01/rdf-schema#> 
PREFIX xsd:     <http://www.w3.org/2001/XMLSchema#> 
PREFIX owl:     <http://www.w3.org/2002/07/owl#> 
PREFIX dct:     <http://purl.org/dc/terms/> 
PREFIX obo:     <http://purl.obolibrary.org/obo/>
PREFIX ncit:    <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#> 
PREFIX sio:     <http://semanticscience.org/resource/> 
PREFIX prov:    <http://http://http://www.w3.org/ns/prov#>
PREFIX bc:      <https://rdf.biosemantics.org/resources/beat-covid/>
PREFIX lco:     <http://purl.org/beat-covid/lco.owl#>

SELECT ?patient_id ?sample_id ?organ ?sampling_process_date_ WHERE {
    ?person a sio:SIO_000498;
              sio:SIO_000228 ?person_donor_role .

    ?person_donor_role a obo:NCIT_C164796 .
    
    ?patient_id a lco:clinical_id ;
                  obo:IAO_0000219 ?person_donor_role .
    
    ?sample a sio:SIO_001050 ;
              sio:SIO_000628 ?organ . 
    
    ?organ a sio:SIO_010003 ;
          obo:BFO_0000050 ?person_ .
    
    ?sample_id a lco:record_id ;
                 sio:SIO_000672 ?sample .
    
    ?sampling_process_ a sio:SIO_001049 ;
                       sio:SIO_000291 ?organ_ ;
                       sio:SIO_000230 ?person_ ;
                       sio:SIO_000229 ?sample_ ;
                       sio:SIO_000008 ?sampling_process_date_ .
    
    ?sampling_process_date_ a obo:NCIT_C25164 .
}
