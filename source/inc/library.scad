use <roundCornersCube.scad>
include <metric.scad>

module nema17_mount(){
	difference(){
		//block
		
		translate([0,0,1.5])roundCornersCube(45,45,3,5);
		
		// Nema 17 cut
		translate([0,0,-1])nema17_cut(5);
	}
}

module nema17_cut(height=10){
	rotate ([0,0,45]) translate([20,0,height/2]) cube(size = [9,m3_diameter,height], center = true);
	rotate ([0,0,-45]) translate([20,0,height/2]) cube(size = [9,m3_diameter,height], center = true);
	rotate ([0,0,135]) translate([20,0,height/2]) cube(size = [9,m3_diameter,height], center = true);
	rotate ([0,0,-135]) translate([20,0,height/2]) cube(size = [9,m3_diameter,height], center = true);
	cylinder(h=height,r=13);
}
