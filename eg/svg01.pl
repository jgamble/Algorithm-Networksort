use Algorithm::Networksort ':all';

my $inputs = $ARGV[0] || 8;
my $alg = $ARGV[1] || 'hibbard';

my $title = "Network for N=$inputs, using $alg.";

my @network = nw_comparators($inputs, algorithm => $alg);

print 		"<html xmlns:svg='http://www.w3.org/2000/svg'>\n\n",
		"<object id=\"AdobeSVG\"\n",
		"   CLASSID=\"clsid:78156a80-c6a1-4bbf-8e6a-3cd390eeb4e2\">\n",
		"</object>\n",
		"<?import namespace=\"svg\" implementation=\"#AdobeSVG\"?>\n",
		"<head>\n<title>$title</title>\n",
		"</head>\n",
		"<body>\n",
		nw_graph(\@network, $inputs, graph => 'svg', namespace => 'svg'),
		"<p>\n$title\n</p>\n\n",
		"</body>\n</html>\n\n";

exit(0);
