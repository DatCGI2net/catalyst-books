#!/usr/bin/perl
 
use strict;
use warnings;
 
use Books::Schema;
 
my $schema = Books::Schema->connect('dbi:SQLite:db\books.db');
 
my @users = $schema->resultset('User')->all;
 
foreach my $user (@users) {
	##print "\nSetting passowrd:mypass for user:",$user->username;
   # $user->password('mypass');
   ## $user->update;
   print "\nChecking passowrd:mypass for user:",$user->username;
   print ": true" if($user->check_password('mypass'));
   
}