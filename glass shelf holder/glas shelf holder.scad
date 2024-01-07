$fn = 100; 

module screw_hole(x,y,z) {
    color("red")
    translate([x,y,z])
    rotate([0, 90, 0])
    cylinder(h=5, r=1.75);

    color("red")
    translate([x+2,y,z])
    rotate([0, 90, 0])
    cylinder(h=2.1, r1=1.75, r2=2.8);
}

difference() {
    union() {
        color("grey")
        translate([3, 0, 10.5])
        cube([5,150,5]);

        cube([3,150,15.5]);

        color("grey")
        translate([3, 0, 0])
        cube([5,150,5]);

        color("green")
        translate([3,147,0])
        cube([5,3,15.5]);
    }

    // color("red")
    // translate([13, -18, -1])
    // rotate([0,0,50])
    // cube([20,20,20]);

    // color("red")
    // translate([10, -1, 12])
    // rotate([0,-70,0])
    // cube([10,152,10]);

    // color("red")
    // translate([1, -1, -0])
    // rotate([0,70,0])
    // cube([10,152,10]);

    screw_hole(-1,10,7.75);
    screw_hole(-1,75,7.75);
    screw_hole(-1,140,7.75);
}





