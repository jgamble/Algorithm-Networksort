use strict;

use Test::More tests => 2;

use Algorithm::Networksort qw(:all);

require "t/zero_one.pl";

my $algorithm = 'oddeventransposition';
my $name = nw_algorithm_name($algorithm);

for my $inputs (4,7)
{
	my @network = nw_comparators($inputs, algorithm=>$algorithm);
	my $status = zero_one($inputs, \@network);
	is($status, "pass", "$name, N=$inputs, $status");
}
