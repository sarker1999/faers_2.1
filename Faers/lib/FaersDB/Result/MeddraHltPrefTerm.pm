use utf8;
package FaersDB::Result::MeddraHltPrefTerm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraHltPrefTerm

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

=head1 TABLE: C<meddra_hlt_pref_term>

=cut

__PACKAGE__->table("meddra_hlt_pref_term");

=head1 ACCESSORS

=head2 hlt_code

  data_type: 'integer'
  is_nullable: 0

=head2 hlt_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 hlt_whoart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 7

=head2 hlt_harts_code

  data_type: 'integer'
  is_nullable: 1

=head2 hlt_costart_sym

  data_type: 'varchar'
  is_nullable: 1
  size: 21

=head2 hlt_icd9_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 hlt_icd9cm_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 hlt_icd10_code

  data_type: 'varchar'
  is_nullable: 1
  size: 8

=head2 hlt_jart_code

  data_type: 'varchar'
  is_nullable: 1
  size: 6

=cut

__PACKAGE__->add_columns(
  "hlt_code",
  { data_type => "integer", is_nullable => 0 },
  "hlt_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "hlt_whoart_code",
  { data_type => "varchar", is_nullable => 1, size => 7 },
  "hlt_harts_code",
  { data_type => "integer", is_nullable => 1 },
  "hlt_costart_sym",
  { data_type => "varchar", is_nullable => 1, size => 21 },
  "hlt_icd9_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "hlt_icd9cm_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "hlt_icd10_code",
  { data_type => "varchar", is_nullable => 1, size => 8 },
  "hlt_jart_code",
  { data_type => "varchar", is_nullable => 1, size => 6 },
);

=head1 RELATIONS

=head2 meddra_hlgt_hlt_comps

Type: has_many

Related object: L<FaersDB::Result::MeddraHlgtHltComp>

=cut

__PACKAGE__->has_many(
  "meddra_hlgt_hlt_comps",
  "FaersDB::Result::MeddraHlgtHltComp",
  { "foreign.hlt_code" => "self.hlt_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oEU2Aj8lQwrvaL7BO2HkwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
