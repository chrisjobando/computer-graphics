#include "colors.inc"
#include "metals.inc"
#include "glass.inc"
#include "pencil.inc"
#include "textures.inc"

// ------------------------------------------ Vase --------------------------------------------

#declare VaseBody =
  lathe {
    cubic_spline
    7,
    <-0.1,0>, <0,0>, <1,0>,
    <2.6,4>,
    <0.9,8>,
    <0.5,13>,
    <0.3,13>
    sturm
  }

#declare VaseBottom =
  sor {
    4
    <0,-0.5>,<1.01,0>,
    <1.4,1.2>,<1.4,0.8>
    open
    sturm
    texture {
      pigment{color rgbt<0.1,0.6,0.5,0.7>}
      finish{
        ior 1.4
        specular 0.8
      }
    }
    translate <0.4,0,0>
  }

#declare VaseRim =
  torus {
    0.4, 0.05
    translate<0,13,0>
    sturm
  }

#declare Vase =
  merge {
    merge {
      object {VaseBody}
      object {VaseRim}
      texture {
        pigment{rgbf <0.9,0,0,0.7>}
        finish{
          F_Glass7
          ior 1.5
          specular 0.9
        }
      }
      translate <0.5,0,0> 
      scale 0.8
    }
    object {
      VaseBottom
    }
  }

// ------------------------------------- Marble Holder ----------------------------------------

#declare BoxBody =
  box {
    <-7,0,-0.5>, <-4,1.8,2>
  }

#declare BoxRound =
  cylinder {
    <-7,0,0.75>,
    <-7,1.8,0.75>,
    1.25
  } 

#declare MarbleHolder =
  merge {
    object{BoxBody}
    object{BoxRound}
    object{
      BoxRound
      translate<3,0,0>
    }
    
    // Ring Borders
    cylinder {<-4,1.74,2>,<-7,1.74,2>,0.05}
    cylinder {<-4,1.74,-0.5>,<-7,1.74,-0.5>,0.05}
    torus {1.25, 0.05 translate<-7,1.74,0.75>}
    torus {1.25, 0.05 translate<-4,1.74,0.75>}
    
    cylinder {<-4,1.2,2>,<-7,1.2,2>,0.05}
    cylinder {<-4,1.2,-0.5>,<-7,1.2,-0.5>,0.05}
    torus {1.25, 0.05 translate<-7,1.2,0.75>}
    torus {1.25, 0.05 translate<-4,1.2,0.75>}
    
    cylinder {<-4,0,2>,<-7,0,2>,0.05}
    cylinder {<-4,0,-0.5>,<-7,0,-0.5>,0.05}
    torus {1.25, 0.05 translate<-7,0,0.75>}
    torus {1.25, 0.05 translate<-4,0,0.75>}     
    
    interior{caustics 0.2 ior 1}
    texture {
      pigment {
        color rgbt<0.1,0.6,0.5,0.9>
      }
      finish {
        specular 0.9
        phong_size 300
        phong 0.1
        reflection 0.1
      }
    }    
    translate <0.8,0,0>
    rotate <0,-30,0>
    scale 0.8
  }

// ------------------------------------ Pencil Holder -----------------------------------------

#declare PencilHolderBody =
  sor{
    6
    <0.5,-0.5>,
    <0.72,0>,
    <0.72,0.8>,
    <0.62,1.1>
    <0.6,1.6>,
    <0.6,1.7> 
    open
    sturm
  }

#declare PencilHolderRim =
  torus {
    0.62, 0.05
    translate<0,1.6,0>
    sturm
  }

#declare PencilHolder =
  merge {
    object {PencilHolderBody}
    object {PencilHolderRim} 
    interior{caustics 0.2 ior 1}
    texture {
      pigment {
        color rgbt<0.1,0.6,0.5,0.9>
      }
      finish {
        specular 0.9
        phong_size 300
        phong 0.1
        reflection 0.1
      }
    }
    translate<-2.8,1.3,-1.1>
    scale 1.1
  }

// --------------------------------------------- Pencils -------------------------------------- 

#declare Pencils =
  merge {
    object { // Pencil 1
      pencil
      rotate <29,180,180>
      translate <-3.6,6.25,0.4>
      scale 0.8
    }
    
    object { // Pencil 2
      pencil
      rotate <10,-20,140>
      translate <-1.75,5.9,-2.2> 
      scale 0.8
    } 
    
    object { // Pencil 3
      pencil
      rotate <15,-50,135>
      translate <-1.9,6.1,-2.45> 
      scale 0.8
    }
    
    object { // Pencil 4
      pencil
      rotate <220,210,-30>
      translate <-3.8,6.1,-3.5>
      scale 0.8
    }
    
    object { // Pencil 5
      pencil
      rotate <210,190,15>
      translate <-5,6,-3.1>
      scale 0.8
    }
    
    object { // Pencil 6
      pencil
      rotate <152,0,23>
      translate <-5.3,6,-3>
      scale 0.8
    }
    
    object { // Pencil 7
      pencil
      rotate <180,140,34>
      translate <-6,6.2,-1.2>
      scale 0.8
    }
    
    object { // Pencil 8
      pencil
      rotate <180,180,30>
      translate <-5.95,6.3,-1>
      scale 0.8
    }
  }

// ------------------------------------------- Marble -----------------------------------------

#declare Marble =
  sphere {
    <0,0.25>, 0.25
    material{
      texture{finish{phong 1}}
      interior{ior 1.5 caustics 0.25}
    }
  }

// --------------------------------------------- Marbles --------------------------------------

#declare Marbles =
  merge {
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<0,0,1,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<0,0,1,1>]
        }
      }
      translate <-4.7,0,-2.75>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<0,0,1,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<0,0,1,1>]
        }
      }
      translate <-5.2,0,-2.6>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<0,0,1,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<0,0,1,1>]
        }
      }
      translate <-4.33,0,-2.1>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<0,0,1,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<0,0,1,1>]
        }
      }
      translate <-4.2,0,-2.6>
    }

    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.9,.5,0,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<.9,.5,0,1>]
        }
      } 
      translate <-3.75,0,-2.35>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.9,.5,0,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<.9,.5,0,1>]
        }
      }
      translate <-5.45,0,-2.15>
    }    
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.9,.5,0,1>]
           [0.5 rgbf<.2,.2,.2,1>]
           [1.0 rgbf<.9,.5,0,1>]
        }
      }
      translate <-4.9,0,-2.1>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.9,.5,0,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [1.0 rgbf<.9,.5,0,1>]
        }
      }
      translate <-4.75,0,-1.13>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.7,.8,0,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [0.0 rgbf<.7,.8,0,1>]
        }
      }
      translate <-5.45,0,-1.65>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.7,.8,0,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [0.0 rgbf<.7,.8,0,1>]
        }
      }
      translate <-4.93,0,-1.6>
    }
    
    object {
      Marble
      pigment{
        marble scale 0.5 turbulence 1.15
        color_map {
           [0.0 rgbf<.7,.8,0,1>]
           [0.5 rgbf<.3,.3,.3,1>]
           [0.0 rgbf<.7,.8,0,1>]
        }
      }
      translate <-4.38,0,-1.55>
    }
    scale 0.95
  }

// --------------------------------------- Scene Set-up ---------------------------------------

camera {
  location <-3.5,3,-14>
  look_at <-1.5,4,0>
}

light_source {
  <0,6,-6>
  color rgb<0.6,0.6,0.6>
}

// -------------------------------------------- Wall ------------------------------------------

background {
  color White
}

// -------------------------------------------- Table -----------------------------------------

plane {
  y, 0
  texture {Polished_Chrome}
  finish {reflection 0.6}
}

// ------------------------------------------ Containers --------------------------------------

object {Vase}
object {MarbleHolder}
object {Marbles}
object {PencilHolder}
object {Pencils}