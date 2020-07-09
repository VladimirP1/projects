



difference() {
    union() {
        roundcube(40, 80, 10, 2);
        
        for (i = [
            [0, "0.25"],
            [20, "0.3"],
            [40, "0.4"],
            [60, "0.5"],
        ])
        translate([i[0] + 3, 35, 10])
        linear_extrude(height=1)
        text(text = i[1], size = 6);
    }

    for (i = [0 : 20: 70]) {
        translate([i + 3, 2, 2])
        roundcube(30, 14, 10, 2);
    }
}

module roundcube(width, length, height, radius) {    
    hull() {
        $fn = 20;
        cylinder(r = radius, h = 10);
        translate([length, width, 0])
        cylinder(r = radius, h = 10);
        translate([length, 0, 0])
        cylinder(r = radius, h = 10);
        translate([0, width, 0])
        cylinder(r = radius, h = 10);
    }
}