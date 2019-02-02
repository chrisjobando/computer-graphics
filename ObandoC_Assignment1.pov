include "colors.inc"
include "metals.inc"
include "glass.inc"

camera {
  location <0.0, 8.0, -30.0>
  look_at <0.0, 0.0, 0.0>
}

light_source {
  <4.0, 6.0, -10.0> // Location
  White // Color
}

background { // Wall
  White
}

plane { // Table
  y, 0
  pigment {
    P_Chrome3
  }
  finish {
    F_MetalB
  }
}

sor {
  6
  <0, -0.5>
  <1, 0>,
  <2.3, 4>,
  <1, 8>,
  <0.4, 13>,
  <0.8, 15>
  open
  pigment { Col_Glass_Ruby }
  finish { F_MetalA }
}
