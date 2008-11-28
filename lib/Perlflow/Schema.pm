package Perlflow::Schema;

use strict;
use warnings;

use base 'DBIx::Class::Schema';

__PACKAGE__->load_classes;
# Created by DBIx::Class::Schema::Loader v0.04004 @ 2008-02-15 11:30:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:nZOJDVGfvVOW4aIgjzHQkA

# You can replace this text with custom content, and it will be preserved on regeneration
sub sqlt_deploy_hook {
    my ($self, $sqlt_schema) = @_;
    my @tables = $sqlt_schema->get_tables;
    foreach (@tables){
        $sqlt_schema->drop_table($_->name) if ref $_->name;
    }
}

1;
