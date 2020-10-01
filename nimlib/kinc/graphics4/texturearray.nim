import ../image

const hhkTextureA = "kinc/graphics4/texturearray.h"

type
    KincG4TextureArray* {.importc:"struct kinc_g4_texture_array", header:hhkTextureA.} = object
        #kinc_g4_texture_array_impl_t impl

proc kinc_g4_texture_array_init*(array: ptr Kinc_g4_texture_array, textures: ptr Kinc_image, count: cint)
    {.header: hhkTextureA.}
proc kinc_g4_texture_array_destroy*(array: ptr Kinc_g4_texture_array)
    {.header: hhkTextureA.}