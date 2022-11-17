use <hex_grid/hex_grid.scad>;

$fn=400;

union() {
    cube([80, 2, 40]);
    
    color("red")
    translate([15,2,0])
    rotate([0,0,90])
    cube([20, 2, 22]);
    
    color("green")
    translate([67,2,0])
    rotate([0,0,90])
    cube([20, 2, 22]);
    
    color("black")
    translate([0,20,0])
    cube([13, 2, 22]);
    
    color("grey")
    translate([67,20,0])
    cube([13, 2, 22]);
    
}