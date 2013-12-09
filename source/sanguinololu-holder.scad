wall_thickness = 2;
M8_dia = 8;
M3_dia = 3;
M3_nut_dia = 5.5;
// distance between holes on electronics
hole_distance = 94;
// distance between rods on printer
rod_distance = 147.5;


module rod_catch(M8_dia = 8,wall_thickness = 2,length = 10,zip_width = 2){
	difference(){
		cube(size = [length,M8_dia + 2*wall_thickness,M8_dia/2 + 2*wall_thickness],center=true);
		translate([0,0,1.5*wall_thickness])rotate([0,90,0])hull(){
			cylinder(r=M8_dia/2,h=length+1,center=true);
			translate([-3,0,0])cylinder(r=M8_dia/2,h=length+1,center=true);
		}
		translate([0,0,1.6*wall_thickness])rotate([0,90,0]){
			difference(){
				cylinder(r = M8_dia/2 + 3*wall_thickness,h=zip_width,center=true);
				cylinder(r = M8_dia/2 + wall_thickness + 0.2,h=zip_width,center=true);
			}
		}
	}
}

module parametric_holder(M8_dia = 8, M3_dia = 3, M3_nut_dia = 5.5,wall_thickness = 2,rod_distance = 150,hole_distance = 100, zip_width = 2){
	width = zip_width + M3_nut_dia + wall_thickness;

	difference(){
		union(){
			cube(size = [width, rod_distance + M8_dia + wall_thickness*2, wall_thickness],center = true);
			translate([0,-hole_distance/2,wall_thickness])
			cube(size = [width, M3_dia + wall_thickness, 2*wall_thickness],center = true);
			translate([0,hole_distance/2,wall_thickness])
			cube(size = [width, M3_dia + wall_thickness, 2*wall_thickness],center = true);
			}
		//screw holes
		translate([0,-hole_distance/2,wall_thickness])cylinder(r = M3_dia/2, h = 4*wall_thickness, center = true, $fn=10);
	translate([0,hole_distance/2,wall_thickness])cylinder(r = M3_dia/2, h = 4*wall_thickness, center = true, $fn=10);
	}

	translate([0,rod_distance/2,wall_thickness*2.5])rod_catch(M8_dia = M8_dia,wall_thickness = wall_thickness,length = width, zip_width = zip_width);
	translate([0,-rod_distance/2,wall_thickness*2.5])rod_catch(M8_dia = M8_dia,wall_thickness = wall_thickness,length = width, zip_width = zip_width);
}

rotate([0,90,-45])parametric_holder(M8_dia,M3_dia,M3_nut_dia,wall_thickness,rod_distance,hole_distance,3);

translate([0,16,0])rotate([0,90,-45])parametric_holder(M8_dia,M3_dia,M3_nut_dia,wall_thickness,rod_distance,hole_distance,3);

