# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl hibbard10.t'

use Test::More tests => 1;
use Algorithm::Networksort qw(:all);

require "t/zero_one.pl";

my $author_testing = $ENV{AUTHOR_TESTING};
my $algorithm = 'hibbard';
my $inputs = 10;

SKIP:
{
	skip "Long test meant for the author's eyes", 1 unless ($author_testing);

	my @network = nw_comparators($inputs, algorithm=>$algorithm);
	my $status = zero_one($inputs, \@network);
	is($status, "pass", "$algorithm, N=$inputs, $status");
}
