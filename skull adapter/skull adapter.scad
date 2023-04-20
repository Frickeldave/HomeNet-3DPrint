$fn = 100;

material_thickness=3;
border_height=5;
plate_height=3;
corner_radius=6.35; // radius (not diameter) of the router

width = 80;
height = 110;
width_minkowski = width - 2 * corner_radius;
height_minkowski = height  - 2 * corner_radius;

module half_skull_outer() {
    polygon(points=[
                    [0, -3], 
                    [-10, 0],
                    [-19, 7],
                    [-29, 17], 
                    [-34, 50],
                    [-34, 52],
                    [-31, 54],
                    [-27, 56],
                    [-28, 57],
                    [-30, 62],
                    [-32, 70],
                    [-30, 75],
                    [-28, 80],
                    [-24, 85],
                    [-16, 93],
                    [-9, 94],
                    [0, 95]
                    ],convexity=10
            );
};

module half_skull_inner() {
    polygon(points=[
                    [0, 0], 
                    [-10, 3],
                    [-19, 10],
                    [-27, 20], 
                    [-32, 48],
                    [-32, 50],
                    [-30, 52],
                    [-22, 54],
                    [-25, 57],
                    [-27, 62],
                    [-29, 70],
                    [-27, 75],
                    [-25, 80],
                    [-20, 85],
                    [-15, 90],
                    [-10, 91],
                    [0, 92]
                    ],convexity=10
            );
};

module plate() {
    difference() {
        union() {
            linear_extrude(height = border_height + plate_height)
            color("grey")
            translate([0, 0, 0])
            half_skull_outer(); 

            linear_extrude(height = border_height + plate_height)
            color("grey")
            translate([-0.1, 0, 0])
            mirror([1,0,0])
            half_skull_outer();
        }
        
        translate([0, 0, 1])
        union() {
            linear_extrude(height = border_height + plate_height)
            color("red")
            half_skull_inner();

            linear_extrude(height = border_height + plate_height)
            color("red")
            translate([-0.1, 0, 0])
            mirror([1, 0, 0]) 
            half_skull_inner();
        }
    }

    color("grey")
    translate([-width_minkowski / 2, 0, 0])
    minkowski() {
        cube([width_minkowski, height_minkowski, plate_height]);
        color("red")
        cylinder(r =corner_radius, h = 1, center = true);
    };
}

difference() {
    
    union() {
    
        plate();

        translate([-15, 20, plate_height])
        cylinder(h=3, r = 2.5);
        translate([15, 20, plate_height])
        cylinder(h=3, r = 2.5);
        translate([-15, 75, plate_height])
        cylinder(h=3, r = 2.5);
        translate([15, 75, plate_height])
        cylinder(h=3, r = 2.5);
    }
    
    // hole bottom
    translate([0, 15, -1])
    cylinder(h = 10, r = 2.5);

    // hole middle
    translate([0, 47.5, -1])
    cylinder(h = 10, r = 2.5);

    // hole bottom
    translate([0, 80, -1])
    cylinder(h = 10, r = 2.5);
}