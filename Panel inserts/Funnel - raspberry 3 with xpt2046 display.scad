$fn=100;

use <./Funnel - empty.scad>;

pi_material_thickness = 2;
pi_funnel_height = 30;
pi_funnel_ring_diameter = 165;
pi_funnel_hole_diameter = 130;
pi_funnel_bottom_diameter = 100;
pi_pi3_width=85;
pi_pi3_depth=56;

pi_draw="cover"; // "funnel" or "cover"

module screw_mount() {
    difference() {
        cylinder(h=4, r=2.5);
        cylinder(h=5, r=0.5);
    }
};

// e = enlargement. When e=0 the case will have the exact size if the raspberry pi. 
// h = The high of the case. Please consider, that the screw-mounts has the high of 4 mm and you hava th add the material thickness of the bottom.
//     When you need the high of 25mm for your raspberry you have to use: 25 + t + 4.
module raspi3_case(w, d, e, h, t) {
     
    pi3_case_width=w + e;
    pi3_case_depth=d + e;

    pi3_case_point0x = - pi3_case_width / 2 - t;
    pi3_case_point0y = - pi3_case_depth / 2 - t;

    difference() {
        
        // The outside measure of the case
        translate([0, 0, h / 2])
        cube([pi3_case_width + t * 2, pi3_case_depth + t * 2, h], center=true);

        // The inner outcut of the case
        translate([0, 0, h / 2 + t])
        cube([pi3_case_width, pi3_case_depth, h], center=true);

        // The cutout at the bottom
        color("red")
        translate([0, 0, 1])
        cube([w - 16, d - 16, t + 2], center=true);

        // The hole for the usb power connector
        color("red")
        translate([pi3_case_point0x + e / 2 + 5, pi3_case_point0y - 1, t + 2])
        cube([20, t + 2, 13]);

    }


    // Screw bottom left
    translate([pi3_case_point0x + t + 3.5 + e / 2, pi3_case_point0y + t + 3.5 + e / 2, t])
    screw_mount();

    // Screw bottom right
    translate([pi3_case_point0x + t + 3.5 + 58 + e / 2, pi3_case_point0y + t + 3.5 + e / 2, t])
    screw_mount();

    // Screw top left
    translate([pi3_case_point0x + t + 3.5 + e / 2, pi3_case_point0y + t + 3.5 + 49 + e / 2, t])
    screw_mount();

    // Screw top right
    translate([pi3_case_point0x + t + 3.5 + 58 + e / 2, pi3_case_point0y + t + 3.5 + 49 + e / 2, t])
    screw_mount();
};

module raspi3_cover(w, d, e, t) {
    pi3_case_width=w + e;
    pi3_case_depth=d + e;

    echo(pi3_case_depth);

    pi3_case_point0x = - pi3_case_width / 2 - t;
    pi3_case_point0y = - pi3_case_depth / 2 - t;

    difference() {
        cube([pi3_case_width + t * 2, pi3_case_depth + t * 2, t], center=true);

        color("red")
        translate([pi3_case_point0x + 10, pi3_case_point0y + 7, - t])
        cube([77, 50, t + 2], center=false);
    }

    difference() {
        // The inner frame
        color("pink")
        translate([0, 0, - t - 3])
        cube([pi3_case_width - 0.5, pi3_case_depth - 0.5,8], center=true);

        // The inner frame outcut
        color("red")
        translate([0, 0, - t - 3])
        cube([pi3_case_width - 1.8, pi3_case_depth - 1.5, 16], center=true);
        
        // The outcut for USB
        color("green")
        translate([pi3_case_width / 2 - 9, 0, 0-t-8-5])
        cube([20, pi3_case_depth + 2, 16], center=true);
    }
};


module funnel() {

    difference() {

        // Create the funnel
        translate([0, 0, - pi_funnel_height - pi_material_thickness])
        panel_insert_funnel(pi_material_thickness, pi_funnel_height, pi_funnel_hole_diameter, pi_funnel_bottom_diameter);

        // Cut out the same size as the raspberry pi case
        color("pink")
        translate([0, 0, -20])
        cube([91, 62, 31], center=true);

        // Cutout the tunnel for the usb power
        color("green")
        translate([-39.5, -100, -27])
        cube([20, 100, 13]);

    }

    // Add the raspberry pi case
    translate([0, 0, -32])
    raspi3_case(pi_pi3_width, pi_pi3_depth, 6, 31, 2);
};

module cover() {
    raspi3_cover(pi_pi3_width, pi_pi3_depth, 6, pi_material_thickness);

};

// if (pi_draw=="funnel") {
//     funnel();
// };

// if (pi_draw=="cover") {
//     cover();
// };

// funnel();
// translate([0,0,5])
cover();