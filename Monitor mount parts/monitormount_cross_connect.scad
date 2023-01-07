$fn=200;
mm_pipe_diameter=21.5; // Use the real measure of your pipe here. One size will be reduced by "mm_pipe_reduction" to obtain a clamping effect
mm_thickness=4; // Take the same value as in the "half_shell" file. 
mm_width=60; // Take the same value as in the "half_shell" file
mm_width_vert=60; // The high of the vertical holder
mm_screw_count=3; // The number of screws on each side

use <./monitormount_half_shell.scad>

difference() {
    union() {
        // horizontal
        translate([mm_thickness * 2 + mm_pipe_diameter -4, mm_width / 2, mm_width_vert / 2])
        rotate([90,180,0])
        mm_holder(mm_width, mm_screw_count);

        // vertical
        mm_holder(mm_width_vert, mm_screw_count);

        // create the "connection cube"
        mm_cube_size = mm_pipe_diameter + 8;
        color("grey")
        translate([- mm_thickness / 2 + 4, - mm_cube_size / 2, mm_width_vert / 2 - mm_cube_size / 2])
        cube([mm_cube_size - 9, mm_cube_size, mm_cube_size]);
    }

    //Remove the pipes again
    // vertical
    color("red")
    translate([0, 0, -1])
    cylinder(h=mm_width + 2, r=mm_pipe_diameter/2);

    // horizontal
    color("red")
    translate([mm_thickness + mm_pipe_diameter + 0, mm_width_vert / 2 + 1, mm_width_vert / 2])
    rotate([90,0,0])
    cylinder(h=mm_width + 2, r=mm_pipe_diameter/2);

}