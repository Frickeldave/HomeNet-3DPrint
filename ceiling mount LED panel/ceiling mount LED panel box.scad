$fn = 50;

// The inner size of the box
cm_width = 190; // Inner size of the box; width
cm_depth = 60; // Inner size of the box; depth
cm_height = 45; // Inner size of the box; height
cm_thickness = 4; // Material thickness
cm_coh_diameter = 28.1; // The diameter of the cable outlet hole
cm_coh_length = 10; // This is how long the outlet hole looks out of the housing
cm_coh_ceiling_distance = 15; // The distance of the outlet hole to the ceiling
cm_led_mount = 16; // The stick to which the LED panel is attached to.


// st = Stick thickness;
// md = Mount depth; 
// mw = Mount width;
module panel_mount(st, md, mw) {
    difference() {
        
        union() {
            // Reinforcement cylinder for the panel mount
            translate([0, , -0])
            rotate([0,  90, 0])
            cylinder(h = mw, r = md / 2);

            // stick for the panel mount
            translate([40, 0, -0])
            rotate([0,  140, 0])
            cylinder(h = 100, r = st / 2);
        }

        //d = a * sqrt( 2 )
        // Bevel for the reinforcement cylinder for the panel mount
        color("red")
        translate([-(md * sqrt(2)) / 2, -(md * sqrt(2)) / 2, -(md * sqrt(2)) / 2])
        rotate([0,  45, 0])
        cube([md, md * 2, md]);

        color("red")
        translate([mw / 2, 0, md / 4])
        cube([mw + 2, md + 2, md / 2 + 30], center=true);

        color("red")
        translate([mw / 2, 0, - md / 2 - 1])
        cylinder(h=40, r = 2.5);

    }
}

// w = inner width of the box
// d = inner depth of the box
// h = inner height of the box
// t = thickness of the material
// col = the length of the outlet hole
// cod = the distance to the top
module panel_box(w, d, h, t, col, codis, cohdia) {
    
    module box_reinforcement(w, d, h) {
        difference() {
            cube([w, d, h]);

            color("red")
            translate([-1, w, w])
            cube([w + 2, d - w * 2, h]);
        }
    }

    module box_cooling(w, d, h) {
        
        translate([0, d, h / 2])
        rotate([90, 0, 0])
        cylinder(h = d, r = h / 2);
        
        cube([w, d, h]);

        translate([w, d, h / 2])
        rotate([90, 0, 0])
        cylinder(h = d, r = h / 2);

    }

    difference() {
        
        union() {
            // The box
            cube([w + t * 2, d + t * 2, h + t * 2]);

            // The outer ring of cable outlet hole
            translate([-col, d / 2 + t, h - cohdia / 2 - codis + t])
            rotate([0,  90, 0])
            cylinder(h=col, r=cohdia / 2 + t * 2);

        }

        //Cut off the bottom edge of the outer ring so that we form a straight edge with the housing
        color("green")
        translate([-col - 1, 0, - t - 1])
        cube([col + 2 + 1, d + t * 2, t + 1]);
        
        // The inner range of the box
        translate([t, t, t])
        cube([w, d, h + t + 1]);

        //The cable outlet hole at the rear end
        translate([-col - 1, d / 2 + t,  h - cohdia / 2 - codis + t])
        rotate([0, 90, 0])
        cylinder(h = col + t + 2, r = cohdia / 2);

        // The screw holes for the mounting screws (front left)
        color("red")
        translate([t + 5, 1 + t, h - 5])
        rotate([90, 0, 0])
        cylinder(h = t * 2, r = 2);

        // The screw holes for the mounting screws (front middle)
        color("red")
        translate([w /2, 1 + t, h - 5])
        rotate([90, 0, 0])
        cylinder(h = t * 2, r = 2);

        // The screw holes for the mounting screws (front right)
        color("red")
        translate([w - t - 5, 1 + t, h - 5])
        rotate([90, 0, 0])
        cylinder(h = t * 2, r = 2);

        // The screw holes for the mounting screws (rear left)
        color("red")
        translate([t + 5, d + 1 + t * 2, h - 5])
        rotate([90, 0, 0])
        cylinder(h = t * 2, r = 2);

        // The screw holes for the mounting screws (rear middle)
        color("red")
        translate([w /2, d + 1 + t * 2, h - 5])
        rotate([90, 0, 0])
        cylinder(h = t * 2, r = 2);

        // The screw holes for the mounting screws (rear right)
        color("red")
        translate([w - t - 5, d + 1 + t * 2, h - 5])
        rotate([90, 0, 0])
        cylinder(h = t * 2, r = 2);

        // the hole for the LED panel power cable
        color("red")
        translate([w -20, d / 2, -1])
        cylinder(h = t + 2, r = 7.5);

        // cooling
        for(i = [0 : w / 5 : w]) {

            if(i < w) {
                color("red")
                translate([i + 8, -1, h - 15])
                box_cooling(w / 5 - 12, t + 2, 3);

                color("red")
                translate([i + 8, d + t -1, h - 15])
                box_cooling(w / 5 - 12, t + 2, 3);
            }
        }

        // Mount hole for the LED mount part
        color("red")
        translate([28.5, d / 2 + 2.0, -20])
        cylinder(h=40, r = 2.5);
    }

    // reinforcements
    for(i = [0 : w / 5 : w]) {
        color("cyan")
        translate([i + 1, t, t])
        box_reinforcement(2, d, h - 12);
    }

}

module panel_cover(w, d, h, t) {

    module clip(d) {

        difference() {
            union() {
                
                // The upper part of the clip (front)
                color("green")
                translate([0, 0, 0])
                cube([10, 4, 10]);

                // The lower round part of the clip (front)
                color("green")
                translate([5, 4, 0])
                rotate([90, 0, 0])
                cylinder(h = 4, r = 5);

                // The reinforcement
                color("green")
                translate([0, 4, 8])
                cube([10, d - 8, 2]);

                // The upper part of the clip (back)
                color("green")
                translate([0, d - 4, 0])
                cube([10, 4, 10]);

                // The lower round part of the clip (back)
                color("green")
                translate([5, d, 0])
                rotate([90, 0, 0])
                cylinder(h = 4, r = 5);
            }

            // The hole for the melting nut (front)
            color("red")
            translate([5, 5, 1])
            rotate([90, 0, 0])
            cylinder(h = 4 + 2, r = 2.5);

            // The hole for the melting nut (back)
            color("red")
            translate([5, d + 1, 1])
            rotate([90, 0, 0])
            cylinder(h = 4 + 2, r = 2.5);
        }
    }

    difference() {
        union() {
            // the cover
            color("blue")
            cube([w, d, t]);

            // The inner frame
            difference() {

                color("cyan")
                translate([t + 0.2, t + 0.2, - t + 2])
                cube([w - t * 2 - 0.4, d - t * 2 - 0.4, 2]);

                translate([t * 2 + 0.2, t * 2 + 0.2, - t +1])
                cube([w - t * 4 - 0.4, d - t * 4 - 0.4, 4]);
            }

            // clip left
            translate([t, t + 0.2, -10])
            clip(d - t * 2 - 0.4);

            // clip middle
            translate([w / 2 - 7, t + 0.2, -10])
            clip(d - t * 2 - 0.4);

            // clip right
            translate([w - 16, t + 0.2, -10])
            clip(d - t * 2 - 0.4);

            // Mount left
            color("cyan")
            translate([20, d / 2, -t +2])
            cylinder(h = 2, r = 5);

            // Mount right
            color("cyan")
            translate([w - 20, d / 2, -t + 2])
            cylinder(h = 2, r = 5);
        }

        // Mount left hole
        color("red")
        translate([20, d / 2, -t +1])
        cylinder(h = t + 2 + 2, r = 2);

        // Mount right hole
        color("red")
        translate([w - 20, d / 2, -t + 1])
        cylinder(h = t + 2 + 2, r = 2);



    }
}

// Draw the Panel mount
//translate([-10, cm_depth / 2 + cm_thickness, 15])
//panel_mount(cm_led_mount, cm_depth, 77);

// Draw the box
//panel_box(cm_width, cm_depth, cm_height, cm_thickness, cm_coh_length, cm_coh_ceiling_distance, cm_coh_diameter);

// Draw the cover
//translate([0, 0, cm_height + cm_thickness * 2])
panel_cover(cm_width + cm_thickness * 2, cm_depth + cm_thickness * 2, cm_height, cm_thickness); 