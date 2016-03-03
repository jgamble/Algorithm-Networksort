use strict;
use warnings;
use Test::More;
use Algorithm::Networksort;
use Algorithm::Networksort::Best qw(:all);

require "t/zero_one.pl";

my @names;

our $author_testing = $ENV{AUTHOR_TESTING};
@names= sort(nw_best_names());	# All, regardless of input size.
diag("Names to run: " . join(", ", @names));

unless ($author_testing)
{
	plan tests => 1;
	ok(scalar @names > 0, "@names");
}
else
{
	plan tests => 1 + scalar @names;
	ok(scalar @names > 0, "@names");

	for (@names)
	{
		my $title = nw_best_title($_);
		my @network = nw_best_comparators($_);
		my $inputs = nw_best_inputs($_);

		my $status = zero_one($inputs, \@network);
		is($status, "pass", "$_, $status, '$title'");
	}
}

1;
