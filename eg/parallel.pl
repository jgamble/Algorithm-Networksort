use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);

print nw_format(\@network);
my @grouped_network = nw_group_parallel(\@network, $inputs);

print "There are ", scalar @grouped_network,
	" columns in the parallel network\n\n";

foreach my $group (@grouped_network)
{
	print nw_format($group), "\n";
}

exit(0);

#
# @new_grouping = nw_group_parallel(\@network, $inputs);
#
# Take a list of comparators, and transform it into a list of a list of
# comparators, each sub-list representing a group that can be performed
# in a parallel (depending upon the architecture).
#
sub nw_group_parallel($$)
{
	my $network = shift;
	my $inputs = shift;

	my @node_range_stack;
	my @node_stack;

	#
	# Group the comparator nodes into columns.
	#
	foreach my $comparator (@$network)
	{
		my($from, $to) = @$comparator;
		my $col = scalar @node_range_stack;

		#
		# Search back through the stack of columns to see if
		# we can fit the comparator in an existing column.
		#
		while (--$col >= 0)
		{
			last if (grep{$_ != 0} @{$node_range_stack[$col]}[$from, $to]);
		}

		#
		# If even the top column can't fit it in, make a
		# new, empty top.
		#
		if (++$col == scalar(@node_range_stack))
		{
			push @node_range_stack, [(0) x $inputs];
		}
		
		@{$node_range_stack[$col]}[$from, $to] = (1, 1);

		#
		# Autovivification creates the [$col] array element
		# even if it doesn't already exist.
		#
		push @{$node_stack[$col]}, $comparator;
	}

	#push @node_stack, [sort {${$a}[0] <=> ${$b}[0]} splice @nodes, 0] if (@nodes);
	return @node_stack;
}

