$fn = 100; 

module single_pipe(t, ht, hm, hb, dt, db) {
    // Top segment
    translate([0, 0, hb + hm + t])
    difference() {
        cylinder(h = ht, r = dt / 2 + t);
        translate([0, 0, -1])
        cylinder(h = ht + 2, r = dt / 2);
    }

    // Middle segment
    translate([0, 0, hb + t])
    difference() {
        cylinder(h = hm, r1 = db / 2 + t, r2 = dt / 2 + t);
        translate([0, 0, -1])
        cylinder(h = hm + 2, r1 = db / 2, r2 = dt / 2);
    }

    // Bottom segment
    translate([0, 0, t])
    difference() {
        cylinder(h = hb, r = db / 2 + t);
        translate([0, 0, -1])
        cylinder(h = hb + 2, r = db / 2);
    }
}
