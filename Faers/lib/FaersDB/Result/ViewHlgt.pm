package FaersDB::Result::ViewHlgt;
                                                                                                                       
use strict;                                                
use warnings;
                                                           
use Moose;                   
use MooseX::NonMoose;                                      
use namespace::autoclean;    
extends 'DBIx::Class::Core'; 
                             
=head1 NAME                  
                             
FaersDB::Result::ViewHlgt
                             
=cut                         
                             
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
                                                           
__PACKAGE__->table('view_hlgt');
__PACKAGE__->add_columns(
    qw/hlgt_name/
);
                                                           
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    q[
select hlgt_name from meddra_hlgt_pref_term inner join meddra_soc_hlgt_comp on meddra_hlgt_pref_term.hlgt_code = meddra_soc_hlgt_comp.hlgt_code inner join meddra_soc_term on meddra_soc_hlgt_comp.soc_code = meddra_soc_term.soc_code where soc_name like ? and hlgt_name like ?
    ]
);                                                   

      
__PACKAGE__->meta->make_immutable;                         
1;                                 


