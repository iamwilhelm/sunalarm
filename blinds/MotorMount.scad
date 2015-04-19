module hangingMount(){
	motorWidth = 42;
	height = 25;
	bolt = 4;
	boltOffset = 15.5;
	wallThickness = 5;
	supportThickness = 5;
	supportWidth = 10;
	supportHeight = 40;
	centerCutout = 20;
	railInnerWidth = 15;
	distToRail=60;
	railOuterWidth = 18; //Replace these with real caliper values
	underslungHeight = 20;
	frameWidth = motorWidth;

	supportXOffset = frameWidth/2;
	supportYOffset = -supportWidth/2;

	distToSupportOuter = supportXOffset+supportThickness/2;
	supportAngle = atan(distToRail/distToSupportOuter);
	
	difference(){
		//Stuff to be added to the shape
		union(){
			translate([-frameWidth/2, -frameWidth/2, 0]){
				cube([motorWidth, motorWidth, wallThickness]);
			}
			
			translate([-supportXOffset, 0, wallThickness]){
				rotate([0, 90-supportAngle, 0]){
					cube([supportThickness, supportWidth, supportHeight]);
					translate([-10,0,supportHeight]){
						cube([15,10,5]);
					}
				}
			}
			
			translate([supportXOffset, 0, wallThickness]){
				rotate([0, 90-supportAngle, 180]){
					cube([supportThickness, supportWidth, supportHeight]);
					translate([-10,0,supportHeight]){
						cube([15,10,5]);
					}
				}
			}
		}
		//Stuff to be carved out of the added shape
		union(){
			translate([boltOffset, boltOffset, -1]){
				cylinder(r=bolt/2, h=wallThickness+2);
			}
			translate([-boltOffset, boltOffset, -1]){
				cylinder(r=bolt/2, h=wallThickness+2);
			}
			translate([-boltOffset, -boltOffset, -1]){
				cylinder(r=bolt/2, h=wallThickness+2);
			}
			translate([boltOffset, -boltOffset, -1]){
				cylinder(r=bolt/2, h=wallThickness+2);
			}
		
			//Center hole/shaft cutout
			translate([0,0, -1]){
				cylinder(r=centerCutout/2, h=wallThickness+2);
			}
		}
	}
	
}

hangingMount();