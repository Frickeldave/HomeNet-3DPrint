// The measures of the u-profile
ml_up_width=496;
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;

ml_dif_part_count=3;
ml_dif_thickness=0.4;
mf_dif_width=ml_up_width / ml_dif_part_count;

ml_endcap_groove_depth=5;

difference() {
    union() {
        cube([mf_dif_width, ml_up_depth, ml_dif_thickness]);

        // Inner holder right
        color("cyan")
        translate([0, ml_up_thickness, ml_dif_thickness])
        cube([mf_dif_width, 1, 3 - ml_dif_thickness]);

        // Outer holder right
        color("cyan")
        translate([0, -1, 0])
        cube([mf_dif_width, 1, 3]);

        // Inner holder left
        color("blue")
        translate([0, ml_up_depth - ml_up_thickness - 1, ml_dif_thickness])
        cube([mf_dif_width, 1, 3 - ml_dif_thickness]);

        // Outer holder left
        color("blue")
        translate([0, ml_up_depth, 0])
        cube([mf_dif_width, 1, 3]);
    }
    color("red")
    translate([-1, -2, ml_dif_thickness])
    cube([ml_endcap_groove_depth + 1, ml_up_depth + 4, 4]);
}