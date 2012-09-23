use Module::Build;
use strict;
use warnings;

my $build = Module::Build->new(
	module_name => 'Algorithm::Networksort',

	dist_abstract => 'Create Sorting Networks',
	dist_author => ['John M. Gamble <jgamble@cpan.org>'],
	dist_version => '1.21',  

	requires => {
		perl=> '5.8.3'
	},

	configure_requires => {
		'Module::Build' => '0.4',
	},

	build_requires => {
		'Test::Simple' => 0
	},

	license => 'perl',
	create_license => 1,
	create_readme => 0,
	create_makefile_pl => 'traditional',
	dynamic_config => 0,

	meta_merge => {
		keywords => [qw(sort sorting-network
			batcher hibbard bose-nelson)],

		resources => {
			repository => 'git://github.com/jgamble/Algorithm-Networksort.git',
#			repository => {
#				url => 'git://github.com/jgamble/Algorithm-Networksort.git',
#				web => 'https://github.com/jgamble/Algorithm-Networksort',
#				type => 'git',
#			},
		},
	},

);

$build->create_build_script;
