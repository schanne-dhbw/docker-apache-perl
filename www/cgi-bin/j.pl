#!/usr/bin/perl
print "Content-Type: text/html\n\n";

$args = $ENV{'QUERY_STRING'};

system("java -cp tinyweb-java/target/tinyweb-java-1.0-SNAPSHOT.jar tinyweb.TinyWebViaPerl $args");

