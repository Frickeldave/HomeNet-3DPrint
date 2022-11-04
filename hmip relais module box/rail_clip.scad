
$fn=100;
module rail_clip(wall_thickness, width) {

    cube([width, wall_thickness, 45]);

    difference() {
        color("green")
        translate([0,wall_thickness,42])
        cube([width,7,3]);

        color("red")
        translate([-1, 6.4, 42])
        rotate([0,90,0])
        cylinder(h=width + 2, r=1);
    }

    difference() {
        union() {
            color("green")
            translate([0,wall_thickness,6.3])
            cube([width,5,2]);

            translate([0, wall_thickness + 5, 0])
            cube([10, 2, 8.3]);
        }

        color("red")
        translate([-1, 6.4, 8.3])
        rotate([0,90,0])
        cylinder(h=width + 2, r=1);
    }
}


rail_clip(1.5, 10);