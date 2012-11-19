use Test::More;

use Algorithm::Networksort qw(:all);
use strict;
use warnings;

my $inputs = 7;
my $algorithm = 'hibbard';
my $name = nw_algorithm_name($algorithm);
my @network = nw_comparators($inputs, algorithm=>$algorithm);

eval "use Test::XML::Easy";
if ($@)
{
	plan skip_all => "Test::XML::Easy required for verifying SVG"
}
else
{
	plan tests => 2;
}

	#
	# Start with a simple network.
	#
	my $svg = nw_graph(\@network, $inputs, graph => 'svg');

	is_well_formed_xml($svg, "Test with default SVG settings");

	#
	# Now create one that has the defaults changed.
	#
	nw_color(inputbegin=>'red',
		inputend=>'blue',
		compbegin=>'magenta',
		compend=>'teal');

	$svg = nw_graph(\@network, 7, graph => 'svg',
		title => "$name, N = 7",
		vt_margin => 25,
		vt_sep => 16,
		indent => 8,
		hz_margin => 20,
		hz_sep => 16,
		stroke_width => 4);

	is_well_formed_xml($svg, "Test with defaults changed");

