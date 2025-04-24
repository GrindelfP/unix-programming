#!/usr/bin/wish

wm geometry . 300x500

frame .preview -width 300 -height 100 -background #000000
grid .preview -columnspan 2 -pady 10

scale .r -from 0 -to 255 -orient horizontal -label "RED" -command updatePreview
scale .g -from 0 -to 255 -orient horizontal -label "GREEN" -command updatePreview
scale .b -from 0 -to 255 -orient horizontal -label "BLUUUUUUUUE" -command updatePreview

grid .r -sticky ew -padx 30
grid .g -sticky ew -padx 30
grid .b -sticky ew -padx 30

button .aButton -text "Apply" -command applyColor
grid .aButton -pady 10

button .qButton -text "Exit" -command {exit}
grid .qButton

label .label  -text "Color code"
grid .label -pady 20

proc updatePreview {val} {
    set r [.r get]
    set g [.g get]
    set b [.b get]
    set hexColor [format "#%02x%02x%02x" $r $g $b]
    .preview configure -background $hexColor
}

proc applyColor {} {
    set r [.r get]
    set g [.g get]
    set b [.b get]
    set hexColor [format "#%02x%02x%02x" $r $g $b]
    puts "Picked colour: $hexColor"
    .label configure -text "Color code: $hexColor"
}
