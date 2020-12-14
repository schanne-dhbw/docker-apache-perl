#!/usr/bin/perl
print "Content-Type: text/html\n\n";

$args = $ENV{'QUERY_STRING'};

system("scala -cp tinyweb-scala/target/classes tinyweb.TinyWebViaPerl $args");

