
// The inner size of the box
cm_width = 190;
cm_depth = 60;
cm_height = 60;
cm_thickness = 2;
cm_coh = 28.1; // The cable outlet hole
cm_coh_length = 10;
cm_led_mount = 17;

difference() {
    
    union() {
        // The box
        cube([cm_width + cm_thickness * 2, cm_depth + cm_thickness * 2, cm_height + cm_thickness * 2]);

        // The outer ring of cable outlot hole
        translate([-cm_coh_length, cm_depth / 2 + cm_thickness, cm_height / 2 + cm_thickness])
        rotate([0,  90, 0])
        cylinder(h=cm_coh_length + cm_thickness, r=cm_coh / 2 + cm_thickness * 2);

        // cylinder for the panel mount
        translate([cm_width / 2 - 50, cm_depth / 2, -0])
        rotate([0,  110, 0])
        cylinder(h = 100, r = cm_led_mount / 2);

        //Box for the the panel mount
        translate([40, cm_depth / 2 - cm_led_mount / 2, -cm_led_mount])
        cube([50, cm_led_mount, cm_led_mount]);
    }
    
    // The inner range of the box
    translate([cm_thickness, cm_thickness, cm_thickness])
    cube([cm_width, cm_depth, cm_height + cm_thickness + 1]);

    // The cable outlet hole
    translate([-cm_coh_length - 1, cm_depth / 2 + cm_thickness, cm_height / 2 + cm_thickness])
    rotate([0, 90, 0])
    cylinder(h = cm_coh_length + cm_thickness + 2, r = cm_coh / 2);
}
