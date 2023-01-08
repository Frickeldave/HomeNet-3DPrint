$fn=400;

module screw_mount() {
    difference() {
        cylinder(h=4, r=1.5);
        cylinder(h=5, r=0.5);
    }
};

// e = enlargement. When e=0 the case will have the exact size if the raspberry pi. 
// h = The high of the case. Please consider, that the screw-mounts has the high of 4 mm and you hava th add the material thickness of the bottom.
//     When you need the high of 25mm for your raspberry you have to use: 25 + t + 4.
module raspi3_case(e, h, t) {
    
    pi3_width=85;
    pi3_depth=56;
    
    pi3_case_width=pi3_width + e;
    pi3_case_depth=pi3_depth + e;

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
        cube([pi3_width - 16, pi3_depth - 16, t + 2], center=true);

        // The hole for the usb power connector
        color("red")
        translate([pi3_case_point0x + e / 2 + 5, pi3_case_point0y - 1, t + 4])
        cube([12, t + 2, 7]);

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

module panel_insert_funnel(t, fh, fdt, fdb) {

    difference() {
        color("lightblue")
        cylinder(h=fh + t, r1=fdb / 2 + t, r2=fdt / 2 + t);

        color("red")
        translate([0, 0, t])
        cylinder(h=fh + 1, r1=fdb / 2, r2=fdt / 2);
    }
};


pi_material_thickness = 2;
pi_funnel_height = 30;
pi_funnel_ring_diameter = 165;
pi_funnel_hole_diameter = 130;
pi_funnel_bottom_diameter = 100;

// Create the ring which will be installed on top of the wood
panel_insert_mounting_ring(pi_material_thickness, pi_funnel_ring_diameter, pi_funnel_hole_diameter);

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
    translate([-39.5, -100, -25])
    cube([12, 100, 7]);

}

// Add the raspberry pi case
translate([0, 0, -32])
raspi3_case(6, 31, 2);