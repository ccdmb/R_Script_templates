#!/usr/bin/perl
#use strict;

# Read  meta to get the sample ids
my $f = shift or die "Usage: $0 FILE\n";
#
open my $fl, '<', $f or die "Could not open '$f' $!";
chomp(my @ls = <$fl>);
my @meta;
#
foreach my $m (@ls){
	my @samp = split(/	/, $m); 
	`echo $samp[0] > "$samp[0].txt"`;
	`egrep -v ^N "$samp[0]ReadsPerGene.out.tab" |cut -f 4  >> "$samp[0].txt"`;

}
`paste S*.txt > matrix`;
`egrep -v "^N" S01ReadsPerGene.out.tab |cut -f 1 >tmp`; 
`cat head  tmp > gene`;
`paste gene matrix > tmp;mv tmp matrix`;
`rm S*.txt`
