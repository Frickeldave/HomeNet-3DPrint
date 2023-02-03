$fn = 200;

cn_dia = 45;
cn_height = 5;

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
        cylinder(h = cn_height - 2, r = cn_dia / 2);
    }
    translate([0, 0, -1])
    cylinder(h = cn_height + 2, r = 9 / 2);
}