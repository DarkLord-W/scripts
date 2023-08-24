#! /bin/zsh
#Examples:xrandr --output VGA1 --mode 1024x768 --pos 1920x0 --output HDMI1 --mode 1920x1080 --pos 0x0
#xrandr --output HDMI-0 --auto --output  DP-4 --auto --right-of HDMI-0
#xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --output DP-4 --mode 2560x1600  --pos 1920x0 --primary
#xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --ouput DP-4 --mode 2560x1600  --pos 1920x0  
#xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-4 --mode 2560x1600 --pos 1920x0 --rotate normal

function daemons() {
    bash  /YourPath/.dwm/scripts/statusbar.sh &
    picom  --config /YourPath/.config/picom/picom.conf >> /dev/null 2>&1 & 
	bash /YourPath/.dwm/scripts/wallpaper.sh &
    fcitx5 &                                  
    numlockx &                                       
    redshift -v            
    xfce4-power-manager &
    #flameshot &
    #rm -rf /YourPath/.cache &
    #/bin/bash /YourPath/scripts/multi-screen.sh &

}


daemons &                                   # 后台程序项

