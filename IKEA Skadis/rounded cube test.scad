// $fn=10;
//https://danielupshaw.com/openscad-rounded-corners/
use <./../modules/roundedcube.scad>


difference() {
    size_outer=[106,73,47];
    rotate([0,180,0])
    roundedcube(size_outer, true, 8, "zmax");

    size_inner=[106-4,73-4,47];
    translate([0,0,2])
    rotate([0,180,0])
    roundedcube(size_inner, true, 8, "zmax");
}