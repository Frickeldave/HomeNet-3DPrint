$fn=400;

rmc_width = 140;
rmc_depth = 65;
rmc_material_thickness = 1.5;

module lid_clip() {
    // Lid clips
    rotate([0,0,90])
    translate([-rmc_material_thickness,0,0])
    cube([15 + rmc_material_thickness, rmc_material_thickness * 2, 12]);
    // Create cliper-dingens
    color("grey")
    rotate([0,0,0])
    translate([0, 4.7, 1.5])
    linear_extrude(height=9)
    polygon(points = [[0, 0], [rmc_material_thickness, 0], [0, 9]]);
}

difference() {
    union() {
        // main cover
        cube([rmc_width, rmc_depth, rmc_material_thickness]);

        // Frame
        translate([rmc_material_thickness, rmc_material_thickness, rmc_material_thickness])
        cube([rmc_width - rmc_material_thickness * 2 - 0.2, rmc_depth  - rmc_material_thickness * 2 - 0.2, rmc_material_thickness]);

    }
    // Frame cutout
    color("red")
    translate([rmc_material_thickness * 2, rmc_material_thickness * 2, rmc_material_thickness])
    cube([rmc_width - rmc_material_thickness * 4 - 0.1, rmc_depth  - rmc_material_thickness * 4 - 0.2, rmc_material_thickness + 1]);    

    // Drill the hole for the antenna 
    color("red")
    translate([58,rmc_depth -30, -1])
    cylinder(h=rmc_material_thickness+2, r=1.5);

}


// Lid clips
// Front left
translate([11 + 10, rmc_material_thickness + 0.2, rmc_material_thickness * 2])
rotate([90,0,270])
lid_clip();

// Front right
translate([rmc_width -9, rmc_material_thickness + 0.2, rmc_material_thickness * 2])
rotate([90,0,270])
lid_clip();

// Back left
translate([9, rmc_depth - rmc_material_thickness - 0.5, rmc_material_thickness * 2])
rotate([90,0,90])
lid_clip();

// Back left
translate([rmc_width -11 - 10, rmc_depth - rmc_material_thickness - 0.5, rmc_material_thickness * 2])
rotate([90,0,90])
lid_clip();
