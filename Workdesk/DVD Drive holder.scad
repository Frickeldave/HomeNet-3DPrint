// $fn = 100;

dvd_drive_width = 144;
dvd_drive_height = 20;
thickness = 4;
border = 8;



difference() {

    cube([dvd_drive_width + border * 2, dvd_drive_height + border * 2, thickness]);

    color("red")
    translate([border, border, -1])
    cube([dvd_drive_width, dvd_drive_height, thickness + 2]);

    color("red")
    translate([-1, -2, 1])
    rotate([20,0,0])
    cube([dvd_drive_width + border * 2 + 2, 10, 4]);

    color("red")
    translate([-1, dvd_drive_height + border * 2 - 6, 4])
    rotate([340,0,0])
    cube([dvd_drive_width + border * 2 + 2, 10, 4]);

    color("red")
    translate([-2, -2, 1])
    rotate([0,-20,0])
    cube([10, dvd_drive_height + border * 2 + 2, 4]);

    color("red")
    translate([dvd_drive_width + border * 2 - 6, -2, 4])
    rotate([0,20,0])
    cube([10, dvd_drive_height + border * 2 + 2, 4]);

}



