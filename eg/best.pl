use Algorithm::Networksort ':all';
use Algorithm::Networksort::Best ':all';
use strict;
use warnings;

my $inputs;
my $name;

if (@ARGV == 0)
{
	warn "Please give an input size or a key name.";
	exit(0);
}

if ($ARGV[0] =~ /^[0-9]+/)
{
	$inputs = $ARGV[0];
	my(@names) = nw_best_names($inputs);
	if (@names == 0)
	{
		print "No 'best' networks available for size $inputs.\n";
		exit(0);
	}

	print "Available names for size $inputs: ", join(", ", @names), "\n";
	exit(0);
}
elsif ($ARGV[0] ne "")
{
	$name = $ARGV[0];
	$inputs = nw_best_inputs($name);
	die "Unknown network name" unless (defined $inputs);
}

my(@network) = nw_best_comparators($name);
my(@node_stack) = nw_group(\@network, $inputs, grouping => 'parallel');

print "There are ", scalar @network, " comparators in this network, grouped into\n",
	scalar @node_stack, " parallel operations.\n\n";

foreach my $group (@node_stack)
{
	print nw_format($group), "\n";
}



exit(0);
