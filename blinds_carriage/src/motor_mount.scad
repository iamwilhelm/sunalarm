$fs = 0.5;
$tol = 1;

module roundedCube(size, radius) {
  module centered() {
    hull() {
      translate([size[0] / 2  - radius,  size[1] / 2 - radius, -size[2] / 2])
        cylinder(r = radius, h = size[2]);
      translate([size[0] / 2  - radius, -size[1] / 2 + radius, -size[2] / 2])
        cylinder(r = radius, h = size[2]);
      translate([-size[0] / 2 + radius, -size[1] / 2 + radius, -size[2] / 2])
        cylinder(r = radius, h = size[2]);
      translate([-size[0] / 2 + radius,  size[1] / 2 - radius, -size[2] / 2])
        cylinder(r = radius, h = size[2]);
    }
  }

  if (center == true) {
    centered();
  } else {
    translate([size[0] / 2, size[1] / 2, size[2] / 2]) centered();
  }
}

boltLength = 4;
boltOffset = 15.5;
motorCutoutRadius = 11;

module motorMount(length, width, wallThickness, offsetX) {
  // Base plate
  difference() {
    union() {
      // center plate
      translate([offsetX, 0, wallThickness / 2])
        roundedCube([width, width, wallThickness], center = true, radius = 5);

      // attachment plate
      translate([0, 0, wallThickness / 2])
        cube([length, width * 6 / 10, wallThickness], center = true);
    }

    // screw hole mounts
    translate([boltOffset + offsetX, boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }
    translate([-boltOffset + offsetX, boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }
    translate([-boltOffset + offsetX, -boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }
    translate([boltOffset + offsetX, -boltOffset, -1]){
      cylinder(r=boltLength/2, h=wallThickness+2);
    }

    // Center hole/shaft cutout
    translate([offsetX, 0, -$tol]){
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
        roundedCube([hangerInsertX, hangerInsertY, hangerThickness], center = true, radius = 5);
      translate([hangerCutoutCenterOffsetX, hangerCutoutCenterOffsetY, -$tol])
        cylinder(r = hangerCutoutRadius + $tol, h = hangerThickness + 2 * $tol);
    }
  }

  // hanger attachment
  translate([-hangerAttachmentX / 2, 0, 0])
    cube([hangerAttachmentX, hangerAttachmentY + 2 * $tol, hangerThickness]);
}

motorMount();
