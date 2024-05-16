$fn = 100;

cyl_dia = 16.2;

translate([10 + cyl_dia / 2, cyl_dia / 2 + 0.5 + 2, 0])
difference() {
    cylinder(h = 30, r = (cyl_dia + 1) / 2 + 2);
    translate([0, 0, 2])
    cylinder(h = 30, r = (cyl_dia + 1) / 2);
}

difference() {
    translate([0, 0, 0])
    cube([cyl_dia + 20, 2, 10]);

    color("red")
    translate([4, 3, 5])
    rotate([90, 0, 0])
    cylinder(h = 4, r = 1.5);


    color("red")
    translate([cyl_dia + 20 - 4, 3, 5])
    rotate([90, 0, 0])
    cylinder(h = 4, r = 1.5);    
}
