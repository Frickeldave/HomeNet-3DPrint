$fn = 100; 

t = 5;      // thickness
hb = 0;    // bottom-segment
db = 120;   // inner-diameter-bottom
shfm = 52; // screw-hole from middle
md = 6; // Magnet diameter
mt = 3; // Magnet thickness
mc = 8; // Magnet count
mfm = 66; // magnet from middle


// Base plate 
difference() {
    
    // The plate
    translate([0, 0, t / 2])
    cube([db + t + 20, db + t + 20, t], center = true);
    
    // Cutout
    translate([0, 0, -1])
    cylinder(h = t + 2 , r = db / 2);
    

    // Screw-hole top right
    color("red")
    translate([shfm, shfm, -1])
    union() {
        cylinder(h = t + 2, r = 2);
        translate([0, 0, 2])
        cylinder(h = t, r = 4);
    }

    // Screw-hole bottom right
    color("red")
    translate([shfm, -shfm, -1])
    union() {
        cylinder(h = t + 2, r = 2);
        translate([0, 0, 2])
        cylinder(h = t, r = 4);
    }

    // Screw-hole top left
    color("red")
    translate([-shfm, shfm, -1])
    union() {
        cylinder(h = t + 2, r = 2);
        translate([0, 0, 2])
        cylinder(h = t, r = 4);
    }

    // Screw-hole bottom left
    color("red")
    translate([-shfm, -shfm, -1])
    union() {
        cylinder(h = t + 2, r = 2);
        translate([0, 0, 2])
        cylinder(h = t, r = 4);
    }

    // Draw the holes for the magnets
    color("pink")
    for ( i = [1: 360/mc :360])
        rotate(i, [0 ,0 , 1])
        translate([mfm, 0, t - mt]) 
        cylinder(h=mt + 1, r=md/2);

}
  