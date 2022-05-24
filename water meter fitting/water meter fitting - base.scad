
$fn=400;

// The length of the complete fitting (In this drawing X-Axis).
wmfitting_width=190;
// The depth of the complete fitting (In this drawing Y-Axis).
wmfitting_depth=50;
// The thickness of the base plate (you put at the wall).
wmfitting_base_thickness=10;
// The thickness of the upright supports where you place the water meter on.
wmfitting_upright_thickness=13;
// The distance of the pipes from the wall.
wmfitting_pipe_height=90;
// The diameter of the tubes (measured on 2 flat opposite sides).
wmfitting_pipe_diameter=22;
// The thickness of the reinforcements.
wmfitting_reinforment_thickness=5;
// The diameter of the whole of the screws you want to use.
wmfitting_screwhole_diameter=6.5;
// The diameter of the nutes (measured on 2 flat opposite sides).
wmfitting_nut_diameter=10;
// The height of the nutes.
wmfitting_nut_height=4;
// The size of the holes for the mounting screws (Recommended to add 0.5mm)
wmfitting_mounting_screw_diameter=6.5;


module triangle(size, thick){
    difference() {
        color("black")
        cube([size,thick,size]);
     
        // Calculate the cube size for the difference by using the 
            // pythagorean theorem "Square root of a² and b²"
        color("red")
        //translate([x,y-1,z+size])
        translate([0,0-1,0+size])
        rotate([0,45,0])
        cube([sqrt(size^2 + size^2),thick+2,sqrt(size^2 + size^2)/2]);   
    }
}

module upright(thickness, depth, height, pos_x, pos_y, pos_z, dia_pipe, pipe_pos_center){  
    difference() {
        difference() {
            // the base body
            color("grey")
            translate([pos_x, pos_y, pos_z])
            cube([thickness, depth, height+30]);

            // Support surface for the water meter
            translate([pos_x-1,depth/2,pipe_pos_center+dia_pipe/2])
            rotate([0,90,0])
            cylinder($fn = 6, r = dia_pipe/2, h = thickness+2);
        }
        
        // Cut off the the upper part
        color("red")
        translate([pos_x-1, pos_y-1, (pipe_pos_center+dia_pipe/2)-1])
        cube([thickness+2, depth+2, 21 + wmfitting_base_thickness]);
    }
}

module screw_hole(srew_dia, nut_dia, nut_height, pos_x, pos_y, pos_z) {
    
    union() {    
        color("red")
        translate([pos_x, pos_y, pos_z])
        cylinder(wmfitting_pipe_height + wmfitting_base_thickness + 2, srew_dia/2, srew_dia/2);

        color("red")
        translate([pos_x, pos_y, pos_z])
        cylinder($fn = 6, r = nut_dia/2, h = nut_height);
    }
}
module mounting(srew_dia, size, height, pos_x, pos_y, pos_z) {
    
    color("grey")
    translate([pos_x + size, pos_y + size, pos_z + height])
    rotate([270,0,180])
    triangle(size, height);   
    
    difference() {
        translate([pos_x + size, pos_y, pos_z])
        color("grey")
        cube([size, size, height]);
        
        translate([pos_x + size + size / 2, pos_y + size / 2, pos_z - 1])
        cylinder(height + 2, srew_dia/2, srew_dia/2);
    }
    
    color("grey")
    translate([pos_x + size + size, pos_y + size, pos_z + height])
    rotate([270,0,270])
    triangle(size, height);
}

difference()
{
    union() {
        
        // base plate
        cube([wmfitting_width, wmfitting_depth, wmfitting_base_thickness]);
        
        // base plate holder (bottom left)
        mount_plate_size=wmfitting_mounting_screw_diameter + 12;
        mounting(wmfitting_mounting_screw_diameter, mount_plate_size, wmfitting_base_thickness, 0, -mount_plate_size, 0);

        // base plate holder (bottom right)
        mounting(wmfitting_mounting_screw_diameter, mount_plate_size, wmfitting_base_thickness,wmfitting_width - mount_plate_size * 3, -mount_plate_size, 0);
        
        // base plate holder (top left)
        rotate([180,0,0])
        mounting(wmfitting_mounting_screw_diameter, mount_plate_size, wmfitting_base_thickness, 0, -wmfitting_depth - mount_plate_size, -wmfitting_base_thickness);
        
        // base plate holder (top right)
        rotate([180,0,0])
        mounting(wmfitting_mounting_screw_diameter, mount_plate_size, wmfitting_base_thickness, wmfitting_width - mount_plate_size * 3, -wmfitting_depth - mount_plate_size, -wmfitting_base_thickness);
        
        // left upright
        upright(thickness=wmfitting_upright_thickness, depth=wmfitting_depth, height=wmfitting_pipe_height, pos_x=0, pos_y=0, pos_z=wmfitting_base_thickness, dia_pipe=wmfitting_pipe_diameter, pipe_pos_center=wmfitting_pipe_height);

        // right upright
        upright(thickness=wmfitting_upright_thickness, depth=wmfitting_depth, height=wmfitting_pipe_height, pos_x=wmfitting_width - wmfitting_upright_thickness, pos_y=0, pos_z=wmfitting_base_thickness, dia_pipe=wmfitting_pipe_diameter, pipe_pos_center=wmfitting_pipe_height);

        // Angles for reinforcing the base plate (Left side)
        translate([wmfitting_upright_thickness, 0, wmfitting_base_thickness])
        triangle(size=30,thick=wmfitting_reinforment_thickness);
        translate([wmfitting_upright_thickness, wmfitting_depth - wmfitting_reinforment_thickness, wmfitting_base_thickness])
        triangle(size=30,thick=wmfitting_reinforment_thickness);

        // Angles for reinforcing the base plate (Right side)
        translate([wmfitting_width - wmfitting_upright_thickness, 0, wmfitting_base_thickness])
        mirror([1,0,0])
        triangle(size=30,thick=wmfitting_reinforment_thickness);
        translate([wmfitting_width - wmfitting_upright_thickness, wmfitting_depth - wmfitting_reinforment_thickness, wmfitting_base_thickness])
        mirror([1,0,0])
        triangle(size=30,thick=wmfitting_reinforment_thickness);
    }
    
    // Drill the screw holes
    screw_hole(wmfitting_screwhole_diameter, wmfitting_nut_diameter, wmfitting_nut_height+1, wmfitting_upright_thickness/2, 7, -1);
    
    screw_hole(wmfitting_screwhole_diameter, wmfitting_nut_diameter, wmfitting_nut_height+1, wmfitting_upright_thickness/2, wmfitting_depth - 7, -1);
    
    screw_hole(wmfitting_screwhole_diameter, wmfitting_nut_diameter, wmfitting_nut_height+1, wmfitting_width - wmfitting_upright_thickness/2, 7, -1);
    
    screw_hole(wmfitting_screwhole_diameter, wmfitting_nut_diameter, wmfitting_nut_height+1, wmfitting_width - wmfitting_upright_thickness/2, wmfitting_depth - 7, -1);

}


    