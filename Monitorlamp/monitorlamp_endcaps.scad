
ml_up_width=600;
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;


ml_endcap_width=ml_up_depth + 4;
ml_endcap_heigth=ml_up_heigth + 4;
ml_endcap_depth=7;
ml_endcap_groove_depth=5;
ml_dif_thickness=0.4;

difference() {
    cube([ml_endcap_width, ml_endcap_depth, ml_endcap_heigth]);

    // left side
    color("red")
    translate([(ml_endcap_heigth - ml_up_heigth) / 2, -1, (ml_endcap_heigth - ml_up_heigth) / 2 - 0.1])
    cube([ml_up_thickness + 0.2, ml_endcap_groove_depth + 1, ml_up_heigth + 0.2]);

    // top
    color("pink")
    translate([(ml_endcap_heigth - ml_up_heigth) / 2 + ml_up_thickness - 1, -1, ml_up_heigth - 0.1])
    cube([ml_up_depth - ml_up_thickness - ml_up_thickness + 2, ml_endcap_groove_depth + 1, ml_up_thickness + 0.2]);

    // right side
    color("red")
    translate([ml_endcap_width - ml_up_thickness - (ml_endcap_heigth - ml_up_heigth) / 2 - 0.2, -1,  (ml_endcap_heigth - ml_up_heigth) / 2 - 0.1])
    cube([ml_up_thickness + 0.2, ml_endcap_groove_depth + 1, ml_up_heigth + 0.2]);

    // bottom (diffusor)
    color("violet")
    translate([1, -1, ml_up_thickness - 0.2])
    cube([ml_up_depth + 2, ml_endcap_groove_depth + 1, ml_dif_thickness + 0.2]);
}