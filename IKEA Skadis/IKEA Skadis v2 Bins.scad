_width = 80;
_depth = 40;
_height = 60;

//use <./IKEA Skadis include backwall with 3 hooks.scad>
use <../modules/roundedcube.scad>
use <./IKEA Skadis v2 hook cutouts.scad>

thickness = 1;

difference() {
    translate([0, _depth / 2, 0])
    difference() {
        roundedcube(size = [_width, _depth, _height], center = true, radius = 5, apply_to = "z");
        color("red")
        translate([0, 0, thickness])
        roundedcube(size = [_width - thickness * 2, _depth - thickness * 2, _height - thickness * 2 + 1], center = true, radius = 5, apply_to = "z");
    }
    color("green")
    translate([0, -1.4, 0])
    skadis_hook_cutout(center=true);
}


