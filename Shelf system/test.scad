module distribute_cylinders_with_rim(cube_size=[100, 50, 10], cylinder_diameter=10, cylinder_height=10, spacing=4, rim_width=2, rim_height=1) {
    // Berechnung der Anzahl der Zylinder in X- und Y-Richtung
    cols = floor((cube_size[0] - spacing) / (cylinder_diameter + spacing));
    rows = floor((cube_size[1] - spacing) / (cylinder_diameter + spacing));
    
    // Berechnung des Abstands vom Rand
    x_margin = (cube_size[0] - (cols * (cylinder_diameter + spacing) - spacing)) / 2;
    y_margin = (cube_size[1] - (rows * (cylinder_diameter + spacing) - spacing)) / 2;
    
    // Erstellen des Cubes
    difference() {
        cube([cube_size[0], cube_size[1], cube_size[2]]);
        
        // Platzieren der Zylinder und Ränder
        for (x = [0:cols-1]) {
            for (y = [0:rows-1]) {
                translate([x_margin + x * (cylinder_diameter + spacing), y_margin + y * (cylinder_diameter + spacing), 0]) {
                    // Zylinderloch
                    cylinder(h=cube_size[2], d=cylinder_diameter);
                    
                    // Rand um das Loch
                    translate([-rim_width, -rim_width, -rim_height])
                        cylinder(h=cube_size[2] + rim_height, d=cylinder_diameter + 2 * rim_width);
                }
            }
        }
    }
}

// Beispielaufruf der Funktion
distribute_cylinders_with_rim([100, 50, 10], 10, 10, 4, 2, 1);