
$fn=400;

dp_height=110;
dp_width=20;
dp_hanger_spacing=13;
dp_material_size=4;
dp_short_tail=10;

difference() {
    union() {
        //Vertical wall
        color("green")
        cube([dp_width,dp_material_size,dp_height]);
        
        // Retainer
        color("blue")
        translate([0,0,dp_height-dp_hanger_spacing])
        cube([dp_width,dp_hanger_spacing+dp_material_size*2,dp_hanger_spacing]);
        
        //Vertical wall (short)
        color("green")
        translate([0, dp_hanger_spacing+dp_material_size,dp_height-dp_short_tail-dp_hanger_spacing])
        cube([dp_width,dp_material_size,dp_short_tail]);
    }
    
    
color("red")
translate([-1,dp_material_size+dp_hanger_spacing/2,dp_height-dp_hanger_spacing])
rotate([0,90,0])
cylinder(dp_width+2, dp_hanger_spacing/2, dp_hanger_spacing/2);
    
}
