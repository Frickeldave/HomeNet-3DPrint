
$fn=20;

sh_height=43;
sh_width=4.5;
sh_hanger_spacing=5.5;
sh_material_size=2;
sh_short_tail=4;
sh_corner_radius = 0.8;

use <../modules/roundedcube.scad>

module ikea_skadis_holder() {
    difference() {
        union() {
            
            //Vertical wall
            color("green")
            roundedcube(size = [sh_width,sh_material_size,sh_height], center = false, radius = sh_corner_radius, apply_to = "ymax");
            //cube([sh_width,sh_material_size,sh_height]);
            
            // Retainer
            color("blue")
            translate([0,0,sh_height-sh_hanger_spacing])
            roundedcube(size = [sh_width, sh_hanger_spacing + sh_material_size * 2 + 1, sh_hanger_spacing + 3], center = false, radius = sh_corner_radius, apply_to = "ymax");

            //Vertical wall connection (short)
            color("cyan")
            translate([0, sh_hanger_spacing + sh_material_size , sh_height - sh_hanger_spacing])
            roundedcube(size = [sh_width, sh_material_size + 1, 2], center = false, radius = sh_corner_radius, apply_to = "z");

            //Vertical wall (short)
            color("cyan")
            translate([0, sh_hanger_spacing + sh_material_size , sh_height - sh_short_tail - sh_hanger_spacing])
            //cube([sh_width,sh_material_size+1,sh_short_tail]);
            roundedcube(size = [sh_width, sh_material_size + 1, sh_short_tail], center = false, radius = sh_corner_radius, apply_to = "zmin");

            //Schnöpsel
            color("yellow")
            translate([0, sh_material_size - 2, 0])
            roundedcube(size = [sh_width, sh_hanger_spacing + 2, 8], center = false, radius = sh_corner_radius + 0.8, apply_to = "ymax");

            //Schnöpsel - Angleichen des unteren radius
            color("yellow")
            translate([0, sh_material_size - 2, 0])
            roundedcube(size = [sh_width, sh_hanger_spacing + 2, 7], center = false, radius = sh_corner_radius, apply_to = "ymax");

        }
        
        
    color("red")
    translate([-1,sh_material_size+sh_hanger_spacing/2,sh_height-sh_hanger_spacing])
    rotate([0,90,0])
    cylinder(sh_width+2, sh_hanger_spacing/2, sh_hanger_spacing/2);
        
    }
}
//color("Yellow")
ikea_skadis_holder();