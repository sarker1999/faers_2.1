package FaersDB::Result::ViewSOC;
                                                                                                                       
use strict;                                                
use warnings;
                                                           
use Moose;                   
use MooseX::NonMoose;                                      
use namespace::autoclean;    
extends 'DBIx::Class::Core'; 
                             
=head1 NAME                  
                             
FaersDB::Result::ViewSOC
                             
=cut                         
                             
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
                                                           
__PACKAGE__->table('view_soc');
__PACKAGE__->add_columns(
    qw/soc_name/
);
                                                           
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    q[
select distinct soc_name from drug join reac on drug.primaryid = reac.primaryid join brand on drug.genericid = brand.genericid join meddra_soc_term on reac.soc_code = meddra_soc_term.soc_code where brand_generic like ? and soc_name like ?
    ]
);                                                   

      
__PACKAGE__->meta->make_immutable;                         
1;                                 

