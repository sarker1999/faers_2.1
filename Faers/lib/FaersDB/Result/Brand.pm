use utf8;
package FaersDB::Result::Brand;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::Brand

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

=head1 TABLE: C<brand>

=cut

__PACKAGE__->table("brand");

=head1 ACCESSORS

=head2 brand_generic

  data_type: 'varchar'
  is_nullable: 0
  size: 768

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 256

=head2 genericid

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 generic_name

  data_type: 'varchar'
  is_nullable: 1
  size: 256

=cut

__PACKAGE__->add_columns(
  "brand_generic",
  { data_type => "varchar", is_nullable => 0, size => 768 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 256 },
  "genericid",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "generic_name",
  { data_type => "varchar", is_nullable => 1, size => 256 },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<brand_generic>

=over 4

=item * L</brand_generic>

=back

=cut

__PACKAGE__->add_unique_constraint("brand_generic", ["brand_generic"]);

=head1 RELATIONS

=head2 genericid

Type: belongs_to

Related object: L<FaersDB::Result::Generic>

=cut

__PACKAGE__->belongs_to(
  "genericid",
  "FaersDB::Result::Generic",
  { id => "genericid" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:S4NTsI17G0hczP0aPV5FUQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
