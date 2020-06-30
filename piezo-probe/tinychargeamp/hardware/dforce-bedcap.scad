// current height:washers (0.8*2), piezo (0.3), this part(10)
// total: 11.9

/*difference(){
    cylinder(d=20,h=10);
    translate([0,0,6])
    cylinder(d=13.5,h=10);
    cylinder(d=4,h=10,$fn=10);
}*/

module blade_elem(r_max, w, h, ang_max, segs, i) {
    r_cur = r_max * (i / segs);
    ang_cur = ang_max * (i / segs);
    rotate([0,0,ang_cur])
    translate([0,r_cur,0])
    cylinder(d = w, h = h);
}

module blade(r_max, w, h, ang_max, segs=20, i=0) {
    if (i < (segs - 1)) {
        hull() {
            blade_elem(r_max, w, h, ang_max, segs, i);
            blade_elem(r_max, w, h, ang_max, segs, i+1);
        }
        blade(r_max, w, h, ang_max, segs, i+1);
    }
}

module bladedlid(r, w, h, ang, n) {
    intersection() {
        for (angle = [0 : 360/n : 360]) {
            rotate([0,0,angle])
            blade (r + w, w, h, ang);
        }
        cylinder(r = r, h = h);
    }
}

module top() {
    bladedlid(r = 20.1 / 2, w = 1.5, h = 2, ang = 60, n = 4);
    
    difference() {
        cylinder(d = 22, h = 6);
        cylinder(d = 20+0.05, h = 6);
    }
    
    cylinder(d = 9, h = 3);
}

module m3bolt() {
    linear_extrude(height = 1.6, scale = 2.85 / 5.4, $fn = 15)
    circle(d = 5.4);
    cylinder(d = 2.9, h = 10, $fn = 15);
    translate([0,0,-0.4])
    cylinder(d = 5.4, h = 0.4);
}

module m3bolt_inflated() {
    minkowski() {
        m3bolt();
        sphere(r=0.05);
    }
}

module lid() {
    difference() {
        top();
        translate([0,0,3 - 0.13])
        rotate([0,180,0])
        m3bolt_inflated();
    }
}

module box() {
    difference(){
        union() {
            cylinder(d=20,h=10 - 3);
            cylinder(d=22,h=10 - 6 - 0.5);
            minkowski() {
                translate([-9,0,0.05])
                cube([18,22+10,1-0.1]);
                cylinder(r=2,h=0.1);
            }
        }
        translate([0,0,4])
        cylinder(d=13.5,h=10);
        translate([0,0,4 - 0.13])
        rotate([0,180,0])
        m3bolt_inflated();
    }
    
}

print = 1;
part = 0;
if (print == 0) {
    box();
    #translate([0,0,10])
    rotate([0,180,0])
    lid();
} else {
    if (part == 0) {
        difference() {
            box();
            translate([-100,-100,0])
            cube([200,200,0.05]);
        }
    } else {
        translate([25,0,0])
        lid();
    }
}