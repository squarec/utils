#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Std;
use File::Basename;
my $name;
my $path;
my $suffix;

our ($opt_e); #For Getopt variable

getopts('e');
#print "e is $opt_e\n" if defined $opt_e;

my $oldfile;
#print "\n#ARGV, ARGV= ",$#ARGV,"  ", @ARGV;
#print "\n";
#shift @ARGV;
#print "\n#ARGV, ARGV= ",$#ARGV, @ARGV;
if  ($#ARGV = 0) {
die "Usage: remove_dot.pl [-e] files\n-e : Ready to RUN\n\n";
}
print "\n";
foreach $_ (@ARGV) {
   $oldfile = $_;
  ($name,$path,$suffix) = fileparse($_,qr"\.[^.]+$");

   print "==========================================================================\n\n";
   print "File Name : ", $name,"\n";
   print "File Ext  : ", $suffix,"\n";
   print "--------------------------------------------------------------------------\n";

   $name =~ s/L\.P/LP/g;
   $name =~ s/V\.A\.-\.//g;
   $name =~ s/\.专辑\.\(FLAC\)//g;
   $name =~ s/\.专辑\.\(FLAC\)//g;
   $name =~ s/\./ /g;
   $name =~ s/]//g;
   $name =~ s/(CD\d\d)/$1]/g;

   $name = $name.$suffix;
   print "New File Name: ", $name,"\n";
   print "rename  ", $oldfile ,"  to  ", $name;
   print "\n\n";
	if ($opt_e) {
   	   print "Executing ...... \n";
	   rename($oldfile, $name);
	}
}

print "Done\n"

#$name =~ s{\.[^.]+$}{}

#V.A.-.[RCA.LIVING.STEREO.60CD.V2.CD21.Gould.-.Bizet.Carmen.for.Orchestra].专辑.(FLAC).flac
