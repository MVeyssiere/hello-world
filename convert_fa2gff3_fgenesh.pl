#!/usr/local/bin/perl
use strict;

#fichier fasta genes de prodigal
open (F, $ARGV[0]) or die "cannot open $ARGV[0]\n";


while (my $lig=<F>){
	chomp $lig;
	my @fields = split(/#/,$lig);
	print "@fields[0]\tFGENESH4.0.0\tprotein_coding\t@fields[1]\t@fields[2]\t.\t@fields[3]\t.\t@fields[4]\n";
	
}


close F;
