//https://openscad-meistern.de/buch/

//https://github.com/brodykenrick/text_on_OpenSCAD/
use <text_on/text_on.scad>

$fn=400;
gate_base_plate_height=5;
gate_base_plate_size=15;
gate_base_plate=[gate_base_plate_size,gate_base_plate_size,gate_base_plate_height];
gate_wide=100;
plug_height=10;
plug_rad=2.5;
archway_depth=5;
archway_thickness=5;
archway_outer_rad=gate_wide/2 - gate_base_plate_size/2 + archway_thickness;

// Create the left base plate and plug
union() {
    translate([gate_base_plate_size/2, gate_base_plate_size/2, -plug_height])
    cylinder(plug_height, plug_rad, plug_rad);
    
    translate([0,0,0])
    color("green")
    cube(gate_base_plate);
}

// Create the right base plate and plug
union() {
    translate([gate_wide-gate_base_plate_size/2, gate_base_plate_size/2, -plug_height])
    cylinder(plug_height, plug_rad, plug_rad);
    
    translate([gate_wide-gate_base_plate_size,0,0])
    color("green")
    cube(gate_base_plate);
}


// Create the archway
difference() {
    //Outer radius of archway
    rotate([90,0,0])
    translate([gate_wide/2,-10,-gate_base_plate_size/2-archway_depth/2])
    cylinder(archway_depth, archway_outer_rad, archway_outer_rad);

    //Inner radius of archway
    rotate([90,0,0])
    translate([gate_wide/2,-10,-gate_base_plate_size/2-archway_depth/2-1])
    cylinder(archway_depth+2, archway_outer_rad-archway_thickness*2, archway_outer_rad-archway_thickness*2);

    // bisect archway
    archway_bisect_cube=[gate_wide, archway_depth+2, gate_wide/2+10];
    color("red")
    translate([0, gate_base_plate_size/2-archway_depth/2-1 , -gate_wide/2-10])
    cube(archway_bisect_cube);
}

rotate([90,0,0])
translate([gate_wide/2,-11,-gate_base_plate_size/2+2.5])
color("blue")
text_on_circle(t="Le passe trappe",r=43,font="ScriptMTBold",size=9,spacing=0.9, rotate=1);


