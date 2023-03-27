
module plugin_tube(tube_height, tube_width,tube_material_size,tube_distance, reinforcements) {
    
    difference() {
        cylinder(h=tube_height,r=tube_width/2);
        translate([0,0,-1])
        cylinder(h=tube_height+2,r=tube_width/2-tube_material_size);
    }

    // middle reinforcement
    if(tube_distance > 2 && reinforcements == 1) {
        color("green")
        translate([ - tube_material_size /2,tube_width/2,0])
        cube([tube_material_size, tube_distance, tube_height]);
    }

    // reinforcement  triangle for left holder
    if(tube_distance > 4 && reinforcements == 1) {
        translate([-tube_width/2, tube_distance + tube_width/2 - tube_distance, tube_distance + tube_height])
        rotate([0,90,0])
        linear_extrude(height=tube_material_size)
        polygon(points = [ [0, tube_distance], [tube_distance, tube_distance], [tube_distance, 0]]);
    }

    // left holder
    color("green")
    translate([-tube_width/2, 0, 0])
    cube([tube_material_size,tube_distance + tube_width/2,tube_height]);

    // right holder
    color("green")
    translate([tube_width/2 - tube_material_size, 0, 0])
    cube([tube_material_size,tube_distance + tube_width/2,tube_height]);

    // reinforcement  triangle for right holder
    if(tube_distance > 4 && reinforcements == 1) {
        translate([tube_width/2 - tube_material_size, tube_distance + tube_width/2 - tube_distance, tube_distance + tube_height])
        rotate([0,90,0])
        linear_extrude(height=tube_material_size)
        polygon(points = [ [0, tube_distance], [tube_distance, tube_distance], [tube_distance, 0]]);
    }
}

plugin_tube(10, 30, 2, 5, 1);