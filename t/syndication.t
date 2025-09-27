use v5.38;
use Test2::V0;
use YAML::PP;

my $yaml_pp = YAML::PP->new;
my $podcast = $yaml_pp->load_file('content/episodes/meta.yaml');
my @slugs   = sort keys $podcast->{syndicate}->%*;

for my $file ( 'content/episodes/meta.yaml', glob 'content/episodes/*/meta.yaml' ) {
    my $episode = $yaml_pp->load_file($file);
    for my $slug (@slugs) {
        ok( exists $episode->{syndication}{$slug}, "$file $slug" );
    }
}

done_testing;
