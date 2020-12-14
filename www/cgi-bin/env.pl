#!/usr/bin/perl
print "Content-Type: text/html\n\n";

print "<ul>\n";
$queryString = $ENV{'QUERY_STRING'};
print "<li>$queryString</li>\n";
print "</ul>\n";


