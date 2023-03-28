$fn = 100;

plate_height = 3;
corner_radius = 9.5;
frame_size = 20;
router_offset = 12;

difference() {
    color("pink")
    cube([60 + frame_size + router_offset, 90 + frame_size + router_offset, plate_height], center = true);

    color("red")
    cube([60 + router_offset, 90 + router_offset, plate_height + 2], center = true);

    translate([-39, -45, plate_height - 2])
    rotate([0, 0, 90])
    linear_extrude(height = 2)
    text(text = "height = 90, width = 60, offset = 12", size=4, halign = 50);
}

