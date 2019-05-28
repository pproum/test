#!/usr/bin/perl
use strict;
use warnings;

chdir("../bin" );

#run xmr-stak for the given time in seconds
sub RunXMRStak{
    my $runtime=shift;
    my $configfile= shift;
    my $poolconfig = shift;
    
    #run xmr-stak in parallel
    system("./xmr-stak -c $configfile  -C $poolconfig &");

    #wait for some time
    sleep ($runtime);

    #and stop xmr-stak
    system("pkill xmr-stak");
}

do
{
	my $secondsMultiplier = 30;
	
	my $runningRatio = 100;
	my $randomNumerRunning = int(rand($runningRatio));
	my $runningTime = $secondsMultiplier*$randomNumerRunning;

	my $sleepRatio = 80;
	my $randomNumerSleep = int(rand($sleepRatio));
	my $sleepTime = $secondsMultiplier*$randomNumerSleep;

    CreateConfig();    

    #now run xmr-stak with the optimum setting 
    RunXMRStak($runningTime, "config.txt", "pools.txt");

    sleep ($sleepTime);
}
while(true);


