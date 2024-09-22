$fn = 100;

difference() {
    
    cube([160, 60, 30]);
    translate([3, 3, 3])
    cube([154, 54, 30]);

    color("red")
    translate([27, -1, 10])
    cube([100, 10, 30]);

    color("red")
    translate([35, 62 - 1, 20])
    rotate([90, 0, 0])
    cylinder(h = 5, r = 2);

    color("red")
    translate([154-35, 62 - 1, 20])
    rotate([90, 0, 0])
    cylinder(h = 5, r = 2);


}


