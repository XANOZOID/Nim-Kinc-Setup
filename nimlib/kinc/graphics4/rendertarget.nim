
const hhkRTarget = "kinc/graphics4/rendertarget.h"

type
    Kinc_g4_render_target_format*{.importc:"enum kinc_g4_render_target_format", header:hhkRTarget.} = enum
        KINC_G4_RENDER_TARGET_FORMAT_32BIT,
        KINC_G4_RENDER_TARGET_FORMAT_64BIT_FLOAT,
        KINC_G4_RENDER_TARGET_FORMAT_32BIT_RED_FLOAT,
        KINC_G4_RENDER_TARGET_FORMAT_128BIT_FLOAT,
        KINC_G4_RENDER_TARGET_FORMAT_16BIT_DEPTH,
        KINC_G4_RENDER_TARGET_FORMAT_8BIT_RED,
        KINC_G4_RENDER_TARGET_FORMAT_16BIT_RED_FLOAT

    Kinc_g4_render_target*{.importc:"struct kinc_g4_render_target", header:hhkRTarget.} = object
        width: cint
        height: cint
        texWidth: cint
        texHeight: cint
        contextId: cint
        isCubeMap: bool
        isDepthAttachment: bool
        #kinc_g4_render_target_impl_t impl

proc kinc_g4_render_target_init*(renderTarget: var Kinc_g4_render_target, width: cint, height: cint, depthBufferBits: cint, 
    antialiasing: bool, format: Kinc_g4_render_target_format, stencilBufferBits: cint, contextId: cint)
    {.header:hhkRTarget.}

# void kinc_g4_render_target_init_cube(kinc_g4_render_target_t *renderTarget, int cubeMapSize, int depthBufferBits, bool antialiasing,
#                                      kinc_g4_render_target_format_t format, int stencilBufferBits, int contextId);

proc kinc_g4_render_target_destroy*(renderTarget: var Kinc_g4_render_target)
    {.header:hhkRTarget.}

# void kinc_g4_render_target_use_color_as_texture(kinc_g4_render_target_t *renderTarget, kinc_g4_texture_unit_t unit);
# void kinc_g4_render_target_use_depth_as_texture(kinc_g4_render_target_t *renderTarget, kinc_g4_texture_unit_t unit);
# void kinc_g4_render_target_set_depth_stencil_from(kinc_g4_render_target_t *renderTarget, kinc_g4_render_target_t *source);
# void kinc_g4_render_target_get_pixels(kinc_g4_render_target_t *renderTarget, uint8_t *data);
# void kinc_g4_render_target_generate_mipmaps(kinc_g4_render_target_t *renderTarget, int levels);