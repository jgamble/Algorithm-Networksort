use Algorithm::Networksort qw(nw_sort);

#
# Test using all binary combinations.  (Skipping the all-zeros
# and all-ones cases, which are already pretty well sorted).
#
sub zero_one
{
	my $inputs = shift;
	my $network_ref = shift;
	my $error = "pass";
	my $zo = qr/^0+1+$/;

	foreach my $x (1 .. (1 << $inputs) - 2)
	{
		my @bitlist = (split(//, unpack("B32", pack("N", $x))))[32 - $inputs .. 31];
		my $x_binary = join "", @bitlist;

		next if ($x_binary =~ $zo);
		nw_sort($network_ref, \@bitlist);

		$sort_string = join "", @bitlist;

		unless ($sort_string =~ $zo)
		{
			$error = "Failed to sort at $x [0b$x_binary].  Returned '$sort_string' instead.";
			last;
		}
	}

	return $error;
}

1;
