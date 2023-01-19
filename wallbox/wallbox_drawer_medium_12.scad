
// The measure of the box
wb_width=65;            // Original: 65
wb_depth=50;            // Original: 50
wb_height=80;           // Original: 80
wb_thickness=1.5;       // Original: 1.5

use <./wallbox_drawer.scad>

// Meeasures of the drawer, calculated on the base of the wallbox
drawer_height=(wb_depth-wb_thickness-wb_thickness)/2-1;
drawer_depth=wb_height - wb_thickness - 3;
drawer_width=wb_width-wb_thickness * 2 - 0.5;

drawer(drawer_width, drawer_depth, drawer_height, wb_thickness);