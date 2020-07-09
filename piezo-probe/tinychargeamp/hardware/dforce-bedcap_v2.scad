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

module ear(r_ear, w_ear, h_ear, hole_dia = 0) {
    difference() {
        hull() {
            cylinder(d = w_ear, h = h_ear, $fn=20);
            translate([r_ear,0,0])
            cylinder(d = w_ear, h = h_ear, $fn=20);
        }
        if (hole_dia != 0) {
            translate([r_ear,0,0])
            cylinder(d = hole_dia, h = h_ear, $fn=20);
        }
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
    bladedlid(r = 21 / 2, w = 1.5, h = 2, ang = 60, n = 3);
    
    difference() {
        union() {
            cylinder(d = 23, h = 6);
            for (i = [0 : 360/3 : 360])
                rotate([0,0,i])
                ear(r_ear = 30/2, w_ear = 8, h_ear = 6, hole_dia = 3.5);
        }
        cylinder(d = 21, h = 6);
        for (i = [0 : 360/3 : 360])
            rotate([0,0,i])
            translate([30/2,0,0])
            cylinder(d1 = 6.5, d2=3.2, h = 4);
    }
    
    cylinder(d = 9, h = 3);
}

module m3bolt() {
    linear_extrude(height = 1.6, scale = 2.85 / 5.4, $fn = 15)
    circle(d = 5.4);
    cylinder(d = 2.9, h = 10, $fn = 15);
    translate([0,0,-4])
    cylinder(d = 5.4, h = 4);
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
        translate([0,0,3 - 0.5])
        rotate([0,180,0])
        m3bolt_inflated();
    }
}

module box() {
    difference(){
        union() {
            cylinder(d=20,h=10 - 3);
            cylinder(d=22,h=10 - 6 - 1);
            minkowski() {
                translate([-9,0,0.05])
                cube([18,22+10,1-0.1]);
                cylinder(r=2,h=0.1);
            }
            for (i = [0 : 360/3 : 360])
                rotate([0,0,i + 30])
                ear(r_ear = 30/2, w_ear = 8, h_ear = 10 - 6 - 1, hole_dia = 1.5);
        }
        translate([0,0,4])
        cylinder(d=13.5,h=10);
        translate([0,0,4 - 0.13])
        rotate([0,180,0])
        m3bolt_inflated();
    }
    
}

print = 0;
part = 1;
if (print == 0) {
    box();
    translate([0,0,10])
    rotate([0,180,30+180])
    lid();
} else if(print == 1) {
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
} else if (print == 2) {
    if (part == 0) { 
       box();
    } else {
        lid();
    }
}