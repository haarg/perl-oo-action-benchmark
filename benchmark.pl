#!/usr/bin/env perl

use strict;
use warnings;
use lib '.';
use feature 'say';

use Cwd;
use Symbol 'gensym';
use Config;
use Time::HiRes 'time';

sub time_it {
    my $t = 0;
    for ( 1 .. 100 ) {
        my $start_time = time();
        system(@_);
        $t += sprintf( "%0.1f", ( time() - $start_time ) * 1000 );
    }
    return $t / 100;
}

say 'PERL TIME          : ',
  time_it( $Config{perlpath}, getcwd() . '/perl.pl' ), 'ms';
say 'PERL + TYPES TIME  : ',
  time_it( $Config{perlpath}, getcwd() . '/perl-types.pl' ), 'ms';
say 'CORINNA TIME       : ',
  time_it( $Config{perlpath}, getcwd() . '/corinna.pl' ), 'ms';
say 'MOO TIME           : ',
  time_it( $Config{perlpath}, getcwd() . '/moo.pl' ), 'ms';
say 'MOO + TYPES TIME   : ',
  time_it( $Config{perlpath}, getcwd() . '/moo-typed.pl' ), 'ms';
say 'MOOSE TIME         : ',
  time_it( $Config{perlpath}, getcwd() . '/moose.pl' ), 'ms';
say 'MOOSE + TYPES TIME : ',
  time_it( $Config{perlpath}, getcwd() . '/moose-typed.pl' ), 'ms';
say 'RUBY TIME          : ', time_it( 'ruby', getcwd() . '/ruby.rb' ),   'ms';
say 'RAKU TIME          : ', time_it( 'raku', getcwd() . '/raku.raku' ), 'ms';
