package fREW;
use strict;
use warnings;
use feature ':5.10';
use Moose;
use MooseX::AttributeHelpers;
use Method::Signatures::Simple;
use Acronym;
use CLASS;

use namespace::clean -except => 'meta';

with 'BusinessCard';

sub names_builder {
   my $fiSMBoC = Acronym->new(
      abbreviation => 'fiSMBoC',
      format       => q{%s %s %s's %s %s %s},
      values       => [qw{is Station Most Bodacious Creation}],
   );

   my $RESEARCH = Acronym->new(
      abbreviation => 'RESEARCH',
      format => '%s %s %s %s %s %s %s %s',
      values => [qw{Robots Eagerly Sailing Epic Artificial Rhythmic
	 Cyclical Homonyms}],
   );
   my $IMAGINATIVE = Acronym->new(
      abbreviation => 'IMAGINATIVE',
      format => '%s %s of %s %s, %s %s, %s %s, and %s %s %s',
      values => [qw{Insane Mimicries Amazingly Gorgeous Incomplete
	 Networks Axiomatic Theorems Immortally Vivacious Ecstasy}],
   );
   my $ORGANIC = Acronym->new(
      abbreviation => 'ORGANIC',
      format => '%s %s of %s %s %s %s in %s',
      values => [qw{Original Renditions Genetic Art Naturally
	 Increasing Complexity}],
   );
   my $UNIFICATIONS = Acronym->new(
      abbreviation => 'UNIFICATIONS',
      format => '%s %s %s %s %s %s; %s %s to %s %s %s %s',
      values => [qw{Unions Normally Identified From Initial Characters
	 Aesthetically Tailored Infer Other Notions Subconsciously}],
   );
   my $fRIOUX = Acronym->new(
      abbreviation => 'fRIOUX',
      format => '%s %ses %s %s %s like %s',
      values => [ $fiSMBoC, $RESEARCH, $IMAGINATIVE, $ORGANIC, $UNIFICATIONS, 'XUOIRf']
   );
   my $fRUE = Acronym->new(
      abbreviation => 'fRUE',
      format => q{%s's %s is %s by %s},
      values => [ $fRIOUX, qw{Rectitude Underpinned Equivalence} ],
   );
   my $fROOH = Acronym->new(
      abbreviation => 'fROOH',
      format => '%s: %s %s %s %s',
      values => [ $fRUE, qw{Robotic Ominous Ossified Herald}],
   );
   my $fREW = Acronym->new(
      abbreviation => 'fREW',
      format => q{%s %s %s %s},
      values => [ $fROOH, qw{Represents Encephelon Welkin} ],
   );
   unshift @{$fiSMBoC->{values}}, $fREW;

   return {
      fiSMBoC => $fiSMBoC,
      fRUE    => $fRUE,
      fREW    => $fREW,
      fROOH   => $fROOH,
      fRIOUX  => $fRIOUX,
   };
}

has names => (
   metaclass => 'Collection::Hash',
   is     => 'ro',
   isa    => 'HashRef[Acronym]',
   builder => 'names_builder',
   lazy    => 1,
   provides  => {
      defined => 'has_name',
   }
);

method expand($name, $depth) {
   $name ||= 'fREW';
   $depth //= 0;
   die "$name is not one of my names!" if !$self->has_name($name);
   $self->names->{$name}->expand($depth);
}

method BUILD {
   $self->job('Programmer');
   my $email = reverse 'moc.liamg@xuoirf';
   $self->email($email);
}

CLASS->meta->make_immutable;

'station';
