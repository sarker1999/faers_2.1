use utf8;
package FaersDB::Result::MeddraHltPrefComp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraHltPrefComp

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

=head1 TABLE: C<meddra_hlt_pref_comp>

=cut

__PACKAGE__->table("meddra_hlt_pref_comp");

=head1 ACCESSORS

=head2 hlt_code

  data_type: 'integer'
  is_nullable: 0

=head2 pt_code

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "hlt_code",
  { data_type => "integer", is_nullable => 0 },
  "pt_code",
  { data_type => "integer", is_nullable => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w0uTkqwbvdEG0Ayk7cXraw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
