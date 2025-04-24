#!/usr/bin/wish

wm geometry . 500x500
grid [label .label  -text "ENTER LETTERS BELOW"]
entry .ltrs
grid .ltrs -pady 20
bind .ltrs <KeyRelease> updateEntryL

proc updateEntryL {} {
        set text [.ltrs get]
        if {[regexp {^[A-Za-zА-Яa-яЁё]*$} $text]} {
                .ltrs configure -background green
        } else {
                .ltrs configure -background red
        }
}

grid [label .myLabelN  -text "ENTER NUMBERS BELOW"]
entry .nmbrs
grid .nmbrs -pady 40
bind .nmbrs <KeyRelease> updateEntryN

proc updateEntryN {} {
        set text [.nmbrs get]
        if {[regexp {^[0-9]*$} $text]} {
                .nmbrs configure -background green
        } else {
                .nmbrs configure -background red
        }
}
