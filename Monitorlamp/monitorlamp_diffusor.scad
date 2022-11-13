// The measures of the u-profile
ml_up_width=600;
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;

ml_dif_part_count=3;
ml_dif_thickness=0.4;

mf_dif_depth=ml_up_depth - ml_up_thickness - ml_up_thickness - 0.2;
mf_dif_width=ml_up_width / ml_dif_part_count;

cube([mf_dif_width, mf_dif_depth, ml_dif_thickness]);