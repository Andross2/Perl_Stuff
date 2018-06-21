#!/usr/bin/env perl
# progress-bar3.pl
# invoke ./progress-bar3.pl hopefully

use English;

my $interval = 1;
my $long_interval=10;

{
        $SIG{INT} = sub { die "exit" };
        sleep $interval; sleep $interval
        while(true){
        do
          print $_ '.' #use dots for now then use a different graphic "+"?
          sleep $interval
          done; }
}

& #Start a progress bar as a background process.

pid=$!
trap "print !; kill -USR1 $pid; wait $pid" EXIT # To handle ^C

print -n 'Long-running process '
sleep $long_interval;
print ' Finished!'

kill -USR1 $pid #Stop the progress bar.

trap EXIT

exit $?

