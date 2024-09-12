use <./../modules/roundedcube.scad>

difference() {

    roundedcube([41, 39, 10], false, 2, "z");
    
    translate([41/2, 39/2, -1])
    cylinder(h = 12, r = 3.1, $fn = 100);

    translate([41/2, 39/2, -1])
    cylinder(h = 6, r = 11);

    translate([19, 39-6, -1])
    cube([14, 6, 6.5]);
}

translate([41/2-15, -2, 0])
cube([30, 2, 2]);

translate([41/2-15, -0.58, 0.59])
rotate([45,0,0])
cube([30, 10, 2]);

color("pink")
translate([19, 39-6, ])
cube([14, 3, 1]);