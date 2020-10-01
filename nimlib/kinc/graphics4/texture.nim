import ../image

const hhkTexture = "kinc/graphics4/texture.h"

type 
    KincG4Texture* {.importc:"struct kinc_g4_texture" header:hhkTexture.} = object
        tex_width*: cint
        tex_height*: cint
        tex_depth*: cint
        format*: KincImageFormat
        # impl


proc kinc_g4_texture_init_from_image*(texture:var Kinc_g4_texture, image:var KincImage) {.header:hhkTexture.}