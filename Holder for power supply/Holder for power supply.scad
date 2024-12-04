$fn = 100;

difference() {
    
    cube([172, 74, 33]);
    
    translate([3, 3, 3])
    cube([166, 68, 31]);

    color("red")
    translate([172 /2 - 100 / 2, -1, 10])
    cube([100, 10, 30]);

    color("pink")
    translate([172 /2 - 142 / 2, 74 / 2 - 44 / 2, -1])
    cube([142, 44, 5]);

    color("red")
    translate([40, 75, 20])
    rotate([90, 0, 0])
    cylinder(h = 5, r = 2);

    color("red")
    translate([172-40, 75, 20])
    rotate([90, 0, 0])
    cylinder(h = 5, r = 2);


}


