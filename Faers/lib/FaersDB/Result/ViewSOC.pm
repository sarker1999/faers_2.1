package FaersDB::Result::ViewSOC;
                                                                                                                       
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
                                                           
__PACKAGE__->table('view_soc');
__PACKAGE__->add_columns(
    qw/soc_name/
);
                                                           
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    q[
select soc_name from drug join reac on drug.primaryid = reac.primaryid join brand on drug.genericid = brand.genericid join meddra_soc_term on reac.soc_code = meddra_soc_term.soc_code where brand_generic like ? and soc_name like ?
    ]
);                                                   

=pod
		SELECT drugname, val_vbm, pt, outc_cod, rpsr_cod, indi_pt, fda_dt, age, age_cod, wt, wt_cod 
        FROM demo JOIN drug ON demo.primaryid = drug.primaryid JOIN brand on drug.genericid = brand.genericid 
        JOIN indi ON drug.primaryid=indi.primaryid 
        JOIN rpsr ON indi.primaryid = rpsr.primaryid JOIN outc ON rpsr.primaryid=outc.primaryid 
        JOIN reac on outc.primaryid=reac.primaryid WHERE brand.brand_generic like ? LIMIT 5

        AND val_vbm like ? AND pt LIKE ? AND 
        outc_cod LIKE ? AND rpsr_cod LIKE ? AND indi_pt LIKE ? AND fda_dt BETWEEN ? AND ? LIMIT ?
=cut
      
__PACKAGE__->meta->make_immutable;                         
1;                                 

