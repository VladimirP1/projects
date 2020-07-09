$fn = 50;
difference() { 
    cylinder(d = 22, h = 6 + 2 + 10);
    cylinder(d = 15, h = 10);
    cylinder(d = 13, h = 100);
    translate([0,0,10+2])
    cylinder(d = 17, h=100);
}