use Getopt::Long;
use Algorithm::Networksort ':all';

use strict;
use warnings;

my %txtset = (compbegin => undef,
	compend => undef,
	compline => undef,
	inputbegin => undef,
	inputend => undef,
	inputline => undef,
);
my $alg = 'hibbard';

GetOptions(
	'compbegin=s' => \$txtset{compbegin},
	'compend=s' => \$txtset{compend},
	'compline=s' => \$txtset{compline},
	'inputbegin=s' => \$txtset{inputbegin},
	'inputend=s' => \$txtset{inputend},
	'inputline=s' => \$txtset{inputline},
	'algorithm=s' => \$alg,
);

my $inputs = $ARGV[0] || 8;

my @network = nw_comparators($inputs, algorithm => $alg);

#
# Because it's a pain to do it on the command line, fix the endline.
#
$txtset{inputend} .= "\n" if (defined $txtset{inputend});

print nw_graph(\@network, $inputs, graph => 'text', %txtset),
    "\tN= $inputs ", nw_algorithm_name($alg), " Sorting Network\n";

exit(0);
