$fn=400;

sh_th_width = 100;
sh_th_height = 45;
sh_th_holder_height = 20;
sh_th_holder_depth = 7;
sh_material_thickness = 1.5;

sh_holder_thickness = 4.5;
sh_holder_height = 43;

use <./IKEA Skadis include backwall with 3 hooks.scad>

union() {
    ikea_skadis_backwall(sh_th_width, sh_th_height);

    difference() {
        color("cyan")
        translate([0, - sh_th_holder_depth + sh_material_thickness, sh_th_height / 2 - sh_th_holder_height / 2])
        cube([sh_th_width, sh_th_holder_depth, sh_th_holder_height]);


        translate([sh_material_thickness, - sh_th_holder_depth + sh_material_thickness * 2, sh_th_height / 2 - sh_th_holder_height / 2 - 1])
        cube([sh_th_width - sh_material_thickness * 2, sh_th_holder_depth - sh_material_thickness * 2, sh_th_holder_height + 2]);

        font = ("Stencil");


translate([10, - sh_material_thickness * 2, sh_th_height / 2 - sh_th_holder_height / 2 + 5])
rotate([90,0,0])
linear_extrude(sh_material_thickness + 2)
text(text = "Pinzetten", font = font, size = 11);
    }
}


