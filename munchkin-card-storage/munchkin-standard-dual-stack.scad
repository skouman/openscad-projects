$fn = 100;

module cutout() {
    union(){
        // Card pocket
        translate([0,0,1]) cube([60,92,43], center=true); //Card hole
    
        // Finger slots
        rotate([90,0,0]) translate([0,0,0]) cylinder(h=100,d=30,center=true);
        translate([0,0,15]) cube([30,100,30], center=true);
     
     difference() {
        translate([0,0,20]) cube([50,100,20], center=true);
        rotate([90,0,0]) translate([25,11.5,0]) cylinder(h=100,r=10, center=true);
        rotate([90,0,0]) translate([-25,11.5,0]) cylinder(h=100,r=10, center=true);
        }
    
        // Buttom slot
        hull() {
            translate([0,15,0]) cylinder(h=100, d=40, center=true);
            translate([0,-15,0]) cylinder(h=100, d=40, center=true);
            }
        }
    }

intersection() {
    difference() {
        // Main cube
        cube([129,96,43], center=true);
        
        // Finger slots - long side
        rotate([0,90,0]) cylinder(h=140,d=30,center=true);
        translate([0,0,15]) cube([140,30,30], center=true);
        
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
        
        difference() {
            translate([0,0,20]) cube([150,50,20], center=true);
            translate([0,-25,11.5]) rotate([0,90,0])  cylinder(h=150,r=10, center=true);
            translate([0,25,11.5]) rotate([0,90,0]) cylinder(h=150,r=10, center=true);
        }
        
        // Card pockest and other repeated cutouts  
        for (i=[-31.5,31.5])
            translate([i, 0, 0]) cutout();
        
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
    
    // Bottom chanfer
    rotate([90,180,0]) linear_extrude(height = 150, center = true) {
        polygon(points = [ [-129/2, -43/2], 
                           [129/2, -43/2], 
                           [129/2, (43/2)-2], 
                           [(129/2)-1, 43/2], 
                           [(-129/2)+1, 43/2], 
                           [-129/2, (43/2)-2] ]);
    }  
}