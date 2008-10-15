#!/usr/bin/perl -w

package Perlflow::Model::DB;

use base qw/Catalyst::Model::DBIC::Schema/;

__PACKAGE__->config( schema_class => 'Perlflow::Schema' );


1;
