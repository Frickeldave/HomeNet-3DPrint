$fn=400;

pi_material_thickness = 2;
pi_funnel_ring_diameter = 165;
pi_funnel_hole_diameter = 130;

module panel_insert_mounting_ring(t, d, hd) {

    difference() {

        union() {
            translate([0,0,0.4])
            cylinder(h = t - 0.4, r1 = d / 2, r2 = d / 2 - t);
            
            color("green")
            cylinder(h = 0.4, r1 = d / 2, r2 = d / 2);
        }

        translate([0, 0, -1])
        cylinder(h = t + 2, r = hd / 2);

        // screw hole right
        translate([d / 2 - 7, 0, -1])
        cylinder(h = t + 2, r = 2);

        translate([d / 2 - 7, 0, 1.1])
        cylinder(h = 1, r1 = 2, r2 = 4);

        // screw hole left
        translate([-(d / 2 - 7), 0, -1])
        cylinder(h = t + 2, r = 2);

        translate([-(d / 2 - 7), 0, 1.1])
        cylinder(h = 1, r1 = 2, r2 = 4);

    }

};

// Create the ring which will be installed on top of the wood
panel_insert_mounting_ring(pi_material_thickness, pi_funnel_ring_diameter, pi_funnel_hole_diameter);
