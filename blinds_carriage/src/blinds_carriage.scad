use <motor_mount.scad>

ARR = "assembly";
$tol = 1;

motorWidth = 42;
motorThickness = 5;

hangerThickness = 8;

nativeCarriageLength = 46;
controlBoxLength = 15;
hangerInterval = nativeCarriageLength + motorWidth / 2;
stubLength = 3.5;

motorMountOffsetX = nativeCarriageLength / 2 - (controlBoxLength / 2) - stubLength;

module blindsCarriage() {
  module uprightMotorHanger() {
    rotate([90, 0, 90])
      translate([0, 0, -hangerThickness / 2])
        motorHanger();
  }

  if (ARR == "assembly") {
    motorMount(hangerInterval, motorWidth, motorThickness, motorMountOffsetX);

    translate([hangerInterval / 2, 0, 0])
      uprightMotorHanger();
    translate([-hangerInterval / 2, 0, 0])
      uprightMotorHanger();


  } else if (ARR == "plate") {

    translate([55, 0, 0])
      motorHanger();

    motorMount(hangerInterval, motorWidth, motorThickness, motorMountOffsetX);
  }
}

blindsCarriage();

