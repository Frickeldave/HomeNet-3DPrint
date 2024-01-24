$fn = 100;

use <./Blast gate components.scad>

// Body with pipe_diameter of 50, pipe thickness of 4, a base plate thickness of 4 and an excerpt of 4 mm
// translate([0,0,10])
// blast_gate_body_with_excerpt_v2(50, 4, 4, 4);

// slider
// translate([-22, 0, 0])
// color("lightblue")
// blast_gate_slider_v2(50, 175, 4, 1);

//Body with pipe_diameter of 50, pipe thickness of 4 and base plate thickness of 4 mm
// translate([0,0,-10])
// rotate([180, 0, 0])
// blast_gate_body_v2(50, 4, 4);

// The holder for the switch
blast_gate_switch_holder(20, 50, 6.5, 2, 10); 