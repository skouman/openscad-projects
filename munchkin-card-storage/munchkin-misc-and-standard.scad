$fn = 100;

module cutout() {
    union(){
        // Card pocket
        translate([0,0,1]) cube([92,60,43], center=true); //Card hole
    
        // Finger slots
        hull() {
            rotate([90,0,0]) translate([-14,0,0]) cylinder(h=100,d=30,center=true);
            rotate([90,0,0]) translate([14,0,0]) cylinder(h=100,d=30,center=true);
        }
        translate([0,0,15]) cube([58,100,30], center=true);
        
        difference() {
            translate([0,0,20]) cube([78,100,20], center=true);
            rotate([90,0,0]) translate([78/2,11.5,0]) cylinder(h=100,r=10, center=true);
            rotate([90,0,0]) translate([-78/2,11.5,0]) cylinder(h=100,r=10, center=true);
        }
        
        // Buttom slot
        hull() {
            translate([15,0,0]) cylinder(h=100, d=40, center=true);
            translate([-15,0,0]) cylinder(h=100, d=40, center=true);
        }
    }
}
intersection() {
    difference() {
        // Main cube
        cube([260, 64, 43], center = true);
        
        //Pockets
        translate([82,0,0]) cutout();
        translate([-82,0,0]) cutout();
        translate([0,0,1]) cube([68,60,43], center=true);
        
        // Finger slots ends
        translate([130, 0, 0]) rotate([0,90,0]) cylinder(h=20, d=30, center=true);
        translate([-130, 0, 0]) rotate([0,90,0]) cylinder(h=20, d=30, center=true);
        translate([130,0,15]) cube([20,30,30], center=true);
        translate([-130,0,15]) cube([20,30,30], center=true);
     
        difference() {
            translate([0,0,20]) cube([300,50,20], center=true);
            translate([0,-25,11.5]) rotate([0,90,0])  cylinder(h=300,r=10, center=true);
            translate([0,25,11.5]) rotate([0,90,0]) cylinder(h=300,r=10, center=true);
        }
        
    }

    // Rounded vertical edges
    hull() {
        translate([-127.5,29.5,0]) cylinder(h=50, d=5, center=true);
        translate([127.5,29.5,0]) cylinder(h=50, d=5, center=true);
        translate([-127.5,-29.5,0]) cylinder(h=50, d=5, center=true);
        translate([127.5,-29.5,0]) cylinder(h=50, d=5, center=true);
    }
    
    // Bottom chamfer
    rotate([90,180,90]) linear_extrude(height = 300, center = true) {
        polygon(points = [ [-64/2, -43/2], 
                           [64/2, -43/2], 
                           [64/2, (43/2)-2], 
                           [(64/2)-1, 43/2], 
                           [(-64/2)+1, 43/2], 
                           [-64/2, (43/2)-2] ]);
    }
    
    // Bottom chanfer
    rotate([90,180,0]) linear_extrude(height = 70, center = true) {
        polygon(points = [ [-260/2, -43/2], 
                           [260/2, -43/2], 
                           [260/2, (43/2)-2], 
                           [(260/2)-1, 43/2], 
                           [(-260/2)+1, 43/2], 
                           [-260/2, (43/2)-2] ]);
    }
}