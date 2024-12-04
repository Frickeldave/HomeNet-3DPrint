$fn = 100; 
l = 200; // length
h = 12;
type = "r"; // l = left; m = middle; r = right

module rail() {
    difference() {
        union() {
            cube([l, 11, 2]);

            // Vordere Schiene
            color("green")
            translate([0, 0, 0])
            cube([l, 2.5, h]);

            // Hintere Schiene
            color("green")
            translate([0, 8.5, 0])
            cube([l, 2.5, h]);

            if(type == "r" || type == "m") {
                // Stutzen vorne
                color("cyan")
                translate([l, 1.5, 0])
                cube([10, 1, h-2.4]);

                // Stutzen hinten
                color("cyan")
                translate([l, 8.5, 0])
                cube([10, 1, h-2.4]);
            }
        }

        if(type == "l" || type == "m") {
            // Ausschnitt links vorne
            color("red")
            translate([-1, 1.3, -1])
            cube([12, 1.4, h + 1 - 2]);

            // Ausschnitt links hinten
            color("red")
            translate([-1, 8.3, -1])
            cube([12, 1.4, h + 1 - 2]);
        }
    }
}

rail();
// translate([l + 10, 0, 0])
// rail();
