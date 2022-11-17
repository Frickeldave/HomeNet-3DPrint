//https://openscad-meistern.de/buch/

$fn=400;
puk_rad=23.5;
puk_height=18;
puk_nut_height=3;
nut_y_pos=puk_height-puk_nut_height;

module torus(r1, r2) {
    rotate_extrude() translate([r1,0,0]) circle(r2);
}


module puk_base() {
    union() {  
        // Create the base body 
        translate([0,0,2])
                color("turquoise")
        cylinder(h=puk_height-2,r=puk_rad);
        // Create the rounding at the bottom as a donut
        translate([0,0,2])
                color("turquoise")
        torus(puk_rad-2, 2);
        // Create the fill for the donut to get a flat underside
        translate([0,0,0])
                color("turquoise")
        cylinder(h=2, r=puk_rad-2); 
    }
}

// Create the nut on the top side of the puk
module puk_nut() {
    difference() {
        
        // nut outer radius
        translate([0,0,nut_y_pos])
        color("green")
        cylinder(h=puk_nut_height+2, r=(puk_rad-2));

        // nut inner radius
        translate([0,0,nut_y_pos-1])
        color("red")
        cylinder(h=puk_nut_height+2, r=(puk_rad-6 ));

    }
}


difference() {
    puk_base();
    puk_nut();
    mirror([1,1,0])
    translate([-15,-10,-1])
    linear_extrude(1.5)
    text("40", size=20);
}
