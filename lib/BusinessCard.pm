use MooseX::Declare;

role BusinessCard {
   has [qw{job email}] => (
      is       => 'rw',
      isa      => 'Str',
   );

   method job_builder {
      return 'Unemployed';
   }
}

