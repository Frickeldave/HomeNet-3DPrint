$fn=400;

bg_holder_width = 80;  // Optimum sizes: HT50 = 80
bg_holder_height = 30;  // Recommended: 30; Minimum: 22
bg_holder_rad = 24.9; // Optimum sizes: HT50 = 24.9
bg_holder_plug_high = 45; // Recommended: 45

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

// Create a chamfer so that the tube can be put over better
difference() {
    color("grey")
    translate([0, 0, bg_holder_plug_high + 5])
    cylinder(5 ,bg_holder_rad, bg_holder_rad -2);

    color("red")
    translate([0, 0, bg_holder_plug_high + 4])
    cylinder(7 ,bg_holder_rad - 2, bg_holder_rad -2);
}

// Create an additional reinforcement
translate([-1.5, -42, 5])
cube([3, 18, bg_holder_height - 5]);

blast_gate_holder(bg_holder_width, bg_holder_height);

