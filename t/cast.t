use v5.38;
use Test2::V0;
use YAML::PP;
use Path::Tiny qw( path );

my $yaml_pp = YAML::PP->new;

my %cast;

# grab the cast from all episodes
for my $episode_yaml ( map path($_), glob 'content/episodes/*/meta.yaml' ) {
    my $path    = $episode_yaml->parent;
    my $number  = $path->basename;
    my $episode = $yaml_pp->load_file($episode_yaml);

    $cast{$_}++ for $episode->{cast}->@*;
}

# check required YAML keys
for my $who ( sort keys %cast ) {
    my $person_yaml = path("content/cast/$who.yaml");
    ok( -e $person_yaml, "$who - YAML file" )
      or next;
    my $person = $yaml_pp->load_file($person_yaml);
    ok( exists $person->{name}, "$who - name" );
}

done_testing;
