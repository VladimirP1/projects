difference() {
    union() {
        translate([-10,0,0])
        cube([70, 53, 15]);
        translate([7.3 + 10, 47.5 + 40, 7.5])
        rotate([90, 0, 0])
        cylinder(r = 15, h= 80);
    }
    difference() {
        cube([50, 47.5, 15]);
        translate([0, 25, 0])
        cube([7.3, 22.5, 15]);
        translate([50-7.3, 25, 0])
        cube([7.3, 22.5, 15]);
    }
    
    translate([7.3 + 10, 47.5 + 100, 7.5])
    rotate([90, 0, 0])
    cylinder(r = 7.5, h= 200);
    
    translate([0,0,-100])
    cube([100, 100, 100]);
    
    translate([0,0,15])
    cube([100, 100, 100]);
}