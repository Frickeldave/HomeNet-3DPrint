$fn = 100;
_hole_diameter = 35;

module sphere_outer() {

    difference() {
        sphere(_hole_diameter);
        sphere(_hole_diameter - 1);
        translate([- _hole_diameter - 1, - _hole_diameter - 1, - _hole_diameter - 2])
        cube([_hole_diameter * 2 + 2, _hole_diameter * 2 + 2, _hole_diameter + 2]);
    }
}

module sphere_inner() {
    
    difference() {
        sphere(_hole_diameter - 10);
        sphere(_hole_diameter - 11);
        translate([- _hole_diameter - 1, - _hole_diameter - 1, - _hole_diameter - 2])
        cube([_hole_diameter * 2 + 2, _hole_diameter * 2 + 2, _hole_diameter + 2]);

        color("red")
        translate([_hole_diameter / 2 + 4, 0, 5])
        rotate([0, 90, 0])
        cylinder(h = 4, r = 2);
    }
}

module sphere_floor() {
    difference(){
        cylinder(h = 2, r = _hole_diameter);

        color("red")
        translate([0, 0, -1])
        cylinder(h = 4, r = _hole_diameter / 2);

    }

    difference() {
        color("violet")
        translate([0, 0, 2])
        cylinder(h = 2, r = _hole_diameter - 11);

        color("red")
        translate([0, 0, 1])
        cylinder(h = 4, r = _hole_diameter / 2 - 1);
    }

    difference() {
        color("cyan")
        translate([0, 0, 2])
        cylinder(h = 2, r = _hole_diameter - 1);

        color("red")
        translate([0, 0, 1])
        cylinder(h = 4, r = _hole_diameter - 2);
    }


}

module hole_inlay() {
    difference() {
        cylinder(h = 10, r = _hole_diameter / 2);
        translate([0, 0, -1])
        cylinder(h = 12, r = _hole_diameter / 2 - 1);
    }
}

translate([0, 0, 10])
sphere_outer();

// translate([0, 0, 10])
// sphere_inner();

// translate([0, 0, 8])
// sphere_floor();

// color("green")
// hole_inlay();