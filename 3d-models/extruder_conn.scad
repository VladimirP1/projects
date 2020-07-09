module flange() {
    difference() {
        cylinder(d = 12, h=18);
        cylinder(d = 9.5, h = 6.5);
        translate([0,0,6.5])
        cylinder(d = 7, h = 20);
    }
}

module holed_ear(holes=1) {
    translate([-4,-1,0])
    difference() {
        cube([8,2,18]);
        if (holes == 1) {
            translate([4,0,4])
            rotate([-90,0,0])
            cylinder(d = 3.3, h = 10, $fn = 10);
            translate([4,0,18-4])
            rotate([-90,0,0])
            cylinder(d = 3.3, h = 10, $fn = 10);
        }
    }
    
}
translate([9,2,0])
holed_ear();
translate([9,-2,0])
holed_ear();
difference() {
    flange();
    translate([3,0,0])
    holed_ear(0);
}
