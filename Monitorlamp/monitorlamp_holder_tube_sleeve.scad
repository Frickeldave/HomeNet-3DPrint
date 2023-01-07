$fn=100;


ml_clip_width=50; // Default: 50. The width of the clip
ml_clip_depth=30.2; // This is the width of the lamp. I used an U-profile with a size of 30mm. Recommendation to add 0.2 to fit perfectly. 
ml_clip_heigth=20.6; // The height of the lamp. This is the height of the U-Profile and the thickness of the diffusor. the Diffusor has a thickenss of 0.4 and i recommnd to add another 0.2mm to fit perfectly (20.6 for 20 mm profile).
ml_clip_thickness=1.0; // The material thickness of the clip (One mm will be added automatically)

ml_pipe_diameter=21.3; // The diameter of the pipe which holds the lamp. "ml_pipe_sleeve_extension" will automatically be added, so that the holder slips well over the tube.
ml_pipe_sleeve_extension=0.4;
ml_pipe_sleeve_length=100;
ml_pipe_sleeve_thickness=1.5;


module lamp_pipe_sleeve(d, l, t, e, bl) {
    r_outer = (d + e + t * 2) / 2;
    d_outer = d + e + t * 2;
    difference() {
        union() {
            cylinder(h=l, r=r_outer);

            color("green")
            translate([0, -r_outer, l - bl])
            cube([r_outer, d_outer, bl]);
        }

        // Pipe-sleeve
        color("red")
        translate([0,0,-t])
        cylinder(h=l, r=(d + e) / 2);
    }


    difference() {
        translate([0, 0, l - bl])
        cylinder(h=t, r=r_outer);
        translate([0, 0, l - bl - 1])
        cylinder(h=t+2, r=(d + e) / 2 - 1);
    }
}

difference() {
        
    // The part which will be put on the pipe
    translate([ml_clip_width/2, 
                ml_pipe_sleeve_length, 
                ml_clip_heigth + ml_clip_thickness * 2 + ((ml_pipe_diameter + ml_pipe_sleeve_thickness + ml_pipe_sleeve_extension ) / 2)])
    rotate([90,90,0])
    lamp_pipe_sleeve(ml_pipe_diameter,
                ml_pipe_sleeve_length, 
                ml_pipe_sleeve_thickness,
                ml_pipe_sleeve_extension, 
                ml_clip_depth + ml_clip_thickness * 2 + 2);

    // The hole between clip and case
    color("red")
    translate([ml_clip_width/2, ml_clip_depth - 7.5, ml_clip_heigth])
    cylinder(h=6, r=7.5);

}