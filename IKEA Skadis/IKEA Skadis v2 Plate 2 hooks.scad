$fn=100;

use <./IKEA Skadis v2 hook.scad>
use <./IKEA Skadis v2 hook cutouts.scad>

module ikea_skadis_backwall(_w, _h) {
    
    _w = _w >= 50  ? _w : 50;
    _h = _h >= 50  ? _h : 50;

    difference() {
        // backwall
        cube([_w, 2, _h], center = true);

       translate([0, 0, 0])
        skadis_hook_cutout(center=true);
    }


}

ikea_skadis_backwall(50, 50);