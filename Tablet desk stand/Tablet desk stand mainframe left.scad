$fn=100;

// Measurement of the Samsung T310 8" tablet, which is used as template
tds_tablet_width=210;
tds_tablet_depth=124;
tds_tablet_height=8;
tds_frame_width=225;
tds_frame_depth=140; //140
tds_tablet_display_width=172;
tds_tablet_display_height=102;

// This are intermediate variables i used for potentially changing someting. 
tds_mf_material_thickness=1.5;
tds_mf_width=tds_tablet_width/2;
tds_mf_depth=tds_tablet_depth;
tds_mf_height=tds_tablet_height;
tds_mf_frame_width=tds_frame_width/2;
tds_mf_frame_depth=tds_frame_depth;

// The case for the tablet
module tablet_case(w, d, h, t) {
    difference() {
        cube([w + t * 2, 
                d + t * 2, 
                h + t]);

        translate([-1, t, t])
        cube([w + t + 1, d, h + 1]);
    }
}

// Create the case of the case
tablet_case(    tds_mf_width,                   // Width of the case
                tds_mf_depth,                   // Depth of the case
                tds_mf_height,                  // Height of the case
                tds_mf_material_thickness);     // The thich ness of the material of the case

// Create the cover of the case
difference() {
color("grey")
translate([     0,                              
                - (tds_mf_frame_depth - tds_mf_depth - tds_mf_material_thickness * 2) / 2, 
                tds_mf_material_thickness + tds_tablet_height])
cube([          tds_mf_frame_width, 
                tds_mf_frame_depth, 
                tds_mf_material_thickness]);
}
