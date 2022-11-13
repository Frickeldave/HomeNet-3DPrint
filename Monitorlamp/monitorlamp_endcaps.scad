
use <./monitorlamp_vars.scad>

ml_up_width=600;
ml_up_depth=30;
ml_up_heigth=20;
ml_up_thickness=2;


ml_endcap_width=ml_up_depth + 4;
ml_endcap_heigth=ml_up_heigth + 4;
ml_endcap_depth=9;
ml_endcap_groove_depth=7;

difference() {
    cube([ml_endcap_width, ml_endcap_depth, ml_endcap_heigth]);

    color("red")
    translate([(ml_endcap_heigth - ml_up_heigth) / 2, -1, (ml_endcap_heigth - ml_up_heigth) / 2])
    cube([ml_up_thickness, ml_endcap_groove_depth + 1, ml_up_heigth]);

    color("pink")
    translate([(ml_endcap_heigth - ml_up_heigth) / 2 + ml_up_thickness - 1, -1, ml_up_heigth])
    cube([ml_up_depth - ml_up_thickness - ml_up_thickness + 2, ml_endcap_groove_depth + 1, ml_up_thickness]);

    color("red")
    translate([ml_endcap_width - ml_up_thickness - (ml_endcap_heigth - ml_up_heigth) / 2, -1,  (ml_endcap_heigth - ml_up_heigth) / 2])
    cube([ml_up_thickness, ml_endcap_groove_depth + 1, ml_up_heigth]);
}