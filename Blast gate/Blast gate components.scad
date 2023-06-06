
// or = outer_radius                Recommended: 24.9 (for an HT50 pipe)
// ph = plug_high                   Recommended: 45

module blast_gate_body(or, ph, sw) {
        
    difference() {
        
        union() {
            // Main plate
            cylinder(h = 5, r = 50);

            // Connection plug
            color("green")
            translate([0, 0, 5])
            cylinder(h = ph, r = or);
        }

        // Connection plug
        translate([0, 0, 0])
        cylinder(h = ph + 6, r = or - 2);

        // Slider excerpt
        color("red")
        translate([-50, -30, -2])
        cube([100, 60, 5]);

        // Screw holes 
        color("red")
        translate([20, 37, -1])
        cylinder(h = 7, r = 2.5);

        color("red")
        translate([-20, 37, -1])
        cylinder(h = 7, r = 2.5);

        color("red")
        translate([-20, -37, -1])
        cylinder(h = 7, r = 2.5);

        color("red")
        translate([20, -37, -1])
        cylinder(h = 7, r = 2.5);
    }
}


// pd = pipe_diameter
// t = thickness

module blast_gate_body_v2(pd, t) {
    
    ph = 45;               // ph = pipe-height; Is statically set, because 45mm is a good value in every case.
    por = pd / 2 - 0.1;    // por = pipe-outer-radius; The outer radius is 0.1 smaller than the pipe radius.
    hor = por + 15;        // hor = holder-outer-radius; The outer radius of the holder
    sw = por * 2 + 10;     // sw = slider width

    difference() {
        
        union() {
            // Connection plug outer
            color("green")
            translate([0, 0, t + 2])
            cylinder(h = ph, r = por);

            // The base plate
            cylinder(h = t + 2, r = por + 15);
        }

        // Connection plug inner
        color("red")
        translate([0, 0, -1])
        cylinder(h = ph + t + 2 + 2, r = por - t);

        // Slider excerpt
        slider_width = por * 2 + 10;
        color("red")
        translate([-(slider_width), - (slider_width / 2), -t])
        cube([slider_width + hor + 1, slider_width, t + 1]);
    }
}

// t = thickness                    Recommended: 4.6
// mph = main plate height          Recommended: 2
// w = width of the slider          Recommended: 59.8
// l = length of slider             Recommended: 175
// hh = the height of the handle    Recommended: 10

module blast_gate_slider(w, l, t, mph, hh) {

    // Create the final thickness
    sft = t + mph;

    // Add the thickness of the main plate to the handle height
    hh = hh + t;
    
    difference() {
        union() {
            // handle left
            translate([0,0, - sft /2])
            rotate([0,0,90])
            cube([w, 3, hh]);

            // handle right
            translate([l + 3,0, - sft /2])
            rotate([0,0,90])
            cube([w, 3, hh]);

            // the main plate, with the complete high (of which only the stop remains on the top) 
            color("blue")
            translate([0, 0, 0 - sft/2])
            cube([l, w, sft]);
        }

        // Main plate excperts
        s_main_plate_excerpt_z = ((0 - sft)/2)+sft-mph;

        // Main plate excperts left
        color("red")
        translate([50+10, w/2, s_main_plate_excerpt_z])
        cylinder(h=mph+1,r=50);

        // Main plate excperts right
        color("red")
        translate([l-50-10, w/2, s_main_plate_excerpt_z])
        cylinder(h=mph+1,r=50);

        // Hole
        color("pink")
        translate([50+10, w/2, 0 - sft / 2 - 1])
        cylinder(h=sft+2, r=25);

    }
}

// w = width of the holder          Recommended: 80
// h = height of th holder          Recommended: 30

module blast_gate_holder(w, h) {

    difference() {

        union() {
            // The wall plate
            color("green")
            translate([-w / 2, -45, 0])
            cube([w, 3, h]);

            // Connecting piece to base plate
            color("cyan")
            translate([-w  /2, -42, 0])
            cube([w, 12, 5]);

        }
        
        color("red")
        translate([-25, -42, -1])
        cube([50, 10, 9]);

        // color("red")
        // translate([-w/2 + 15, -42, -1])
        // cube([w - 30,10,9]);

        // Screw holes 
        color("red")
        translate([-w / 2 + 7, -41, 17.5])
        rotate([90, 0, 0])
        cylinder(h = 5, r = 2);

        color("red")
        translate([+ w / 2 - 7, -41, 17.5])
        rotate([90, 0, 0])
        cylinder(h = 5, r = 2);
    }
}

//blast_gate_holder(80, 30);

// blast_gate_slider(59.8, 175, 4.6, 2, 10);

//blast_gate_body(24.9, 45);