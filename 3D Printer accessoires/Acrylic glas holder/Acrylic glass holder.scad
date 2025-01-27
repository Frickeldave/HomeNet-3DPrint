include <./../../modules/BOSL2_103/constants.scad>
use <./../../modules/BOSL2_103/metric_screws.scad>

difference() {
    union() {
        metric_bolt(size=9, l=60, shank=0, details=true, $fn=32);
        color("pink")
        cylinder(h=8, r=6);
    }
    
    color("red")
    translate([0, 0, -70])
    cylinder(h=80, r=1.5, $fn=32);

    translate([0,0,3.1])
    cylinder(h=7, r1=1.5,  r2=6, $fn=32);
}

    

// translate([20, 0, 0])
// metric_bolt(headtype="socket", size=10, l=15, shank=0, pitch=1.5, details=true, $fn=32);

// translate([40, 0, 0])
// rotate([0,0,0])
// metric_nut(size=10, hole=true, pitch=1.5, flange=3, details=true);