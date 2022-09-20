$fn=400;

sh_cube_width = 65;
sh_cube_depth = 50;
sh_cube_height = 80;
sh_material_thickness = 1.5;

sh_holder_thickness = 4.5;
sh_holder_height = 43;

use <./IKEA Skadis holder.scad>

union() {

    difference() {
        cube([sh_cube_width,sh_cube_depth,sh_cube_height]);
        translate([sh_material_thickness, sh_material_thickness, sh_material_thickness])
        cube([sh_cube_width - sh_material_thickness * 2, sh_cube_depth - sh_material_thickness * 2, sh_cube_height]);
    }

    // backwall
    translate([0,sh_cube_depth-2,0])
    cube([sh_cube_width,2,sh_cube_height]);

    // color("red")
    // translate([sh_cube_width/2, sh_cube_depth-1, sh_cube_height])
    // cube([20,2,5]);

    // color("pink")
    // translate([sh_cube_width/2-20, sh_cube_depth-1, sh_cube_height])
    // cube([20,2,5]);

    if(sh_cube_height < sh_holder_height) {
        // holder left
        translate([sh_cube_width/2-sh_holder_thickness/2-20,sh_cube_depth-2,0])
        ikea_skadis_holder();

        // holder right
        translate([sh_cube_width/2-sh_holder_thickness/2+20,sh_cube_depth-2,0])
        ikea_skadis_holder();
    } else {
        // holder left
        translate([sh_cube_width/2-sh_holder_thickness/2-20,sh_cube_depth-2,sh_cube_height-sh_holder_height])
        ikea_skadis_holder();

        // holder right
        translate([sh_cube_width/2-sh_holder_thickness/2+20,sh_cube_depth-2,sh_cube_height-sh_holder_height])
        ikea_skadis_holder();
    }

}