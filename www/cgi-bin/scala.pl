#!/usr/bin/perl
print "Content-Type: text/html\n\n";

$className = $ENV{'QUERY_STRING'};

system("scala $className");

