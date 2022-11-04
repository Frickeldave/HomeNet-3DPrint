CLIP_H = 10;
HOLE_DEPTH = 7;
HOLE_DIAMETER = 2.9;

module din_clip() {
	
	difference() {

		linear_extrude(height=CLIP_H, center=true, convexity=5) {
			import(file="din_clip_02.dxf", layer="0", $fn=64);
		}

		union() {

			translate([0, 45, 0]) {
				rotate([0, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
				}
			}

			translate([0, 5, 0]) {
				rotate([0, 90, 0]) {
					cylinder(h= HOLE_DEPTH, r = HOLE_DIAMETER / 2, $fn = 16);
				}
			}
		}
}

}

din_clip();

