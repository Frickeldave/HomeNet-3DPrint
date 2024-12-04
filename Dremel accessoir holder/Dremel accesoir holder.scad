$fn = 100;

_width = 150;
//_depth = 50;
_height = 13;

use <./../modules/hex_grid_v02.scad>

module tool_block(w, d, h, hc) {
    difference() {
        union() {
            cube([w, d, h]);
        }
        
        // Front row of holes
        for(i = [1 : 1 : hc]) {
            
            color("red")
            translate([w / (hc + 1) * i, d / 3 + 5, h - 10])
            cylinder(h = 11, r = 4);
        }

        // Back row of holes
        for(i = [1 : 1 : hc]) {
            color("red")
            translate([w / (hc + 1) * i, d / 3 * 2 + 5, h - 10])
            cylinder(h = 11, r = 4);
        }

        // Front bevel
        color("red")
        rotate([45, 0, 0])
        translate([-1, 0, h / 2 - 5])
        cube([w + 2, h * 2, h]);
    }
}

module tool_insert(td) {
    difference() {
        union() {
            cylinder(h = 10, r=3.8);

            translate([0, 0, 10])
            cylinder(h = 1, r = 5);
        }

        translate([0, 0, 2])
        cylinder(h = 10, r = td / 2);
    }
}

module block_holder_enforcement(d, type) {

    w = _width;
    h = d / 2;

    // Create the triangle empty frame
    module block_holder_enforcement_frame(o) {
        difference() {
            polygon(points=[[0, 0], [w, 0], [10, h], [0, h]]);
            offset(o) 
            polygon(points=[[0, 0], [w, 0], [10, h], [0, h]]);
        }
    }

    // Create the triangle filled frame
    module block_holder_enforcement_filled() {
        polygon(points=[[0, 0], [w, 0], [10, h], [0, h]]);
    }

    // Create the triangle grid
    module block_holder_enforcement_grid() {

        color("cyan")
        difference() {
            
            hexgrid([d, h, 2], 10, 2);

            color("red")
            translate([w + 10, h, -1])
            rotate([0, 0, 180])
            linear_extrude(height = 4)
            polygon(points=[[0, 0], [w, 0], [10, h], [0, h]]);

            difference() {
                translate([-20, -20, -1])
                cube([w + 40, h + 40, 4]);

                translate([0.5, 0.5, -2])
                cube([w-1, h-1, 6]);
            }
        }
    }

    module block_holder_enforcement_holder(type) {
        difference() {
            union() {
                cube([10, 10, 2]);

                translate([10, 5, 0])
                rotate([0, 0, 0])
                cylinder(h = 2, r = 5);
            }

            translate([10, 5, -1])
            cylinder(h=4, r=2);
        }
    }

    // Create border
    translate([0, 0, 0])
    linear_extrude(height = 2)
    block_holder_enforcement_frame(-2);

    if(type == "empty")
        linear_extrude(height = 0.8)
        block_holder_enforcement_frame(-8);
    if(type == "hex")
        block_holder_enforcement_grid();
    if(type == "fill")
        linear_extrude(height = 0.8)
        block_holder_enforcement_filled();

    // The screw holder
    translate([2, h-10, 2])
    rotate([0, -90, 0])
    block_holder_enforcement_holder();

}

//d =     depth
//type =  empty, hex, fill
module block_holder(d, type, enforcement)
{
    w = _width + 0.6;
    h = _height + 0.4;

    difference() {
        // Main block
        cube([w + 4, d + 2, h + 4]);
        
        // Manin cutout
        color("red")
        translate([2, -1, 2])
        cube([w, d + 1, h]);

        // Top cutout
        color("red")
        translate([4, -1, h + 1])
        cube([w - 4, d, 4]);
        
        // Bottom cutout
        color("red")
        translate([4, -1, - 1])
        cube([w - 4, d, 4]);

        // Left hole
        color("pink")
        translate([20, d + 3, (h + 4) / 2])
        rotate([90, 0, 0])
        cylinder(h = 4, r = 2);

        // Right hole
        color("pink")
        translate([(w + 2) - 20, d + 3, (h + 4) / 2])
        rotate([90, 0, 0])
        cylinder(h = 4, r = 2);        
    }

    //Add the reinforcements
    if((type != "hex") && (type != "fill"))
    {
        difference() {
            color("violet")
            cube([w, w, 2]);
            color("red")
            translate([w / 2 + 2, w - 50, -1])
            cylinder(h=4, r = w/2 + 10);
        }
    }

    if(type == "hex")
        hexgrid_frame(w, d, 2);
    if(type == "fill")
        cube([w, d, 1]);

    translate([2, 0, 0])
    cube([w, 2, 2]);

    if(enforcement == 1) {
        // left enforcement
        color("lightgreen")
        translate([0, d + 2, h + 4])
        rotate([90, 0, 270])
        mirror([0, 0, 1])
        block_holder_enforcement(d, type);

        // right enforcement
        color("lightgreen")
        translate([w + 4, d + 2, h + 4])
        rotate([90, 0, 270])
        block_holder_enforcement(d, type);
    }
}

module drawer(d){

    w = _width;
    h = _height;

    difference() {
        union() {
            
            // Main block
            cube([w, d, h]);

            // The handle            
            translate([w / 2 - 20, -8 , h / 2])
            cube([40, 8, 5]);
        }

        // Inner cutout
        translate([2, 2, 2])
        cube([ w - 4, d - 4, h]);

        // left hole
        color("red")
        translate([18 - 0.3, d + 3, (h + 4) / 2 - 2.2])
        rotate([90,0,0])
        cylinder(h = 4, r = 4);

        // right hole
        color("red")
        translate([(w + 2) - 22 + 0.3, d + 3, (h + 4) / 2 - 2.2])
        rotate([90,0,0])
        cylinder(h = 4, r = 4);
    }
}


module block_holder_30() {
    block_holder(_width, 30, _height);
}

module drawer_30() {
    translate([2.3, 0, 2.3])
    drawer(_width, 30, _height);    
}

// color("cyan")
block_holder(150, "empty", 0);

//block_holder(150);
// color("white")
// translate([2.3, -10, 2.2])
// drawer(150);

//block_holder_enforcement(150, "blank");