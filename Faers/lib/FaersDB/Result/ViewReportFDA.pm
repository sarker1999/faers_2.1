package FaersDB::Result::ViewReportFDA;
                                                                                                                       
use strict;                                                
use warnings;
                                                           
use Moose;                   
use MooseX::NonMoose;                                      
use namespace::autoclean;    
extends 'DBIx::Class::Core'; 
                             
=head1 NAME                  
                             
FaersDB::Result::ViewSearchResultFDA
                             
=cut                         
                             
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
                                                           
__PACKAGE__->table('view_search_result');
__PACKAGE__->add_columns(
    qw/fda_dt age sex hlgt_name/
);
                                                           
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    q[
    select fda_dt, age, sex, hlgt_name from drug join reac on drug.primaryid = reac.primaryid join demo on drug.primaryid = demo.primaryid join brand on drug.genericid = brand.genericid join outc on reac.primaryid = outc.primaryid join meddra_soc_term on reac.soc_code = meddra_soc_term.soc_code join meddra_hlgt_pref_term on reac.hlgt_code = meddra_hlgt_pref_term.hlgt_code where brand_generic like ? and fda_dt between ? and ? group by fda_dt, age, sex, hlgt_name 
    ]
);                                                   

      
__PACKAGE__->meta->make_immutable;                         
1;                                 

