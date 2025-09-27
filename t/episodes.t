use v5.38;
use Test2::V0;
use YAML::PP;

use Path::Tiny qw( path );

my $yaml_pp = YAML::PP->new;

# global podcast data
my $podcast = $yaml_pp->load_file('content/episodes/meta.yaml');
my @slugs   = sort keys $podcast->{syndicate}->%*;

# test podcast data
{
    my $podcast = $yaml_pp->load_file( path('content/episodes/meta.yaml') );
    ok( exists $podcast->{syndication}{$_}, "podcast - $_ link" ) for @slugs;
}

# test all episodes
for my $episode_yaml ( map path($_), glob 'content/episodes/*/meta.yaml' ) {
    my $path    = $episode_yaml->parent;
    my $number  = $path->basename;
    my $episode = $yaml_pp->load_file($episode_yaml);

    # syndication
    ok( exists $episode->{syndication}{$_}, "episode $number - $_ link" )
      for @slugs;

    # required values
    for my $required (qw( title description recorded published file )) {
        ok( exists $episode->{$required},
            "episode $number - $required exists" );
    }

    # required arrays
    for my $required (qw( cast editors )) {
        ok( exists $episode->{$required} && $episode->{$required}->@*,
            "episode $number - $required not empty" );
    }

    # linked files
    for my $file (qw( file transcript )) {
      SKIP: {
            skip "no $file defined for episode $number"
              unless exists $episode->{$file};
            ok(
                -e $path->child( $episode->{$file} ),
                "episode $number - $episode->{$file} exists"
            );
        }
    }

}

done_testing;
