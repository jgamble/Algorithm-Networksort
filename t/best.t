# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

use Test;
BEGIN { plan tests => 9 };
use Algorithm::Networksort qw(:all);
require "t/zero_one.pl";
ok(1); 

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.


my @network;
my $status;

for my $inputs (9..16)
{
	@network = nw_comparators($inputs, algorithm=>'best');
	$status = zero_one($inputs, \@network);
	ok($status, "pass", "test of 'Best', N=$inputs");
}

