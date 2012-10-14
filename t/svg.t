# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl svg.t'

use Test::More tests => 2;

use Algorithm::Networksort qw(:all);
use strict;
use warnings;

SKIP:
{
	eval "use Test::XML::Easy";
	skip("Test::XML::Easy required for verifying SVG", 2) if (1);

	#
	# Start with a simple network.
	#
	my @network = nw_comparators(4, algorithm=>'hibbard');
	my $svg = nw_graph(\@network, 4, graph => 'svg');

	is_well_formed_xml($svg, "Test with default settings");

	#
	# Now create one that has the defaults changed.
	#
	@network = nw_comparators(7, algorithm=> 'batcher');
	nw_color(inputbegin=>'red',
		inputend=>'blue',
		compbegin=>'magenta',
		compend=>'teal');
	$svg = nw_graph(\@network, 7, graph => 'svg',
		title => "Batcher's Merge Exchange, N = 7",
		vt_margin => 25,
		vt_sep => 16,
		indent => 8,
		hz_margin => 20,
		hz_sep => 16,
		stroke_width => 4);

	is_well_formed_xml($svg, "Test with defaults changed");
}
exit(0);
