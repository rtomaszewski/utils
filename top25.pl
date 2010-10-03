#!/usr/bin/perl
use strict;

my $history = shift // "$ENV{HOME}/.zsh-history";
my $count   = shift // 25;

open(my $fh, '<', $history) or print STDERR "$!" and exit(1);
chomp(my @records = <$fh>);
close($fh);

my %commands = ();

for(@records) {
  s/^:\s+[0-9]+:[0-9]+;//;
  $commands{$_}++;
}

for(sort { $commands{$b} <=> $commands{$a} } keys(%commands)) {
  if($count == 0) {
    exit(0);
  }
  printf("% 4d => %s\n", $commands{$_}, $_);
  $count--;
}
