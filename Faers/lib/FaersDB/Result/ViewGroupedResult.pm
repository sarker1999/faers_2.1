package FaersDB::Result::ViewGroupedResult;
                                                                                                                       
use strict;                                                
use warnings;
                                                           
use Moose;                   
use MooseX::NonMoose;                                      
use namespace::autoclean;    
extends 'DBIx::Class::Core'; 
                             
=head1 NAME                  
                             
FaersDB::Result::ViewGroupedResult
                             
=cut                         
                             
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
                                                           
__PACKAGE__->table('view_Grouped_result');
__PACKAGE__->add_columns(
    qw/drugname val_vbm pt outc_cod rpsr_cod indi_pt fda_dt age age_cod wt wt_cod/
);
                                                           
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    q[
    select distinct r.pt as Side_effect, count(IF(d.drugname like '%atorvastatin%', 1, NULL)
	or IF(d.drugname like '%lipitor%',1,NULL) or IF(d.drugname like '%ator%',1,NULL) or
	IF(d.drugname like '%Caduet%',1,NULL) or IF(d.drugname like '%Envacar%',1,NULL)) as Atorvastatin,
count(IF(d.drugname like '%Compactin%',1,NULL) or IF(d.drugname like '%Mevastatin%',1,NULL)) as Mevastatin,
count(IF(d.drugname like '%Fluvastatin%',1,NULL) or IF(d.drugname like '%Lescol%',1,NULL)) as Fluvastatin,
count(IF(d.drugname like '%Lovastatin%',1,NULL) or IF(d.drugname like '%Mevacor%',1,NULL) or
IF(d.drugname like '%Altocor%',1,NULL) or IF(d.drugname like '%Altoprev%',1,NULL) or
IF(d.drugname like '%Advicor%',1,NULL)) as Lovastatin,
count(IF(d.drugname like '%Pitavastatin%',1,NULL) or IF(d.drugname like '%Livazo%',1,NULL) or
IF(d.drugname like '%Livalo%',1,NULL) or IF(d.drugname like '%Pitava%',1,NULL)) as Pitavastatin,
count(IF(d.drugname like '%Crestor%',1,NULL) or IF(d.drugname like '%Rosuvastatin%',1,NULL)) as Rosuvastatin,
count(IF(d.drugname like '%Zocor%',1,NULL) or IF(d.drugname like '%Lipex%',1,NULL) or
	IF(d.drugname like '%Simvastatin%',1,NULL) or IF(d.drugname like '%Vytorin%',1,NULL) or
	IF(d.drugname like '%Simcor%',1,NULL) or IF(d.drugname like '%Inegy%',1,NULL)) as Simvastatin,
count(IF(d.drugname like '%Pravastatin%',1,NULL) or IF(d.drugname like '%Pravachol%',1,NULL)) as Pravastatin

 from drug as d
inner join reac as r on r.primaryid =  d.primaryid
where d.drugname like '%atorvastatin%' or d.drugname like '%lipitor%' or d.drugname like '%ator%'
or d.drugname like '%Cerivastatin%' or d.drugname like '%Lipobay%' or d.drugname like '%Fluvastatin%' or
d.drugname like '%Mevacor%' or d.drugname like '%Lovastatin%' or d.drugname like '%Lescol%' or
d.drugname like '%Altocor%' or d.drugname like '%Altoprev%' or d.drugname like '%Compactin%' or
d.drugname like '%Pitavastatin%' or d.drugname like '%Livalo%' or d.drugname like '%Livazo%' or
d.drugname like '%Pitava%' or d.drugname like '%Pravastatin%' or d.drugname like '%Pravachol%' or
d.drugname like '%Crestor%' or d.drugname like '%Zocor%' or d.drugname like '%Lipex%' or
d.drugname like '%Advicor%' or d.drugname like '%Vytorin%' or d.drugname like '%Inegy%' or
d.drugname like '%Caduet%' or d.drugname like '%Envacar%' or d.drugname like '%Simcor%' or
d.drugname like '%Mevastatin%' or d.drugname like '%Rosuvastatin%' or d.drugname like '%Simvastatin%'
group by r.pt limit 3
    ]
);                                                   
      
__PACKAGE__->meta->make_immutable;                         
1;                                 

