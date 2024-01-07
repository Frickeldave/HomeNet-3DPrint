$fn = 400; 

difference() {
    union() {
        translate([-20, 5, 0])
        cube([40,3,40]);

        color("green")
        translate([-6, 0, 0])
        cube([12,5,40]);

        cylinder(h=60, r=6);
    }
    color("red")
    translate([0,0,2])
    cylinder(h=60, r=4);
}