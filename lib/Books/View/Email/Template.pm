package Books::View::Email::Template;

use strict;
use base 'Catalyst::View::Email::Template';

__PACKAGE__->config(
    stash_key       => 'email',
    template_prefix => ''
);

=head1 NAME

Books::View::Email::Template - Templated Email View for Books

=head1 DESCRIPTION

View for sending template-generated email from Books. 

=head1 AUTHOR

A clever guy

=head1 SEE ALSO

L<Books>

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
