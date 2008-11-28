#!/usr/bin/perl -w

package Perlflow::Schema::User;
use strict;
use utf8;

use base qw/DBIx::Class/;
__PACKAGE__->load_components(qw/ TimeStamp Core /);
__PACKAGE__->table('users');
__PACKAGE__->add_columns(
    url => {
        data_type   => 'varchar',
        size        => 255,
        is_nullable => 0,
    },
    display => {
        data_type   => 'varchar',
        size        => 255,
        is_nullable => 0,
    },

);
__PACKAGE__->set_primary_key('display');
__PACKAGE__->resultset_class('Perlflow::Schema::User::ResultSet');

__PACKAGE__->has_many( roles => 'Perlflow::Schema::UserRole', 'user_id' );

sub add_role {
    my ( $self, $role ) = @_;
    $self->Roles->find_or_create( { uid => $self->id, role => $role } );
}

sub is_admin {
    grep { $_->role eq 'admin' } shift->roles;
}

package Perlflow::Schema::User::ResultSet;
use strict;
use warnings;
use base qw/DBIx::Class::ResultSet/;

sub auto_create {
    my ($self, $openid_info) = @_;
    my $selected = { map { $_ => $openid_info->{$_} } qw/display url/ };
    $self->create( $selected );
}
1;
