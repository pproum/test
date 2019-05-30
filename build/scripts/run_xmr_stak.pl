#!/usr/bin/perl
use strict;
use warnings;

chdir("./mine" );

#run xmr-stak for the given time in seconds
sub RunXMRStak{
    my $runtime=shift;
    my $configfile= shift;
    my $poolconfig = shift;
    
	print "Running";
    #run xmr-stak in parallel
    system("./xmr-stak -c $configfile  -C $poolconfig &");

    #wait for some time
    sleep ($runtime);
	print "Killing";
    #and stop xmr-stak
    system("pkill xmr-stak");
}

do
{
	my $secondsMultiplier = 10;
	
	my $runningRatio = 100;
	my $randomNumerRunning = int(rand($runningRatio));
	my $runningTime = $secondsMultiplier*$randomNumerRunning;

	my $sleepRatio = 40;
	my $randomNumerSleep = int(rand($sleepRatio));
	my $sleepTime = $secondsMultiplier*$randomNumerSleep;
	
	print "Running number: ", $randomNumerRunning;
	print "Running time: ", $runningTime ;
	print "Sleep number: ", $randomNumerSleep ;
	print "Sleep time: ", $sleepTime;
	
    #now run xmr-stak with the optimum setting 
    RunXMRStak($runningTime, "config.txt", "pools.txt");
	print "Sleeping";
    sleep ($sleepTime);
}
while(2>1);


