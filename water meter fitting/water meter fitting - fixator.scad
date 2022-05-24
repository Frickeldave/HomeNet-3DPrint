$fn=400;

// The depth of the complete fitting (In this drawing Y-Axis).
wmfitting_depth=50;

// The thickness of the upright supports where you place the water meter on.
wmfitting_upright_thickness=13;

// The diameter of the tubes (measured on 2 flat opposite sides).
wmfitting_pipe_diameter=22;

// The diameter of the whole of the screws you want to use.
wmfitting_screwhole_diameter=6.5;

difference() {
    // the base body
    color("grey")
    //translate([pos_x, pos_y, pos_z])
    cube([wmfitting_upright_thickness, wmfitting_depth, wmfitting_pipe_diameter/2+7]);

    // Support surface for the water meter
    translate([-1, wmfitting_depth/2, -1])
    rotate([0,90,0])
    cylinder($fn = 6, r = wmfitting_pipe_diameter/2, h = wmfitting_upright_thickness+2);
    
    color("red")
    translate([wmfitting_upright_thickness / 2, 7, -1])
    cylinder(wmfitting_pipe_diameter/2+9, wmfitting_screwhole_diameter/2, wmfitting_screwhole_diameter/2);

    color("red")
    translate([wmfitting_upright_thickness / 2, wmfitting_depth - 7, -1])
    cylinder(wmfitting_pipe_diameter/2+9, wmfitting_screwhole_diameter/2, wmfitting_screwhole_diameter/2);            
}