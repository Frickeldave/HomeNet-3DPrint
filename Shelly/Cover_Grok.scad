$fn = 100;

// Maße definieren
base_width = 80;       // Breite und Länge der Basis (mm)
base_height = 3;       // Höhe der Basis (mm)
pyramid_height = 8;   // Höhe der Pyramide über der Basis (mm)
total_height = base_height + pyramid_height; // Gesamthöhe (20 mm)
rounding_radius = 5;   // Radius für die Abrundung der Kanten (mm)

// Basis als Quader mit Vorbereitung für Abrundung
module base_raw(w) {
    adjusted_width = w - 2 * rounding_radius;
    cube([adjusted_width, adjusted_width, base_height], center=true);
}

// Funktion für eine rundere Wölbung
function curve_factor(z) = pow(1 - z / pyramid_height, 0.4); // Rundere Kurve

// Pyramidenform ohne Abrundung
module curved_pyramid_raw(w) {
    adjusted_width = w - 2 * rounding_radius;
    
    hull() {
        // Basis der Pyramide (flach und passend zur Basis)
        translate([0, 0, base_height/2])
            cube([adjusted_width, adjusted_width, 0.01], center=true);
        
        // Obere Spitze der Pyramide
        translate([0, 0, base_height/2 + pyramid_height])
            sphere(r=0.01); // Minimaler Punkt für die Spitze
        
        // Zwischenpunkte für die Wölbung
        for (z = [0.5:pyramid_height/32:pyramid_height-0.5]) {
            scale_factor = curve_factor(z);
            translate([0, 0, base_height/2 + z])
                linear_extrude(height=0.01)
                    square(adjusted_width * scale_factor, center=true);
        }
    }
}

// Abgerundete Basis mit flacher Unterseite
module rounded_base(w) {
    difference() {
        minkowski() {
            base_raw(w);
            cylinder(r=rounding_radius, h=0.01, center=true); // Seitliche Rundung
        }
        // Schneide die Unterseite flach ab
        translate([0, 0, -base_height/2 - rounding_radius - 1])
            cube([w + 2*rounding_radius, w + 2*rounding_radius, 2*rounding_radius + 2], center=true);
    }
}

// Abgerundete Pyramide mit flacher Unterseite
module rounded_pyramid(w) {
    difference() {
        minkowski() {
            curved_pyramid_raw(w);
            cylinder(r=rounding_radius, h=0.01, center=true); // Nur seitliche Rundung
        }
        // Entferne die Abrundung an der Unterseite der Pyramide
        translate([0, 0, base_height/2 - rounding_radius - 1])
            cube([w + 2*rounding_radius, w + 2*rounding_radius, 2*rounding_radius + 2], center=true);
    }
}

//color("red")
//cube([76, 76, 5], center=true);

difference() {
    // Gesamte Form
    union() {
        // Abgerundete Basis mit flacher Unterseite
        rounded_base(base_width);
        
        // Abgerundete Pyramide
        rounded_pyramid(base_width);
    }
    // cube([50, 50, 30], center=true);

    // translate([0, 0, 20], center=true)
    // cube([80, 80, 20], center=true);
}