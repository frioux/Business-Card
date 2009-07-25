package fREW;
use strict;
use warnings;
use feature ':5.10';
use Moose;
use MooseX::AttributeHelpers;

use namespace::clean -except => 'meta';

my $fiSMBoC = {
   string => q{%s is Station's Most Bodacious Creation},
   values => [],
};

my $RESEARCH = {
   string => 'Robots Eagerly Sailing Epic Artificial Rhythmic Cyclical Homonyms',
   values => []
};
my $IMAGINATIVE = {
   string => 'Insane Mimicries of Amazingly Gorgeous, Incomplete Networks, Axiomatic Theorems, and Immortally Vivacious Ecstasy',
   values => []
};
my $ORGANIC = {
   string => 'Original Renditions of Genetic Art Naturally Increasing in Complexity',
   values => [],
};
my $UNIFICATIONS = {
   string => 'Unions Normally Identified From Initial Characters; Aesthetically Tailored to Infer Other Notions Subconsciously',
   values => [],
};
my $fRIOUX = {
   string => q{%s %ses %s %s %s like XUOIRf},
   values => [ $fiSMBoC, $RESEARCH, $IMAGINATIVE, $ORGANIC, $UNIFICATIONS, ]
};
my $fRUE = {
   string => q{%s's Rectitude is Underpinned by Equivalence},
   values => [ $fRIOUX ],
 };
my $fROOH = {
   string => q{%s: Robotic Ominous Ossified Herald},
   values => [ $fRUE ],
 };
my $fREW = {
   string => q{%s Represents Encephelon Welkin},
   values => [ $fROOH ],
 };
push @{$fiSMBoC->{values}}, $fREW;

sub names_builder {
   return {
      fiSMBoC => $fiSMBoC,
      fRUE => $fRUE,
      fREW => $fREW,
      fROOH => $fROOH,
      fRIOUX => $fRIOUX,
   };
}



has names => (
   is     => 'ro',
   isa    => 'HashRef',
   builder => 'names_builder',
   lazy    => 1,
   provides  => {
      exists    => 'exists_in_mapping',
      keys      => 'ids_in_mapping',
      get       => 'get_mapping',
   },
);

__PACKAGE__->meta->make_immutable;

'station';
