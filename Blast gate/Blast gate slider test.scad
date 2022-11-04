$fn=400;

s_thickness=4.6;
s_handle_high = 24;
s_slider_width = 59.8;
s_slider_length = 170;
s_main_plate_height = 2;
s_slider_complete_thickness=s_thickness + s_main_plate_height;


difference() {

    translate([0, 0, s_handle_high/2 - s_slider_complete_thickness/2])
    cube([s_slider_length, s_slider_width, s_slider_complete_thickness]);

    // Main plate excperts
    s_main_plate_excerpt_z = ((s_handle_high - s_slider_complete_thickness)/2)+s_slider_complete_thickness-s_main_plate_height;

    // Main plate excperts left
    color("red")
    translate([50+10, s_slider_width/2, s_main_plate_excerpt_z])
    cylinder(h=s_main_plate_height+1,r=50);

    // Main plate excperts right
    color("red")
    translate([s_slider_length-50-10, s_slider_width/2, s_main_plate_excerpt_z])
    cylinder(h=s_main_plate_height+1,r=50);

    // Hole
    color("pink")
    translate([50+10, s_slider_width/2, s_handle_high/2 - s_slider_complete_thickness / 2 - 1])
    cylinder(h=s_slider_complete_thickness+2, r=25);
}