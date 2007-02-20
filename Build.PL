use Module::Build;
use strict;
use warnings;

my $build = Module::Build->new(
	module_name => 'Algorithm::Networksort',
	dist_author => 'John M. Gamble <jgamble@ripco.com>',
	dist_version_from => 'lib/Algorithm/Networksort.pm',  

	requires => { perl=> '5.6.0' },
	build_requires => { 'Test::Simple' => 0 },

	include_dirs => [ '.' ],
	license => 'perl',
	create_readme => 0,
	create_makefile_pl => 'traditional',
);

$build->create_build_script;
