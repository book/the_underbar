use v5.38;
use Test2::V0;
use YAML::PP;

use Path::Tiny qw( path );

my $yaml_pp = YAML::PP->new;

for my $yaml ( map path($_), glob 'content/episodes/*/meta.yaml' ) {
    my $episode = $yaml_pp->load_file($yaml);
    ok( -e $yaml->parent->child( $episode->{file} ), "$episode->{file} exists" );
}

done_testing;
