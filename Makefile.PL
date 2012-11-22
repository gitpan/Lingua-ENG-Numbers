
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Lingua::ENG::Numbers converts arbitrary numbers into human-oriented English text. Limited support is included for parsing standardly formatted numbers (i.e. 3,213.23). But no attempt has been made to handle any complex formats. Support for multiple variants of English are supported. Currently only \"American\" formatting is supported.",
  "AUTHOR" => "Stephen Pandich <pandich\@yahoo.com>",
  "BUILD_REQUIRES" => {
    "Test::More" => 0,
    "utf8" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Lingua-ENG-Numbers",
  "EXE_FILES" => [],
  "LICENSE" => "gpl",
  "NAME" => "Lingua::ENG::Numbers",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "base" => 0,
    "strict" => 0,
    "vars" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.044",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



