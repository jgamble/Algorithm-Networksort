use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my @network = nw_comparators($inputs, algorithm => $alg);

print "<?xml version=\"1.0\" standalone=\"no\"?>\n",
	"<!DOCTYPE svg PUBLIC \"-//W3C//DTD SVG 20001102//EN\"\n",
        "         \"http://www.w3.org/TR/2000/CR-SVG-20001102/DTD/svg-20001102.dtd\">\n";

if (@ARGV == 3)
{
	print nw_graph(\@network, $inputs, graph => 'svg', namespace => $ARGV[2]);
	print "\n\nNamespace $ARGV[2] found!!\n";
}
else
{
	print nw_graph(\@network, $inputs, graph => 'svg');
	print "\n\nNo namespace!!\n";
}

exit(0);
