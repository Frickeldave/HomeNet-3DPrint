$fn = 100; 

t = 4;      // thickness
dt = 88;    // inner-diameter-top

a=40;
mpl=200;  //main pipe length
lpl=170; //leg pipe length
ph = 180; // plate height
pw = 200; // plate width

difference() {

    union() {
        translate([0,0,0])
        cylinder(h=mpl, r=(dt+t+t)/2);

        color("green")
        translate([-(dt + t + t) / 2, 0, (mpl - ph) / 2 +10])
        rotate([40, 0, 0])
        cube([dt + t + t, dt / 2 + 20 + 70, 10]);

        color("green")
        translate([-(dt + t + t) / 2, 0, mpl-(mpl - ph) / 2 - 80])
        rotate([40, 0, 0])
        cube([dt + t + t, dt / 2 + 70, 10]);

        translate([0, 0, 40])
        rotate([0,a,0])
        lpl();


        translate([-dt/2-t -15, dt / 2 + 20, (mpl - ph) / 2])
        difference() {
            union() {
                cube([pw, t, ph]);
            }

            color("red")
            translate([7, t + 1, 7])
            rotate([90,0,0])
            cylinder(h = t + 2, r = 2);
        
            color("red")
            translate([7, t + 1, ph - 7])
            rotate([90,0,0])
            cylinder(h = t + 2, r = 2);

            color("red")
            translate([pw - 7, t + 1, 7])
            rotate([90,0,0])
            cylinder(h = t + 2, r = 2);
        
            color("red")
            translate([pw - 7, t + 1, ph - 7])
            rotate([90,0,0])
            cylinder(h = t + 2, r = 2);

        }
    }


    translate([-dt/2-t -15 - 1, dt / 2 + 20 + t, (mpl - ph) / 2 -1])
    cube([pw+2, 100, ph+2]);   

    color("red")
    translate([0,0,-1])
    cylinder(h=mpl+2, r=(dt)/2);

    color("red")
    translate([0, 0, 40])
    rotate([0,a,0])
    cylinder(h=lpl+2, r=(dt)/2);

    



}

module lpl() {

    difference() {
    
        union() {
            color("pink")
            translate([0,0,0])
            cylinder(h=lpl, r=(dt+t+t)/2);

            color("pink")
            translate([-dt/2-t, 0, lpl -40])
            cube([dt + t + t, dt / 2 + 20, 10]);

        }

        color("red")    
        translate([0,0,-1])
        //rotate([0,a,0])
        cylinder(h=lpl+2, r=(dt)/2);

    }


}

// translate([-dt/2-t -15, dt / 2 + 20, (mpl - ph) / 2])


// difference() {
    
//     union() {
//     cube([pw, t, ph]);


//     }    

//     color("red")
//     translate([7, t + 1, 7])
//     rotate([90,0,0])
//     cylinder(h = t + 2, r = 2);
 
//     color("red")
//     translate([7, t + 1, ph - 7])
//     rotate([90,0,0])
//     cylinder(h = t + 2, r = 2);

//     color("red")
//     translate([pw - 7, t + 1, 7])
//     rotate([90,0,0])
//     cylinder(h = t + 2, r = 2);
 
//     color("red")
//     translate([pw - 7, t + 1, ph - 7])
//     rotate([90,0,0])
//     cylinder(h = t + 2, r = 2);



// }



