$fn = 30;

use <height extender - base.scad>;



w = 38.5;
t = 3.6;
h = 10;

difference() {
    extender(10);
    color("green")
    translate([-1, t, 2])
    rotate([0, 0, 0])
    cube([w, t, h]);

    color("red")
    translate([-1, -1, 2])
    cube([37, t+2, 10]);
}

