use strict;
use Test::More tests => 3;

use Algorithm::Networksort qw(:all);

require "t/zero_one.pl";

my $algorithm = 'best';
my $name = nw_algorithm_name($algorithm);

for my $inputs (9..11)
{
	my @network = nw_comparators($inputs, algorithm=>$algorithm);
	my $status = zero_one($inputs, \@network);
	is($status, "pass", "$name, N=$inputs, $status");
}
