#!/usr/bin/wish

wm geometry . 600x300
grid [label .label  -text ""]

proc button_clck {} {
    puts "Pressed"
    .button configure -text "Pressed" 
    .label configure -text "Hi" -background blue
}

grid [button .button -text "Button" -command button_clck]
