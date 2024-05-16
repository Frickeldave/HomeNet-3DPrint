$fn = 100;
px = 69; // plate x
py = 63.5; // plate y
t = 2.5; // material thickness
th = 30; // tube hight
aitr = 5; // air assist tube radius
ctr = 3; // cable tube radius
ctr_slot = 3; // slot size for cable
aitr_slot = 6; // slot size for air assist tube
fs = 58; // fan size

// The main plate
difference() {
    union() {

        difference() {
            // base plate
            cube([px, py, t]);

            // cutout for the fan
            dist = ((py - fs) / 2) + fs / 2;
            translate([dist, dist, -1])
            cylinder(h = t + 2, r = fs / 2);
        }

        // Add the air assist tube
        translate([74, 20, 0])
        rotate([0, 0, 180])
        air_assist_tube();

        // Add the cable tube
        translate([px - t - ctr, py / 2, 0])
        rotate([0, 0, -90])
        cable_tube();
    }

    // cutouts in plate for cable
    color("red")
    translate([px - t - ctr, py / 2, -t -1])
    cylinder(h = th + t + 1, r = ctr);

    color("red")
    translate([px - t -1, py / 2 - ctr_slot / 2, -1])
    cube([t + 2, ctr_slot, t + 2]); 


    // cutout for drill hole (bottom left)
    color("cyan")
    translate([6.5, 6.5, -3])
    screw_hole();

    // cutouts for drill hole  (bottom right)
    color("cyan")
    translate([57.5, 6.5, -3])
    screw_hole();

    // cutouts for drill hole  (top left)
    color("cyan")
    translate([6.5, py - 6.5, -3])
    screw_hole();

    // cutouts for drill hole (top right)
    color("cyan")
    translate([57.5, py - 6.5, -3])
    screw_hole();  
}  

// The holder for the air assist tube
module air_assist_tube() {
    difference() {
        cylinder(h = th, r = aitr + t);
        translate([0, 0, -1])
        cylinder(h = th + 2, r = aitr);

        color("red")
        translate([-aitr_slot/2, aitr_slot/2, -1])
        cube([aitr_slot, 5, th + 2]); 
    } 
}

// the holder for the cable
module cable_tube() {
    difference() {
        cylinder(h = th, r = ctr + t);
        translate([0, 0, -1])
        cylinder(h = th + 2, r = ctr);

        color("red")
        translate([-ctr_slot/2, ctr_slot/2, -1])
        cube([ctr_slot, 5, th + 2]); 
    } 
}


module screw_hole() {
    union() {
    translate([0, 0, t+1])
    cylinder(h = 2.1, r1 = 1.6, r2 = 2.5);
    cylinder(h = t + 1, r = 1.6);
    }
}