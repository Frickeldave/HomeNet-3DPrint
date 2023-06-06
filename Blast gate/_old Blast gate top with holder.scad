$fn=400;

bg_holder_width = 80;  // Optimum sizes: HT50 = 80
bg_holder_height = 30;  // Recommended: 30; Minimum: 22
bg_holder_rad = 27.4; // Optimum sizes: HT50 = 27.4
bg_holder_plug_high = 35; // Recommended: 35
use <./Blast gate body.scad>
use <./Blast gate holder.scad>

difference() {
    // Draw the blast gate korpus
    blast_gate_body(bg_holder_rad, bg_holder_plug_high);

    // Remove the protruding rounding
    bg_pr_width = bg_holder_width > 64  ? bg_holder_width : 65;
    color("red")
    translate([-bg_pr_width/2 + 10, -52, -1])
    cube([bg_pr_width - 20,10,9]);  


 
} 

// Create an additional reinforcement
translate([-1.5, -42, 5])
cube([3, 16, bg_holder_height - 5]);

blast_gate_holder(bg_holder_width, bg_holder_height);

// Create a small stopper, to prevent the tube from slipping through
difference() {

    color("cyan")
    translate([0,0,3])
    cylinder(h=2,r=bg_holder_rad);

    color("red")
    translate([0,0,2])
    cylinder(h=4,r=bg_holder_rad - 3.5);

}