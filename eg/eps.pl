use Getopt::Long;
use Algorithm::Networksort ':all';

use strict;
use warnings;

my %colorset = (compbegin => undef,
	compend => undef,
	compline => undef,
	inputbegin => undef,
	inputend => undef,
	inputline => undef,
	foreground => undef,
);
my $alg = 'hibbard';

GetOptions('compbegin=s' => \$colorset{compbegin},
	'compend=s' => \$colorset{compend},
	'compline=s' => \$colorset{compline},
	'inputbegin=s' => \$colorset{inputbegin},
	'inputend=s' => \$colorset{inputend},
	'inputline=s'=> \$colorset{inputline},
	'foreground=s' => \$colorset{foreground},
	'algorithm=s' => \$alg,
);

%colorset = nw_color(%colorset);

my $inputs = $ARGV[0] || 8;

my @network = nw_comparators($inputs, algorithm => $alg);

print nw_graph(\@network, $inputs, graph => 'eps');

exit(0);
