$fn = 100;


// dd = Drill diameter
// ibs = in between size
module drill_holder(dd, ibs) {

    _dh_drill_dia = dd + ibs;
    _dh_width = _dh_drill_dia + 7;
    _dh_depth = 65;
    _dh_height = 40;
    _dh_hole_tolerance = 0.25;

    difference() {
        rotate([0,90,0])
        linear_extrude(height = _dh_width)
            translate([0, 0, 0])
            polygon(points=[
                [0, 0], 
                [- _dh_height + 15, 0],
                [- _dh_height, _dh_depth - 15],
                [- _dh_height, _dh_depth],
                [0, _dh_depth] 
                ],convexity=10
            );

        color("red")
        translate([_dh_width / 2, 22, 4])
        rotate([17, 0, 0])
        cylinder(h = _dh_height, r = _dh_drill_dia / 2 + _dh_hole_tolerance);

        color("red")
        translate([_dh_width / 2, _dh_depth - 20, 4])
        rotate([17, 0, 0])
        cylinder(h = _dh_height, r = _dh_drill_dia / 2 + _dh_hole_tolerance);
    }

    font = ("Arial");
    _dh_label = ibs == 0 ? str(dd) : str(dd,".");

    color("black")
    translate([_dh_width / 2, 0, _dh_height / 2 - 8])
    rotate([90,0,0])
    linear_extrude(1)
    text(halign = "center", valign = "center", text = _dh_label, font = font, size = 8);

    color("black")
    translate([_dh_width / 2, _dh_depth -8, _dh_height])
    rotate([0,0,0])
    linear_extrude(1)
    text(halign = "center", valign = "center", text = _dh_label, font = font, size = 8);
}

drill_holder(8, 0.5);