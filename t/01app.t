#!F:\strawberry\perl\bin\perl.exe
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'Books';

ok( request('/login')->is_success, 'Request should succeed' );

done_testing();
