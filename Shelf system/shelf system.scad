//$fn = 100; 

thickness = 2;
raildepth = 3;

use <./../modules/hex_grid_v02.scad>

module screw_holder() {
    difference() {
        union() {
            cube([10, 10, 2]);

            translate([10, 5, 0])
            cylinder(h = 2, r = 5);
        }

        translate([10, 5, -1])
        cylinder(h=4, r=2);
    }
}

// Create the holder with an optional enforcement
module holder_enforcement(_d, _h, _t) {

    // Create the triangle empty frame
    module holder_enforcement_frame(__d, __h, __t) {
        difference() {
            polygon(points=[[0, 0], [__d, 0], [__d, __t], [__t, __h], [0, __h]]);

            offset(__t - (__t * 2)) 
            polygon(points=[[0, 0], [__d, 0], [__d, __t], [__t, __h], [0, __h]]);
        }
    }

    linear_extrude(height = _t)
    holder_enforcement_frame(_d, _h, _t);

}

// _d = depth of the shelf
// _h = high of the reinforcement
// _t = material thickness
// _r = the depth of the rail
module holder(_d, _h, _t, _r) {

    module holder_connector(__w, __d, __t) {
        
        difference() {
            cube([__w + 4, __d, __t + 2]);
            translate([2, -1, __t])
            cube([__w, __d + 2, __t + 1]);

            translate([(__w + 4) / 2, __d / 2, -1])
            cylinder(h = __t * 2, r = 2);
        }
    }

    difference() {
        
        // Main block
        cube([_d + _t + 2, 16, _t + _r]);
        
        // Main cutout
        color("red")
        translate([_t + 2, 4, _t])
        cube([_d + 1, 10, _r + 1]);
    }


    // Back connector
    color("cyan")
    translate([0, _h, _t + _r + 10])
    rotate([90, 180, 90])
    holder_connector(10, 10, 2);
    
    translate([0, _h - 3, _t + _r])
    difference() {
        cube([_t, 10, 10]);
        color("red")
        translate([-1, 10, 5])
        rotate([0,90,0])
        cylinder(h=_t + 2, r = 2);
    }

    // Rear connector
    color("cyan")
    translate([20, 0, _t + _r + 10])
    rotate([-90, 0, 0])
    holder_connector(10, 10, 2);

    // Front connector
    color("cyan")
    translate([_d - 10, 0, _t + _r + 10])
    rotate([-90, 0, 0])
    holder_connector(10, 10, 2);
    
    // Add the reinforcement
    color("violet")
    translate([0, 16 - _t, 0])
    holder_enforcement(_d + _t * 2, _h, _t + _r);

    // Screw holder top
    translate([0, _h + 12, 0])
    rotate([90, -90, 90])
    screw_holder();

    // Screw holder bottom
    translate([0, 10, 0])
    rotate([90, -90, 90])
    screw_holder();

}

module connector(_w, _d) {

    __wr = 0.6;
    __w = _w - __wr;
    __d = _d - 0.6;

    translate([__wr / 2, 0.3, 0])
    cube([__w, __d, 1]);

    translate([5, 5, 1])
    cylinder(h = 2 - 0.1, r = 2 - 0.2);

    translate([_w - 5, 5, 1])
    cylinder(h = 2 - 0.1, r = 2 - 0.2);
}

module insert_base(_w, _d, _r, _t) {

    __w = _w - 0.6;
    __d = _d - 0.3;
    __r = _r - 0.3;
    
    union() {
        // Base plate
        color("white")
        translate([__r, _t, 0])
        hexgrid_frame(__w, __d - _t * 2, 2);

        // rail left
        cube([_r, __d, 10 - 1.6]);

        // rail right
        translate([__w + __r, 0, 0])
        cube([_r, __d, 10 - 1.6]);

        // back
        translate([_r, __d - _t, 0])
        cube([__w, _t, 10 - 1.6]);

        // front
        translate([_r, 0, 0])
        cube([__w, _t, 10 - 1.6]);

    }

}

// Example: insert_holes(150, 150, 2, 10, 21.5);
//  _hcd = hole cylinder depth
// _hcb = the bottom / floor size of the cylinder (0 = no bottom, 1 = thickness)
module insert_holes(_w, _d, _t, _h, _hd, _hcd, _hcb) {

    __w = _w - 1.5;
    __d = _d - 0.9;
    __inner_frame_w = __w - _t * 2 - 10;
    __inner_frame_d = __d - _t * 4 - 10;
    __hd = _hd + 4; // Outer radius of the holes
    
    module _container_corpus() {
        difference() {
            
            // Main cube
            color("cyan")
            cube([__w, __d - _t * 2, _h]);

            // Cutout
            color("red")
            translate([_t, _t, _t - 1])
            cube([__w - _t * 2, __d - _t * 4, _h]);

            // Cutout for the grid
            color("yellow")
            translate([_t + 5, _t + 5, - 1])
            cube([__inner_frame_w, __inner_frame_d, _t + 2]);
        }
    }

    module _container_hole_rim() {

        difference() {
            cylinder(h = _hcd, r = __hd / 2);
            translate([0, 0, -1])
            cylinder(h = _hcd + _t, r = _hd / 2);
        }

        if(_hcb == 1) {
            color("pink")
            translate([0,0, _hcd])
            cylinder(h=_t, r = __hd / 2);
        }
    }

    module _container_grid_with_rims() {

        // The minimum distance for the holes
        _min_spacing = 2; 

        // get the number of rows and columns
        _num_x = floor(__inner_frame_w / (__hd + _min_spacing));
        _num_y = floor(__inner_frame_d / (__hd + _min_spacing));

        echo(str("Number of columns and rows: ", _num_x, ", ", _num_y ));

        _effective_spacing_x = (__inner_frame_w - (_num_x * __hd)) / (_num_x - 1);
        _effective_spacing_y = (__inner_frame_d - (_num_y * __hd)) / (_num_y - 1);

        echo(str("Spacing x and y: ", _effective_spacing_x, ", ", _effective_spacing_y ));

        difference() {

            union() {
                // Base plate
                color("green")
                hexgrid_frame(__inner_frame_w, __inner_frame_d, _t);

                // add the rims
                for (_col = [0 : _num_x - 1]) {
                    for (_row = [0 : _num_y - 1]) {
                    
                        _x = (_col * __hd) + (_col * _effective_spacing_x) + __hd / 2;
                        _y = (_row * __hd) + (_row * _effective_spacing_y) + __hd / 2;

                        translate([_x, _y, 0])
                        _container_hole_rim();
                    }
                }
            }

            // add the holes
            for (_col = [0 : _num_x - 1]) {
                for (_row = [0 : _num_y - 1]) {
                
                    _x = (_col * __hd) + (_col * _effective_spacing_x) + __hd / 2;
                    _y = (_row * __hd) + (_row * _effective_spacing_y) + __hd / 2;

                    color("red")
                    translate([_x, _y, -1])
                    cylinder(h = _t + 2, r = _hd / 2);
                }
            }
        }
    }

    translate([_t + 5, _t + 5, 0])
    _container_grid_with_rims();

    _container_corpus();
}



//*************************************************************************
// Infos: 
// - "Depth" is calculated like here: given depth + thickness + 2
//*************************************************************************

//*************************************************************************
//The right holder
//*************************************************************************
//holder(150, 75, thickness, raildepth);

//*************************************************************************
// The left holder
//*************************************************************************
//mirror([1, 0, 0])
//holder(150, 75, thickness, raildepth);

//*************************************************************************
// The connector
//*************************************************************************
//connector(150, 10);

//*************************************************************************
// A simple drawer
//*************************************************************************
//insert_base(150, 150, raildepth, thickness);

//*************************************************************************
// A drawer insert with holes for epoxy colors
//*************************************************************************
//// translate([-raildepth - 0.3, - thickness - 0.3, -thickness])
//// insert_base(150, 150, raildepth, thickness);

// translate([0,0,20])
// mirror([0, 0, 1])
// insert_holes(150, 150, thickness, 20, 21.5, thickness); //21.5

//*************************************************************************
// A drawer insert with holes for accessoires holder
//*************************************************************************
//// translate([-raildepth - 0.3, - thickness - 0.3, -thickness])
//// insert_base(150, 150, raildepth, thickness);

translate([0,0,20])
mirror([0, 0, 1])
insert_holes(150, 150, thickness, 20, 8, 8, 1);

//*************************************************************************
// A full model with draser
//*************************************************************************

// translate([- thickness - raildepth, 150 + thickness + 2, 0])
// mirror([1, 0, 0])
// rotate([90,0,270])
// holder(150, 75, thickness, raildepth);

// translate([150 + thickness + raildepth, 150 + thickness + 2, 0])
// rotate([90,0,270])
// holder(150, 75, thickness, raildepth);

// translate([0, 12 + 0.15, thickness * 2])
// rotate([180,0,0])
// connector(150, 10);

// translate([0, 150 - 18, thickness * 2])
// rotate([180,0,0])
// connector(150, 10);

// translate([0, 150, 73])
// rotate([270,0,0])
// connector(150, 10);

// translate([-raildepth + 0.3, 0, thickness + 2 + 0.3])
// insert_base(150, 150, raildepth, thickness);
