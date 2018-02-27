#!/usr/local/bin/perl
use strict;

#fichier annotation iprscan
open (A, $ARGV[0]) or die "cannot open $ARGV[0]\n";

#fichier gff3
open (F, $ARGV[1]) or die "cannot open $ARGV[1]\n";

my %goi=();

while (my $ligne=<A>){
	chomp $ligne;
	my @fields = split(/\t/,$ligne);
	$goi{$fields[0]}=$fields[3].";Alias=".$fields[4].";Ontology_term=".$fields[6].";Description=".$fields[5];	
	#print $fields[0]."\n";
}

while (my $lig=<F>){
	chomp $lig;
	my @fieldsg = split(/=/,$lig);
	#print "@fieldsg[1]\n";
	#print $fieldsg[1];
	
	if (exists($goi{$fieldsg[1]})){
		$lig=~s/@fieldsg[1]/@fieldsg[1];Note=$goi{$fieldsg[1]}\n/;
		print $lig;
		#print $goi{$fieldsg[1]};
	}
}

close A;
close F;
