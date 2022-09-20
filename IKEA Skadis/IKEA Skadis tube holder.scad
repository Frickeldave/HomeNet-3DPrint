$fn=400;

tube_distance = 5;
tube_width = 50;
tube_height = 30;
tube_material_size = 2;

tube_backwall_height = tube_height > 49 ? tube_height : 50;
tube_backwall_width = tube_width > 49 ? tube_width : 50;

use <./IKEA Skadis backwall with 2 hooks.scad>

// Draw the backwall
translate([0,tube_width + tube_distance,0])
ikea_skadis_backwall(tube_backwall_width, tube_backwall_height);

module plugin_tube() {
    
    difference() {
        cylinder(h=tube_height,r=tube_width/2);
        translate([0,0,-1])
        cylinder(h=tube_height+2,r=tube_width/2-tube_material_size);
    }

    // left holder
    color("green")
    translate([-tube_width/2, 0, 0])
    cube([tube_material_size,tube_distance + tube_width/2,tube_height]);

    // right holder
    color("green")
    translate([tube_width/2 - tube_material_size, 0, 0])
    cube([tube_material_size,tube_distance + tube_width/2,tube_height]);
}

translate([tube_backwall_width/2, tube_width/2, 0 ])
plugin_tube();