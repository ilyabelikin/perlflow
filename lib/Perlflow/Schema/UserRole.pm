#!/usr/bin/perl -w

package Perlflow::Schema::UserRole;
use base qw/DBIx::Class/;
__PACKAGE__->load_components(qw/UTF8Columns Core/);
__PACKAGE__->table('user_roles');
__PACKAGE__->add_columns(
    user_id => {
        data_type      => 'int',
        is_nullable    => 0,
        is_foreign_key => 1,
    },
    role => {
        data_type   => 'varchar',
        size        => 50,
        is_nullable => 0,
    },
);
__PACKAGE__->set_primary_key(qw/user_id role/);
__PACKAGE__->utf8_columns(qw/role/);

__PACKAGE__->belongs_to( user => 'Perlflow::Schema::User', 'user_id' );
1;
