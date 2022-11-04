$fn=400;

// The depth of the complete fitting (In this drawing Y-Axis).
pcf_depth=50;

// The thickness of the upright supports where you place the water meter on.
pcf_thickness=13;

// The diameter of the pipe.
pcf_pipe_diameter=29;

// The diameter of the whole of the screws you want to use.
pcf_screwhole_diameter=5;

// The diameter screw head.
pcf_screw_head_diameter=8.5;

// The diameter screw head.
pcf_screw_head_hight=4;

pcf_body_height=pcf_pipe_diameter / 2 + 7;

difference() {

    // the base body
    color("grey")
    //translate([pos_x, pos_y, pos_z])
    cube([pcf_thickness, pcf_depth, pcf_body_height]);

    // Support surface for the water meter
    translate([-1, pcf_depth/2, -1])
    rotate([0,90,0])
    cylinder(r = pcf_pipe_diameter/2, h = pcf_pipe_diameter+2);
    
    // left screw
    color("red")
    translate([pcf_thickness / 2, 7, -1])
    cylinder(pcf_pipe_diameter/2+9, pcf_screwhole_diameter/2, pcf_screwhole_diameter/2);

    // left screw sink
    color("pink")
    translate([pcf_thickness / 2, 7, pcf_body_height - pcf_screw_head_hight])
    cylinder(h=pcf_screw_head_hight + 1, r1=pcf_screwhole_diameter / 2, r2=pcf_screw_head_diameter / 2 + 1);

    // right screw
    color("red")
    translate([pcf_thickness / 2, pcf_depth - 7, -1])
    cylinder(pcf_pipe_diameter/2+9, pcf_screwhole_diameter/2, pcf_screwhole_diameter/2);

    // right screw sink
    color("pink")
    translate([pcf_thickness / 2, pcf_depth - 7, pcf_body_height - pcf_screw_head_hight])
    cylinder(h=pcf_screw_head_hight + 1, r1=pcf_screwhole_diameter / 2, r2=pcf_screw_head_diameter / 2 + 1);

}






    