#include "colors.inc"
#include "metals.inc"
#include "glass.inc" 
#include "pencil.inc"
#include "textures.inc"
                 
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
    texture {
      pigment{Col_Glass_Ruby}
      finish{F_Glass7 ior 1.3}
    }      
  }     
  
#declare VaseRim = 
  torus {
    0.5, 0.02
    translate<0,13,0>   
    sturm
    texture {
      pigment{Col_Glass_Ruby}
      finish{F_Glass7 ior 1.5}
    }
  }

#declare Vase =
  merge {
    object {VaseBody}
    object {VaseRim}
  }            

#declare BoxBody =   
  box { 
    <-8,0,-0.5>, <-4,1.8,1.5>
    texture {
      pigment {Col_Glass_Clear}
      finish{F_Glass7 ior 1.5}
    }   
  }

#declare BoxRound =
  cylinder {
    <-8,0,0.5>,
    <-8,1.8,0.5>,
    1     
    texture {
      pigment {Col_Glass_Clear}
      finish{F_Glass7 ior 1.5}
    }  
  }    

#declare MarbleHolder =
  merge {
    object{BoxBody}
    object{BoxRound}
    object{
      BoxRound
      translate<4,0,0>
    }
    scale 1.1
  }

#declare PencilHolderBody = 
  sor{
    5
    <0,0>,
    <0.9,0>,
    <0.8,1.8>,
    <0.6,2.4>,
    <0.6,2>
    texture {
      pigment {Col_Glass_Clear}
      finish{F_Glass7 ior 1.5}
    }
    sturm
  }     
  
#declare PencilHolderRim = 
  torus {
    0.7, 0.1
    translate<0,2.4,0>   
    sturm
    texture {
      pigment {Col_Glass_Clear}
      finish{F_Glass7 ior 1.5}
    }
  } 

#declare PencilHolder =
  merge {
    object {PencilHolderBody}
    object {PencilHolderRim} 
    translate<-5,1.8,0.8>
    scale 1.1
  }
             
// Scene Set-up
camera {
  location <-15,5,-12>
  look_at <-5,5.5,0>
}

light_source {
  <0,6,-6>
  color Gray60
}
            
// Wall
background {
  rgb<0.8,0.8,0.8>
}
       
// Table
plane {
  y, 0
  texture {T_Chrome_2B}
  finish {metallic}
}             
             
             
// Containers  
object {Vase}
object {MarbleHolder} 
object {PencilHolder} 

// Pencils         
object {
  pencil         
  rotate <180,220,20>
  translate <-6.3,6.7,1>    
  scale 1.1
}