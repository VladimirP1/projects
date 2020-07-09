module part() {
    difference() {
        union() {
            translate([-10,15/2, 0])
            cube([20, 1.5, 9]);
            cylinder(d = 17, h = 9);
            translate([-27/2,0.5, 0])
            cube([27, 1.5, 9]);
            translate([-27/2,-1.5, 0])
            cube([27, 1.5, 9]);
        }
        
        cylinder(d = 15, h = 40);
        
        translate([11,50,9/2])
        rotate([90,0,0])
        cylinder(d = 3.2, h=100, $fn=20);
        
        translate([-11,50,9/2])
        rotate([90,0,0])
        cylinder(d = 3.2, h=100, $fn=20);
    }
}

module part0() {
    difference() {
        part();
        
        translate([-50,-0.5,0])
        cube([100, 100, 100]);
    }
}

module part1() {
    difference() {
        part();
        
        rotate([0,0,180])
        translate([-50,-0.5,0])
        cube([100, 100, 100]);
    }
}

part0();
//part1();