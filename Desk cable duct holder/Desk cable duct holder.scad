$fn = 100;

thickness=4;
width=135;
height=77;
depth=20;

module reinforcement() {
    rotate([90,90,90])
    linear_extrude(height = thickness)
    polygon(points=[
        [0,0],
        [16,0],
        [0,16]
    ]);
}

module wall() {
    difference() {
        union() {
            translate([0,0,thickness])
            cube([width,thickness,height]);

            cube([width,depth,thickness]);

            translate([0,0,height + thickness])
            cube([width, depth, thickness]);

            color("blue")
            translate([20, thickness, height + thickness])
            reinforcement();

            color("blue")
            translate([20, thickness, thickness])
            rotate([90,0,0])
            reinforcement();

            color("blue")
            translate([width - thickness - 20, thickness, height + thickness])
            reinforcement();

            color("blue")
            translate([width - thickness - 20, thickness, thickness])
            rotate([90,0,0])
            reinforcement();
        }

        // color("red")
        // translate([width/2, thickness+1, height/2+thickness])
        // rotate([90,0,0])
        // cylinder(h=thickness+2, r=height/2-5);
    }
}

module wall_tunnel_left() {
    difference() {
        
        wall();

        color("red")
        translate([0, thickness+1, height - 20])
        rotate([90,0,0])
        cylinder(h=thickness+2, r=6);

        color("red")
        translate([0, depth+thickness+1, 0])
        rotate([90,0,0])
        cylinder(h=depth+thickness+2, r=12);

    }
}

module wall_tunnel_right() {
    difference() {
        
        wall();

        color("red")
        translate([width, thickness+1, height - 20])
        rotate([90,0,0])
        cylinder(h=thickness+2, r=6);

        color("red")
        translate([width, depth+thickness+1, 0])
        rotate([90,0,0])
        cylinder(h=depth+thickness+2, r=12);

    }
}


//wall_tunnel_left();

// translate([width + 10, 0, 0])
//wall_tunnel_right();

// translate([width * 2 + 20, 0, 0])
wall();

// translate([width * 3 + 30, 0, 0])
// wall();
