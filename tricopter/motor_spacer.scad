
difference () {
    cylinder(d=25,h=5);
    translate([19/2,0,0])
    cylinder(d=3.5, h = 5,$fn=10);
    translate([-19/2,0,0])
    cylinder(d=3.5, h = 5,$fn=10);
    translate([0,16/2,0])
    cylinder(d=3.5, h = 5,$fn=10);
    translate([0,-16/2,0])
    cylinder(d=3.5, h = 5,$fn=10);
    cylinder(d = 9, h = 5);
}