$fn = 100;

// The overall depth
_dh_depth = 65;
// The overall height (plus number)
_dh_height = 40; 
// Teh font used for the numbers
_font = ("Arial");


module notch(height, reduction) {

    r = reduction;
    linear_extrude(height = height)
    translate([0, 0, 0])
    polygon(points=[
        [r, r], 
        [13-r, r],
        [13-r, 3-r],
        [10-r, 3-r],
        [10-r, 6-r+r],
        [3+r, 6-r+r],
        [3+r, 3-r],
        [r, 3-r] 
        ],convexity=1
    );
}

// dd = Drill diameter
// ibs = in between size
module drill_holder(dd, ibs) {

    _dh_drill_dia = dd;
    _dh_width = _dh_drill_dia + 9;
    _dh_hole_tolerance = 0.5;

    // The base form of the corpus
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

        // Front hole
        color("red")
        translate([_dh_width / 2, 22, 4])
        rotate([17, 0, 0])
        cylinder(h = _dh_height, r = _dh_drill_dia / 2 + _dh_hole_tolerance);

        // Back hole
        color("red")
        translate([_dh_width / 2, _dh_depth - 20, 4])
        rotate([17, 0, 0])
        cylinder(h = _dh_height, r = _dh_drill_dia / 2 + _dh_hole_tolerance);

        // Notch cutout
        // color("red")
        // translate([6 - 0.2, _dh_depth - 15, -1])
        // rotate([0, 0, 90])
        // notch(_dh_height + 2, 0);

    }

    // Notch
    color("cyan")
    translate([_dh_width + 6 - 0.1, _dh_depth - 15, 0])
    rotate([0, 0, 90])
    notch(_dh_height, 0.5);

    
    _dh_label = ibs == 0 ? str(dd) : str(dd,".5");

    // Front number
    color("black")
    translate([_dh_width / 2, 0, _dh_height / 2 - 8])
    rotate([90,0,0])
    linear_extrude(1)
    text(halign = "center", valign = "center", text = _dh_label, font = _font, size = 7);

    // Back number
    color("black")
    translate([_dh_width / 2 + 1, _dh_depth -8, _dh_height])
    rotate([0,0,0])
    linear_extrude(1)
    text(halign = "center", valign = "center", text = _dh_label, font = _font, size = 5);
}

drill_holder(1, 0);

// difference() {
//     drill_holder(12.5, 0);

//     translate([-1, -1, -1])
//     cube([30, 45, 50]);
// }

// difference() {
//     cube([20,20,20]);

//     color("red")
//     translate([14.1, 18, -1])
//     rotate([0, 0, 270])
//     notch(22, 0);
// }


// color("green")
// translate([-6, 18, 0])
// rotate([0, 0, 270])
// notch(20, 0.4);

// color("red")
// notch(1, 0.5);

// translate([0,0,1])
// notch(1,0);