$fn=200;



difference() {

    union() {
        // lid
        cylinder(h = 4, r = 32.8);
        sphere (r=20);
    }

    // handle cave
    translate([-21,-21,4])
    cube([42,42,22]);

    // handle cave excerpt
    sphere(r=18);

}

// handle cave grip
translate([-2.5,-20,0])
cube([5,40,4]);