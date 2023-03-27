$fn = 100;

material_thickness=3;

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
            linear_extrude(height=5)
            color("grey")
            translate([0, 0, 0])
            half_skull_outer(); 

            linear_extrude(height=5)
            color("grey")
            translate([-0.1, 0, 0])
            mirror([1,0,0])
            half_skull_outer();
        }
        
        translate([0, 0, 3])
        union() {
            linear_extrude(height=5)
            color("red")
            half_skull_inner();

            linear_extrude(height=5)
            color("red")
            translate([-0.1, 0, 0])
            mirror([1, 0, 0]) 
            half_skull_inner();
        }
    }

    color("grey")
    translate([-30, 2, 0])
    minkowski() {
        cube([60,90,1]);
        color("red")
        cylinder(r=9.5,h=1,center=true);
    };
}

difference() {
    plate();
    
    cylinder(h = 10, r = 2.5);
}

