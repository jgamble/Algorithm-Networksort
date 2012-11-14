use strict;

use Algorithm::Networksort qw(:all);
use Test::More;

our $author_testing = $ENV{AUTHOR_TESTING};
our @input_range = $author_testing? (3..16): (3..9);

require "t/zero_one.pl";

my $algorithm = 'bitonic';

for my $inputs (@input_range)
{
	my @network = nw_comparators($inputs, algorithm=>$algorithm);
	my $status = zero_one($inputs, \@network);

	if ($status eq "pass")
	{
		ok(1, "$algorithm, N=$inputs");
	}
	else
	{
		ok(0, "$algorithm, N=$inputs, $status");
	}
}

done_testing(scalar @input_range);

