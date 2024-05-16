$fn = 30;

use <height extender - base.scad>;

// w = 38.5;
// t = 3.6;
// h = 10;

difference() {
    w = 30;
    t = 3.1;
    h = 7.5;
    extender(10);

    color("red")
    translate([-3.6, 10, -1])
    cube([50,50,13]);

    font = ("Elephant");
    // color("cyan")
    // translate([10, 0.2, 1.5])
    // rotate([90, 0, 0])
    // linear_extrude(2)
    // text(text = "10 mm", font = font, size = 7);

    color("cyan")
    translate([55.8, 10, 1.5])
    rotate([90, 0, 90])
    linear_extrude(2)
    text(text = "10 mm", font = font, size = 7);


    //////////////////////////////////////////////////
    // 
    color("green")
    translate([-1, t+0.9, 2])
    rotate([0, 0, 0])
    cube([w, t, h+2]);

    color("red")
    translate([-1, -1, 2])
    cube([37, t+3, 10]);
    //
    //////////////////////////////////////////////////
}


//color("green")
translate([56 - 3.5, 3.5, -9])
rotate([0, 0, 90])
recess();


module recess(s) {

    w = 30;
    t = 3.1;
    h = 7.5;

    difference() {

        union() {   
            color("red")
            translate([t, 0, 2])
            cube([w, t, h]);

            color("pink")
            translate([t, t, 2])
            rotate([0, 0, 90])
            cube([w, t, h]);
        }

        color("blue")
        translate([10, -10, 1])
        rotate([0, 0, 90])
        cube([20, 20, 10]);



    }

};