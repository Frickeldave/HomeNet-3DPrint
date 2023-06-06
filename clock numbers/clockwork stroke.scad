$fn = 200;

translate([0,-4,0])
cube([28, 8, 2.5]);

translate([0, 0, 0])
cylinder(r=4, h=2.5);

translate([28, 0, 0])
cylinder(r=4, h=2.5);