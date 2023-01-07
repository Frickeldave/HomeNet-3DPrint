$fn=400;

use <./Pipe clamp mount single.scad>

translate([50,0,0])
rotate([0,0,90])
pipe_clamp();

translate([100,0,0])
rotate([0,0,90])
pipe_clamp();


