$fn = 100;

id = 57; // inner diameter

use <./../modules/hex_grid_v02.scad>;

difference() {
    cylinder(h = 5, r = id / 2);
    translate([0, 0, -1])
    cylinder(h = 7, r = id / 2 - 2);
}

color("cyan")
translate([0, 0, 4])
difference() {
    cylinder(h = 2, r1 = id / 2 + 6, r2 = id / 2 + 2);
    translate([0, 0, -1])
    cylinder(h = 4, r = id / 2 - 2);
}

translate([0, 0, +2])
hexcircle(id / 2);

module hexcircle(r) {

    module hexcircle_frame(e, h) {
        difference() {
            translate([-r - e / 2, -r - e / 2, 0])
            cube([r * 2 + e, r * 2 + e, h]);
            translate([0, 0, -1])
            cylinder(h = h + 2, r = r);
        }
    }

    difference() {
        translate([-r, -r, 0])
        hexgrid([r * 2, r * 2, 4], 10, 2.5);
        
        color("red")
        translate([0, 0, -1])
        hexcircle_frame(200, 6);
    }
}




