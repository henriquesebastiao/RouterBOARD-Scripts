 :for i from=800 to=2000 step=100 do={
 :beep frequency=$i length=11ms;
 :delay 11ms;
 }
 :for i from=2000 to=50 step=-100 do={
 :beep frequency=$i length=11ms;
 :delay 11ms;
 }
