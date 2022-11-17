//https://www.thingiverse.com/thing:1296149/files
use <./../modules/hex_grid_v02.scad>;

$fn=100;
gate_thickness=4.5;
grid_thickness=2.5;
gate_width=200;
gate_height=50;




union() {

    rotate([90,0,0])
    translate([3.5, 3, -2.5])
    color("white")
    hexgrid([180, 34, 2.5], 13, 2.5);
    
    difference() {
        
        cube([196,4.5, 50]);
        
        color("red")
        translate([4.5, -1, 9.5])
        cube([186, 6.5, 50-15]);
    }
    
}