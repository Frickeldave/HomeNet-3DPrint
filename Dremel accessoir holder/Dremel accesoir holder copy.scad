$fn = 200;

dah_width = 150;
dah_depth = 50;
dah_height = 13;
dah_hole_count = 10;

use <./../modules/hex_grid_v02.scad>

module dremel_block(w, d, h, hc) {
    difference() {
        union() {
            cube([w, d, h]);
        }
        
        // Front row of holes
        for(i = [1 : 1 : hc]) {
            
            color("red")
            translate([w / (hc + 1) * i, d / 3 + 5, h - 10])
            cylinder(h = 11, r = 4);
        }

        // Back row of holes
        for(i = [1 : 1 : hc]) {
            color("red")
            translate([w / (hc + 1) * i, d / 3 * 2 + 5, h - 10])
            cylinder(h = 11, r = 4);
        }

        // Front bevel
        color("red")
        rotate([45, 0, 0])
        translate([-1, 0, h / 2 - 5])
        cube([w + 2, h * 2, h]);
    }
}

module dremel_tool_insert(td) {
    difference() {
        union() {
            cylinder(h = 10, r=3.8);

            translate([0, 0, 10])
            cylinder(h = 1, r = 5);
        }

        translate([0, 0, 2])
        cylinder(h = 10, r = td / 2);
    }
}

module dremel_block_holder(w, d, h)
{
    difference() {
        cube([w + 4, d + 2, h + 4]);
        
        color("red")
        translate([2, -1, 2])
        cube([w, d + 1, h]);

        color("red")
        translate([8, - 4, -1])
        cube([w - 12, d, h + 6]);
        
        color("pink")
        translate([20, d + 3, (h + 4) / 2])
        rotate([90, 0, 0])
        cylinder(h = 4, r = 2);

        color("pink")
        translate([(w + 2) - 20, d + 3, (h + 4) / 2])
        rotate([90, 0, 0])
        cylinder(h = 4, r = 2);        
    }

    hexgrid_frame(w, d, 2);

    translate([2, 0, 0])
    cube([w, 2, 2]);
}

module dremel_drawer(w, d, h){

    difference() {
        union() {
            cube([w, d, h]);

            translate([w / 2 - 20, -8 , h / 2])
            cube([40, 8, 5]);
        }

        translate([2, 2, 2])
        cube([ w - 4, d - 4, h]);
    }
}

// color("violet")
// translate([15.7, 38.5, 4])
// dremel_tool_insert(2);
// dremel_tool_insert(2.5);
// dremel_tool_insert(3);
// dremel_tool_insert(3.5);
// dremel_tool_insert(4);

 translate([2.1, 0, 2.1])
dremel_block(dah_width, dah_depth, dah_height, dah_hole_count);

//translate([2.1, 0, 2.1])
//dremel_drawer(dah_width, dah_depth, dah_height);

// color("cyan")
// translate([0, dah_depth - 32, 0])
// dremel_block_holder(dah_width + 0.6, dah_depth - 20, dah_height + 0.4);