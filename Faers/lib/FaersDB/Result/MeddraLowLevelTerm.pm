use utf8;
package FaersDB::Result::MeddraLowLevelTerm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraLowLevelTerm

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

=head1 TABLE: C<meddra_low_level_term>

=cut

__PACKAGE__->table("meddra_low_level_term");

=head1 ACCESSORS

=head2 llt_code

  data_type: 'integer'
  is_nullable: 0

=head2 llt_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 pt_code

  data_type: 'integer'
  is_nullable: 1

=head2 llt_whoart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 7

=head2 llt_harts_code

  data_type: 'integer'
  is_nullable: 1

=head2 llt_costart_sym

  data_type: 'varchar'
  is_nullable: 1
  size: 21

=head2 llt_icd9_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 llt_icd9cm_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 llt_icd10_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 llt_currency

  data_type: 'varchar'
  is_nullable: 1
  size: 1

=head2 llt_jart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=cut

__PACKAGE__->add_columns(
  "llt_code",
  { data_type => "integer", is_nullable => 0 },
  "llt_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "pt_code",
  { data_type => "integer", is_nullable => 1 },
  "llt_whoart_code",
  { data_type => "varchar", is_nullable => 1, size => 7 },
  "llt_harts_code",
  { data_type => "integer", is_nullable => 1 },
  "llt_costart_sym",
  { data_type => "varchar", is_nullable => 1, size => 21 },
  "llt_icd9_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "llt_icd9cm_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "llt_icd10_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "llt_currency",
  { data_type => "varchar", is_nullable => 1, size => 1 },
  "llt_jart_code",
  { data_type => "varchar", is_nullable => 1, size => 6 },
);

=head1 RELATIONS

=head2 meddra_pref_terms

Type: has_many

Related object: L<FaersDB::Result::MeddraPrefTerm>

=cut

__PACKAGE__->has_many(
  "meddra_pref_terms",
  "FaersDB::Result::MeddraPrefTerm",
  { "foreign.pt_code" => "self.pt_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:t0Gy39uhBK7gtjQ0Obf3OQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
