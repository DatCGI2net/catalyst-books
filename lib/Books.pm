package Books;
use Moose;
use namespace::autoclean;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application.
#
# Note that ORDERING IS IMPORTANT here as plugins are initialized in order,
# therefore you almost certainly want to keep ConfigLoader at the head of the
# list if you're using it.
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use Catalyst qw/
    -Debug
    ConfigLoader
    Static::Simple
 
    StackTrace
	
	Authentication
	Authorization::Roles
	
    Session
    Session::Store::File
    Session::State::Cookie
	+CatalystX::SimpleLogin
	
	StatusMessage
/;

extends 'Catalyst';

our $VERSION = '0.01';

# Configure the application.
#
# Note that settings in books.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config(
    name => 'Books',
    # Disable deprecated behavior needed by old applications
    disable_component_resolution_regex_fallback => 1,
    enable_catalyst_header => 1, # Send X-Catalyst header
);
__PACKAGE__->config(
    # Configure the view
    'View::HTML' => {
        #Set the location for TT files
        INCLUDE_PATH => [
            __PACKAGE__->path_to( 'root', 'src' ),
        ],
    },
);

# Configure SimpleDB Authentication
=pod
Working fine
__PACKAGE__->config(
    'Plugin::Authentication' => {
        default => {
            class           => 'SimpleDB',
            user_model      => 'DB::User',
            password_type   => 'self_check',
        },
    },
);
=cut
__PACKAGE__->config(
   authentication => {
      default_realm => 'users',
      realms        => {
         users => {
            credential => {
               class          => 'Password',
               password_field => 'password',
               password_type  => 'self_check'
            },
            store => {
               class         => 'DBIx::Class',
               user_model    => 'DB::User',
               role_relation => 'roles',
               role_field    => 'role',
            }
         }
      },
   },
   'Controller::Login' => {
       traits => ['-RenderAsTTTemplate'],
       login_form_args => {
           authenticate_args => { active => '1' },
       },
   },
);
# Start the application
__PACKAGE__->setup();

=encoding utf8

=head1 NAME

Books - Catalyst based application

=head1 SYNOPSIS

    script/books_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Books::Controller::Root>, L<Catalyst>

=head1 AUTHOR

Catalyst developer

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
