
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;

ml_h_width=20; 
ml_h_thickness=1;


module lamp_clip(width) {
    difference() {

        // Outer shape
        cube([width, ml_up_depth + ml_h_thickness * 2, ml_up_heigth + ml_h_thickness * 2]);

        // cutout
        translate([-1, ml_h_thickness, ml_h_thickness])
        cube([width + 2, ml_up_depth, ml_up_heigth]);

        //Cut out the lower part of the clip
        color("red")
        translate([-1, ml_up_thickness+2, -1])
        cube([width + 2, ml_up_depth - ml_up_thickness - 4, ml_h_thickness + 2]);
    }
}

lamp_clip(ml_h_width);