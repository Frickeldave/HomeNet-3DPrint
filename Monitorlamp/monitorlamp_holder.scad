$fn=100;


ml_up_width=600;
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;

ml_h_width=50;
ml_h_height=20;
ml_h_monitor_thickness=25;
ml_h_monitor_distance=70;
ml_h_thickness=1;

module lamp_clip(w, d, h, t) {
    difference() {

        union() {
            // Outer shape
            translate([0, 1, 0])
            cube([w, d + t * 2, h + t * 2]);

            // Static reinforcement of 1mm
            translate([0, 0, 0])
            cube([w, 1, h + t * 2]);

            // Static reinforcement of 1mm
            translate([0, d + t * 2 + 1, 0])
            cube([w, 1, h + t * 2]);
        }

        // cutout
        translate([-1, t + 1, t])
        cube([w + 2, d, h]);

        //Cut out the lower part of the clip
        color("red")
        translate([-1, t + 3.5, -1])
        cube([w + 2, d - t - 4, t + 2]);

        //Cut out diffusor (3mm)
        color("red")
        translate([-1, 1, t])
        cube([w + 2, t + 1, 3.2]);

        //Cut out diffusor (3mm)
        color("red")
        translate([-1, d +  t, t])
        cube([w + 2, t + 1, 3]);

    }

}

module lamp_box(w, d, h, t) {

    difference() {
        cube([w, d, h]);

        translate([t, t, t])
        cube([w - t * 2, d - t * 2, h]);
    }
}

difference() {
    union() {
        lamp_clip(ml_h_width,
                ml_up_depth,
                ml_up_heigth,
                ml_h_thickness);


        translate([0,0,ml_up_heigth + ml_up_thickness])
        lamp_box(ml_h_width,
                ml_up_depth + ml_h_monitor_thickness + ml_h_monitor_distance,
                ml_h_height,
                ml_h_thickness);
    }

    // The hole between clip and case
    color("red")
    translate([ml_h_width/2, ml_up_depth - 7.5, ml_up_heigth])
    cylinder(h=4, r=7.5);

    // The hole for the infrared diode
    color("red")
    translate([ml_h_width / 2 -3, -1, ml_up_heigth + ml_h_height / 2])
    cube([6, 3, 3]);

    color("red")
    translate([ml_h_width / 2, + 3, 2.5 + ml_up_heigth + ml_h_height / 2])
    rotate([90,0,0])
    cylinder(h=4, r=2.5);

    //The hole for the power connector
    color("red")
    translate([ml_h_width / 2 - 4.5, ml_up_depth + ml_h_monitor_thickness + ml_h_monitor_distance - 2, ml_up_heigth + ml_h_thickness + 6])
    cube([9, 3, 11]);
}

