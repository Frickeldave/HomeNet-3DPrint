
include <./../modules/BOSL2/std.scad>
include <./../modules/BOSL2/screws.scad>

module case() {
    difference() {
        union() {
            color("pink")
            cylinder(h=80, r=7);
            translate([0, 0, 7])
            screw("M16x1.5,10", length=8, anchor=TOP);
        }
        translate([0, 0, -4])
        cylinder(h=83, r=5.5);


    translate([-7, 0, 64])
    cube([14, 14, 14]);
    }
}

module lock() { 
    
    difference() {
        sphere(12);
        translate([0, 0, -7])
        screw_hole("M16x1.5,35",anchor=BOTTOM,thread=true,bevel1="reverse");


    color("red")
    translate([0, 0, 7])
    cylinder(h=6, r=12);

    }


}


case();

//translate([0, 0,0 -13])
//lock();
