$fn=400;



module blast_gate_holder(bg_holder_width, bg_holder_heigth) {

    difference() {

        union() {
            // The wall plate
            color("green")
            translate([-bg_holder_width/2, -45, 0])
            cube([bg_holder_width,3,bg_holder_heigth]);

            // Connecting piece to base plate
            color("cyan")
            translate([-bg_holder_width/2, -42, 0])
            cube([bg_holder_width,12,5]);

        }
        
        color("red")
        translate([-25, -42, -1])
        cube([50,10,9]);

        // color("red")
        // translate([-bg_holder_width/2 + 15, -42, -1])
        // cube([bg_holder_width - 30,10,9]);

        // Screw holes 
        color("red")
        translate([-bg_holder_width / 2 + 7,-41,17.5])
        rotate([90,0,0])
        cylinder(h=5,r=2);

        color("red")
        translate([+bg_holder_width / 2 - 7,-41,17.5])
        rotate([90,0,0])
        cylinder(h=5,r=2);

    }
}