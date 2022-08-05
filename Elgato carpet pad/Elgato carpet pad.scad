
$fn=400;

ecp_edge_height=15;
ecp_dia=140;
ecp_material_size=3;
ecp_bottom_thickness=2;


difference() {
    cylinder(ecp_edge_height, ecp_dia/2, ecp_dia/2);
    
    translate([0,0,ecp_bottom_thickness])
    cylinder(ecp_edge_height, ecp_dia/2-ecp_material_size*2, ecp_dia/2-ecp_material_size*2);
}