_width = 130;
_depth = 45;
_height = 59;
_thickness = 1.6; //Recommended minimum 1.6

_bottom_cutout = 1;
_bottom_cutout_width = 103;
_bottom_cutout_depth = 20;

_right_cutout = 0;
_right_cutout_depth = 13;
_right_cutout_height = 20;
_right_cutout_z_offset = 30; // (_height - _left_cutout_height) / 2
_right_cutout_y_offset = 20; // (_depth - _left_cutout_depth) / 2

_left_cutout = 1;
_left_cutout_depth = 13; //16
_left_cutout_height = 20;
_left_cutout_z_offset = 30; // (_height - _right_cutout_height) / 2
_left_cutout_y_offset = 20; // (_depth - _left_cutout_depth) / 2

_front_cutout = 1;
_front_cutout_width = 50;
_front_cutout_height = 50;
_front_cutout_z_offset = 17; // Middle = (_height - _front_cutout_height) / 2;

use <./IKEA Skadis v2 Bin.scad>
use <../modules/roundedcube.scad>

difference() {
    translate([_width / 2, 0, _height / 2])
    bin(_width, _depth, _height, _thickness);

    // Bottom cutout
    if(_bottom_cutout == 1) {
        translate([(_width - _bottom_cutout_width) / 2, (_depth - _bottom_cutout_depth) / 2, -1])
        //cube([_bottom_cutout_width, _bottom_cutout_depth, _thickness + 2]);
        roundedcube(size = [_bottom_cutout_width, _bottom_cutout_depth, _thickness + 2], center = false, radius = 5, apply_to = "z");
    }

    // Right cutout
    if(_right_cutout == 1) {
        translate([_width - _thickness - 1, _depth - _right_cutout_depth - _right_cutout_y_offset, _left_cutout_z_offset])
        roundedcube(size = [_thickness + 2, _right_cutout_depth, _right_cutout_height], center = false, radius = 2.5, apply_to = "x");
    }

    // Left cutout
    if(_left_cutout == 1) {
        translate([- 1, _depth - _left_cutout_depth - _left_cutout_y_offset, _left_cutout_z_offset])
        roundedcube(size = [_thickness + 2, _left_cutout_depth, _left_cutout_height], center = false, radius = 2.5, apply_to = "x");
    }

    // Front cutout
    if(_front_cutout == 1) {
        color("red")
        translate([(_width - _front_cutout_width) / 2, _depth -1, _front_cutout_z_offset])
        //cube([_bottom_cutout_width, _bottom_cutout_depth, _thickness + 2]);
        roundedcube(size = [_front_cutout_width, _thickness, _front_cutout_height], center = false, radius = 5, apply_to = "y");
    }
}

// color("pink")
// translate([3, 2, 2])
// cube([124, 39, 74]);