$fn=400;

sh_holder_thickness = 4.5;
sh_holder_height = 43;

use <./IKEA Skadis include holder.scad>

module ikea_skadis_backwall(width, height, reinforcements) {
    union() {

        width = width > 83  ? width : 84;

        // backwall
        cube([width,2,height]);

        if(height < sh_holder_height) {
            // holder left
            translate([width/2-sh_holder_thickness/2-40, 0, 0])
            ikea_skadis_holder();

            // holder middle
            translate([width/2-sh_holder_thickness/2,0,0])
            ikea_skadis_holder();

            // holder right
            translate([width/2-sh_holder_thickness/2+40, 0, 0])
            ikea_skadis_holder();
        } else {
            // holder left
            translate([width/2-sh_holder_thickness/2-40, 0, height-sh_holder_height])
            ikea_skadis_holder();

            // holder middle
            translate([width/2-sh_holder_thickness/2,0, height-sh_holder_height])
            ikea_skadis_holder();

            // holder right
            translate([width/2-sh_holder_thickness/2+40, 0, height-sh_holder_height])
            ikea_skadis_holder();
        }

        if(reinforcements == 1) {
            // backwall reinforcement left
            color("black")
            translate([0, -2, 0])
            cube([4, 2, height]);

            // backwall reinforcement middle
            color("black")
            translate([width / 2 - 2, -2, 0])
            cube([4, 2, height]);

            // backwall reinforcement right
            color("black")
            translate([width - 4, -2, 0])
            cube([4, 2, height]);
        }
    }
}

// ikea_skadis_backwall(90,43, 0);