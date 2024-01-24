// pd = pipe-diameter
// pt = pipe-thickness
// bpt = base-plate-thickness
module blast_gate_body_v2(pd, pt, bpt) {
    
    ph = 45;               // ph = pipe-height; Is statically set, because 45mm is a good value in every case.
    por = pd / 2 - 0.1;    // por = pipe-outer-radius; The outer radius is 0.1 smaller than the pipe radius.
    difference() {
        
        union() {
            // Connection plug outer
            color("green")
            translate([0, 0, bpt])
            cylinder(h = ph, r = por);

            translate([0, 0, ph + bpt])
            cylinder(h=4, r1 = por, r2 = por -2);

            // The base plate
            cylinder(h = bpt, r = pd / 2 + 30);
        }

        // Connection plug inner
        color("red")
        translate([0, 0, -1])
        cylinder(h = ph + bpt + 10, r = por - pt);

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
// dsh = draw-switch-holder
module blast_gate_body_with_excerpt_v2(pd, pt, bpt, st) {

    por = pd / 2 - 0.1;    // por = pipe-outer-radius; The outer radius is 0.1 smaller than the pipe radius.
    sw = pd + 10 + 1;      // sw = slider-width
    
    difference() {

        blast_gate_body_v2(pd, pt, bpt + st);
        
        //Slider excerpt
        color("red")
        translate([0, 0, st / 2 - 0.5])
        cube([pd + 30 + 100, sw, st + 1], center=true);
    }
}

// pd = pipe-diameter
// l = length of slider             Recommended: 175
// t = thickness                    Recommended: 4
// sp = switch plate
module blast_gate_slider_v2(pd, l, t, sp) {

    // Create the final width
    sw = pd + 10;   //final-slider-width

    difference() {
        union() {
            // the main plate, with the complete high (of which only the stop remains on the top) 
            cube([l, sw, t], center=true);

            //handle left
            translate([-l/2, 0, 0])
            blast_gate_slider_handle_v2(pd, sw, t);
    
            //handle right
            translate([l/2, 0, 0])
            rotate([0, 0, 180])
            blast_gate_slider_handle_v2(pd, sw, t, sp);
        }

        // The hole
        translate([22, 0, - t / 2 -1])
        cylinder(h = t + 2, r = pd / 2 - t);
    }
}

module blast_gate_slider_handle_v2(pd, w, t, sp) {
    
    difference() {

        union() {
            color("pink")
            translate([0,0,t*2])
            cube([t, w, t*5], center=true);

            color("red")
            translate([15, 0, t])
            cube([30, w, t], center=true);

            // The switch bumper
            if(sp == 1)
                translate([15, 0, t*3])
                cube([30,25,t*3], center = true);
        }
        translate([pd + 15, 0, t/2])
        cylinder(h=t*4 + 1, r=pd / 2 + 30);
    }
}

// sw = switch-width        Recommended: 20
// pd = pipe-diameter       Recommended: 50 
// sh = switch-height       Recommended: 6.5
// st = switch-thickness    Recommended: 2
// sr = switch-reduction    Recommended: 5
module blast_gate_switch_holder(sw, pd, sh, st, sr) {

    // Base plate radius
    bpr = (pd / 2 + 30); 

    // Switch depth
    sd = bpr - pd / 2;
    
    
    difference() {

        // Outer cube
        translate([-(sw + st*2)/2, 0, 0])
        cube([sw + st*2, sd + pd - sr, sh + st * 2]);
        
        //Inner cube
        color("red")
        translate([-sw/2, -1 , -1])
        cube([sw, sd + pd - sr, sh + st + 1]);

        // cut other round
        excerpt_height = sh + st * 2 + 2;
        color("red")
        translate([0, bpr, -1])
        difference() {
            cylinder(h = excerpt_height, r = bpr+200);
            translate([0, 0, -1])
            cylinder(h = excerpt_height + 2, r = bpr);
        }

        //cut inner round
        color("red")
        translate([0, pd + sd - sr, -1])
        cylinder(h = excerpt_height + 2, r = pd);

        //hole for the cable
        color("red")
        translate([sw /2 -1, sd - sr  -5 ,5])
        rotate([0, 90, 0])
        cylinder(h = st + 2, r = 2);

    }


}
