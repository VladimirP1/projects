// 69x90

mid_x = 85/2;

module ear() {
    ofs_y = -6.5;
    hull() {
        translate([0, ofs_y, 0])
        cylinder(d=9, h=4);
        translate([0, 5, 0])
        cylinder(d=9, h=4);
        
    }
    hull() {
        translate([0, 90 + ofs_y, 0])
        cylinder(d=9, h=4);
        translate([0, 90 - 20, 0])
        cylinder(d=9, h=4);
    }
}

module ears() {
    translate([mid_x + 69/2,0,0])
    ear();
    translate([mid_x - 69/2,0,0])
    ear();
}

y_length = 77;

module wall(e = 1) {
    difference() {
        union() {
            minkowski() {
                cylinder(r = 2, h = 1,$fn=20);
                cube([85, y_length, 30]);
            }
            if(e == 1) ears();
        }
        
        cube([85, y_length, 30]);
        
        translate([-10,-10,30])
        cube([100,100,100]);
        
        translate([-10,-10,30])
        cube([100,100,100]);
        
        translate([0,0,-100])
        cube([100,100,100]);
    }
}

btm_hgt = 1;

module bottom() {
    translate([0,0,-btm_hgt])
    linear_extrude(height=btm_hgt)
    hull()
    projection()
    wall(0);
}

wall();
bottom();

//fixup ears
translate([0,0,-btm_hgt])
difference() {
    ears();
    cube([85, y_length, 30]);
}