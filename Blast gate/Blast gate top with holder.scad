$fn=400;

bg_holder_width = 75;

use <./Blast gate body.scad>

blast_gate_body();

color("green")
translate([-bg_holder_width/2, -45, 0])
cube([bg_holder_width,3,30]);

color("red")
translate([-bg_holder_width/2, -52, 0])
cube([bg_holder_width,7,7]);

color("cyan")
translate([-bg_holder_width/2, -52, 0])
cube([bg_holder_width,7,7]);