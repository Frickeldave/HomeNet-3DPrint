$fn = 100; 

difference() {
    
    union() {
        translate([0,0,8])
        linear_extrude(height = 4)
        polygon(points=[
            [0,0],
            [30,0],
            [0,30]
        ]);

        cube([30, 3, 12]);

        cube([3, 30, 12]);
    }

    color("red")
    translate([9,9,7])
    cylinder(h=6, r=6);    

    color("red")
    translate([9, -1, 4])
    rotate([270, 0, 0])
    cylinder(h=5, r1 = 1.5, r2 = 2);

    color("red")
    translate([22, -1, 4])
    rotate([270, 0, 0])
    cylinder(h=5, r1 = 1.5, r2 = 2);

    color("red")
    translate([9, 1.5, 4])
    rotate([270,0,0])
    cylinder(h=4, r1 = 1.5, r2 = 4);

    color("red")
    translate([22, 1.5, 4])
    rotate([270,0,0])
    cylinder(h=4, r1 = 1.5, r2 = 4);
}




