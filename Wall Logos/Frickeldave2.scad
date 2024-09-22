$fn=40;

_file = "Frickeldave2.svg";
_t = 2;


module logo_base(h, o) {
    scale([0.39, 0.39, 1])
    linear_extrude(height=h)
    offset(o)
    import(file=_file, center=true);
}

module logo_inlay(h) {
    difference() {
        color("violet")
        logo_base(h, 0);

        color("red")
        translate([0, 0, -1])
        logo_base(h + 2, -_t);
    }
}

module logo_corpus(h, t) {
    difference() {
        logo_base(h, t);

        color("red")
        translate([0, 0, _t])
        logo_base(h, 0);
    }

    logo_inlay(h - 10 -_t);

}


module logo_cover(h) {

    translate([0, 0, h])
    logo_base(_t,0);

    difference() {
        logo_base(h, 0);

        color("red")
        translate([0, 0, -1])
        logo_base(h + 2, -_t);
    }
}

// color("black")
// logo_corpus(20, 10);

color("white")
translate([0, 0, 60])
logo_cover(12);