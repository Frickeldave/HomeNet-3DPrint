$fn=40;
_file="Frickeldave2.svg";

module logo_base(h, o) {
    union() {
        scale([0.39, 0.39, 1])
        linear_extrude(height=h)
        offset(o)
        import(file = _file, center = true);
    }
}

module logo_inlay(h) {
    difference() {
        color("violet")
        logo_base(h, 0);

        color("red")
        translate([0, 0, -1])
        logo_base(h + 2, -2);
    }
}

module logo_corpus(h, t) {

    difference() {
        logo_base(h, t);

        color("red")
        translate([0, 0, 2])
        logo_base(h, 0);
    }
}

module frickeldave_cover(h, t) {
    frickeldave_logo(h, 7);
}

//frickeldave_led(25, 1.6);
//import(file = "Frickeldave.svg", center = true);

//frickeldave_logo(20, 0);




logo_corpus(20, 7);