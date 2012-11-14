use Module::Build;
use strict;
use warnings;

our $test_all = 0;

my $class = Module::Build->subclass(
	class => "Module::Build::Custom",
	code => <<'SUBCLASS' );

sub ACTION_test {
	my $self = shift;

	local $ENV{AUTHOR_TESTING} = 1 if ($test_all);
	$self->SUPER::ACTION_test;
}
SUBCLASS

#my $build = Module::Build->new(
my $build = $class->new(
	module_name => 'Algorithm::Networksort',

	dist_abstract => 'Create Sorting Networks',
	dist_author => ['John M. Gamble <jgamble@cpan.org>'],
	dist_version => '1.25',  

	requires => {
		perl=> '5.8.3'
	},

	configure_requires => {
		'Module::Build' => '0.4',
	},

	build_requires => {
		'Test::Simple' => 0
	},

	#
	# Some test files take a long time to run. To save
	# the testers some processing time, skip those tests
	# by default (this is set in the individual test files).
	# Use the --Testall option to run all tests in the t/
	# directory.
	#
	get_options => {
		Testall => {store => \$test_all},
	},

	license => 'perl',
	create_license => 1,
	create_readme => 0,
	create_makefile_pl => 'traditional',
	dynamic_config => 0,

	meta_merge => {
		keywords => [qw(sort sorting-network
			batcher bitonic hibbard bose-nelson)],

		resources => {
			repository => 'git://github.com/jgamble/Algorithm-Networksort.git',
		},
	},

);

$build->create_build_script;
