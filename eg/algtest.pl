use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);

print STDERR nw_format(\@network), "\n";

print nw_graph(\@network, $inputs, graph => 'text'), "\tN= $inputs\n",
	"\n\n\n\ttesting...\n";

#
# Now test using an array of all of the binary combinations, skipping
# the all-zeros and all-ones cases which are already pretty well sorted.
#
foreach my $x (1 .. (1 << $inputs) - 2)
{
	my @bitlist = (split(//, unpack("B32", pack("N", $x))))[32 - $inputs .. 31];
	my $bitstring = join "", @bitlist;

	nw_sort(\@network, \@bitlist);

	my $sort_bits = join "", @bitlist;

	die "Sort test fails at 0b$bitstring\n" if ($sort_bits !~ m/^0+1+$/);
}

print "Passed zero-one tests.\n";

exit(0);
