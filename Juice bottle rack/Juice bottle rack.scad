$fn = 400;

jbr_material_thickness = 5;
jbr_bottle_dia = 87;
jbr_wide = 230;
jbr_height = 230;

difference() {
    cube([jbr_wide, jbr_material_thickness, jbr_height]);

    // bottle bottom left
    color("red")
    rotate([90,0,0])
    translate([jbr_bottle_dia / 2 + jbr_material_thickness,
                    jbr_bottle_dia / 2 + jbr_material_thickness, 
                    - jbr_material_thickness - 1])
    cylinder(jbr_material_thickness + 2, jbr_bottle_dia / 2, jbr_bottle_dia / 2);

    // bottle bottom right
    color("red")
    rotate([90,0,0])
    translate([jbr_wide - jbr_bottle_dia / 2 - jbr_material_thickness, 
                jbr_bottle_dia / 2 + jbr_material_thickness,
                - jbr_material_thickness - 1])
    cylinder(jbr_material_thickness + 2, jbr_bottle_dia / 2, jbr_bottle_dia / 2);

    // bottle center
    color("red")
    rotate([90,0,0])
    translate([jbr_wide / 2, 
                jbr_wide / 2,
                - jbr_material_thickness - 1])
    cylinder(jbr_material_thickness + 2, jbr_bottle_dia / 2, jbr_bottle_dia / 2);

    // bottle top left
    color("red")
    rotate([90,0,0])
    translate([jbr_bottle_dia / 2 + jbr_material_thickness,
                jbr_height - jbr_bottle_dia / 2 - jbr_material_thickness,
                - jbr_material_thickness - 1])
    cylinder(jbr_material_thickness + 2, jbr_bottle_dia / 2, jbr_bottle_dia / 2);

    // bottle top right
    color("red")
    rotate([90,0,0])
    translate([jbr_wide - jbr_bottle_dia / 2 - jbr_material_thickness,
                jbr_height - jbr_bottle_dia / 2 - jbr_material_thickness,
                - jbr_material_thickness - 1])
    cylinder(jbr_material_thickness + 2, jbr_bottle_dia / 2, jbr_bottle_dia / 2);

    // Cutout left
    color("red")
    translate([jbr_material_thickness, -1, jbr_material_thickness * 2 + jbr_bottle_dia])
    cube([jbr_wide / 2 - (jbr_bottle_dia / 2 + jbr_material_thickness * 2), 
            jbr_material_thickness + 2, 
            jbr_height - (jbr_bottle_dia * 2 + jbr_material_thickness * 4)]);

    // Cutout left
    color("red")
    translate([jbr_wide / 2 + jbr_bottle_dia / 2 + jbr_material_thickness, -1, jbr_material_thickness * 2 + jbr_bottle_dia])
    cube([jbr_wide / 2 - (jbr_bottle_dia / 2 + jbr_material_thickness * 2), 
            jbr_material_thickness + 2, 
            jbr_height - (jbr_bottle_dia * 2 + jbr_material_thickness * 4)]);

    // Cutout top
    color("red")
    translate([jbr_bottle_dia + jbr_material_thickness * 2, -1, jbr_height - jbr_material_thickness])
    rotate([0,90,0])
    cube([jbr_wide / 2 - (jbr_bottle_dia / 2 + jbr_material_thickness * 2), 
            jbr_material_thickness + 2, 
            jbr_height - (jbr_bottle_dia * 2 + jbr_material_thickness * 4)]);

    // Cutout bottom
    color("red")
    translate([jbr_wide - jbr_bottle_dia - jbr_material_thickness * 2, -1, jbr_material_thickness])
    rotate([0,270,0])
    cube([jbr_wide / 2 - (jbr_bottle_dia / 2 + jbr_material_thickness * 2), 
            jbr_material_thickness + 2, 
            jbr_height - (jbr_bottle_dia * 2 + jbr_material_thickness * 4)]);
        
}