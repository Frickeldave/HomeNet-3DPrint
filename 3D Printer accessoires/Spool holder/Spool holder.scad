$fn = 100; 

use <./../../modules/hex_grid_v02.scad>
use<./../../modules/roundedcube.scad>

module groundplate() {

    _w = 70;
    _d = 50;
    _h = 10;

    difference() {
        roundedcube(size = [_w, _d, _h], center = false, radius = 5, apply_to = "zmax");
        
        translate([10.5, 7.5, -1])
        cylinder(h = _h + 2, r = 2);
        translate([10.5, 7.5, _h - 4])
        cylinder(h = 5, r = 3.6);

        translate([10.5, _d - 7.5, -1])
        cylinder(h = _h + 2, r = 2);
        translate([10.5, _d - 7.5, _h - 4])
        cylinder(h = 5, r = 3.6);

        translate([45.5, 7.5, -1])
        cylinder(h = _h + 2, r = 2);
        translate([45.5, 7.5, _h - 4])
        cylinder(h = 5, r = 3.6);

        translate([45.5, _d - 7.5, -1])
        cylinder(h = _h + 2, r = 2);
        translate([45.5, _d - 7.5, _h - 4])
        cylinder(h = 5, r = 3.6);
    }

}

module vertical_holder() {
        
    _w = 160;
    _d = 50;
    _h = 10;
    _shr = 15; // Spool holder radius

    module vertical_holder_form(__w, __d, __h, __shr) {
        union() {
            linear_extrude(height = __h)
            polygon(points=[
                [0,0],
                [__w - __shr * 2 / 2, (_d - __shr * 2) / 2],
                [__w - __shr * 2 / 2, _d - ((__d - __shr * 2) / 2)],
                [0, 50]
            ],convexity=10);

            translate([160 - 15, 25, 0])
            cylinder(h = __h, r = 15);
        }
    }

    vertical_holder_form(_w, _d, _h, _shr);

    translate([_w - _shr, _d / 2 - 8, _h])
    rotate([0, 270, 0])
    linear_extrude(height = _w - _shr)
    polygon(points=[
        [0,0],
        [4, 4],
        [4, 12],
        [0, 16]
    ],convexity=10);

}

module spool_holder() {
    
    _shs = 10; // Spool holder schnöpsel
    _shw = 100; // Spool holder width
    _shr = 15; // Spool holder radius
    
    difference() {
        union() {
            translate([0, 0, _shs])
            cylinder(h = _shw - _shs, r = _shr);
            
            translate([0, 0, 2])
            cylinder(h = _shs - 2, r2 = _shr, r1 = _shr + 7);

            cylinder(h = 2, r = _shr + 7);
        }
        translate([0, 0, -1])
        cylinder(h= _shw + 2, r = _shr - 4);
    }
    
}

groundplate();

color("pink")
translate([60, 0, 0])
cube([20, 50, 10]);

color("lightgreen")
translate([58, 5, 8])
rotate([0, 45, 0])
roundedcube(size = [10, 50 - 10, 20], center = false, radius = 4, apply_to = "all");

translate([70 + 10, 0, 0])
rotate([0, 270, 0])
vertical_holder();

translate([- (100 - 70 - 10), 25, 160 - 15])
rotate([0, 90, 0])
spool_holder();