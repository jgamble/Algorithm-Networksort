use Algorithm::Networksort;

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';
my $grp =  $ARGV[2] || 'group';

my $nw = Algorithm::Networksort->new(inputs => $inputs, algorithm => $alg);

print "[default option] There are ", scalar @network, " comparators in this network.\n";

print nw_format(\@network), "\n";

print "[grouping option] There are ", scalar @network, " comparators in this network.\n";

print nw_format(\@network), "\n";


exit(0);
