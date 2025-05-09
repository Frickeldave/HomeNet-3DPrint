use <./../../modules/hex_grid_v02.scad>;

module container() {
    difference() {
        cube([60, 350, 208]);
        translate([3, 3, 3])
        cube([54, 344, 208]);
    }
}

module handle() {
    rotate([-45, 0, 0])
    cube([40, 40, 5]);

    cube([40, 5, 100]);

    translate([0, 0, 100])
    rotate([45, 0, 0])
    cube([40, 40, 5]);
    
}

container();