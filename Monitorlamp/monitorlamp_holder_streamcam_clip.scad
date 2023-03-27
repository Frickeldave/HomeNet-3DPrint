$fn=100;


ml_clip_width=50; // Default: 50. The width of the clip
ml_clip_depth=30.2; // This is the width of the lamp. I used an U-profile with a size of 30mm. Recommendation to add 0.2 to fit perfectly. 
ml_clip_heigth=20.6; // The height of the lamp. This is the height of the U-Profile and the thickness of the diffusor. the Diffusor has a thickenss of 0.4 and i recommnd to add another 0.2mm to fit perfectly (20.6 for 20 mm profile).
ml_clip_thickness=1.0; // The material thickness of the clip (One mm will be added automatically)

ml_pipe_diameter=21.3; // The diameter of the pipe which holds the lamp. "ml_pipe_sleeve_extension" will automatically be added, so that the holder slips well over the tube.
ml_pipe_sleeve_extension=0.4;
ml_pipe_sleeve_length=100;
ml_pipe_sleeve_thickness=1.5;


inner_dia = ml_pipe_diameter + ml_pipe_sleeve_extension + ml_pipe_sleeve_thickness;
difference() {
    cylinder(h = 20, r = (inner_dia +  ml_pipe_sleeve_thickness) / 2);
    translate([0, 0, -1])
    cylinder(h = 22, r = inner_dia / 2);

}

    translate([0, -inner_dia / 2 - ml_pipe_sleeve_thickness * 2, 0])
    cube([inner_dia, inner_dia  + ml_pipe_sleeve_thickness * 4, inner_dia]);