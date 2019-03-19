#include "woods.inc"

camera {
  angle 80 
  right x * image_width / image_height
  location <0,1,-2>
  look_at <0,0.8,0>
}

light_source{<1500,2500,-2500> color rgb<1,1,1> }


// Scenery from:
// http://www.f-lohmueller.de/pov_tut/backgrnd/pov/p_sky03.txt
// --------------------------- Sky -----------------------------
plane {
  <0,1,0>,1 hollow
  texture {
    pigment {
      color rgb<0.1,0.3,0.75>*0.7
    }
    #if (version = 3.7 ) finish { emission 1 diffuse 0 }
    #else finish { ambient 1 diffuse 0}
    #end 
  }
  texture {
    pigment {
      bozo turbulence 0.75
      octaves 6  omega 0.7 lambda 2 
      color_map {
        [0  color rgb <0.95,0.95,0.95>]
        [0.05  color rgb <1,1,1> * 1.25]
        [0.15 color rgb <0.85,0.85,0.85>]
        [0.55 color rgbt <1,1,1,1> * 1]
        [1 color rgbt <1,1,1,1> * 1]
      } 
      translate <3,0,-1>
      scale <0.3,0.4,0.2> * 3
    }
    finish {emission 1 diffuse 0} 
  }
  scale 10000
}

// -------------------------- Ground --------------------------- 
plane {
  <0,1,0>, 0 
  texture {
    pigment {
      color rgb<0.35,0.65,0> * 0.8
    }
    normal {
      bumps 1
      scale 0.01
    }
    finish {
      ambient 0.1
      diffuse 0.8
    }
  }
}

// ------------------------- Fog at horizon --------------------
fog {
  fog_type 2
  distance 1000
  color rgb <1,1,1> * 0.9
  fog_offset 0.1
  fog_alt 20
  turbulence 1.8
}

// ------------------------- Tree Macro -----------------------
// From: http://www.bugman123.com/Fractals/
#macro tree(i)
  union {
    cone {
      <0,0,0>, 0.1,
      <0,0,1>, 0.06
      texture {T_Wood22}
    }
    #if (i>0)
      union{
        #local j=0;
        #while (j<3)
          object {
            tree(i-1)
            rotate <0,45,0>
            rotate <0,0,100*j>
          }
          #local j=j+1;
        #end
        scale 0.6
        translate <0,0,1>
      }
    #end
  rotate <270,0,0>
  }
#end

// Generate 3D Tree Fractal (7th exponent)
tree(6)