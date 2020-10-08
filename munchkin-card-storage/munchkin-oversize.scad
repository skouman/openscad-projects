$fn = 100;

intersection(){
    difference() {
        cube([129,96,43], center=true);
        
        //Card pocket
        translate([0,0,1]) cube([123,90,43], center=true);
        
        // Bottom slot
        hull() {
            translate([20,0,0]) cylinder(h=50, d=60, center=true);
            translate([-20,0,0]) cylinder(h=50, d=60, center=true);
        }
        
        // Finger slots - long side
        rotate([0,90,0]) cylinder(h=280,d=30,center=true);
        translate([0,0,15]) cube([280,30,30], center=true);
        
        // Finger slots short side
        translate([0,0,15]) cube([63,100,30], center=true);
        hull() {
            rotate([90,0,0]) translate([16.5,0,0])   cylinder(h=100,d=30,center=true);
            rotate([90,0,0]) translate([-16.5,0,0]) cylinder(h=100,d=30,center=true);
        }

        // Plastic saving slots
        hull() {
            translate([0,31.5,5]) rotate([0,90,0]) cylinder(h=130,d=20,center=true);
            translate([0,31.5,-5]) rotate([0,90,0]) cylinder(h=130,d=20,center=true);
        }
        
        // Plastic saving slots
        hull() {
            translate([0,-31.5,5]) rotate([0,90,0]) cylinder(h=130,d=20,center=true);
            translate([0,-31.5,-5]) rotate([0,90,0]) cylinder(h=130,d=20,center=true);
        }
        
        // Plastic saving slots
        hull() {
            translate([48,0,5]) rotate([90,0,0]) cylinder(h=130,d=20,center=true);
            translate([48,0,-5]) rotate([90,0,0]) cylinder(h=130,d=20,center=true);
        }
        
        // Plastic saving slots
        hull() {
            translate([-48,0,5]) rotate([90,0,0]) cylinder(h=130,d=20,center=true);
            translate([-48,0,-5]) rotate([90,0,0]) cylinder(h=130,d=20,center=true);
        }
    }

    // Rounded vertical edges
    hull() {
        translate([-62,45.5,0]) cylinder(h=50, d=5, center=true);
        translate([62,45.5,0]) cylinder(h=50, d=5, center=true);
        translate([-62,-45.5,0]) cylinder(h=50, d=5, center=true);
        translate([62,-45.5,0]) cylinder(h=50, d=5, center=true);
        }
    
    // Bottom chamfer    
    rotate([90,180,90]) linear_extrude(height = 150, center = true) {
        polygon(points = [ [-96/2, -43/2], 
                           [96/2, -43/2], 
                           [96/2, (43/2)-2], 
                           [(96/2)-1, 43/2], 
                           [(-96/2)+1, 43/2], 
                           [-96/2, (43/2)-2] ]);
        }
    
    // Bottom chamfer    
    rotate([90,180,0]) linear_extrude(height = 150, center = true) {
        polygon(points = [ [-129/2, -43/2], 
                           [129/2, -43/2], 
                           [129/2, (43/2)-2], 
                           [(129/2)-1, 43/2], 
                           [(-129/2)+1, 43/2], 
                           [-129/2, (43/2)-2] ]);
        }
}