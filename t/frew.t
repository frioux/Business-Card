#!perl
use strict;
use warnings;
use feature ':5.10';
use Test::More 'no_plan';
use Test::Exception;

use FindBin;
use lib "$FindBin::Bin/../lib";

BEGIN { use_ok 'fREW', 'fREW Works' }

lives_ok { fREW->new } 'fREW Lives!';
my $fREW = fREW->new;
lives_ok { $fREW->names } 'fREW has valid names';

is $fREW->expand           , 'fROOH Represents Encephelon Welkin'                              , 'fREW expands correctly';
is $fREW->expand('fROOH')  , 'fRUE: Robotic Ominous Ossified Herald'                           , 'fROOH expands correctly';
is $fREW->expand('fRUE')   , q{fRIOUX's Rectitude is Underpinned by Equivalence}               , 'fRUE expands correctly';
is $fREW->expand('fRIOUX') , 'fiSMBoC RESEARCHes IMAGINATIVE ORGANIC UNIFICATIONS like XUOIRf' , 'fRIOUX expands correctly';
is $fREW->expand('fRIOUX', 1), q{fREW is Station's Most Bodacious Creation Robots Eagerly Sailing Epic Artificial Rhythmic Cyclical Homonymses Insane Mimicries of Amazingly Gorgeous, Incomplete Networks, Axiomatic Theorems, and Immortally Vivacious Ecstasy Original Renditions of Genetic Art Naturally Increasing in Complexity Unions Normally Identified From Initial Characters; Aesthetically Tailored to Infer Other Notions Subconsciously like XUOIRf}, 'fRIOUX(1) expands correctly';
is $fREW->expand('fiSMBoC'), q{fREW is Station's Most Bodacious Creation}, 'fiSMBoC expands correctly';

is $fREW->expand, $fREW->expand('fREW', 0), 'expand defaults correctly';
is $fREW->job, 'Programmer', 'Job set correctly';
my $email = reverse $fREW->email;
is $email, 'moc.liamg@xuoirf', 'Email set correctly';
