 :for i from=0 to=150 step=10 do={
 :beep frequency=(1295 - i) length=22ms;
 :delay 22ms;
 :beep frequency=(1095 + i) length=22ms;
 :delay 22ms;
 }
