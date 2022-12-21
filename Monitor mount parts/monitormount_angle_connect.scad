$fn=200;
mm_pipe_diameter=21.5; // Use the real measure of your pipe here. One size will be reduced by "mm_pipe_reduction" to obtain a clamping effect.
mm_thickness=4; // Take the same value as in the "half_shell" file. 
mm_holder_depth=12; // Take the same value as in the "half_shell" file. 
mm_width_straight=100; // Take the same value as in the "half_shell" file.
mm_angle=20; // The angle with which the two parts are joined together.
mm_width_angled=100; // The high of the vertical holder.
mm_screw_count=5; // The number of screws on each side.

use <./monitormount_half_shell.scad>

module mm_connector(h, d, a) {
    
    difference() {
        union() {
            difference() {
                cylinder(h = h/2, r = d / 2);
                
                color("red")
                translate([0, - d / 2 - 1, -1])
                cube([d / 2 + 1, d + 2, h / 2 + 1]);
            }

            difference() {
                color("lightgreen")
                translate([0, 0, h / 2])
                cylinder(h = h / 2, r = d / 2);


            }
        }        
    }

    color("red")
    translate([0, - d - 2, h / 2])
    rotate([0, 0, a])
    translate([0, - d / 2 - 1, h / 2])
    cube([d / 1 + 1, d + 2, h / 2 + 2]);
}

mm_connector(100, 20, 20);

// difference() {
//     union() {
//         // straight element
//         translate([0, 0, 0])
//         mm_holder(mm_width_straight, mm_screw_count);

//         // element with angle
//         translate([0, 0, mm_width_straight / 2])
//         rotate([0,mm_angle,0])
//         translate([0, mm_pipe_diameter + mm_thickness + mm_holder_depth * 2, -mm_width_straight / 2])
//         mm_holder(mm_width_angled, mm_screw_count);


//         //create the "connection cube" at the straight element
//         mm_cyl_size = mm_pipe_diameter * 2 + mm_holder_depth * 2 + mm_thickness * 3;
//         color("pink")
//         translate([1, mm_cyl_size - mm_pipe_diameter / 2 - mm_thickness,  mm_width_straight / 2])
//         rotate([90,180,0])
//         mm_connector(mm_cyl_size, mm_pipe_diameter * 2);
//     }

//     //Remove the pipes again 
//     color("red")
//     translate([0, 0, -1])
//     cylinder(h=mm_width_straight + 2, r=mm_pipe_diameter/2);

//     color("red")
//     translate([0, 0, mm_width_straight / 2])
//     rotate([0,mm_angle,0])
//     translate([0, mm_pipe_diameter + mm_thickness + mm_holder_depth * 2, -mm_width_straight / 2 -1])
//     cylinder(h=mm_width_straight + 2, r=mm_pipe_diameter/2);
// }

