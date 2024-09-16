$fn=40;


module frickeldave_logo(h, o) {
    
    union() {
        linear_extrude(height=h)
        offset(o)
        import(file = "Frickeldave.svg", center = true);

        color("violet")
        linear_extrude(height = h)
        translate([-105, -55, 0])
        rotate([0, 0, 60])
        offset(o)
        square([15,30]);

    }
}

module frickeldave_led(h, o, t) {

    difference() {
        frickeldave_logo(h, 0);

        color("red")
        translate([0, 0, t])
        frickeldave_logo(h, -t);
    }
}

frickeldave_led(15, 0, 1.6);

