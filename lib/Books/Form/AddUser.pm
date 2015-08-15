package Books::Form::AddUser;
 
use HTML::FormHandler::Moose;
extends 'Books::Form::EditUser';
use namespace::autoclean;
 
has_field 'username' => (
    type     => 'Text',
    label    => 'User name',
    required => 1,
);
 
__PACKAGE__->meta->make_immutable;
 
1;