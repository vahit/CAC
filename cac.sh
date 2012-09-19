### Smart Alarmed Clock
### version 1.0

#!/bin/bash4

function siren
{
	declare key;
	while `test -f /devel/tmp/200`; do
        	play-sound /media/internal/.sounds/Ringtones/ringtone.wav &
                if read -t 16; then
                	{
                        	killall play-sound;
                                rm /devel/tmp/200;
                        }
                fi
        done
}
declare -i i;
volum.sh -100
playm.sh
touch /devel/tmp/200
for ((i=1; $i<= $1 ; i=i+1)) ; do
	volum.sh +1
        sleep 3;
done
gsleep 5m;
for ((i=1; $i<= 5; i=i+1)) ; do
	volum.sh +2
        sleep 1;
done
gsleep 2m;
stopm.sh;
siren;
exit 0;
#while true; do
#	play-sound /media/internal/.sounds/Ringtones/ringtone.wav;
#	play-sound /media/internal/.sounds/Ringtones/Siren-AirRaid.wav;
#done
