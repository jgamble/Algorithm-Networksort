use Getopt::Long;
use Algorithm::Networksort;
use Algorithm::Networksort::Best qw(:all);

use strict;
use warnings;

my %colorset = (compbegin => undef,
	compend => undef,
	compline => undef,
	inputbegin => undef,
	inputend => undef,
	inputline => undef,
	foreground => undef,
	background => undef,
);
my $alg = 'bosenelson';
my($nw, $best);

GetOptions('compbegin=s' => \$colorset{compbegin},
	'compend=s' => \$colorset{compend},
	'compline=s' => \$colorset{compline},
	'inputbegin=s' => \$colorset{inputbegin},
	'inputend=s' => \$colorset{inputend},
	'inputline=s'=> \$colorset{inputline},
	'foreground=s' => \$colorset{foreground},
	'background=s' => \$colorset{background},
	'algorithm=s' => \$alg,
	'best=s' => \$best,
);

my $inputs = $ARGV[0] || 8;

if (defined $best)
{
	$nw = nwsrt_best(name => $best);
}
else
{
	$nw = nwsrt(inputs => $inputs, algorithm => $alg);
}


$nw->colorsettings(%colorset);

print qq(<?xml version="1.0" standalone="no"?>\n),
qq(<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" ),
qq("http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">\n);

print "<!--\n";
foreach my $k (keys %colorset)
{
	my $v = (defined $colorset{$k})? $colorset{$k}: "undef";
	print "$k => $v\n";
}
print " -->\n";
print $nw->graph_svg();

exit(0);
