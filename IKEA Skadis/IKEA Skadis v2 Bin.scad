_width = 37 + 1.6 + 1.6;
_depth = 18 + 1.6 + 1.6;
_height = 60;
_thickness = 1.6;  //Recommended minimum 1.6

//use <./IKEA Skadis include backwall with 3 hooks.scad>
use <../modules/roundedcube.scad>
use <./IKEA Skadis v2 hook cutouts.scad>



module bin(_w, _d, _h, _t, _r) {

    difference() {
        translate([0, _d / 2, 0])
        difference() {
            roundedcube(size = [_w, _d, _h], center = true, radius = _r, apply_to = "z");
            color("red")
            translate([0, 0, _t])
            roundedcube(size = [_w - _t * 2, _d - _t * 2, _h - _t * 2 + 1], center = true, radius = _r, apply_to = "z");
        }
        color("green")
        translate([0, -1.4, 0])
        skadis_hook_cutout(center=true, 3);
    }
}

bin(_width, _depth, _height, _thickness);
