$fn=200;
mm_pipe_diameter=21.3; // Use the real measure of your pipe here. We will substract the "mm_pipe_reduction" to obtain a clamping effect
mm_pipe_reduction=0.5; // Reduce the pipe size to clamp the pipes
mm_width=30; // You can play around here. I used xx mm for my 4 24" Zoll monitors.
mm_thickness=4; // The material thickness. I used xx mm.
mm_holder_depth=10; // The width of the holder for the screws. Recommended: 10mm
mm_holder_thickness=4; // The thickness of the holder for the screws. Recommended: 4mm, max. 6.
mm_screw_diameter=5; // The diameter of the screws you want to use


module mm_holder(w, d, t, sd) {
    difference() {
        cube([w, d + t, t]);

        color("red")
        translate([7, d / 2, -1])
        rotate([0,0,0])
        cylinder(h=t + 2, r=5/2);

        color("red")
        translate([w - 7, d / 2, -1])
        rotate([0,0,0])
        cylinder(h=t + 2, r=sd/2);
    }
}

difference() {
    union() {
        cylinder(h=mm_width, r=mm_pipe_diameter/2 + mm_thickness);

        translate([0, - mm_pipe_diameter - mm_thickness, mm_width])
        rotate([0,90,0])
        mm_holder(mm_width, mm_holder_depth, mm_holder_thickness, mm_screw_diameter);

        translate([mm_holder_thickness, mm_pipe_diameter + mm_thickness, mm_width])
        rotate([180,90,0])
        mm_holder(mm_width, mm_holder_depth, mm_holder_thickness, mm_screw_diameter);
    }

    color("red")
    translate([0,0,-1])
    cylinder(h=mm_width + 2, r=mm_pipe_diameter/2);

    color("red")
    translate([-mm_pipe_diameter / 2 - mm_thickness, - mm_pipe_diameter / 2 - mm_thickness - 1, -1])
    cube([mm_pipe_diameter / 2 + mm_thickness, mm_pipe_diameter + mm_thickness * 2 + 2, mm_width + 2]);

    color("red")
    translate([-mm_pipe_diameter / 2 - mm_thickness, - mm_pipe_diameter / 2 - mm_thickness - 2 - mm_holder_depth, -1])
    cube([mm_pipe_diameter / 2 + mm_thickness + mm_pipe_reduction, mm_pipe_diameter + mm_thickness * 2 + + mm_holder_depth * 2 + 4, mm_width + 2]);
}
