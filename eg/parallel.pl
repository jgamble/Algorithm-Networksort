use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);
my @grouped_network = nw_group(\@network, $inputs, grouping=>'parallel');

print "There are ", scalar @network,
	" comparators in this network, grouped into\n",
	scalar @grouped_network, " parallel operations.\n\n";

foreach my $group (@grouped_network)
{
	print nw_format($group), "\n";
}

@grouped_network = nw_group(\@network, $inputs);
print "\nThis will be graphed in ", scalar @grouped_network,
	" columns.\n";

exit(0);
