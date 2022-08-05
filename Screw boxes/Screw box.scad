
$fn=400;

box_sidewall_thickness=1.5;
box_ground_thickness=1.5;
box_outer_size_width=100;
box_outer_size_depth=100;
box_outer_height=55;
box_label_width=37;
box_label_height=5;
box_corner_support_size=4;

module corner_support(width, height) {
    
    label_frame=3;

    union() {

        // Create the support structure
        difference() {
            cube([width,height,height]);
            
            // Calculate the cube size for the difference by using the 
            // pythagorean theorem "Square root of a² and b²"
            tmp=sqrt((height)^2 + (height)^2);
            color("red") 
            rotate([45,0,0])
            translate([-1, 0, -tmp/2])
            cube([width+2, tmp/2, tmp]);   
        }
    }
}

module label(plate_width, plate_height, label_width, label_height, label_thickness, pos_x, pos_y, pos_z) {
    plate_thickness = 1;

    union() {
        difference() {
            // Draw a plate that is a bit larger than the label on each side
            color("blue")
            translate([pos_x, pos_y, pos_z])
            cube([plate_width, plate_height, plate_thickness]);
            // Draw a sink for the paper label
            color("green")
            translate([
                    pos_x + (plate_width - label_width)/2,
                    pos_y + (plate_height - label_height)/2,
                    pos_z + plate_thickness - label_thickness])
            cube([label_width, label_height, label_thickness+1]);
        }
        
        translate([pos_x,pos_y,pos_z - plate_height])
        corner_support(plate_width, plate_height);
    }
}

union() {
    // Create the box by differencing one cube with another one
    difference() {
        cube([box_outer_size_width, box_outer_size_depth, box_outer_height]);
        translate([box_sidewall_thickness, box_sidewall_thickness, box_ground_thickness])
        cube([box_outer_size_width - box_sidewall_thickness*2, box_outer_size_depth - box_sidewall_thickness*2,box_outer_height]);
    }

    // Add the label compoent
    label(
            box_outer_size_width - box_sidewall_thickness*2,                      // plate_width
            box_label_height+2,                                                   // plate_height (The paper label + 2mm). This will also be the height of the support structure. 
            box_label_width,                                                      // label_width
            box_label_height,                                                     // label_height
            0.2,                                                                  // label_thickness
            box_sidewall_thickness,                                               // pos_x
            box_outer_size_depth - box_label_height - 2 - box_sidewall_thickness, // pos_y
            box_outer_height - 1                                                  // pos_z
    );
    
    // Add the support structure in left bottom corner
    color("blue")
    translate([box_corner_support_size + box_sidewall_thickness,
                box_corner_support_size + box_sidewall_thickness,
                box_outer_height])
    rotate([180,90,0])
    corner_support(box_outer_height - box_ground_thickness,box_corner_support_size);
    
    // Add the support structure in right bottom corner
    color("blue")
    translate([box_outer_size_width - box_corner_support_size - box_sidewall_thickness,
                box_corner_support_size + box_sidewall_thickness,
                box_outer_height])
    rotate([90,90,0])
    corner_support(box_outer_height - box_ground_thickness,box_corner_support_size);
    
    // Add the support structure in left upper corner
    color("blue")
    translate([box_corner_support_size + box_sidewall_thickness,
                box_outer_size_depth - box_corner_support_size - box_sidewall_thickness,
                box_outer_height])
    rotate([270,90,0])
    corner_support(box_outer_height - box_ground_thickness,box_corner_support_size);
    
    // Add the support structure in right upper corner
    color("blue")
    translate([box_outer_size_width - box_corner_support_size - box_sidewall_thickness,
                box_outer_size_depth - box_corner_support_size - box_sidewall_thickness,
                box_outer_height])
    rotate([0,90,0])
    corner_support(box_outer_height - box_ground_thickness,box_corner_support_size);
    
    // Add the support structure at the ground (top)
    color("grey")
    translate([box_sidewall_thickness,
                box_outer_size_depth - box_corner_support_size - box_sidewall_thickness,
                box_corner_support_size + box_ground_thickness])
    mirror([0,0,1])
    corner_support(box_outer_size_width - box_sidewall_thickness*2,box_corner_support_size);
    
    // Add the support structure at the ground (left)
    color("grey")
    translate([box_corner_support_size + box_sidewall_thickness,
                0,
                box_corner_support_size + box_ground_thickness])
    rotate([0,0,90]) 
    mirror([0,0,1])
    corner_support(box_outer_size_depth - box_sidewall_thickness*2,box_corner_support_size);

    // Add the support structure at the ground (right)
    color("grey")
    translate([box_outer_size_width - box_corner_support_size - box_sidewall_thickness,
                + box_outer_size_depth,
                box_corner_support_size + box_ground_thickness])
    rotate([0,0,270]) 
    mirror([0,0,1])
    corner_support(box_outer_size_depth - box_sidewall_thickness*2,box_corner_support_size);

    // Add the support structure at the ground (bottom)
    color("grey")
    translate([box_outer_size_width,
                box_corner_support_size + box_sidewall_thickness,
                box_corner_support_size + box_ground_thickness])
    rotate([0,0,180]) 
    mirror([0,0,1])
    corner_support(box_outer_size_width - box_sidewall_thickness*2,box_corner_support_size);
}
