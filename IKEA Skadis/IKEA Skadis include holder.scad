
$fn=400;

sh_height=43;
sh_width=4.5;
sh_hanger_spacing=5.5;
sh_material_size=2;
sh_short_tail=2;

module ikea_skadis_holder() {
    difference() {
        union() {
            
            //Vertical wall
            color("green")
            cube([sh_width,sh_material_size,sh_height]);
            
            // Retainer
            color("blue")
            translate([0,0,sh_height-sh_hanger_spacing])
            cube([sh_width,sh_hanger_spacing+sh_material_size*2+1,sh_hanger_spacing]);
            
            //Vertical wall (short)
            color("cyan")
            translate([0, sh_hanger_spacing+sh_material_size,sh_height-sh_short_tail-sh_hanger_spacing])
            cube([sh_width,sh_material_size+1,sh_short_tail]);

            //Schnöpsel
            color("yellow")
            translate([0, sh_material_size,0])
            cube([sh_width,sh_hanger_spacing,7]);
        }
        
        
    color("red")
    translate([-1,sh_material_size+sh_hanger_spacing/2,sh_height-sh_hanger_spacing])
    rotate([0,90,0])
    cylinder(sh_width+2, sh_hanger_spacing/2, sh_hanger_spacing/2);
        
    }
}
ikea_skadis_holder();