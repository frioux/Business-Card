package Acronym;
use Moose;
use MooseX::AttributeHelpers;
use namespace::clean except => 'meta';
use CLASS;
use Method::Signatures::Simple;

has $_ => (
   is       => 'ro',
   isa      => 'Str',
   required => 1,
) for (qw{format abbreviation});

has values => (
   is       => 'ro',
   isa      => 'ArrayRef[Acronym|Str]',
   default  => sub { [] },
   metaclass => 'Collection::Array',
   provides => {
      get => 'get_value',
   }
);

method expand($depth) {
   $depth //= 1;
   return $self->abbreviation
      if $depth < 0;

   my @values = map {
      ( ref $_ )
         ? $_->expand($depth - 1)
         : $_;
   } @{$self->values};
   return sprintf $self->format, @values;
}

CLASS->meta->make_immutable;

1;
