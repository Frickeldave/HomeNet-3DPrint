$fn=20;

//module drawer(wb_width, wb_depth, wb_height, wb_thickness) {


module drawer(drawer_width, drawer_depth, drawer_height, wb_thickness) {

    difference() {
        union() {

            // Create the drawer corpus by differencing one cube from another
            difference() {

                cube([drawer_width, drawer_depth, drawer_height]);

                translate([wb_thickness, wb_thickness, wb_thickness])
                cube([drawer_width - wb_thickness * 2,drawer_depth - wb_thickness * 2, drawer_height]);
            }

            // Reinforce the bottom
            cube([drawer_width, drawer_depth, wb_thickness * 2]);
        }

        // Lowering the running rail left
        color("red")
        translate([-1, wb_thickness, -1])
        cube([6.5, drawer_depth - wb_thickness + 1, wb_thickness + 1]);

        // Lowering the running rail right
        color("red")
        translate([drawer_width - 5.5, wb_thickness, -1])
        cube([6.5, drawer_depth - wb_thickness + 1, wb_thickness + 1]);

        // Create the insert for the label
        color("red")
        translate([drawer_width - 38 -10, -0.8, drawer_height / 2 - 3])
        // Labels are 37mmx5mm
        cube([38, 1, 6]);

        // Drill the hole for the knob
        color("red")
        translate([7.5,wb_thickness + 1, drawer_height / 2])
        rotate([90,0,0])
        cylinder(h= wb_thickness + 2, r=1);

    }

    holder_distance_third=(drawer_depth-wb_thickness-wb_thickness)/3;
    holder_distance_half=(drawer_depth-wb_thickness-wb_thickness)/2;

    // Create the holder at the bottom
    color("white")
    translate([wb_thickness, holder_distance_third - wb_thickness - 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([wb_thickness, holder_distance_third + wb_thickness + 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([drawer_width - wb_thickness * 2, holder_distance_third - wb_thickness - 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([drawer_width - wb_thickness * 2, holder_distance_third + wb_thickness + 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    // Create the holder at the top
    color("white")
    translate([wb_thickness, holder_distance_third * 2 - wb_thickness - 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([wb_thickness, holder_distance_third * 2 + wb_thickness + 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([drawer_width - wb_thickness * 2, holder_distance_third * 2 - wb_thickness - 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([drawer_width - wb_thickness * 2, holder_distance_third * 2 + wb_thickness + 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);


    // Create the holder in the middle
    color("white")
    translate([wb_thickness, holder_distance_half - wb_thickness - 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([wb_thickness, holder_distance_half + wb_thickness + 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([drawer_width - wb_thickness * 2, holder_distance_half - wb_thickness - 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);

    color("white")
    translate([drawer_width - wb_thickness * 2, holder_distance_half + wb_thickness + 0.1, wb_thickness])
    cube([wb_thickness, wb_thickness, drawer_height - wb_thickness]);
}