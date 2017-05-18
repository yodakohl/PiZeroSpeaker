$fn=90;
radius=20;
size=40;
drill=30;
	
pi_hole_distance_x =58;
pi_hole_distance_y =23;
	
module base()
{
	minkowski()
	{
		cube(size=[92,52,40],center=true);
		cylinder(r=radius,center=true);
	}
}

module zero_standoff(){
	
	//Pi Zero Standoffs
	difference(){
		
		union(){
			translate([-pi_hole_distance_y/2,-pi_hole_distance_x/2,-20])cylinder(r=4,h=21);
			translate([-pi_hole_distance_y/2,pi_hole_distance_x/2,-20])cylinder(r=4,h=21);
			translate([pi_hole_distance_y/2,-pi_hole_distance_x/2,-20])cylinder(r=4,h=21);
			translate([pi_hole_distance_y/2,pi_hole_distance_x/2,-20])cylinder(r=4,h=21);
		}
		
		translate([-pi_hole_distance_y/2,-pi_hole_distance_x/2,-10])cylinder(r=1,h=21);
		translate([-pi_hole_distance_y/2,pi_hole_distance_x/2,-10])cylinder(r=1,h=21);
		translate([pi_hole_distance_y/2,-pi_hole_distance_x/2,-10])cylinder(r=1,h=21);
		translate([pi_hole_distance_y/2,pi_hole_distance_x/2,-10])cylinder(r=1,h=21);
	}
	
}

module speaker_box(){
	difference(){
		base();

		//translate([0,0,35])scale([0.95,0.90,0.9])base();

		//Speaker Cutout
		translate([-20,0,-15])cylinder(r=77.5/2,h=40);

		//Pi Zero Cutout
		translate([24,-35,-15])cube(size=[32,72,40]);
		
		//Mirco USB Hole
		translate([40,18,-0])cube(size=[30,14,12]);
		
		//Speaker Cable Hole
		translate([0,-2,-15])cube(size=[30,5,5]);


		//Grill Sockets
		translate([17,-38,5])cylinder(r=4,h=20);
		translate([17,38,5])cylinder(r=4,h=20);
		translate([-55,-38,5])cylinder(r=3,h=20);
		translate([-55,38,5])cylinder(r=3,h=20);


		//Speaker Drills
		translate([-20,0,5]){
			translate([-drill,drill,0])cylinder(r=1.5,h=20);
			translate([-drill,-drill,0])cylinder(r=1.5,h=20);
			translate([drill,-drill,0])cylinder(r=1.5,h=20);
			translate([drill,drill,0])cylinder(r=1.5,h=20);
		}
		
		//Cover Drills
		translate([0,0,5]){
			translate([-61,-27,0])cylinder(r=1.5,h=20);
			translate([-61,27,0])cylinder(r=1.5,h=20);
			translate([27,-41,0])cylinder(r=1.5,h=20);
			translate([27,41,0])cylinder(r=1.5,h=20);
			translate([60,-20,0])cylinder(r=1.5,h=20);
			translate([60,20,0])cylinder(r=1.5,h=20);
		}
		
	}
	
	translate([40,2,0]) zero_standoff();

}


module grillHoles(){
	
	for(y=[1:14]){
		for(x=[1:15]){
			translate([x*5,y*5,0]) scale([1,1,3])cube(2);
		}
	}
}

module grill(){
	
	difference(){
		union(){
			difference(){
				translate([0,0,0])scale([1,1,0.1])base();
				translate([0,0,-2])scale([0.95,.9,0.1])base();
				
					translate([45,0,-10])cylinder(r=2,r2=10,h=20);
				
					//Microphone Holes
					translate([45,-28,-10])cylinder(r=2,r2=2,h=20);
					translate([45,28,-10])cylinder(r=2,r2=2,h=20);
			}
			
			//Connection Pins
			translate([17,-38,-10])cylinder(r=3,r2=4,h=10);
			translate([17,38,-10])cylinder(r=3,r2=4,h=10);
			translate([-55,-38,-10])cylinder(r=2,r2=3,h=10);
			translate([-55,38,-10])cylinder(r=2,r2=3,h=10);
		}

		translate([-60,-38,0]){
			grillHoles();
		}
		
		//Logo
		translate([25, 35,1]) {
			%rotate([0,0,-90])scale([0.8,0.8,3])text("nyumaya.com", font = "Liberation Sans:style=Bold Italic");
		}
		
	}
	
}


speaker_box();

//translate([0,0,50]) grill();






