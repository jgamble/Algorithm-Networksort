use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);

print nw_graph(\@network, $inputs, graph => 'text'), "\tN= $inputs\n";

exit(0);
