
$fn=400;

gsff_max_height=90;
gsff_width=30;
gsff_motion_range=40;
gsff_material_size=4;
gsff_hole_size=5;

module slotted_hole(thickness, width, length) {
     
    union() {
    
        color("red")
        rotate([0,0,0])
        cylinder(thickness, width/2, width/2);
        
        color("red")
        translate([length,0,0])
        rotate([0,0,0])
        cylinder(thickness, width/2, width/2);
        
        color("red")
        translate([0,-width/2,0])
        rotate([90,0,90])
        cube([width, thickness, length]);
    }
}



difference() {

    union() {
        //Vertical wall
        color("green")
        cube([gsff_width,gsff_material_size,gsff_max_height/2]);
        
        // Retainer
        color("blue")
        translate([0,gsff_material_size,gsff_max_height/2 - gsff_material_size])
        cube([gsff_width,14+gsff_material_size,gsff_material_size]);
    }

    // Retaining groove
    color("red")
    translate([-1,gsff_material_size+10+1+gsff_material_size,gsff_max_height/2-gsff_material_size])
    rotate([0,90,0])
    cylinder(h=gsff_width+2,r=1);
   
    // Slotted hole
    translate([gsff_width/2,gsff_material_size+1,gsff_max_height/2-10])
    rotate([90,90,0])
    slotted_hole(gsff_material_size+2,          //thickness
                    gsff_hole_size,             //hole_size
                    gsff_max_height/2-20);      //length

}
