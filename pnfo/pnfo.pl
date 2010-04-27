#!/usr/bin/perl
use strict;
# pnfo
# NFO files are ASCII-art with the cp437 codepage
# Lucida ConsoleP has support for all the cp437 chars

my $term = "urxvt -fn xft:'Lucida ConsoleP' -fg '#ffffff' -uc +sb";
my $viewer = "vimpager-nfo";
if($ARGV[0] =~ /\.nfo$/) {
        system("$term -e $viewer $ARGV[0]");
}
else {
    system("$term -e $viewer *.nfo");
}
