use strict;
use warnings;

use Books;

my $app = Books->apply_default_middlewares(Books->psgi_app);
$app;

