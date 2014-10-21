use strict;
use Test::More;
use YAML::Syck;
use Data::Dumper;

plan tests => 1;

my $bref = bless \eval{my $scalar = 'YAML::Syck' }, 'foo';
my $bref2bref = bless \$bref, 'bar';

my $dd =  Dumper $bref2bref;
my $edd;
{
    no strict 'vars';
    $edd = eval $dd;
}
is Dumper(Load(Dump($bref2bref))),   $dd, 'YAML::Syck'
