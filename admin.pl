#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
use Term::ANSIColor;
use 5.30.0;
my $response = get('https://ifconfig.me');
unless ($response) {
    print "Check your internet connection.\n";
    exit;
}
my $RED = (color("bold red"));
my $NORMAL = (color("reset"));
my $CYAN = (color("bold cyan"));
my $GREEN = (color("bold green"));
my $WHITE = (color("bold white"));
print STDERR $RED;
print <<BANNER;
\t[ c0der by widhisec    ]
\t[ admin finder with perl ]
BANNER
print STDERR $NORMAL;
print STDERR $CYAN . "[*]" . $WHITE . "URL HERE :" . $NORMAL . " ";
my $urls = <STDIN>;
chomp($urls);
open(my $wordlist, "<", "wordlist.txt") or warn "Failed to open wordlist: $!";
my @wordlist = <$wordlist>;

close $wordlist;
sub scanlgsg {
  my $x = shift;
  my $urls = shift;
  my $res = head("$urls/$x");
 unless (!$res) {
  print STDERR "$CYAN [*] $WHITE $urls/$x code: ".$res->status_line."\n";
} else {
  print STDERR "$RED [*] $WHITE No response received for $urls/$x\n";
}
}
my $count = 15;
my $i = 0;

foreach my $x (@wordlist) {
    if ($i % $count == 0) {
        wait;
    }

    scanlgsg($x, $urls);

    $i++;
}



