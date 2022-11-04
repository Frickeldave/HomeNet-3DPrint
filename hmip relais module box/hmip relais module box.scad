$fn=400;

rmb_width = 140;
rmb_depth = 65;
rmb_height = 50;
rmb_material_thickness = 1.5;
rmb_cable_entry_width = 124;
rmb_cable_entry_height = 8;
rmb_relaisboard_hole_spacing_x = 129;
rmb_relaisboard_hole_spacing_y = 47;

rmb_hmip_distance = 25; // the distance between relais board and hmip board. Please add 5mm, because of the board holder that are set statically to 5mm.
rmb_hmip_board_width = 80; 

module board_holder(height, holder_diameter, screw_diameter) {
    difference() {
        cylinder(h=height, r=(holder_diameter / 2));
        translate([0, 0, -1])
        cylinder(h=height + 2, r=(screw_diameter / 2));
    }
}

module insertion(insertion_width, insertion_depth, insertion_high, insertion_material_thickness) {

    color("lightgrey")
    cube([insertion_material_thickness, insertion_depth, insertion_high]);
    
    color("grey")
    translate([insertion_material_thickness, insertion_depth - insertion_material_thickness, 0])
    cube([insertion_material_thickness * 2, insertion_material_thickness, insertion_high]);

    color("lightgrey")
    translate([insertion_width - insertion_material_thickness, 0, 0])
    cube([insertion_material_thickness, insertion_depth, insertion_high]);

    color("grey")
    translate([insertion_width - insertion_material_thickness * 3, insertion_depth - insertion_material_thickness, 0])
    cube([insertion_material_thickness * 2, insertion_material_thickness, insertion_high]);

}

// This is an rail clip on the backside of the box. 
module rail_clip(wall_thickness, width) {

    cube([width, wall_thickness, 45]);

    difference() {
        color("green")
        translate([0,wall_thickness,42])
        cube([width,7,3]);

        color("red")
        translate([-1, 6.4, 42])
        rotate([0,90,0])
        cylinder(h=width + 2, r=1);
    }

    difference() {
        union() {
            color("green")
            translate([0,wall_thickness,6.3])
            cube([width,5,2]);

            color("green")
            translate([0, wall_thickness + 5, 0])
            cube([width, 2, 8.3]);
        }

        color("red")
        translate([-1, 6.4, 8.3])
        rotate([0,90,0])
        cylinder(h=width + 2, r=1);
    }
}


//Box
difference() {
    
    // Draw the box
    cube([rmb_width, rmb_depth, rmb_height]);
    
    // Cut out the inner box
    color("red")
    translate([rmb_material_thickness, rmb_material_thickness, rmb_material_thickness])
    cube([rmb_width - rmb_material_thickness * 2, rmb_depth - rmb_material_thickness * 2, rmb_height]);

    // Cut out the cable gland
    color("red")
    translate([(rmb_width - rmb_cable_entry_width) / 2, -1, rmb_material_thickness + 5])
    cube([rmb_cable_entry_width, rmb_material_thickness + 2, rmb_cable_entry_height]);

    // Cut out the usb cable hole
    color("red")
    translate([-1, rmb_depth / 2, rmb_height / 2])
    rotate([0,90,0])
    cylinder(h=rmb_material_thickness + 2, r = 2.5);

    // Cut out holes for the lid clips
    //Front left
    color("red")
    translate([10, -1, rmb_height - 15])
    cube([10, rmb_material_thickness + 2, 10]);

    // Front right
    color("red")
    translate([rmb_width -20, -1, rmb_height - 15])
    cube([10, rmb_material_thickness + 2, 10]);

    // Back left
    color("red")
    translate([10, rmb_depth - rmb_material_thickness - 1, rmb_height - 15])
    cube([10, rmb_material_thickness + 2, 10]);

    // Back right
    color("red")
    translate([rmb_width -20, rmb_depth - rmb_material_thickness - 1, rmb_height - 15])
    cube([10, rmb_material_thickness + 2, 10]);
}

// Add a rail clip to the backside of the box
translate([25, rmb_depth - rmb_material_thickness, 0])
rail_clip(rmb_material_thickness, 15);

translate([rmb_width - 40, rmb_depth - rmb_material_thickness, 0])
rail_clip(rmb_material_thickness, 15);


// board holder bottom left
translate([(rmb_width - rmb_relaisboard_hole_spacing_x) / 2, (rmb_depth - rmb_relaisboard_hole_spacing_y) / 2, rmb_material_thickness])
board_holder(5, 5, 2);

// board holder bottom right
translate([rmb_width - ((rmb_width - rmb_relaisboard_hole_spacing_x) / 2), (rmb_depth - rmb_relaisboard_hole_spacing_y) / 2, rmb_material_thickness])
board_holder(5, 5, 2);

// board holder bottom top left
translate([(rmb_width - rmb_relaisboard_hole_spacing_x) / 2, rmb_depth - ((rmb_depth - rmb_relaisboard_hole_spacing_y) / 2), rmb_material_thickness])
board_holder(5, 5, 2);

// board holder bottom top right
translate([rmb_width - ((rmb_width - rmb_relaisboard_hole_spacing_x) / 2), rmb_depth - ((rmb_depth - rmb_relaisboard_hole_spacing_y) / 2), rmb_material_thickness])
board_holder(5, 5, 2);


// Draw insertions
rmb_insertion_width = 15.2;
rmb_insertion_depth = 3.2;
rmb_left_insertion_x = 30;
rmb_right_insertion_x = rmb_left_insertion_x + rmb_hmip_board_width - rmb_insertion_width;

// Top left
translate([rmb_left_insertion_x + rmb_insertion_width, rmb_depth - rmb_material_thickness, rmb_material_thickness])
rotate([0,0,180])
insertion(rmb_insertion_width, rmb_insertion_depth, rmb_hmip_distance, rmb_material_thickness);

// Bottom right
translate([rmb_right_insertion_x + rmb_insertion_width, rmb_depth - rmb_material_thickness, rmb_material_thickness])
rotate([0,0,180])
insertion(rmb_insertion_width, rmb_insertion_depth, rmb_hmip_distance, rmb_material_thickness);

// Create the support surface
color("grey")
rotate([0,90,0])
translate([- rmb_hmip_distance - rmb_material_thickness, rmb_material_thickness, rmb_left_insertion_x])
linear_extrude(height=rmb_hmip_board_width)
polygon(points = [[0, 0], [5, 0], [0, 3]]);