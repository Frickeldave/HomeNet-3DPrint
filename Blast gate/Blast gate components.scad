// pd = pipe-diameter
// pt = pipe-thickness
// bpt = base-plate-thickness
// dsh = draw-switch-holder
module blast_gate_body_v2(pd, pt, bpt, dsh) {
    
    ph = 45;               // ph = pipe-height; Is statically set, because 45mm is a good value in every case.
    por = pd / 2 - 0.1;    // por = pipe-outer-radius; The outer radius is 0.1 smaller than the pipe radius.
    difference() {
        
        union() {
            // Connection plug outer
            color("green")
            translate([0, 0, bpt])
            cylinder(h = ph, r = por);

            // The base plate
            cylinder(h = bpt, r = pd / 2 + 30);

            // The switch holder
            if(dsh == 1)
                translate([36,0,13])
                rotate([0,0,90])
                blast_gate_switch_holder(20, 30, 11.5);
        }

        // Connection plug inner
        color("red")
        translate([0, 0, -1])
        cylinder(h = ph + bpt + 2, r = por - pt);

        // Screw hole front left
        color("red")
        translate([por, -por - 10, -1])
        cylinder(h = bpt + 2, r = 2.5);

        // Screw hole front right
        color("red")
        translate([-por, -por - 10, -1])
        cylinder(h = bpt + 2, r = 2.5);

        // Screw hole back right
        color("red")
        translate([por, por + 10, -1])
        cylinder(h = bpt + 2, r = 2.5);

        // Screw hole back left
        color("red")
        translate([-por, por + 10, -1])
        cylinder(h = bpt + 2, r = 2.5);
    }
}

// pd = pipe-diameter
// pt = pipe-thickness
// bpt = base-plate-thickness
// st = slider-thickness
module blast_gate_body_with_excerpt_v2(pd, pt, bpt, st, dsh) {

    por = pd / 2 - 0.1;    // por = pipe-outer-radius; The outer radius is 0.1 smaller than the pipe radius.
    sw = pd + 10;      // sw = slider-width
    
    difference() {

        blast_gate_body_v2(pd, pt, bpt + st, dsh);
        
        //Slider excerpt
        color("red")
        translate([0, 0, + 1])
        cube([sw + 100, sw, st + 1], center=true);
    }
}

// pd = pipe-diameter
// l = length of slider             Recommended: 175
// t = thickness                    Recommended: 4
// sp = switch plate
module blast_gate_slider_v2(pd, l, t, sp) {

    // Create the final width
    fsw = pd + 10 - 0.2;   //final-slider-width

    difference() {
        union() {
            // the main plate, with the complete high (of which only the stop remains on the top) 
            cube([l, fsw, t], center=true);

            //handle left
            translate([-l/2, 0, 0])
            blast_gate_slider_handle_v2(pd, fsw, t);
    
            //handle right
            translate([l/2, 0, 0])
            rotate([0, 0, 180])
            blast_gate_slider_handle_v2(pd, fsw, t);

            // The switch holder
            if(sp == 1)
                translate([l / 2 - 4, 0, 13])
                cube([12,24,15.5], center = true);
        }

        // The hole
        translate([-22, 0, - t / 2 -1])
        cylinder(h = t + 2, r = pd / 2 - t);
    }
}

module blast_gate_slider_handle_v2(pd, w, t) {
    
    difference() {

        union() {
            color("pink")
            cube([t, w, t*5], center=true);

            color("red")
            translate([15, 0, t])
            cube([30, w, t], center=true);
        }
        translate([pd + 15, 0, t/2])
        cylinder(h=t + 1, r=pd / 2 + 30);
    }
}

module blast_gate_switch_holder(sw, sd, sh) {
    difference() {
        cube([sw + 4, sd + 4, sh + 4], center=true);
        
        color("red")
        translate([0, 0, 0])
        cube([sw, sd + 6, sh], center=true);

        color("red")
        translate([sw /2 -1,0 ,0])
        rotate([0, 90, 0])
        cylinder(h = 4, r = 2);
    }
}