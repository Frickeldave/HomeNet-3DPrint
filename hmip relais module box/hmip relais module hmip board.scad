$fn=400;

rmc_material_thickness = 1.5;
rmc_insertion_width = 11.5;
rmc_insertion_thickness = 1.3;
rmc_hmip_distance = 25; // the distance between relais board and hmip board. Please add 5mm, because of the board holder that are set statically to 5mm.
rmc_hmip_boardholder_depth = 64.8 - rmc_material_thickness * 2; // The box has a width of 65
rmc_hmip_boardholder_width = 76;
rmc_hmip_board_depth = 30;
rmc_hmip_board_width = 70;

module board_holder(height, holder_diameter, screw_diameter) {
    difference() {
        cylinder(h=height, r=(holder_diameter / 2));
        translate([0, 0, -1])
        cylinder(h=height + 2, r=(screw_diameter / 2));
    }
}

// insertion left
translate([0, rmc_hmip_boardholder_depth - rmc_material_thickness,0])
cube([rmc_insertion_width, rmc_insertion_thickness, rmc_hmip_distance]);

// insertion right
translate([rmc_hmip_boardholder_width - rmc_insertion_width, rmc_hmip_boardholder_depth - rmc_material_thickness, 0])
cube([rmc_insertion_width, rmc_insertion_thickness, rmc_hmip_distance]);

// main plate
difference() {
    color("green")
    translate([0,0,rmc_hmip_distance])
    cube([rmc_hmip_boardholder_width, rmc_hmip_boardholder_depth, rmc_material_thickness]);

    // Cut out a hole for the cables
    color("red")
    translate([25, rmc_hmip_boardholder_depth - 15, rmc_hmip_distance - 1])
    cube([30, 16, rmc_material_thickness + 2]);
}

// Board holder (Hole spacing 65 x 25mm and 22m from the top because of the cables)

// Bottom left
translate([(rmc_hmip_boardholder_width -66) / 2, rmc_hmip_boardholder_depth - 22 - 25, rmc_hmip_distance + rmc_material_thickness])
board_holder(5, 5, 2);

// Bottom right 
translate([rmc_hmip_boardholder_width - ((rmc_hmip_boardholder_width -65) / 2), rmc_hmip_boardholder_depth - 22 - 25, rmc_hmip_distance + rmc_material_thickness])
board_holder(5, 5, 2);

// Top left
translate([(rmc_hmip_boardholder_width -66) / 2, rmc_hmip_boardholder_depth - 22, rmc_hmip_distance + rmc_material_thickness])
board_holder(5, 5, 2);

// Bottom right 
translate([rmc_hmip_boardholder_width - ((rmc_hmip_boardholder_width -65) / 2), rmc_hmip_boardholder_depth - 22, rmc_hmip_distance + rmc_material_thickness])
board_holder(5, 5, 2);


// color("blue")
// translate([0, rmc_hmip_boardholder_depth - 10, 0])
// cube([77,10,5]);


// // insertion left
// translate([0, rmc_hmip_boardholder_depth - rmc_material_thickness,0])
// cube([rmc_insertion_width, rmc_insertion_thickness, rmc_hmip_distance]);


// // main plate
// color("green")
// translate([0,0,rmc_hmip_distance])
// cube([rmc_insertion_width, rmc_hmip_boardholder_depth, rmc_material_thickness]);