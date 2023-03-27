$fn=200;
mm_pipe_diameter=21.5; // Use the real measure of your pipe here. One size will be reduced by "mm_pipe_reduction" to obtain a clamping effect
mm_pipe_reduction=0.5; // Reduce the pipe size to clamp the pipes
w=60; // You can play around here. I used xx mm for my 4 24" Zoll monitors.
mm_thickness=4; // The material thickness. I used xx mm.
mm_holder_depth=12; // The width of the holder for the screws. Recommended: 12mm. It will be integrated 2 mm into the cube, in reality you get ~10mm when using 12mm. 
mm_holder_thickness=4; // The thickness of the holder for the screws. Recommended: 4mm, max. 6.
mm_screw_diameter=5; // The diameter of the screws you want to use

// w   = width
// h   = height
// t   = thickness
// shd = screw hole diameter
// shc = screw hole count
module mm_holder_plate(w, d, t, shd, shc) {
    difference() {
        
        // Create the base plate
        cube([w, d, t]);
    }
    
}

module mm_reinforcement(w, h, t) {

            linear_extrude(t)
            polygon(points=[
                [0, 0],
                [0, w],
                [h, 0]
            ]);
}

module mm_holder(w, shc) {

    _reinforcement_distance = (w - mm_holder_thickness * (shc + 1)) / shc;
    difference() {

        union() {
            cylinder(h=w, r=mm_pipe_diameter/2 + mm_thickness);

            color("lightgreen")
            translate([0, - mm_pipe_diameter / 2 - mm_holder_depth - mm_thickness + 2, w])
            rotate([0,90,0])
            mm_holder_plate(w, mm_holder_depth, mm_holder_thickness, mm_screw_diameter, shc);

            color("lightgreen")
            translate([mm_holder_thickness, mm_pipe_diameter /2 + mm_holder_depth + mm_thickness - 2, w])
            rotate([180,90,0])
            mm_holder_plate(w, mm_holder_depth, mm_holder_thickness, mm_screw_diameter, shc);

            // reinforcements
            for(i = [0 : 1 : shc]) {
                // Add the reinforcements side 1
                color("grey")
                translate([mm_holder_thickness, 0, _reinforcement_distance * i + mm_holder_thickness * i])
                mm_reinforcement(mm_holder_depth + mm_pipe_diameter / 2 + mm_holder_thickness - 2, mm_pipe_diameter / 2 , mm_holder_thickness);

                // Add the reinforcements side 2
                color("grey")
                rotate([180,0,0])
                translate([mm_holder_thickness, 0, - _reinforcement_distance * i - mm_holder_thickness * (i + 1)])
                mm_reinforcement(mm_holder_depth + mm_pipe_diameter / 2 + mm_holder_thickness - 2, mm_pipe_diameter / 2 , mm_holder_thickness);
            }

        }

        color("red")
        translate([0,0,-1])
        cylinder(h=w + 2, r=mm_pipe_diameter/2);

        color("red")
        translate([-mm_pipe_diameter / 2 - mm_thickness, - mm_pipe_diameter / 2 - mm_thickness - 1, -1])
        cube([mm_pipe_diameter / 2 + mm_thickness, mm_pipe_diameter + mm_thickness * 2 + 2, w + 2]);

        color("red")
        translate([-mm_pipe_diameter / 2 - mm_thickness, - mm_pipe_diameter / 2 - mm_thickness - 2 - mm_holder_depth, -1])
        cube([mm_pipe_diameter / 2 + mm_thickness + mm_pipe_reduction, mm_pipe_diameter + mm_thickness * 2 + + mm_holder_depth * 2 + 4, w + 2]);

        // Cut out screw holes
        for(i = [1 : 1 : shc]) {
            
            // Screw holes side 1
            color("red")
            translate([mm_holder_thickness - mm_holder_thickness - 1, mm_holder_depth + 7, _reinforcement_distance * i + mm_holder_thickness * i - _reinforcement_distance / 2])
            rotate([0,90,0])
            cylinder(mm_holder_thickness + 2, r=mm_screw_diameter/2);

            // Screw holes side 2
            color("red")
            translate([mm_holder_thickness - mm_holder_thickness - 1, - mm_holder_depth - 7, _reinforcement_distance * i + mm_holder_thickness * i - _reinforcement_distance / 2])
            rotate([0,90,0])
            cylinder(mm_holder_thickness + 2, r=mm_screw_diameter/2);
        }
    }
}

