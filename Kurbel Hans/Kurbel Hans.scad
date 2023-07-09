$fn = 200;

difference() {
    union() {
        // left circle
        cylinder(h=4, r=7);

        // right circle
        translate([98, 0, 0])
        cylinder(h=4, r=10);

        // base plate
        linear_extrude(4)
        polygon(points=[[0,-7],[0,7],[98,10],[98,-10]]);

        // left cylinder
        cylinder(h=10, r=5);

        // right cylinder
        translate([98, 0, 0])
        cylinder(h=15, r=7.5);

        // element in the middle
        translate([0, 2, 0])
        rotate([90, 0, 0])
        linear_extrude(4)
        polygon(points=[[0, 0], [95, 0], [95, 13], [0, 9]]);
    }

    translate([0, 0, -1])
    cylinder(h=16, r=2);

    translate([98, 0, -1])
    cylinder(h=17, r=4, $fn=6);
}