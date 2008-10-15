#!/usr/bin/perl -w
use strict;
use utf8;
use lib ('./lib');
use YAML::Syck;
use Perlflow::Schema;

my $cfg = LoadFile 'perlflow.yml';
$cfg = $cfg->{'Model::DB'}{connect_info};
my $schema = Perlflow::Schema->connect(@$cfg);
$schema = adapt_for_mysql($schema);

my ($next, $prev); 

if (@ARGV) {
    $next = $ARGV[0];
    $prev = $ARGV[1];
} else {
    my @list = <./sql/*.sql>;
    my $max = 0;
    foreach (@list) { 
        /^[^-]+-Schema-(\d+)-MySQL\.sql$/ or next;  
        $max = $1 if $max < $1;
    }
    
    $next = $max + 1;
    $prev = $max;
}

$schema->create_ddl_dir( ['MySQL'], $next, './sql/', $prev );

sub adapt_for_mysql {
    my ($schema)=@_;

    foreach my $src ($schema->sources){
        my $rs=$schema->source($src);
        foreach my $cn ($rs->columns){
            my $ci=$rs->column_info($cn);
            if($ci->{data_type} eq 'enum'){
                $ci->{data_type}='enum('.join(',', map {"'$_'"} @{$ci->{enum_values}}).')';
                delete $ci->{size};
            } elsif($ci->{data_type} eq 'DATE') {
                delete $ci->{size};
            }
        }
    }
    return $schema;
}
