$fn=100;


ml_up_width=600;
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;

ml_h_width=50;
ml_h_monitor_thickness=25;
ml_h_monitor_distance=70;


use <./monitorlamp_clip.scad>

ml_h_thickness=1;

difference() {
    union() {

        color("grey")
        lamp_clip(ml_h_width);

        difference() {
            translate([0, 0, ml_up_heigth + 1])
            cube([ml_h_width, ml_up_depth + ml_h_monitor_thickness + ml_h_monitor_distance, 20]);

            translate([1, 1, ml_up_heigth + 2])
            cube([ml_h_width - 2, ml_up_depth + ml_h_monitor_thickness + ml_h_monitor_distance - 2, 20]);
        }
    }

    // The hole between clip and case
    color("red")
    translate([ml_h_width/2, ml_up_depth - 7.5, ml_up_heigth])
    cylinder(h=ml_h_thickness + 2, r=7.5);

    // The hole for the power connector
    color("red")
    translate([ml_h_width / 2 -4.5, ml_up_depth + ml_h_monitor_thickness + ml_h_monitor_distance - 2, ml_up_heigth + 6])
    cube([9, 3, 11]);

    // The hole for the infrared diode

}


    color("red")
    translate([ml_h_width / 2 -3,0, 0])
    cube([6, 3, 3]);

