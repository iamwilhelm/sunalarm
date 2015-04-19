$fs = 0.5;
$tol = 1;

boltLength = 4;
boltOffset = 15.5;
wallThickness = 4;
centerCutout = 22;

module motorMount(width, thickness) {
  // Base plate
  difference() {
    translate([0, 0, wallThickness / 2])
      cube([width, width, thickness], center = true);

    // screw hole mounts
    translate([boltOffset, boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }
    translate([-boltOffset, boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }
    translate([-boltOffset, -boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }
    translate([boltOffset, -boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }

    // Center hole/shaft cutout
    translate([0,0, -$tol]){
      cylinder(r=centerCutout/2 + $tol, h=wallThickness+2);
    }
  }
}

module hangingMount(){
  height = 25;
	supportThickness = 5;
	supportWidth = 10;
	supportHeight = 40;
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
	}
	
}

hangingMount();
