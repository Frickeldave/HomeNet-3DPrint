$fn = 50;

// The inner size of the box
cm_width = 190;
cm_depth = 60;
cm_height = 60;
cm_thickness = 2;
cm_coh = 28.1; // The cable outlet hole
cm_coh_length = 10;
cm_led_mount = 17;


// st = Stick thickness;
// md = Mount depth; 
// mw = Mount width;
module panel_mount(st, md, mw) {
    difference() {
        
        union() {
            // Reinforcement cylinder for the panel mount
            translate([0, , -0])
            rotate([0,  90, 0])
            cylinder(h = mw, r = st);

            // cylinder for the panel mount
            translate([0, 0, -0])
            rotate([0,  110, 0])
            cylinder(h = 130, r = st / 2);
        }
        
        color("red")
        translate([-1, - st * 2 / 2 - 1, 0])
        cube([mw + 2, st * 2 + 2, st + 2]);

        //d = a * sqrt( 2 )
        // Bevel for the reinforcement cylinder for the panel mount
        color("red")
        translate([-(md * sqrt(2)) / 2, -(md * sqrt(2)) / 2, -(md * sqrt(2)) / 2])
        rotate([0,  45, 0])
        cube([md, md, md]);   

    }
}

difference() {
    
    union() {
        // The box
        cube([cm_width + cm_thickness * 2, cm_depth + cm_thickness * 2, cm_height + cm_thickness * 2]);

        // The outer ring of cable outlot hole
        translate([-cm_coh_length, cm_depth / 2 + cm_thickness, cm_height / 2 + cm_thickness])
        rotate([0,  90, 0])
        cylinder(h=cm_coh_length + cm_thickness, r=cm_coh / 2 + cm_thickness * 2);

        translate([0, cm_depth / 2 + cm_thickness, 0])
        panel_mount(cm_led_mount, cm_depth, 70);
    }
    
    // The inner range of the box
    translate([cm_thickness, cm_thickness, cm_thickness])
    cube([cm_width, cm_depth, cm_height + cm_thickness + 1]);

    // The cable outlet hole
    translate([-cm_coh_length - 1, cm_depth / 2 + cm_thickness, cm_height / 2 + cm_thickness])
    rotate([0, 90, 0])
    cylinder(h = cm_coh_length + cm_thickness + 2, r = cm_coh / 2);

    // The screw holes for the mounting screws (front left)
    color("red")
    translate([cm_thickness + 5, 1 + cm_thickness, cm_height - 5])
    rotate([90, 0, 0])
    cylinder(h = cm_thickness * 2, r = 2);

    // The screw holes for the mounting screws (front middle)
    color("red")
    translate([cm_width /2, 1 + cm_thickness, cm_height - 5])
    rotate([90, 0, 0])
    cylinder(h = cm_thickness * 2, r = 2);

    // The screw holes for the mounting screws (front right)
    color("red")
    translate([cm_width - cm_thickness - 5, 1 + cm_thickness, cm_height - 5])
    rotate([90, 0, 0])
    cylinder(h = cm_thickness * 2, r = 2);

    // The screw holes for the mounting screws (rear left)
    color("red")
    translate([cm_thickness + 5, cm_depth + 1 + cm_thickness * 2, cm_height - 5])
    rotate([90, 0, 0])
    cylinder(h = cm_thickness * 2, r = 2);

    // The screw holes for the mounting screws (rear middle)
    color("red")
    translate([cm_width /2, cm_depth + 1 + cm_thickness * 2, cm_height - 5])
    rotate([90, 0, 0])
    cylinder(h = cm_thickness * 2, r = 2);

    // The screw holes for the mounting screws (rear right)
    color("red")
    translate([cm_width - cm_thickness - 5, cm_depth + 1 + cm_thickness * 2, cm_height - 5])
    rotate([90, 0, 0])
    cylinder(h = cm_thickness * 2, r = 2);

}
