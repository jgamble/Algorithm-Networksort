use Getopt::Long;
use Algorithm::Networksort;
use Algorithm::Networksort::Best qw(:all);

use strict;
use warnings;

#
# These are the default settings.
#
my %graphset = (
	hz_margin => 18,
	hz_sep => 12,
	indent => 9,
	inputline => 2,
	inputradius => 2,
	compline => 2,
	compradius => 2,
	vt_margin => 21,
	vt_sep => 12,
);

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
	'hz_margin=i' => \$graphset{hz_margin},
	'hz_sep=i' => \$graphset{hz_sep},
	'indent=i' => \$graphset{indent},
	'inputradius=i' => \$graphset{inputradius},
	'compradius=i' => \$graphset{compradius},
	'inputline=i' => \$graphset{inputline},
	'compline=i' => \$graphset{compline},
	'vt_margin=i' => \$graphset{vt_margin},
	'vt_sep=i' => \$graphset{vt_sep},
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
$nw->graphsettings(%graphset);

print "<html>\n";

print "<!--\n";
foreach my $k (keys %colorset)
{
	my $v = (defined $colorset{$k})? $colorset{$k}: "undef";
	print "$k => $v\n";
}
print " -->\n";

print $nw->graph_svg(), "\n</html>\n";

exit(0);
