$fn=400;

module panel_insert_funnel(t, fh, fdt, fdb) {

    difference() {
        color("lightblue")
        cylinder(h=fh + t, r1=fdb / 2 + t, r2=fdt / 2 + t);

        color("red")
        translate([0, 0, t])
        cylinder(h=fh + 1, r1=fdb / 2, r2=fdt / 2);
    }
};