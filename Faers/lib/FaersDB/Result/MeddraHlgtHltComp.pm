use utf8;
package FaersDB::Result::MeddraHlgtHltComp;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

FaersDB::Result::MeddraHlgtHltComp

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

=head1 TABLE: C<meddra_hlgt_hlt_comp>

=cut

__PACKAGE__->table("meddra_hlgt_hlt_comp");

=head1 ACCESSORS

=head2 hlgt_code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 hlt_code

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "hlgt_code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "hlt_code",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 RELATIONS

=head2 hlgt_code

Type: belongs_to

Related object: L<FaersDB::Result::MeddraHlgtPrefTerm>

=cut

__PACKAGE__->belongs_to(
  "hlgt_code",
  "FaersDB::Result::MeddraHlgtPrefTerm",
  { hlgt_code => "hlgt_code" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);

=head2 hlt_code

Type: belongs_to

Related object: L<FaersDB::Result::MeddraHltPrefTerm>

=cut

__PACKAGE__->belongs_to(
  "hlt_code",
  "FaersDB::Result::MeddraHltPrefTerm",
  { hlt_code => "hlt_code" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "RESTRICT" },
);


# Created by DBIx::Class::Schema::Loader v0.07047 @ 2018-04-04 16:57:02
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:w4tBCS0yGjIsntc/RmlsaQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
