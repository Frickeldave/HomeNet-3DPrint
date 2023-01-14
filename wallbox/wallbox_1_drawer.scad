wb_width=65;
wb_depth=50;
wb_height=80;
wb_thickness=1.5;

slider_height=(wb_depth-wb_thickness-wb_thickness)/3-0.5;


difference() {
    cube([wb_width,wb_depth,wb_height]);


    translate([wb_thickness, wb_thickness, wb_thickness])
    cube([wb_width-wb_thickness*2,wb_depth-wb_thickness*2, wb_height]);

}

color("yellow")
translate([wb_thickness, wb_thickness, wb_thickness])
cube([5, wb_thickness, wb_height-wb_thickness-wb_thickness]);

color("yellow")
translate([wb_width-wb_thickness-5, wb_thickness, wb_thickness])
cube([5, wb_thickness, wb_height-wb_thickness-wb_thickness]);