$fn = 20;
difference() {
    cylinder(d = 10, h = 15);
    cylinder(d = 6, h = 3.5);
    translate([0,0,5.5])
    cylinder(d = 6, h = 15);
    cylinder(d = 3.6, h = 20);
}