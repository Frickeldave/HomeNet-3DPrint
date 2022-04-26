use <hex_grid/hex_grid.scad>;

$fn=400;
plate_thickness=5;
gate_base_plate_height=plate_thickness;
gate_base_plate_size_x=21;
gate_base_plate_size_y=20;
gate_base_plate=[gate_base_plate_size_y,gate_base_plate_size_x,gate_base_plate_height];

gate_side_plate_height=plate_thickness;
gate_side_plate_size_x=20+plate_thickness;
gate_side_plate_size_y=20;
gate_side_plate=[gate_side_plate_size_y,gate_side_plate_size_x,gate_side_plate_height];

gate_holder_plate_height=plate_thickness;
gate_holder_plate_size_x=gate_base_plate_size_y;
gate_holder_plate_size_y=10;
gate_holder_plate=[gate_holder_plate_size_y,gate_holder_plate_size_x,gate_holder_plate_height];
gate_holder_space=5;

union() {
    
    cube(gate_base_plate);
    
    rotate([90,0,0])
    translate([0, -gate_side_plate_size_y, 0])
    color("red")
    cube(gate_side_plate);

    rotate([90,0,0])
    translate([0, -gate_side_plate_size_y, - (gate_base_plate_size_x + plate_thickness)])
    color("green")
    cube(gate_side_plate);
    
    color("black")
    rotate([90,90,0])
    translate([- (gate_holder_plate_size_y + plate_thickness), 0, -(gate_base_plate_size_x/2 - plate_thickness/2)])
    cube(gate_holder_plate);
    
    color("grey")
    rotate([90,90,0])
    translate([-gate_holder_plate_size_x+5, 0, -(gate_base_plate_size_x/2 + plate_thickness + plate_thickness/2)])
    cube(gate_holder_plate);
}