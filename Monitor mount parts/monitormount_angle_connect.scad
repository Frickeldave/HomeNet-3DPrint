$fn=200;
mm_pipe_diameter=21.5; // Use the real measure of your pipe here. One size will be reduced by "mm_pipe_reduction" to obtain a clamping effect.
mm_thickness=4; // Take the same value as in the "half_shell" file. 
mm_holder_depth=12; // Take the same value as in the "half_shell" file. 
mm_width_straight=100; // Take the same value as in the "half_shell" file.
mm_angle=-50; // The angle with which the two parts are joined together.
mm_width_angled=100; // The high of the vertical holder.
mm_screw_count=5; // The number of screws on each side.
mm_screw_diameter=5; // The diameter of the screws you want to use

use <./monitormount_half_shell.scad>


module mm_shelf_with_connector() {
    
    difference() {
        union() {
            // Draw the half she
            mm_holder(mm_width_straight, mm_screw_count);
        
        translate([0, 25, mm_width_straight / 2])
        rotate([90, 0, 0])
        cylinder(h = 50, r = 16);

        }

        // Substract the pipe
        translate([0, 0, -1])
        cylinder(h=mm_width_straight + 2, r=mm_pipe_diameter / 2);

        // Substract the flat side of the shell
        translate([-19.5, -30, 0])
        cube([20, 60, mm_width_straight]);

        // Substract the left screwhole
        translate([-10, -19, mm_width_straight / 2])
        rotate([90,00,90])
        cylinder(h=40, r=mm_screw_diameter/2);

        // Substract the right screwhole
        translate([-10, +19, mm_width_straight / 2])
        rotate([90,00,90])
        cylinder(h=40, r=mm_screw_diameter/2);

    }

}

mm_shelf_with_connector();

// Draw the angeled shelf
translate([0, 0, mm_width_straight / 2])
rotate([0,mm_angle,0])
translate([0, mm_pipe_diameter + mm_thickness + mm_holder_depth * 2, -mm_width_straight / 2])
mm_shelf_with_connector();
