$fn=400;

tube_distance = 10;
tube_width = 60;
tube_height = 10;
tube_material_size = 4;
tube_reinforcements = 1;

// Set the backwall height and width to a minimum of 50
tube_backwall_width = tube_width > 49 ? tube_width : 44;
tube_backwall_height = tube_height > 49 ? tube_height : 43;

use <./IKEA Skadis include backwall with 2 hooks.scad>
use <./IKEA Skadis include plugin tube.scad>

difference() {
    union() {
        // Draw the backwall
        translate([0,tube_width + tube_distance,0])
        ikea_skadis_backwall(tube_backwall_width, tube_backwall_height, 1);

        // Draw the holder
        translate([tube_backwall_width/2, tube_width/2, 0 ])
        plugin_tube(tube_height,tube_width,tube_material_size,tube_distance,tube_reinforcements);
    }


}

    // // Cut the tip of the triangle
    // color("red")
    // translate([-1,tube_width,tube_backwall_height])
    // cube([tube_backwall_width + 2, tube_distance + 2, tube_distance]);
