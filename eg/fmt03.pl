use Algorithm::Networksort ':all';
use strict;
use warnings;

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);

print nw_format(\@network,
		"SWAP(%d, %d);\n",
		undef,
		[1..$inputs]);

exit(0);
