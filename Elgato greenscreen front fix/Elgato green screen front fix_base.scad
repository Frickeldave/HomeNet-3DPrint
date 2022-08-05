
$fn=400;

gsff_max_height=125;
gsff_width=30;
gsff_guide_rail_thickness=2;
gsff_motion_range=40;
gsff_material_size=4;
gsff_hole_size=5;
gsff_hole_size_base=4;

difference() {

    union() {
        color("green")
        translate([0,-gsff_material_size/2,0])
        cube([gsff_width,gsff_material_size,gsff_max_height/2]);
        
        color("blue")
        translate([0,-gsff_material_size/2-10,0])
        cube([gsff_width,gsff_material_size+20,gsff_material_size]);
        
        color("yellow")
        translate([-gsff_guide_rail_thickness,-gsff_material_size/2,0])
        cube([gsff_guide_rail_thickness,gsff_material_size*2,gsff_max_height/2]);
        
        color("yellow")
        translate([-gsff_guide_rail_thickness,-gsff_material_size/2-10,0])
        cube([gsff_guide_rail_thickness,gsff_material_size+20,gsff_material_size]);
        
        color("cyan")
        translate([gsff_width,-gsff_material_size/2,0])
        cube([gsff_guide_rail_thickness,gsff_material_size*2,gsff_max_height/2]);
        
        color("cyan")
        translate([gsff_width,-gsff_material_size/2-10,0])
        cube([gsff_guide_rail_thickness,gsff_material_size+20,gsff_material_size]);
    }

    color("red")
    translate([gsff_width/2,gsff_material_size-1,gsff_max_height/2-10])
    rotate([90,0,0])
    cylinder(h=gsff_material_size+2,r=gsff_hole_size/2);
    
    color("red")
    translate([5,-gsff_material_size/2 - 5,-1])
    cylinder(h=gsff_material_size+2,r=gsff_hole_size_base/2);

    color("red")
    translate([gsff_width-5,-gsff_material_size/2 - 5,-1])
    cylinder(h=gsff_material_size+2,r=gsff_hole_size_base/2);

    color("red")
    translate([5,2.5+gsff_material_size,-1])
    cylinder(h=gsff_material_size+2,r=gsff_hole_size_base/2);

    color("red")
    translate([gsff_width-5,2.5+gsff_material_size,-1])
    cylinder(h=gsff_material_size+2,r=gsff_hole_size_base/2);
}