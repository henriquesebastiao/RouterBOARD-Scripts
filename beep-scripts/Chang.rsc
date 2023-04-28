 :for j from=1 to=4 step=1 do={
 :for i from=2000 to=50 step=-400 do={
 :beep frequency=$i length=11ms;
 :delay 11ms;
 }
 :for i from=800 to=2000 step=400 do={
 :beep frequency=$i length=11ms;
 :delay 11ms;
 }
 }