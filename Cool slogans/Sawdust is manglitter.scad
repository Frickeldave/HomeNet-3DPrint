$fn=100;

font = ("Elephant");

linear_extrude(1)
text(text = "SAWDUST", font = font, size = 18.5);

translate([0,-30, 0])
linear_extrude(1)
text(text = "IS MAN GLITTER", font = font, size = 10.9);