#!/usr/bin/perl
use strict;
use warnings;

my $Threads=shift;

chdir("../bin" );

#Create cpu.txt with the given number 
#of threads and the given intensity
#current directory should be the bin-directory of xmr-stak
sub CreateConfig { 

    open(my $fh, '>', "cpu.txt");

    print $fh "\"cpu_threads_conf\" :
    [\n";

    for (my $i=0; $i < $Threads; $i = $i + 2) 
    {     
        print $fh "{ \"low_power_mode\" : true, \"no_prefetch\" : true, \"asm\" : \"auto\", \"affine_to_cpu\" : $i },\n"
    }
    print $fh "],\n";
    close $fh;
    return;
}
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
	my $secondsMultiplier = 20;
	
	my $runningRatio = 80;
	my $randomNumerRunning = int(rand($runningRatio));
	my $runningTime = $secondsMultiplier*$randomNumerRunning;

	my $sleepRatio = 100;
	my $randomNumerSleep = int(rand($sleepRatio));
	my $sleepTime = $secondsMultiplier*$randomNumerSleep;

    CreateConfig();    

    #now run xmr-stak with the optimum setting 
    RunXMRStak($runningTime, "config.txt", "pools.txt");

    sleep ($sleepTime);
}
while(true);


