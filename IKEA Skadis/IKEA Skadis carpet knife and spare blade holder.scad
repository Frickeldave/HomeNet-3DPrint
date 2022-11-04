$fn=400;

sh_cube_knife_width = 37;
sh_cube_knife_depth = 21;
sh_cube_knife_height = 20;
sh_cube_sbh_width = 18;
sh_cube_sbh_depth = 28;
sh_cube_sbh_height = 50;
sh_material_thickness = 1.5;

sh_holder_thickness = 4.5;
sh_holder_height = 43;

use <./IKEA Skadis include backwall with 2 hooks.scad>
use <./../modules/hex_grid.scad>


union() {

    // Backwall
    translate([0, 0,0])
    ikea_skadis_backwall(60, 50);

    // Cube for the knife
    translate([0, - sh_cube_knife_depth + sh_material_thickness, 0])
    difference() {
        cube([sh_cube_knife_width,sh_cube_knife_depth,sh_cube_knife_height]);
        translate([sh_material_thickness, sh_material_thickness, -1])
        cube([sh_cube_knife_width - sh_material_thickness * 2, sh_cube_knife_depth - sh_material_thickness * 2, sh_cube_knife_height + 2]);
    }

    // Cube for the spare blades
    translate([60 - sh_cube_sbh_width,- sh_cube_sbh_depth + sh_material_thickness, 0])
    difference() {
        cube([sh_cube_sbh_width,sh_cube_sbh_depth,sh_cube_sbh_height]);
        translate([sh_material_thickness, sh_material_thickness, sh_material_thickness])
        cube([sh_cube_sbh_width - sh_material_thickness * 2, sh_cube_sbh_depth - sh_material_thickness * 2, sh_cube_sbh_height + 2]);
    }
}
