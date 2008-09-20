package Perlflow::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(
    {

        CATALYST_VAR => 'C',
        INCLUDE_PATH => [ Perlflow->path_to('tpl') ],
        DEBUG       => undef,         #all, service, context, parser, provider,
        PRE_CHOMP   => 3,
        POST_CHOMP  => 3,
        TRIM        => 1,
        TEMPLATE_EXTENSION => '.tt'
    }
);

=head1 NAME

Perlflow::View::TT - TT View for Perlflow

=head1 DESCRIPTION

TT View for Perlflow. 

=head1 AUTHOR

=head1 SEE ALSO

L<Perlflow>

Dmitriy Dzema

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
