$fn = 200;

dah_width = 150;
dah_depth = 50;
dah_height = 13;
dah_hole_count = 10;

use <./../modules/hex_grid_v02.scad>

module dremel_block(w, d, h, hc)
{
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

module dremel_tool_insert(td)
{
    difference() {
        union() {
            cylinder(h = 11, r=3.8);

            translate([0, 0, 11])
            cylinder(h = 1, r = 5);
        }

        translate([0, 0, 2])
        cylinder(h = 11, r = td / 2);
    }
}

module dremel_block_holder(w, d, h)
{
    difference() {
        union() {
            cube([w + 4, d + 4, h + 4]);
        }

        color("red")
        translate([2, -2, 2])
        cube([w, d, h]);

        color("green")
        translate([8, - 8, -1])
        cube([w - 12, d, h + 6]);
        
    }
}

//dremel_tool_insert(2);
//dremel_block(dah_width, dah_depth, dah_height, dah_hole_count);
dremel_block_holder(dah_width, dah_depth, dah_height);