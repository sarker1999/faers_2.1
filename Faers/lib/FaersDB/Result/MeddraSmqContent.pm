use utf8;
package FaersDB::Result::MeddraSmqContent;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraSmqContent

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

=head1 TABLE: C<meddra_smq_content>

=cut

__PACKAGE__->table("meddra_smq_content");

=head1 ACCESSORS

=head2 smq_code

  data_type: 'integer'
  is_nullable: 0

=head2 term_code

  data_type: 'integer'
  is_nullable: 0

=head2 term_level

  data_type: 'integer'
  is_nullable: 0

=head2 term_scope

  data_type: 'integer'
  is_nullable: 0

=head2 term_category

  data_type: 'varchar'
  is_nullable: 0
  size: 1

=head2 term_weight

  data_type: 'integer'
  is_nullable: 0

=head2 term_status

  data_type: 'varchar'
  is_nullable: 0
  size: 1

=head2 term_addition_version

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 term_last_modified_version

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=cut

__PACKAGE__->add_columns(
  "smq_code",
  { data_type => "integer", is_nullable => 0 },
  "term_code",
  { data_type => "integer", is_nullable => 0 },
  "term_level",
  { data_type => "integer", is_nullable => 0 },
  "term_scope",
  { data_type => "integer", is_nullable => 0 },
  "term_category",
  { data_type => "varchar", is_nullable => 0, size => 1 },
  "term_weight",
  { data_type => "integer", is_nullable => 0 },
  "term_status",
  { data_type => "varchar", is_nullable => 0, size => 1 },
  "term_addition_version",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "term_last_modified_version",
  { data_type => "varchar", is_nullable => 0, size => 5 },
);

=head1 RELATIONS

=head2 meddra_pref_terms

Type: has_many

Related object: L<FaersDB::Result::MeddraPrefTerm>

=cut

__PACKAGE__->has_many(
  "meddra_pref_terms",
  "FaersDB::Result::MeddraPrefTerm",
  { "foreign.pt_code" => "self.term_code" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:aOXWAKOeDdyVZPnrJ344Aw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
