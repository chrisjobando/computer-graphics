#include "colors.inc"

camera {
  location<2,2,2>
  look_at <0,0,1>
  sky z
}

light_source {
  <2,2,2>,1
}

background {
  color Cyan
}

#macro tree(i)
  union {
    cone {
      <0,0,0>, 0.1,
      <0,0,1>, 0.06
      
      pigment {color Brown}
    }
    #if (i>0)
      union{
        #local j=0;
        #while (j<3)
          object {
            tree(i-1)
            rotate <0,45,0>
            rotate <0,0,120*j>
          }
          #local j=j+1;
        #end
        scale 0.6
        translate <0,0,1>
      }
    #end
} #end

tree(10)