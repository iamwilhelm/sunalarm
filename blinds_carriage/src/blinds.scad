use <motor_mount.scad>

ARR = "assembly";
$tol = 1;

motorWidth = 42;
wallThickness = 5;

module blinds() {
  if (ARR == "assembly") {
    motorMount(motorWidth, wallThickness);
  } else {

  }
}

blinds();

