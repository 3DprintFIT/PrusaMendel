// FIT Mendel  v2.5
// X-end prototype
// GNU GPL v3
// Marek Žehra
// https://github.com/3DprintFIT/PrusaMendel

include <configuration.scad>
use <bushing.scad>
use <teardrop.scad>
use <library.scad>

module xend(closed_end=true, linear_bearing=false)
{
	//if(linear_bearing==true) lm8uu_bearing_holder();
	//if(linear_bearing==false) bushing();	
	
	//teardrop(r=smooth_bar_diameter);
	module_height = 10;
	translate([0,0,module_height/2])difference(){
		cube(size=[50,55,module_height], center = true);
		//bearing cut
		translate([0,0,module_height/2-3.5/2+0.1])#cube(size=[20,51,3.5], center = true);
	}
	
	
	translate([0,13,module_height-3.6])lm8uu_bearing_holder();
	translate([0,-13,module_height-3.6])lm8uu_bearing_holder();
}

xend(closed_end=true, linear_bearing=true);

