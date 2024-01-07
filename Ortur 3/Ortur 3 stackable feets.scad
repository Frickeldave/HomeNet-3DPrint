$fn = 100; 

feet_dia=21;
feet_height=30;
thickness=4;
hole_pos=15;
insert_height=15;

use <../modules/text_on.scad>

module base() {
    difference() {
        union() {
            cylinder(h=feet_height, r=feet_dia/2+thickness);
            cube([feet_dia + 30, feet_dia + 30, thickness], center=true);
        }

        translate([0, 0, thickness + 1])
        cylinder(h=feet_height-thickness +1, r=feet_dia/2);

        translate([-hole_pos, -hole_pos, -3])
        cylinder(h=thickness+2, r=1.5);
        translate([-hole_pos, -hole_pos, -0])
        cylinder(h=thickness+2, r1=1.5, r2=6);

        translate([hole_pos, hole_pos, -3])
        cylinder(h=thickness+2, r=1.5);
        translate([hole_pos, hole_pos, -0])
        cylinder(h=thickness+2, r1=1.5, r2=6);

        translate([hole_pos, -hole_pos, -3])
        cylinder(h=thickness+2, r=1.5);
        translate([hole_pos, -hole_pos, -0])
        cylinder(h=thickness+2, r1=1.5, r2=6);

        translate([-hole_pos, hole_pos, -3])
        cylinder(h=thickness+2, r=1.5);
        translate([-hole_pos, hole_pos, -0])
        cylinder(h=thickness+2, r1=1.5, r2=6);


        color("red")
        translate([0,-(feet_dia + 30)/2, 2])
        rotate([30,0,0])
        cube([feet_dia + 30+2, 20, thickness], center=true);
        
        color("red")
        translate([0,(feet_dia + 30)/2, 2])
        rotate([30,180,0])
        cube([feet_dia + 30+2, 20, thickness], center=true);

        color("red")
        translate([-(feet_dia + 30)/2,0, 2])
        rotate([30,0,270])
        cube([feet_dia + 30+2, 20, thickness], center=true);

        color("red")
        translate([(feet_dia + 30)/2,0, 2])
        rotate([30,0,90])
        cube([feet_dia + 30+2, 20, thickness], center=true);

        translate([feet_dia/2-2, 0, feet_height])
        rotate([0,90,0])
        cylinder(h=thickness+2, r=6);

    }
}

module stack(h) {
    difference() {
        union() {
            cylinder(h=h, r=feet_dia/2+thickness);
            
            translate([0,0, -insert_height+3])
            cylinder(h=insert_height - 3, r=feet_dia/2 - 0.3);

            translate([0,0, -insert_height+3])
            rotate([180,0,0])
            cylinder(h=3, r1=feet_dia/2 - 0.3, r2=feet_dia/2 - 2.3);
        }

        translate([0, 0, thickness + 1])
        cylinder(h=h-thickness +1, r=feet_dia/2);

        translate([feet_dia/2-2, 0, h])
        rotate([0,90,0])
        cylinder(h=thickness+2, r=6);

        color("blue")
        translate([0,0,-14])
        rotate([0,0,270])
        text_on_cylinder(t=str(h), r1=feet_dia/2+thickness, r2=feet_dia/2+thickness, h=40, font="Arial", halign="center", valign="center", direction="ttb", size=10);
    }
}

// Minimal height should be 20
stack(60);

//cylinder(h=10, r=feet_dia/2 - 0.3);
        