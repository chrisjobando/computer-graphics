// This file shows a pencil created with the "pencil.inc" file.

#include "colors.inc"
#include "textures.inc"
#include "pencil.inc"

camera
{
  location  <-1.0 , 1.0 ,-3.5>
  look_at   <-1.4 , 1.3 , 0.0>
}

background { color red 1 green 1 blue 1}

light_source
{
  0*x
  color red 1.0  green 1.0  blue 1.0
  translate <-10, 40, 10>
}

light_source
{
  0*x
  color rgb 1.0
  area_light
  <8, 0, 0> <0, 0, 8>
  4, 4
  adaptive 0
  jitter
  translate <40, 80, -40>
}

light_source
{
  0*x
  color red 1.0  green 1.0  blue 1.0
  translate <-5, 40, -10>
}


object {pencil
rotate 180*z
translate 5*y
rotate 50*z}
