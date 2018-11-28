package Faers::Controller::Fda;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

use JSON;
use Text::CSV;

=head1 NAME

Faers::Controller::Drug - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path : Args(0) {

    my ( $self, $c ) = @_;
    $c->stash->{template} = 'fda/fda_data.html';
}

=head2 show_screen
Args: nothing
Return: nothing
Displays the generated query result on screen
=cut

sub show_screen : Local {
    my ( $self, $c ) = @_;

    my @display_results = generate_query_result( $c->request->params );

    $c->stash->{display_results} = \@display_results;
    $c->stash->{drugname} = $c->request->params->{'dname'};
    $c->stash->{start_date} = $c->request->params->{df};
    $c->stash->{end_date} = $c->request->params->{dt};
    $c->stash->{soc_req} = $c->request->params->{soc};
    $c->stash->{reaction} = $c->request->params->{reaction_term};
    $c->stash->{sorting} = $c->request->params->{sorting_screen};
 
    $c->stash->{template}        = 'fda/fda_data.html';
}

sub report : Local {
    my ( $self, $c ) = @_;

    my @display_report = generate_report( $c->request->params );
    $c->stash->{display_report} = \@display_report;
    $c->stash->{drugname} = $c->request->params->{'dname'};
    $c->stash->{start_date} = $c->request->params->{df};
    $c->stash->{end_date} = $c->request->params->{dt};
    $c->stash->{soc_req} = $c->request->params->{soc};
    $c->stash->{reaction} = $c->request->params->{reaction_term};
    $c->stash->{sorting} = $c->request->params->{sorting_screen};
 
    $c->stash->{template}        = 'fda/fda_data.html';
    

}

sub generate_report {
    my $params = shift;

    my $drugname      = $params->{'dname'}        || '';
    my $date_from     = $params->{df}             || 20140101;
    my $date_to       = $params->{dt}             || 20171231;
    my $soc           = $params->{soc}            || '';
    my $reaction_term = $params->{reaction_term}  || '';
    my $sort          = $params->{sorting_report} || '';
    my $valid = validate( $drugname, $date_from, $date_to, $soc, $reaction_term );
    if ($valid) {
        my $view_search_results_rs = Faers->model('FaersDB::ViewReportFDA')->search_rs(
            {},
            {
                bind => [
                    $drugname, $date_from, $date_to

                ],
                order_by => $sort
            }
        );

        my @search_results;
        Faers->log->info('before while');
        while ( my $search_result = $view_search_results_rs->next ) {
            push @search_results, $search_result;
        }

        return @search_results;
    }
}

=head3 generate_query_result
Args: $result
Return: $result
Returns the passed has after populating it with query result
=cut

sub generate_query_result {
    my $params = shift;

    my $drugname      = $params->{'dname'}        || '';
    my $date_from     = $params->{df}             || 20140101;
    my $date_to       = $params->{dt}             || 20171231;
    my $soc           = $params->{soc}            || '';
    my $reaction_term = $params->{reaction_term}  || '';
    my $sort          = $params->{sorting_screen} || '';

    my $valid = validate( $drugname, $date_from, $date_to, $soc, $reaction_term );
    if ($valid) {
        my $view_search_results_rs = Faers->model('FaersDB::ViewSearchResultFDA')->search_rs(
            {},
            {
                bind => [
                    $drugname, "$soc%", "$reaction_term%", $date_from, $date_to

                ],
                order_by => $sort
            }
        );

        my @search_results;
        Faers->log->info('before while');
        while ( my $search_result = $view_search_results_rs->next ) {
            push @search_results, $search_result;
            Faers->log->info($search_result);
        }
    return @search_results;
    }
}

=head3 suggest_drug_name
Args: nothing
Return: nothing
Creates suggestions for the specified field and prints them to a kson file
=cut

sub suggest_drug_name : Local {
    my ( $self, $c ) = @_;

    my $term     = $c->request->params->{term};
    my $drugs_rs = $c->model('FaersDB::brand')->search_rs(
        {
            brand_generic => { -like => "$term%" }
        },
        {
            select   => ['brand_generic'],
            distinct => 1
        }
    );
    my @drugs;
    while ( my $drug = $drugs_rs->next ) {
        push @drugs, $drug->brand_generic;
    }

    $c->response->content_type('application/json');
    $c->response->body( objToJson( \@drugs ) );
}

sub suggest_soc : Local {
    my ( $self, $c ) = @_;

    my $passed_data = $c->request->params->{term};
    my ( $term, $drugname ) = split( ',', $passed_data );

    Faers->log->info('before while $term $drugname');

    my $valid = 1;
    if ($valid) {
        my $soc_rs = Faers->model('FaersDB::ViewSOC')->search_rs(
            {},
            {
                bind => [
                    $drugname, "$term%"

                ],
            }
        );
        my @soc;
        while ( my $soc = $soc_rs->next ) {
            push @soc, $soc->soc_name;
        }

        $c->response->content_type('application/json');
        $c->response->body( objToJson( \@soc ) );
    }

}

sub suggest_reaction : Local {

    my ( $self, $c ) = @_;

    my $passed_data = $c->request->params->{term};
    my ( $term, $soc ) = split( ',', $passed_data );

    Faers->log->info('before while $term $drugname');

    my $valid = 1;
    if ($valid) {
        my $hlgt_rs = Faers->model('FaersDB::ViewHlgt')->search_rs(
            {},
            {
                bind => [
                    $soc, "$term%"

                ],
            }
        );
        my @hlgt;
        while ( my $hlgt = $hlgt_rs->next ) {
            push @hlgt, $hlgt->hlgt_name;
        }

        $c->response->content_type('application/json');
        $c->response->body( objToJson( \@hlgt ) );
    }

}

sub download : Local : Args {
    my ( $self, $c, $type ) = @_;
    my $drugname = substr($c->request->params->{'dname'},0,3);
    my $start_date = $c->request->params->{df};
    my $end_date = $c->request->params->{dt};
    my $soc_req = substr($c->request->params->{soc},0,3);
    my $reaction = substr($c->request->params->{reaction_term},0,3);
    
    my $name = "sum-".$drugname.$start_date."to".$end_date.$soc_req.$reaction;

    my @display_results = generate_query_result( $c->request->params );

    my $sep_char  = ',';
    my $extension = 'csv';
    if ( defined $type && $type eq 'tsv' ) {
        $sep_char  = "\t";
        $extension = 'tsv';
    }
    my $csv = Text::CSV->new( { sep_char => $sep_char } );
    my $csv_string = '';
    for my $display_result (@display_results) {
        $csv->combine( $display_result->soc_name, $display_result->hlgt_name,
            $display_result->total, $display_result->deaths );
        $csv_string .= $csv->string . "\n";
    }

    $c->response->content_type("text/$extension");
    $c->response->header( 'Content-Disposition' => "attachment; filename=$name.$extension" );
    $c->response->body($csv_string);
}

sub download_report : Local : Args {
    my ( $self, $c, $type ) = @_;
    my $drugname = substr($c->request->params->{'dname'},0,3);
    my $start_date = $c->request->params->{df};
    my $end_date = $c->request->params->{dt};
    my $soc_req = substr($c->request->params->{soc},0,3);
    my $reaction = substr($c->request->params->{reaction_term},0,3);
    
    my $name = "list-".$drugname.$start_date."to".$end_date.$soc_req.$reaction;

    my @display_results = generate_report( $c->request->params );

    my $sep_char  = ',';
    my $extension = 'csv';
    if ( defined $type && $type eq 'tsv' ) {
        $sep_char  = "\t";
        $extension = 'tsv';
    }
    my $csv = Text::CSV->new( { sep_char => $sep_char } );
    my $csv_string = '';
    for my $display_result (@display_results) {
        $csv->combine( $display_result->fda_dt, $display_result->age,
            $display_result->sex, $display_result->hlgt_name );
        $csv_string .= $csv->string . "\n";
    }

    $c->response->content_type("text/$extension");
    $c->response->header( 'Content-Disposition' => "attachment; filename=$name.$extension" );
    $c->response->body($csv_string);
}

=head2 
Args: @fields
Return: $value
return true if at least one field has some value and 
all the fields with a value doesn't have any inappriate characters
=cut

sub validate {
    my @fields = @_;
    my $value  = 0;
    foreach my $fields (@fields) {
        if ( length($fields) > 2 ) { $value = 1; }
    }
    if ($value) {
        foreach my $fields (@fields) {
            if ( $fields =~ m/[^a-zA-Z0-9\\\ \/()\-\_]/ ) { $value = 0; }

            #if ( $fields =~ m/[^A-Z]/ ) { $value = 0; }
        }
    }
    return $value;
}

=encoding utf8

=head1 AUTHOR

Programmer

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

