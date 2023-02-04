$fn = 200;

dah_width = 200;
dah_depth = 50;
dah_height = 15;
dah_hole_count = 15;


difference() {
    union() {
        cube([dah_width, dah_depth, dah_height]);
    }

    for(i = [1 : 1 : dah_hole_count - 1]) {
        color("red")
        translate([dah_width / dah_hole_count * i, dah_depth / 3, dah_height - 10])
        cylinder(h = 11, r = 4);
    }

    for(i = [1 : 1 : dah_hole_count - 1]) {
        color("red")
        translate([dah_width / dah_hole_count * i, dah_depth / 3 * 2, dah_height - 10])
        cylinder(h = 11, r = 4);
    }
}