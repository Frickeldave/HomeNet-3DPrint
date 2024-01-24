$fn = 100; 

t = 4;      // thickness
ht = 6;    // top-segment
hm = 30;   // middle-segment
hb = 20;    // bottom-segment
dt = 96;    // inner-diameter-top
db = 120;   // inner-diameter-bottom

use <./Laserbox_single_pipe.scad>
use <./pipe1.scad> // https://www.thingiverse.com/thing:5644676/files

module pipe_base() {
    // Left tube
    translate([-(db / 2) - 10, 0, 0])
    single_pipe(t, ht, hm, hb, dt, db);

    // Right tube
    translate([db / 2 + 10, 0, 0])
    single_pipe(t, ht, hm, hb, dt, db);

    // Base plate 
    difference() {
        
        // The plate
        translate([0, 0, t / 2])
        cube([db * 2 + t + 40, db + t + 20, t], center = true);
        
        // Cutout left
        translate([-(db / 2) - 10, 0, -1])
        cylinder(h = t + 2 , r = db / 2);

        // Cutout right
        translate([(db / 2) + 10, 0, -1])
        cylinder(h = t + 2 , r = db / 2);

        color("red")
        translate([db, db / 2, -1])
        cylinder(h = t + 2, r = 2);

        color("red")
        translate([db, -(db / 2), -1])
        cylinder(h = t + 2, r = 2);

        color("red")
        translate([-db, db / 2, -1])
        cylinder(h = t + 2, r = 2);

        color("red")
        translate([-db, -(db / 2), -1])
        cylinder(h = t + 2, r = 2);
    }
}

pipe_base();

translate([-70, 0, 60])
union() {
    color("blue")
    rotate([0, 0, 90])
    bending();
    
    color("green")
    translate([140, 0, 0])
    rotate([0, 0, -90])
    bending();
}

module bending() {
    //   outer_radius, inner_radius, list of segments
    pipe((dt + t*2) / 2, 46, [
            //length, rotation, angle, radius_of_curvature 
            [50, 0, 20, 100],
            [50, 0, 20, 100],
            [56, 180, 20, 100],
            [50, 0, 20, 100]
        ]);
}

