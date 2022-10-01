$fn=400;

sh_sp_width = 10;
sh_sp_height = 50;
sh_sp_thickness = 2;

sh_holder_thickness = 4.5;
sh_holder_height = 43;

use <./IKEA Skadis include holder.scad>

union() {

    // backwall
    cube([sh_sp_width,sh_sp_thickness,sh_sp_height]);

    // holder middle
    translate([sh_sp_width/2-sh_holder_thickness/2,0,sh_sp_height-sh_holder_height])
    ikea_skadis_holder();

    color("red")
    translate([sh_sp_width/2,0,sh_sp_height - 10])
    rotate([90,0,0])
    cylinder(h = 10, r = 3.5);

}