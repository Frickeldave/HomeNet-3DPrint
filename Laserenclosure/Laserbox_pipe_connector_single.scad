$fn = 100; 

t = 4;      // thickness
ht = 30;    // top-segment
hm = 30;   // middle-segment
hb = 0;    // bottom-segment
dt = 88;    // inner-diameter-top
db = 120;   // inner-diameter-bottom
shfm = 52; // screw-hole from middle

use <./Laserbox_pipe_connector.scad>

module pipe_base() {

    // tube
    translate([0, 0, 0])
    single_pipe(t, ht, hm, hb, dt, db);

    // Base plate 
    difference() {
        
        // The plate
        translate([0, 0, t / 2])
        cube([db + t + 20, db + t + 20, t], center = true);
        
        // Cutout
        translate([0, 0, -1])
        cylinder(h = t + 2 , r = db / 2);

        color("red")
        translate([shfm, shfm, -1])
        cylinder(h = t + 2, r = 2);

        color("red")
        translate([shfm, -shfm, -1])
        cylinder(h = t + 2, r = 2);

        color("red")
        translate([-shfm, shfm, -1])
        cylinder(h = t + 2, r = 2);

        color("red")
        translate([-shfm, -shfm, -1])
        cylinder(h = t + 2, r = 2);
    }
}

pipe_base();

