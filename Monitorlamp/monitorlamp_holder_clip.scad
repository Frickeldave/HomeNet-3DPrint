$fn=100;


ml_clip_width=50; // Default: 50. The width of the clip
ml_clip_depth=30.2; // This is the width of the lamp. I used an U-profile with a size of 30mm. Recommendation to add 0.2 to fit perfectly. 
ml_clip_heigth=20.6; // The height of the lamp. This is the height of the U-Profile and the thickness of the diffusor. the Diffusor has a thickenss of 0.4 and i recommnd to add another 0.2mm to fit perfectly (20.6 for 20 mm profile).
ml_clip_thickness=1.0; // The material thickness of the clip (One mm will be added automatically)

ml_pipe_diameter=21.3; // The diameter of the pipe which holds the lamp. "ml_pipe_sleeve_extension" will automatically be added, so that the holder slips well over the tube.
ml_pipe_sleeve_extension=0.4;
ml_pipe_sleeve_length=100;
ml_pipe_sleeve_thickness=1.5;

module lamp_clip(w, d, h, t) {
    difference() {

        union() {
            // Outer shape
            translate([0, 1, 0])
            cube([w, d + t * 2, h + t * 2]);

            // Static reinforcement of 1mm top
            color("pink")
            translate([0, 0, h + t+1])
            cube([w, d + t * 2 + 2, 1]);

            // Static reinforcement of 1mm side 1
            translate([0, 0, 0])
            cube([w, 1, h + t * 2]);

            // Static reinforcement of 1mm side 2
            translate([0, d + t * 2 + 1, 0])
            cube([w, 1, h + t * 2]);
        }

        // cutout
        translate([-1, t + 1, t])
        cube([w + 2, d, h]);

        //Cut out the lower part of the clip
        color("red")
        translate([-1, t + 2.5, -1])
        cube([w + 2, d - t - 2, t + 2]);

        //Cut out diffusor (3mm)
        color("red")
        translate([-1, 1, t])
        cube([w + 2, t + 1, 3.2]);

        //Cut out diffusor (3mm)
        color("red")
        translate([-1, d +  t, t])
        cube([w + 2, t + 1, 3]);

    }

}


difference() {
        
    //The clip which holds the lamp
    lamp_clip(ml_clip_width,
                ml_clip_depth,
                ml_clip_heigth,
                ml_clip_thickness);

    // The hole between clip and case
    color("red")
    translate([ml_clip_width/2, ml_clip_depth - 7.5, ml_clip_heigth])
    cylinder(h=6, r=7.5);

}