$fn = 200;

cn_dia = 30;
cn_height = 2;

module torus(r1, r2) {
    rotate_extrude() translate([r1,0,0]) circle(r2);
}

difference() {
    union() {

        color("cyan")
        cylinder(h = cn_height, r = cn_dia / 2 - 2);
        translate([0, 0, cn_height - 2])
        torus(cn_dia / 2 - 2, 2);

        color("green")
        translate([0, 0, -2])
        cylinder(h = cn_height - 0, r = cn_dia / 2);

    }

    color("red")
    translate([0, 0, -3])
    cylinder(h = cn_height + 4, r = 9 / 2);
}