use <hex_grid/hex_grid.scad>;

$fn=100;
gate_thickness=4.5;
grid_thickness=2.5;
gate_width=200;
gate_height=50;

union() {

    rotate([90,0,0])
    translate([3.5, 3, -2.5])
    hexgrid([185, 34, 2.5], 13, 2.5);
    
    difference() {
        
        cube([200,4.5, 50]);
        
        color("red")
        translate([4.5, -1, 9.5])
        cube([200 - 10, 6.5, 50-15]);
    }
    
}