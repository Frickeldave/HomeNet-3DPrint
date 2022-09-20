$fn=400;


difference() {
    
    union() {
        // inner ring
        color("green")
        cylinder(h=7,r=33.5);
        // cover
        translate([0,0,5])
        cylinder(h = 2, r1 = 40, r2 = 36);
        //cylinder(h=2,r=40);
    }

    //excerpt
    color("red")
    translate([0,0,-1])
    cylinder(h=9,r=32.5);
}

difference() {
    // inner holder
    color("blue")
    cylinder(h = 2, r = 32.5);

        // inner holder
    color("red")
    translate([0,0,-1])
    cylinder(h = 4, r = 30.5);
}