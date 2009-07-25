use MooseX::Declare;
use MooseX::AttributeHelpers;

class Acronym {
   has [qw{format abbreviation}] => (
      is       => 'ro',
      isa      => 'Str',
      required => 1,
   );

   has values => (
      is       => 'ro',
      isa      => 'ArrayRef[Acronym|Str]',
      default  => sub { [] },
      metaclass => 'Collection::Array',
      provides => {
	 get => 'get_value',
      }
   );

   method expand(Int $depth = 1) {
      return $self->abbreviation
	 if $depth < 0;

      my @values = map {
	 ( ref $_ )
	    ? $_->expand($depth - 1)
	    : $_;
      } @{$self->values};
      return sprintf $self->format, @values;
   }
}

