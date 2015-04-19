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
hangerInsertX = 32;
hangerInsertY = 16;
hangerCutoutRadius = 7 / 2;
hangerCutoutCenterOffsetX = 0;
hangerCutoutCenterOffsetY = 9.5 - hangerInsertY / 2;
hangerAttachmentX = 24.5;
hangerAttachmentY = 30;

module motorHanger() {
  // hanger insert
  translate([0, hangerInsertY / 2 + hangerAttachmentY, 0]) {
    difference() {
      translate([0, 0, hangerThickness / 2])
        cube([hangerInsertX, hangerInsertY, hangerThickness], center = true);
      translate([hangerCutoutCenterOffsetX, hangerCutoutCenterOffsetY, -$tol])
        cylinder(r = hangerCutoutRadius + $tol, h = hangerThickness + 2 * $tol);
    }
  }

  // hanger attachment
  translate([-hangerAttachmentX / 2, 0, 0])
    cube([hangerAttachmentX, hangerAttachmentY + 2 * $tol, hangerThickness]);
}

motorHanger();
