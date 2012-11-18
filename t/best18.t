use strict;
use Test::More tests => 1;
use Algorithm::Networksort qw(:all);

require "t/zero_one.pl";

my $author_testing = $ENV{AUTHOR_TESTING};
my $algorithm = 'best';
my $name = nw_algorithm_name($algorithm);
my $inputs = 18;

SKIP:
{
	skip "Long test meant for the author's eyes", 1 unless ($author_testing);

	my @network = nw_comparators($inputs, algorithm=>$algorithm);
	my $status = zero_one($inputs, \@network);
	is($status, "pass", "$name, N=$inputs, $status");
}
