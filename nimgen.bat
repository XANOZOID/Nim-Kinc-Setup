REM technically none of these paths need to be absolute, was just using absolute for workflow reasons
cd C:\<fix-absolute-path>\kinc\nim_binding

start /MIN nim c  -c --cc:vcc --noMain  --noLinking --nimcache:./Sources/nim/ --header:./nimlib/nmain.h ./nimlib/nmain.nim