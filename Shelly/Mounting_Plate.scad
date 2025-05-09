$fn = 30;
width = 71;          // Breite des Rahmen
height = 71;         // Höhe des Rahmen
corner_radius = 4;   // Radius der abgerundeten Ecken
thickness = 1.5;       // Dicke der Baseplate
hole_diameter = 4;   // Druchmesser der Montagelöcher
shelly_switch_width=41;
shelly_switch_height=41;
// Sicherstellen, dass der Radius nicht zu groß ist
assert(corner_radius <= width/2 && corner_radius <= height/2, 
    "Corner radius must not exceed half of width or height");

// Modul für das abgerundete Viereck
module rounded_rectangle(w, h, r, t) {
    linear_extrude(height = t)
    hull() {
        // Vier Kreise an den Ecken
        translate([r, r, 0])
            circle(r);
        translate([w-r, r, 0])
            circle(r);
        translate([w-r, h-r, 0])
            circle(r);
        translate([r, h-r, 0])
            circle(r);
    }
}

module slotted_hole(r, t) {
    linear_extrude(height = t)
    hull() {
        translate([-r/2, r/2, 0])
        circle(r);
        translate([r/2, -r/2, 0])
        circle(r);   
    }
}

// module clip() {
    
//     cube([6, 1, 6]);
    
//     points = [
//         [0, 0],
//         [3, 0],
//         [1.5, 2]
//     ];

//     translate([0, 1, 5])
//     rotate([0, 90, 0])
//     linear_extrude(height=6)
//     polygon(points);

// }

module clip2(h,w,t) {
    t=2;
    points = [
        [0, 0],
        [0, h],
        [t, h],
        [t + 1.5, h - 1],
        [t + 1.5, h - 1.5],
        [t, h - 2.5],
        [t, 0]
    ];

    linear_extrude(height=w)
    polygon(points);
}


module baseplate_base(w, h, t, cr, hd) {
    translate([-w / 2, -h / 2])
    difference() {
        rounded_rectangle(w, h, cr, t);
        color("red")
        translate([hd + 1, hd + 1, -1])
        slotted_hole(hd / 2, t + 2);

        color("red")
        translate([w - hd + 0, h - hd + 0, -1])
        slotted_hole(hd / 2, t + 2);

        color("red")
        translate([hd, h - hd, -1])
        cylinder(h = t + 2, r = hd / 2);

        color("red")
        translate([w - hd, hd + 0, -1])
        cylinder(h = t + 2, r = hd / 2);


    }
}

difference() {
    union() {
        baseplate_base(width, height, thickness, corner_radius, hole_diameter);

        color("cyan")
        translate([-3, -shelly_switch_width / 2 - 2, thickness])
        rotate([90,0,90])
        clip2(5,6,1);

        color("cyan")
        translate([3, shelly_switch_width / 2 + 2, thickness])
        rotate([90, 0, 270])
        clip2(5,6,1);
    }

    translate([- shelly_switch_width / 2, - shelly_switch_height / 2, -1])
    cube([shelly_switch_width , shelly_switch_height, thickness + 2]);

    color("pink")
    translate([-30, 0, -1])
    cylinder(h = thickness + 2, r = 2);

    color("pink")
    translate([30, 0, -1])
    cylinder(h = thickness + 2, r = 2);

    color("pink")
    translate([0, -30, -1])
    cylinder(h = thickness + 2, r = 2);

    color("pink")
    translate([0, 30, -1])
    cylinder(h = thickness + 2, r = 2); 
}