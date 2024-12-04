skadis_hook_width = 4.5;
skadis_hook_height = 46;
skadis_hole_spacing_width = 40; // middle to middle
cutout_tolerance_w = 0.2;
cutout_tolerance_h = 0.6;


module skadis_hook_cutout(center=false, hook_count=2) {
    
    if(center) {
        translate([-(skadis_hole_spacing_width + skadis_hook_width) / 2, 0, - skadis_hook_height / 2])
        object(hook_count);
    } else {
        object();
    }
    

}

module object(hook_count=2) {
    union() {

        // Cutout for the hook 1
        color("red")
        translate([- cutout_tolerance_w / 2, 0, - cutout_tolerance_h / 2])
        cube([skadis_hook_width + cutout_tolerance_w, 2, skadis_hook_height + cutout_tolerance_h]);

        // Cutout for the hook 2
        color("red")
        translate([- cutout_tolerance_w / 2 + skadis_hole_spacing_width, 0, - cutout_tolerance_h / 2])
        cube([skadis_hook_width + cutout_tolerance_w, 2, skadis_hook_height + cutout_tolerance_h]);

    }
}

skadis_hook_cutout(center = false);