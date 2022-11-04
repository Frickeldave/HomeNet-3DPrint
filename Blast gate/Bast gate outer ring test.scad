$fn=400; 
 
difference() {
    
    // Connection plug
    color("green")
    translate([0,0,0])
    cylinder(h=13,r=24.9);

    // Connection plug
    translate([0,0,-1])
    cylinder(h=15,r=22.9);
}