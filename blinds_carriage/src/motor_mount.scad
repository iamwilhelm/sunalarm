$fs = 0.5;
$tol = 1;

boltLength = 4;
boltOffset = 15.5;
motorCutoutRadius = 11;

module motorMount(width, wallThickness) {
  // Base plate
  difference() {
    translate([0, 0, wallThickness / 2])
      cube([width, width, wallThickness], center = true);

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
    translate([0, 0, -$tol]){
      cylinder(r = motorCutoutRadius + $tol, h = wallThickness + 2 * $tol);
    }
  }
}

hangerThickness = 8;
hangerInsertLength = 32;
hangerInsertWidth = 30;
hangerCutoutRadius = 7 / 2;
hangercutoutOffsetLength = hangerInsertLength / 2;
hangercutoutOffsetWidth = hangerInsertWidth / 2;
hangerAttachmentLength = 24.5;
hangerAttachmentWidth = 30;

module motorHanger() {
  // hanger insert
  translate([0, hangerAttachmentWidth / 2 + hangerAttachmentWidth, 0]) {
    difference() {
      translate([0, 0, hangerThickness / 2])
        cube([hangerInsertLength, hangerInsertWidth, hangerThickness], center = true);
      translate([0, 0, -$tol])
        cylinder(r = hangerCutoutRadius + $tol, h = hangerThickness + 2 * $tol);
    }
  }

  // hanger attachment
  translate([-hangerAttachmentLength / 2, 0, 0])
    cube([hangerAttachmentLength, hangerAttachmentWidth + 2 * $tol, hangerThickness]);
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
