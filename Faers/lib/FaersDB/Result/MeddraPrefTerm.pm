use utf8;
package FaersDB::Result::MeddraPrefTerm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraPrefTerm

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<meddra_pref_term>

=cut

__PACKAGE__->table("meddra_pref_term");

=head1 ACCESSORS

=head2 pt_code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 pt_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 null_field

  data_type: 'varchar'
  is_nullable: 1
  size: 1

=head2 pt_soc_code

  data_type: 'integer'
  is_nullable: 1

=head2 pt_whoart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 7

=head2 pt_harts_code

  data_type: 'integer'
  is_nullable: 1

=head2 pt_costart_sym

  data_type: 'varchar'
  is_nullable: 1
  size: 21

=head2 pt_icd9_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 pt_icd9cm_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 pt_icd10_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 pt_jart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=cut

__PACKAGE__->add_columns(
  "pt_code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "pt_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "null_field",
  { data_type => "varchar", is_nullable => 1, size => 1 },
  "pt_soc_code",
  { data_type => "integer", is_nullable => 1 },
  "pt_whoart_code",
  { data_type => "varchar", is_nullable => 1, size => 7 },
  "pt_harts_code",
  { data_type => "integer", is_nullable => 1 },
  "pt_costart_sym",
  { data_type => "varchar", is_nullable => 1, size => 21 },
  "pt_icd9_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "pt_icd9cm_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "pt_icd10_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "pt_jart_code",
  { data_type => "varchar", is_nullable => 1, size => 6 },
);

=head1 RELATIONS

=head2 meddra_soc_terms

Type: has_many

Related object: L<FaersDB::Result::MeddraSocTerm>

=cut

__PACKAGE__->has_many(
  "meddra_soc_terms",
  "FaersDB::Result::MeddraSocTerm",
  { "foreign.soc_code" => "self.pt_soc_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pt_code

Type: belongs_to

Related object: L<FaersDB::Result::MeddraLowLevelTerm>

=cut

__PACKAGE__->belongs_to(
  "pt_code",
  "FaersDB::Result::MeddraLowLevelTerm",
  { pt_code => "pt_code" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 pt_code_2

Type: belongs_to

Related object: L<FaersDB::Result::MeddraSmqContent>

=cut

__PACKAGE__->belongs_to(
  "pt_code_2",
  "FaersDB::Result::MeddraSmqContent",
  { term_code => "pt_code" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:OwvP+SO2MG+RMFMrmHxdrg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
