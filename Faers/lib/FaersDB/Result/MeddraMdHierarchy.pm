use utf8;
package FaersDB::Result::MeddraMdHierarchy;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraMdHierarchy

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

=head1 TABLE: C<meddra_md_hierarchy>

=cut

__PACKAGE__->table("meddra_md_hierarchy");

=head1 ACCESSORS

=head2 pt_code

  data_type: 'integer'
  is_nullable: 0

=head2 hlt_code

  data_type: 'integer'
  is_nullable: 0

=head2 hlgt_code

  data_type: 'integer'
  is_nullable: 0

=head2 soc_code

  data_type: 'integer'
  is_nullable: 0

=head2 pt_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 hlt_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 hlgt_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 soc_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 soc_abbrev

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 null_field

  data_type: 'varchar'
  is_nullable: 1
  size: 1

=head2 pt_soc_code

  data_type: 'integer'
  is_nullable: 1

=head2 primary_soc_fg

  data_type: 'varchar'
  is_nullable: 1
  size: 1

=cut

__PACKAGE__->add_columns(
  "pt_code",
  { data_type => "integer", is_nullable => 0 },
  "hlt_code",
  { data_type => "integer", is_nullable => 0 },
  "hlgt_code",
  { data_type => "integer", is_nullable => 0 },
  "soc_code",
  { data_type => "integer", is_nullable => 0 },
  "pt_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "hlt_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "hlgt_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "soc_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "soc_abbrev",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "null_field",
  { data_type => "varchar", is_nullable => 1, size => 1 },
  "pt_soc_code",
  { data_type => "integer", is_nullable => 1 },
  "primary_soc_fg",
  { data_type => "varchar", is_nullable => 1, size => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Kmtbv4/Rq/ZdmKdLk+soyQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
