$fn=40;

_file = "Frickeldave2.svg";
_t = 2;


module logo_base(h, o) {
    
    scale([0.39, 0.39, 1])
    linear_extrude(height=h)
    offset(o)
    import(file=_file, center=true);

}


module logo_corpus(h, t) {

    module logo_inlay(_h) {

        difference() {
            color("violet")
            logo_base(_h, 0);

            color("red")
            translate([0, 0, -1])
            logo_base(_h + 2, -_t);
        }
        
    }

    difference() {
        logo_base(h, t);

        color("red")
        translate([0, 0, _t])
        logo_base(h, 0);
    }

    logo_inlay(h - 5 -_t);

}


module logo_cover(h,o) {

    color("white")
    translate([0, 0, h])
    logo_base(_t, 0);

    difference() {
        color("green")
        logo_base(h, o);

        color("red")
        translate([0, 0, -1])
        logo_base(h + 2, -_t - o);
    }
}

// difference() {

//     //color("black")
//     %logo_corpus(20, 10);

//     color("green")
//     translate([5, 67, 2])
//     cube([10, 10, 10]);

//     color("green")
//     translate([-15, 45, 2])
//     cube([10, 15, 10]);


// }

//color("white")
translate([0, 0,22])
logo_cover(7, -0.4);