# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl hibbard04.t'

use Test::More tests => 6;

use Algorithm::Networksort qw(:all);

require "t/zero_one.pl";

my $algorithm = 'hibbard';
my @network;
my $status;

for my $inputs (4..9)
{
	@network = nw_comparators($inputs, algorithm=>$algorithm);
	$status = zero_one($inputs, \@network);
	is($status, "pass", "$algorithm, N=$inputs, $status");
}
