use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 5;
my $n_comparators = $ARGV[1] || $inputs * 2;
my @network = ([0,1]) x $n_comparators;
my $combinations = (($inputs * ($inputs - 1))/2)**$n_comparators;
my $start_at = $ARGV[2] || 0;

print "N = $inputs, searching for a sort using $n_comparators comparators.\nNumber of possible combinations: $combinations\n\n";


for (my $j = 0; $j < $start_at; $j++)
{
	@network = next_network(\@network, $inputs, $n_comparators);
}
for (my $j = $start_at; $j < $combinations; $j++)
{
	print STDERR sprintf("%08d: ", $j), nw_format(\@network), "\n" if (($j % 1000) == 0);
	@network = next_network(\@network, $inputs, $n_comparators);
	if (zero_one(\@network, $inputs) == 0)
	{
		print "Solved! at $j of $combinations.\n";
		last;
	}
}
my @grouped_network = nw_group(\@network, $inputs);

foreach my $group (@grouped_network)
{
	print nw_format($group), "\n";
}

print nw_graph(\@network, $inputs);

exit(0);

sub comp_incr
{
	my($from, $to, $inputs) = @_;
	$to++;
	if ($to == $inputs)
	{
		$from++;
		return (0,1) if ($from == $inputs - 1);
		return ($from, $from+1);
	}
	return ($from, $to);
}

sub next_network
{
	my $network_ref = shift;
	my $inputs = shift;
	my $n_comps = shift;
	
	for (my $j = $n_comps - 1; $j >= 0; $j--)
	{
		my $comparator = $$network_ref[$j];
		my($from, $to) = comp_incr(@$comparator, $inputs);
		$$network_ref[$j] = [$from, $to];
		return @$network_ref unless ($from == 0 && $to == 1);
	}
	return @$network_ref;
}

sub zero_one
{
	my $network_ref = shift;
	my $inputs = shift;
	my $error;

	foreach my $x (1 .. (1 << $inputs) - 2)
	{
		my @bitlist = (split(//, unpack("B32", pack("N", $x))))[32 - $inputs .. 31];
		my $x_binary = join "", @bitlist;

		nw_sort($network_ref, \@bitlist);

		$sort_string = join "", @bitlist;

		if ($sort_string !~ qr/^0+1+$/)
		{
#			$error = "Failed to sort at $x [0b$x_binary].  Returned '$sort_string' instead.";
			return $x;
		}
	}

	return 0;
}

