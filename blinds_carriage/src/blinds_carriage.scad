use <motor_mount.scad>

ARR = "plate";
$tol = 1;

motorWidth = 42;
motorThickness = 5;

hangerThickness = 8;

carriageLength = 46;

module blindsCarriage() {
  module uprightMotorHanger() {
    rotate([90, 0, 90])
      translate([0, 0, -hangerThickness / 2])
        motorHanger();
  }

  if (ARR == "assembly") {
    motorMount(motorWidth, motorThickness);

    translate([carriageLength / 2, 0, 0])
      uprightMotorHanger();
    translate([-carriageLength / 2, 0, 0])
      uprightMotorHanger();


  } else if (ARR == "plate") {

    translate([40, 0, 0])
      motorHanger();

    motorMount(motorWidth, motorThickness);
  }
}

blindsCarriage();

