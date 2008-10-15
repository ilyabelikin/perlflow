package Perlflow::Controller::User;

use strict;
use warnings;
use parent 'Catalyst::Controller';

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    
}

sub login : Local {
    my ( $self, $c ) = @_;
    
    if ( $c->authenticate( $c->request->param("openid_url") ) ) {
        return $c->res->redirect( $c->uri_for('/') );
    } else {
        #auth error
    }
}

sub logout : Local {
    my ( $self, $c ) = @_;

    $c->logout;
    $c->response->redirect($c->uri_for('/'));
}

=head1 AUTHOR

Dmitriy Dzema

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
