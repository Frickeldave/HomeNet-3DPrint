$fn=100;

use <./Funnel - empty.scad>;

pi_material_thickness = 2;
pi_funnel_height = 30;
pi_funnel_ring_diameter = 165;
pi_funnel_hole_diameter = 130;
pi_funnel_bottom_diameter = 100;
pi_hmip_width=55;
pi_hmip_depth=55;

pi_draw="cover"; // "funnel" or "cover"

module screw_mount() {
    difference() {
        cylinder(h=4, r=1.5);
        cylinder(h=5, r=0.5);
    }
};

// e = enlargement. When e=0 the case will have the exact size if the raspberry pi. 
// h = The high of the case. Please consider, that the screw-mounts has the high of 4 mm and you hava th add the material thickness of the bottom.
//     When you need the high of 25mm for your raspberry you have to use: 25 + t + 4.
module hmip_case(w, d, e, h, t) {
     
    hmip_case_width=w + e;
    hmip_case_depth=d + e;

    difference() {
        
        // The outside measure of the case
        translate([0, 0, h / 2])
        cube([hmip_case_width + t * 2, hmip_case_depth + t * 2, h], center=true);

        // The inner outcut of the case
        translate([0, 0, h / 2 + t])
        cube([hmip_case_width, hmip_case_depth, h + t], center=true);
    }
};

module hmip_cover(w, d, e, t) {
    hmip_case_width=w + e;
    hmip_case_depth=d + e;

    difference() {
        cube([hmip_case_width + t * 2, hmip_case_depth + t * 2, t], center=true);

        color("red")
        //translate([0, 0, - t])
        cube([w, d, t + 2], center=true);
    }

    difference() {
        // The inner frame
        color("pink")
        translate([0, 0, - t])
        cube([hmip_case_width - 0.1, hmip_case_depth - 0.1, 2], center=true);

        // The inner frame outcut
        color("red")
        translate([0, 0, - t])
        cube([hmip_case_width - 1.5, hmip_case_depth - 1.5, 3], center=true);
    }
};

module funnel() {

    difference() {

        // Create the funnel
        translate([0, 0, - pi_funnel_height - pi_material_thickness])
        panel_insert_funnel(pi_material_thickness, pi_funnel_height, pi_funnel_hole_diameter, pi_funnel_bottom_diameter);
    }

    // Add the cylinder between the funnel and the thermostate case
    translate([0,0,-32])
    cylinder(h = 11, r1 = 22, r2 = 13);

    // Add the hmip case
    translate([0, 0, -22])
    %hmip_case(pi_hmip_width, pi_hmip_depth, 3, 20, 2);
};

module cover() {

    // Add the hmip case
    hmip_cover(pi_hmip_width, pi_hmip_depth, 3, 2);
};


if (pi_draw=="funnel") {
    funnel();
};

if (pi_draw=="cover") {
    cover();
};