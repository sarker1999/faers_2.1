package FaersDB::Result::ViewSearchResultDrug;
                                                                                                                       
use strict;                                                
use warnings;
                                                           
use Moose;                   
use MooseX::NonMoose;                                      
use namespace::autoclean;    
extends 'DBIx::Class::Core'; 
                             
=head1 NAME                  
                             
FaersDB::Result::ViewSearchResultDrug
                             
=cut                         
                             
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
                                                           
__PACKAGE__->table('view_search_result');
__PACKAGE__->add_columns(
    qw/drugname val_vbm pt outc_cod rpsr_cod indi_pt fda_dt age age_cod wt wt_cod/
);
                                                           
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    q[
		SELECT drugname, val_vbm, pt, outc_cod, rpsr_cod, indi_pt, fda_dt, age, age_cod, wt, wt_cod 
        FROM demo JOIN drug ON demo.primaryid = drug.primaryid JOIN brand on drug.genericid = brand.genericid 
        JOIN indi ON drug.primaryid=indi.primaryid 
        JOIN rpsr ON indi.primaryid = rpsr.primaryid JOIN outc ON rpsr.primaryid=outc.primaryid 
        JOIN reac on outc.primaryid=reac.primaryid WHERE brand.brand_generic like ? 
        AND val_vbm like ? AND pt LIKE ? AND 
        outc_cod LIKE ? AND rpsr_cod LIKE ? AND indi_pt LIKE ? AND fda_dt BETWEEN ? AND ? LIMIT ?
   
]
);                                                   

=pod
		SELECT drugname, val_vbm, pt, outc_cod, rpsr_cod, indi_pt, fda_dt, age, age_cod, wt, wt_cod 
        FROM demo JOIN drug ON demo.primaryid = drug.primaryid JOIN brand on drug.genericid = brand.genericid 
        JOIN indi ON drug.primaryid=indi.primaryid 
        JOIN rpsr ON indi.primaryid = rpsr.primaryid JOIN outc ON rpsr.primaryid=outc.primaryid 
        JOIN reac on outc.primaryid=reac.primaryid WHERE brand.brand_generic like ? 
        AND val_vbm like ? AND pt LIKE ? AND 
        outc_cod LIKE ? AND rpsr_cod LIKE ? AND indi_pt LIKE ? AND fda_dt BETWEEN ? AND ? LIMIT ?
=cut
      
__PACKAGE__->meta->make_immutable;                         
1;                                 
