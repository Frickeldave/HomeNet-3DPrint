

// m_hinge_width = 100.0;
// hinge_width = 100.0;
// echo ( m_hinge_width                    = m_hinge_width );
// use <./../modules/hinge.scad>
// main();

$fn =100;
include <./../modules/hinge.scad>;

enable_fillet = 1; // Kanten abrunden
enable_pin = 1; // Verbindungspin zeichnen
enable_fasteners = 1; // Schraubenlöcher
fstener_head_type = 0; // 0:Counterbored, 1:Countersunk
hinge_width = 40.0;
leaf_height = 180.0;
fastener_margin = 10;
resolution = 100; // Does not work
m_resolution = 100; // Does not work
knuckle_count = 7;
component_color= "grey";
fastener_count = 5;
throw_angle = 90;

// m_flip_model = false;
// m_female_leaf_enabled = true;
// m_male_leaf_enabled = true;

leaf(0);
leaf(1);
//m_female_leaf_enabled = true;
// Initialize model resolution.
