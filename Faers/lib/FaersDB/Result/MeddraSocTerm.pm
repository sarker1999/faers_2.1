use utf8;
package FaersDB::Result::MeddraSocTerm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraSocTerm

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

=head1 TABLE: C<meddra_soc_term>

=cut

__PACKAGE__->table("meddra_soc_term");

=head1 ACCESSORS

=head2 soc_code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 soc_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 soc_abbrev

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 soc_whoart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 7

=head2 soc_harts_code

  data_type: 'integer'
  is_nullable: 1

=head2 soc_costart_sym

  data_type: 'varchar'
  is_nullable: 1
  size: 21

=head2 soc_icd9_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 soc_icd9cm_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 soc_icd10_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 soc_jart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=cut

__PACKAGE__->add_columns(
  "soc_code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "soc_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "soc_abbrev",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "soc_whoart_code",
  { data_type => "varchar", is_nullable => 1, size => 7 },
  "soc_harts_code",
  { data_type => "integer", is_nullable => 1 },
  "soc_costart_sym",
  { data_type => "varchar", is_nullable => 1, size => 21 },
  "soc_icd9_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "soc_icd9cm_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "soc_icd10_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "soc_jart_code",
  { data_type => "varchar", is_nullable => 1, size => 6 },
);

=head1 RELATIONS

=head2 meddra_soc_intl_orders

Type: has_many

Related object: L<FaersDB::Result::MeddraSocIntlOrder>

=cut

__PACKAGE__->has_many(
  "meddra_soc_intl_orders",
  "FaersDB::Result::MeddraSocIntlOrder",
  { "foreign.soc_code" => "self.soc_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 soc_code

Type: belongs_to

Related object: L<FaersDB::Result::MeddraPrefTerm>

=cut

__PACKAGE__->belongs_to(
  "soc_code",
  "FaersDB::Result::MeddraPrefTerm",
  { pt_soc_code => "soc_code" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 soc_code_2

Type: belongs_to

Related object: L<FaersDB::Result::MeddraSocHlgtComp>

=cut

__PACKAGE__->belongs_to(
  "soc_code_2",
  "FaersDB::Result::MeddraSocHlgtComp",
  { soc_code => "soc_code" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2SnDK0ou5vShzu+wUM50Ew


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
