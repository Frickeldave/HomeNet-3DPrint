
$fn=400;

// Printer ist set to top/bottom thickness of 0.8. Use this factor to get massive plates
ecp_plate_height=1.6;
ecp_dia=140;
ecp_material_size=3;


difference() {
    cylinder(ecp_plate_height, ecp_dia/2-ecp_material_size*2-0.2, ecp_dia/2-ecp_material_size*2-0.2);
}