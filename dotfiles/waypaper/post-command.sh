 wallust run $1 && pkill waypaper 

 pkill waybar && waybar &
 sed -i "s|^[[:space:]]*path = .*|    path = $1|"\
   ~/.config/hypr/hyprlock.conf
#restart lock session

pkill hyprlock && hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'
