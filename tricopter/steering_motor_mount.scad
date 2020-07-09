difference() {
    difference () {
        cylinder(d=25,h=5);
        translate([19/2,0,0])
        cylinder(d=3.5, h = 5,$fn=20);
        translate([-19/2,0,0])
        cylinder(d=3.5, h = 5,$fn=20);
        translate([0,16/2,0])
        cylinder(d=3.5, h = 5,$fn=20);
        translate([0,-16/2,0])
        cylinder(d=3.5, h = 5,$fn=20);
        cylinder(d = 9, h = 5);
    }
    translate([0,0,-1])
    rotate([0,90,45])
    translate([0,0,-50])
    cylinder(d = 6, h = 100, $fn = 20);
    translate([0,0,-1])
    rotate([0,90,45+90])
    translate([0,0,-50])
    cylinder(d = 6, h = 100, $fn = 20);
}