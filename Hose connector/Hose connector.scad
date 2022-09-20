$fn=200;

module gardena_connector_small() {
    
    gc_length=30;

    difference() {    
        
        union() {
            
            difference() {
                // The rounded front of the connector
                translate([0,0,3])
                rotate_extrude() 
                translate([5.0,0,0]) 
                circle(3);
                
                // The main body top
                color("red")
                translate([0,0,3])
                cylinder(12, 8, 8);
            }
        
            color("green")
            translate([0,0,3])
            cylinder(2.85, 11.8/2, 11.8/2); 

            // The main body top
            translate([0,0,5.85])
            cylinder(2.8, 15.4/2, 15.4/2);

            // Click-clack ring bevel front
            translate([0,0,8.65])
            cylinder(1.11, 15.4/2, (15.4+1.2)/2);

            // Click clack ring base
            translate([0,0,9.76])
            cylinder(2, (15.4+1.2)/2, (15.4+1.2)/2);

            // Click-clack ring bevel back
            translate([0,0,11.76])
            cylinder(1.65, (15.4+1.2)/2, 13.3/2);

            // The main body back
            translate([0,0,13.41])
            cylinder(5, 13.3/2, 13.3/2);

            // Rear thickening
            color("yellow")
            translate([0,0,18.41])
            cylinder(3, 13.3/2, 10);
            translate([0,0,21.41])
            cylinder(8.59, 10, 10);
        }


        //The hole in the middle
        color("red")
        translate([0,0,-1])
        cylinder(50, 9/2, 9/2);
    }
}

difference() {
    union() {
        translate([0, 0, -35])
        gardena_connector_small();

        color("green")
        translate([0,0,-5])
        cylinder(5, 10, 10);

        color("black")
        cylinder(2, 14, 14); 

        color("green")
        translate([0,0,2])
        cylinder(5, 10, 10);

        rotate([180,0,0])
        translate([0, 0, -37])
        gardena_connector_small();
}

    //The hole in the middle
    color("red")
    translate([0,0,-36])
    cylinder(580, 9/2, 9/2);
}