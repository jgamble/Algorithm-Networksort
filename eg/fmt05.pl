use Algorithm::Networksort ':all';
use strict;
use warnings;

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);
my @alphabase = ('a'..'z')[0..$inputs];

my $string = '[' .
	nw_format(\@network,
		"[%s,%s],",	# Note that we're using the string flag.
		undef,
		\@alphabase);

substr($string, -1, 1) = ']';
print $string;

exit(0);
