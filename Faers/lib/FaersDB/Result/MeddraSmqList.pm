use utf8;
package FaersDB::Result::MeddraSmqList;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraSmqList

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

=head1 TABLE: C<meddra_smq_list>

=cut

__PACKAGE__->table("meddra_smq_list");

=head1 ACCESSORS

=head2 smq_code

  data_type: 'integer'
  is_nullable: 0

=head2 smq_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 smq_level

  data_type: 'integer'
  is_nullable: 0

=head2 smq_description

  data_type: 'varchar'
  is_nullable: 0
  size: 2000

=head2 smq_source

  data_type: 'varchar'
  is_nullable: 1
  size: 2000

=head2 smq_note

  data_type: 'varchar'
  is_nullable: 1
  size: 2000

=head2 meddra_version

  data_type: 'varchar'
  is_nullable: 0
  size: 5

=head2 status

  data_type: 'varchar'
  is_nullable: 0
  size: 1

=head2 smq_algorithm

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=cut

__PACKAGE__->add_columns(
  "smq_code",
  { data_type => "integer", is_nullable => 0 },
  "smq_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "smq_level",
  { data_type => "integer", is_nullable => 0 },
  "smq_description",
  { data_type => "varchar", is_nullable => 0, size => 2000 },
  "smq_source",
  { data_type => "varchar", is_nullable => 1, size => 2000 },
  "smq_note",
  { data_type => "varchar", is_nullable => 1, size => 2000 },
  "meddra_version",
  { data_type => "varchar", is_nullable => 0, size => 5 },
  "status",
  { data_type => "varchar", is_nullable => 0, size => 1 },
  "smq_algorithm",
  { data_type => "varchar", is_nullable => 0, size => 256 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JAX8SGeRqpf9zSJy7VMN6Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
