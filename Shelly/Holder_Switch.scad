$fn = 30; 

switch_width = 48;
switch_height = 48;
switch_outer_width = 49.5;
switch_outer_height = 49.5;
switch_radius = 1;
as500_cover_inner_width = 56.0;
as500_cover_inner_height = 56.0;
as500_cover_inner_radius = 2;
thickness=1;

// Modul für das abgerundete Viereck
module rounded_rectangle(w, h, r, t) {
    linear_extrude(height = t)
    hull() {
        // Vier Kreise an den Ecken
        translate([r, r, 0])
            circle(r);
        translate([w-r, r, 0])
            circle(r);
        translate([w-r, h-r, 0])
            circle(r);
        translate([r, h-r, 0])
            circle(r);
    }
}

module clip() {
    
    cube([15, 2, 5]);
    
    points = [
        [0.5, 0],
        [3, 0],
        [2, 1.5],
        [0.5, 1.5]
    ];

    translate([0, 2, 3])
    rotate([0, 90, 0])
    linear_extrude(height=15)
    polygon(points);

}

difference() {
    translate([- as500_cover_inner_width / 2, - as500_cover_inner_height / 2, 0])
    rounded_rectangle(as500_cover_inner_width, as500_cover_inner_width, as500_cover_inner_radius, thickness);
    color("red")
    translate([- switch_width / 2, - switch_height / 2, -1])
    rounded_rectangle(switch_width, switch_height, switch_radius, thickness + 2);
}

translate([-switch_outer_width / 2 - 2, -7.5, 6])
rotate([0, 180, 270])
clip();

translate([switch_outer_width / 2 + 2, 7.5, 6])
rotate([0, 180, 90])
clip();

translate([-7.5, switch_outer_height / 2 + 2, 6])
rotate([0, 180, 180])
clip();

translate([7.5, -switch_outer_height / 2 - 2, 6])
rotate([0, 180, 0])
clip();