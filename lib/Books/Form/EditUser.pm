package Books::Form::EditUser;
 
use HTML::FormHandler::Moose;
extends 'Books::Form::UserProfile';
use namespace::autoclean;
 
has_field 'roles' => (
    type         => 'Multiple',
    widget       => 'checkbox_group',
    label_column => 'role',
    label        => '',
);
 
__PACKAGE__->meta->make_immutable;
 
1;