$fn = 30;

use <./height extender - base.scad>;
extender(10);
module extender(h) {
    difference() {
        union() {
            linear_extrude(height = h)
            color("grey")
            translate([0, 0, 0])
            base();
        }

        translate([56 - 3.5, 3.5, 2])
        rotate([0, 0, 90])
        recess();

        color("pink")
        translate([-1, 10, 2])
        linear_extrude(height = 10)
        cutout();

        translate([17, 17, -1])
        cylinder(h = 4, r = 2);

        translate([40, 40, -1])
        cylinder(h = 4, r = 2);
    }

    translate([17,17,2])
    screw_hole();

    translate([40,40,2])
    screw_hole();
}

module base() {
    polygon(points=[
                [0, 0],
                [56, 0],
                [56, 56],
                [46, 56],
                [0, 10],
                [0,0]
                ],convexity=10
        );
};

module cutout() {
    polygon(points=[
                [0, 0],
                [47, 0],
                [47, 47],
                [0,0]
                ],convexity=10
        );
};

module recess() {

    w = 38.5;
    t = 3.6;
    h = 10;

    color("red")
    cube([w, t, h]);

    color("pink")
    translate([t, 0, 0])
    rotate([0, 0, 90])
    cube([w, t, h]);
};

module screw_hole() {
    
    difference() {
        cylinder(h = 3, r = 5);
            
        color("red")
        union() {
            translate([0, 0, 1.1])
            cylinder(h = 2, r1 = 2, r2 = 4);
            translate([0, 0, -1])
            cylinder(h = 5, r = 2);
        }   
    }
}