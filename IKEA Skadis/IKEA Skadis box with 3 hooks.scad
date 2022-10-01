$fn=400;

sh_cube_width = 90;
sh_cube_depth = 45;
sh_cube_height = 90;
sh_material_thickness = 1.5;

sh_holder_thickness = 4.5;
sh_holder_height = 43;

use <./IKEA Skadis include backwall with 3 hooks.scad>

union() {

    // Backwall
    translate([0,sh_cube_depth - sh_material_thickness,0])
    ikea_skadis_backwall(sh_cube_width, sh_cube_height);

    // Cube
    difference() {
        cube([sh_cube_width,sh_cube_depth,sh_cube_height]);
        translate([sh_material_thickness, sh_material_thickness, sh_material_thickness])
        cube([sh_cube_width - sh_material_thickness * 2, sh_cube_depth - sh_material_thickness * 2, sh_cube_height]);
    }
}