$fn = 100; 

t = 4;      // thickness
hh = 40;    // hose hight
hd = 96;    // hose diameter
cd = 150;   // cover-diameter
cdis = 20;  // cover distance

module hose_connector(h, r) {
    difference() {
        cylinder(h = h, r = r + t);
        translate([0, 0, -1])
        cylinder(h = h + 2, r = r);
    }
}
module hose_connector_clip_stilt(h,t) {
    difference() {

        translate([-t/2, -t/2,0])
        cube([t,t,h]);
        
        color("red")
        translate([0,t-1,h -3])
        rotate([90,0,0])
        cylinder(h=t+2, r=1);
    }

    difference() {

        hyp=sqrt(h*h+h*h)/2;
        // Reinforcement
        translate([-t/2,-t/2,h/2])
        rotate([0,45,0])
        cube([hyp+t, t, t]);

        color("red")
        translate([0,-t/2-1,-t-2])
        cube([h, t+2, t+2]);

    }



}


// h = will be the height of the ring (eg, your material thickness)
// r = inner radius of the hose connector
// ch = height of the hose-connector

module hose_connector_clip(h, r, ch) {
    difference() {
        cylinder(h = t, r = r + t);
        translate([0, 0, -1])
        cylinder(h = h + 2, r = r);
    }

    // cross at bottom
    translate([0,0,t/2])
    cube([r*2, t*2, t], center=true);

    translate([0,0,t/2])
    rotate([0,0,90])
    cube([r*2, t*2, t], center=true);

    // 4 stilts
    translate([r-t/2, 0, 0])
    rotate([0,0,180])
    hose_connector_clip_stilt(ch+5, t);

    translate([-r+t/2, 0, 0])
    hose_connector_clip_stilt(ch+5, t);

    translate([0, r-t/2, 0])
    rotate([0,0,270])
    hose_connector_clip_stilt(ch+5, t);

    translate([0, -r+t/2, 0])
    rotate([0,0,90])
    hose_connector_clip_stilt(ch+5, t);


}

module cover(r, t) {

    difference() {
        sphere(r);
        sphere(r - t);

        color("red")
        translate([0, 0, -r/2 + 0])
        cube([r*2+2, r*2+2, r+1], center=true);
    }

    // suspension
    translate([0, 0, hh + r/2 - t])
    rotate([90,0,0])
    rotate_extrude() translate([15,0,0]) circle(t);
}

// hose connector
// color("blue")
// translate([0,0,t])
// hose_connector(hh, hd/2);

// clips
//hose_connector_clip(t, hd/2 - 0.1, hh + t + 0.5);

// cover
translate([0, 0, hh + cdis])
cover(cd / 2, t );

