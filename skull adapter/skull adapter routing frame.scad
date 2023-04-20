$fn = 100;

plate_height = 7.5;
corner_radius = 9.5;
frame_size = 20;
router_diameter = 12.7;
copy_ring_diameter = 18;
workpiece_width = 80;
workpiece_height = 110;

cube_width = workpiece_width + (copy_ring_diameter - router_diameter);
cube_heigth = workpiece_height + (copy_ring_diameter - router_diameter);
frame_text = (str("width = ", workpiece_width,", height = ",workpiece_height, " with router dia = ", router_diameter, " and copy ring dia = ", copy_ring_diameter));

difference() {
    
    //frame_text = (str("test",2,"d"));
    //color("pink")
    cube([cube_width + frame_size * 2, cube_heigth + frame_size * 2, plate_height], center = true);

    color("red")
    cube([cube_width, cube_heigth, plate_height + 2], center = true);

    translate([-(cube_width / 2 + 8), -60, plate_height / 2 - 1])
    rotate([0, 0, 90])
    linear_extrude(height = 2)
    text(text = frame_text, size=3, halign = 50);


}



