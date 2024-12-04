
$fn = 100;

difference() {

    union() {
        cylinder(h = 19, r = 7);
        
        color("green")
        translate([0, 0, 14])
        cylinder(h=3, r1 = 7, r2 = 10);
        color("green")
        translate([0, 0, 17])
        rotate([0, 0, 0])
        cylinder(h=2, r = 10);

        color("blue")
        translate([0, 0, 2])
        cylinder(h=3, r1 = 10, r2 = 7);
        color("blue")
        translate([0, 0, 0])
        rotate([0, 0, 0])
        cylinder(h=2, r = 10); 
    }
    translate([0, 0, -1])
    cylinder(h = 21, r = 2.5);
}