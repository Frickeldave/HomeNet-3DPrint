$fn=400;

tube_distance = 10;
tube_width = 50;
tube_height = 10;
tube_material_size = 2;
tube_reinforcements = 1;

// set backwall height to a fixed value
tube_backwall_height = 100;

// Set backwall width to a fixed value
tube_backwall_width = 100;

tube_cable_holder_end_thick = 5;
tube_cable_holder_height = tube_width + tube_distance - tube_cable_holder_end_thick;
tube_cable_holder_thickness = 8;

use <./IKEA Skadis include backwall with 3 hooks.scad>
use <./IKEA Skadis include plugin tube.scad>

difference() {
    union() {
        // Draw the backwall
        translate([0,tube_width + tube_distance,0])
        ikea_skadis_backwall(tube_backwall_width, tube_backwall_height);

        // Draw the holder
        translate([tube_width/2, tube_width/2, 10 ])
        plugin_tube(tube_height,tube_width,tube_material_size,tube_distance,tube_reinforcements);

        // Draw cable holder 1
        color("blue")
        translate([tube_backwall_width - 20, tube_width + tube_distance, 15])
        rotate([90,0,0])
        cylinder(h=tube_cable_holder_height, r=tube_cable_holder_thickness / 2);
        
        color("blue")
        translate([tube_backwall_width - 20, tube_cable_holder_end_thick, 15])
        rotate([90,0,0])
        cylinder(h=tube_cable_holder_end_thick, r=tube_cable_holder_thickness / 2 + 5);
    
        // Cable holder middlepart
        color("lightblue")
        translate([tube_backwall_width - tube_cable_holder_thickness / 2 - 20, tube_cable_holder_height + tube_cable_holder_end_thick, 15])
        rotate([90,0,0])
        cube([tube_cable_holder_thickness, tube_backwall_height - 30,tube_cable_holder_height + tube_cable_holder_end_thick]);

        // Draw cable holder 2
        color("blue")
        translate([tube_backwall_width - 20, tube_width + tube_distance, tube_backwall_height - 15])
        rotate([90,0,0])
        cylinder(h=tube_cable_holder_height, r=tube_cable_holder_thickness / 2);
        
        color("blue")
        translate([tube_backwall_width - 20, tube_cable_holder_end_thick, tube_backwall_height - 15])
        rotate([90,0,0])
        cylinder(h=tube_cable_holder_end_thick, r=tube_cable_holder_thickness / 2 + 5);
    }

    // Cut the tip of the triangle
    color("red")
    translate([-1,tube_width,tube_backwall_height])
    cube([tube_backwall_width + 2, tube_distance + 2, tube_distance]);
}