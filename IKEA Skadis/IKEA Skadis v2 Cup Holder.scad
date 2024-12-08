_height = 20;
_radius = 45;
_thickness = 2;
_pen_holes_radius = 5;
_enforcements = 1;

//use <./IKEA Skadis include backwall with 3 hooks.scad>
use <../modules/roundedcube.scad>
use <./IKEA Skadis v2 hook cutouts.scad>


// The cup holder
module cup_holder() {
    difference() {
        difference() {
            union() {
                cylinder(h = _height, r = _radius);
                color("lightgreen")
                translate([0, - _radius / 2 - 5, _height / 2])
                cube([_radius * 2, _radius + 10, _height], center = true);
            }
            translate([0, 0, _thickness])
            cylinder(h = _height, r = _radius - _thickness);

            // left pen hole
            translate([- _radius + _pen_holes_radius + _thickness + 2, - _radius + _pen_holes_radius + _thickness - 7, _thickness])
            cylinder(h = _height, r = _pen_holes_radius);

            // right pen hole
            translate([+ _radius - _pen_holes_radius - _thickness - 2, - _radius + _pen_holes_radius + _thickness - 7, _thickness])
            cylinder(h = _height, r = _pen_holes_radius);
        }
    }
}

// the triangle for the optional enforcements
module triangle(_h) {
    rotate([0, 270, 0])
    linear_extrude(_thickness)
    polygon(points=[[0,0], [_h - _thickness - 5,0], [0,_h - _thickness - 5], [0,0]]);
}

difference() {

    union() {

        // Execute cup_holder
        translate([0, _radius + 10, 0])
        cup_holder();

        // Add the backwall
        translate([- _radius, 0, 0])
        cube([_radius * 2, _thickness, 60]);

        if(_enforcements == 1) {
            if(_height < 40) {
                // Left enforcement
                translate([- _radius + _thickness, _thickness, _height])
                triangle(60 - _height);

                // Right enforcement
                translate([+ _radius, _thickness, _height])
                triangle(60 - _height);
            }
        }

    }
    color("red")
    translate([0, -1.4, 30])
    skadis_hook_cutout(center=true);
}