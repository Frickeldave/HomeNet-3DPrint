$fn=100;

use <./Funnel - empty.scad>;

pi_material_thickness = 2;
pi_funnel_height = 30;
pi_funnel_ring_diameter = 165;
pi_funnel_hole_diameter = 130;
pi_funnel_bottom_diameter = 100;
pi_pi3_width=85;
pi_pi3_depth=56;

module funnel() {

    difference() {

        // Create the funnel
        translate([0, 0, - pi_funnel_height - pi_material_thickness])
        panel_insert_funnel(pi_material_thickness, pi_funnel_height, pi_funnel_hole_diameter, pi_funnel_bottom_diameter);

        // Cutout the tunnel for the usb power
        color("green")
        translate([-5, -30, - pi_funnel_height / 2 + 5])
        rotate([90,0,0])
        cylinder(h=100, r1=6, r2=6);
    }

};

funnel();