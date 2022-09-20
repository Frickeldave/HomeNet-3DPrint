$fn=400;

module blast_gate_body() {
        
    difference() {
        
        union() {
            // Main plate
            cylinder(h=5,r=50);

            // Connection plug
            color("green")
            translate([0,0,5])
            cylinder(h=35,r=27);
        }

        // Connection plug
        translate([0,0,0])
        cylinder(h=41,r=25);

        // Slider excerpt
        color("red")
        translate([-50,-30,-2])
        cube([100,60,5]);

        // Screw holes 
        color("red")
        translate([20,37,-1])
        cylinder(h=7,r=2.5);

        color("red")
        translate([-20,37,-1])
        cylinder(h=7,r=2.5);

        color("red")
        translate([-20,-37,-1])
        cylinder(h=7,r=2.5);

        color("red")
        translate([20,-37,-1])
        cylinder(h=7,r=2.5);
    }
}

