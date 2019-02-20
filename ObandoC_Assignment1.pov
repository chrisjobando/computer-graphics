include "colors.inc"
include "metals.inc"
include "glass.inc" 
include "pencil.inc"

camera {
  location <-5.0, 12.0, -25.0>
  look_at <0.0, 5.0, 0.0>
}

light_source {
  <4.0, 6.0, -1.0> // Location
  White // Color
}

background { // Wall
  White
}

plane { // Table
  y, 0
  texture {
    T_Silver_5A
    pigment {
      P_Silver2
    }
    finish {
      F_MetalB
    }
  }
}

sor { // Vase
  6
  <0, -0.5>
  <1, 0>,
  <2.5, 4>,
  <1, 8>,
  <0.4, 13>,
  <0.8, 15>
  open
  texture {
    pigment {
      Col_Glass_Ruby
    }
    finish {
      specular 0
      roughness 0.001
      ambient 0
      diffuse 0
      reflection {
        0.2, 1
        fresnel on
      }
      conserve_energy
    }
  }
  sturm on
}
          
object {
  pencil         
  rotate <180,180,0>
  translate <-3,5.3,0>    
  scale 1.3
}