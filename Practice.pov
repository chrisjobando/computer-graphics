#include "colors.inc"
#include "golds.inc"

// Camera Position
camera {
  location <10, 15, -20>
  look_at <0, 5, 0>
  angle 45
}

// Light Position
light_source {
  <100, 100, -100>
  color rgb 1
}

// Background
background {
  color rgb<0.2, 0.4, 0.8>
}

// Checkerboard Floor
plane {
  y, 0
  pigment { checker color White, color Black scale 5 }
}

// Surface of Revolution Object
sor { // Cup
  8,
  <0.0,  -0.5>,
  <3.0,   0.0>,
  <1.0,   0.2>,
  <0.5,   0.4>,
  <0.5,   4.0>,
  <1.0,   5.0>,
  <3.0,  10.0>,
  <4.0,  11.0>
  open
  texture { T_Gold_1B }
}
