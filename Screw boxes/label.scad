module corner_support(width, height) {
    
    label_frame=3;
    label_height=height + label_frame;
    label_width=width + label_frame;

    union() {
        
        // Calculate the cube size for the difference by using the 
        // pythagorean theorem "Square root of a² and b²"
        holder_hyp=sqrt((height)^2 + (height)^2);
      
        // Create the support structure
        difference() {
            
            translate([0, height, -2])
            rotate([45,0,0])
            cube([width,holder_hyp,holder_hyp]);
        
            tmp=sqrt((holder_hyp)^2 + (holder_hyp)^2);
            color("red")
            translate([-1, height, -2])
            cube([width+4, tmp/2, tmp]);
            
            color("red")
            translate([-1, 0, height-2])
            cube([width+4, tmp/2+1, tmp/2]);  
        }
    }
}

corner_support(47, 10);