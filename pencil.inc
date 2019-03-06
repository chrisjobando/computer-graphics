// a lead pencil, with a slightly dulled point,
// including the eraser and thingy that holds the eraser.
// the pencil is "standing up" with the point at <0, 0, 0>

#include "shapes.inc"  
#include "woods.inc"

#declare White = color red 1 green 1 blue 1;
#declare Black = color red 0 green 0 blue 0;

#declare Paint = texture {pigment{Black}
  finish
      {
         ambient 0.5
         diffuse 0.05
         brilliance 1
         specular 0.3
         reflection 0.01
      }
}

#declare T_Holder =
   texture
   {
      pigment{Black}
      finish
      {
         ambient 0.15
         diffuse 0.1
         brilliance 1
         specular 0.1
         reflection 0.007
      }
   }

#declare pencilbody=
difference
{
union
{
 difference
 {
  intersection
  {
   plane{z, .10825 texture{Paint}}
   plane{z, .10825 rotate 60*y texture {Paint}}
   plane{z, .10825 rotate 120*y texture {Paint}}
   plane{z, .10825 rotate 180*y texture {Paint}}
   plane{z, .10825 rotate 240*y texture {Paint}}
   plane{z, .10825 rotate 300*y texture {Paint}}
   plane{y, 4.5}
   plane{y, 0 inverse}
  }
  object{QCone_Y inverse scale<.13,1,.13>}
  texture{T_Wood14}
 }

 intersection
 {
  object{QCone_Y scale<.1301,1,.1301>}
  plane{y, 0 inverse}
  plane{y, .3}
  texture
  {
  pigment {Black}
  finish {ambient 0.25
  diffuse 0.2
  brilliance .6
  specular 0.3
  reflection 0.002}
  }
 }
 text {
   ttf "cyrvetic.ttf" "ENGLAND" 0.001,0
   pigment {White}
   scale 0.06
   translate <1.7,-0.03,-0.11>
   rotate 90*z
 }
 text {
   ttf "cyrvetic.ttf" "DERWENT - GRAPHIC                                38" 0.001,0
   pigment {White}
   scale 0.1
   translate <2.2,-0.04,-0.11>
   rotate 90*z
 }
}
plane {y, .12}
}

#declare eraser =
superellipsoid
{
  <1.0,
  .248>
  texture {pigment {Black}}
  rotate <90,0,0>
  scale <.12,.15,.12>
  translate <0,6.6,0>
}

#declare ridge =
torus
{
  0.11,
  0.023
  texture {T_Holder}
}

#declare holder =
union
{
cylinder
{
  6*y,  6.564*y,  .125
  texture {T_Holder}
}

cylinder
{
  6.23*y,  6.334*y,  .127
  texture {
      pigment
      {
         color rgb <1,0,0>
      }
      finish
      {
         ambient 0.35
         diffuse 0.2
         brilliance 1
         specular 0.3
         reflection 0.071933
      }
   }
}

object {ridge translate <0,6.069,0>}
object {ridge translate <0,6.115,0>}
object {ridge translate <0,6.161,0>}
object {ridge translate <0,6.207,0>}
object {ridge translate <0,6.357,0>}
object {ridge translate <0,6.403,0>}
object {ridge translate <0,6.449,0>}
object {ridge translate <0,6.495,0>}
}

#declare pencil = union
{
object {pencilbody}
object {eraser translate -1.5*y}
object {holder translate -1.5*y}
translate <0,-.12,0>
}
