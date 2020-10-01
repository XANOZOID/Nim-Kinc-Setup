import pipeline, ../math/matrix, texture, rendertarget, texturearray

const hhkGraphics = "kinc/graphics4/graphics.h"

type 
    Kinc_g4_texture_addressing* = enum
        kincG4TextureAddressingRepeat,
        kincG4TextureAddressingMirror,
        kincG4TextureAddressingClamp,
        kincG4TextureAddressingBorder
    Kinc_g4_texture_direction* = enum
        kincG4TextureDirection_U,
        kincG4TextureDirection_V,
        kincG4TextureDirection_W
    Kinc_g4_texture_operation* = enum
        kincG4TextureOperationModulate,
        kincG4TextureOperationSelectFirst,
        kincG4TextureOperationSelectSecond
    Kinc_g4_texture_argument* = enum
        kincG4TextureArgumentCurrentColor,
        kincG4TextureArgumentTextureColor
    Kinc_g4_texture_filter* = enum
        kincG4TextureFilterPoint,
        kincG4TextureFilterLinear,
        kincG4TextureFilterAnisotropic
    Kinc_g4_mipmap_filter* = enum
        kincG4MipmapFilterNone,
        kincG4MipmapFilterPoint,
        kincG4MipmapFilterLinear # linear texture filter + linear mip filter -> trilinear filter

let kinc_g4_clear_color*:uint = 1
let kinc_g4_clear_depth*:uint = 2
let kinc_g4_clear_stencil*:uint = 4

proc kinc_g4_init*(window:cint, depthBufferBits: cint, stencilBufferBits: cint, vSync: bool)
    {.header:hhkGraphics.}
proc kinc_g4_destroy*(window:cint)
    {.header:hhkGraphics.}
proc kinc_g4_flush*()
    {.header:hhkGraphics.}
proc kinc_g4_begin*(window:cint)
    {.header:hhkGraphics.}
proc kinc_g4_end*(window:cint)
    {.header:hhkGraphics.}
proc kinc_g4_swap_buffers*():bool   
    {.header:hhkGraphics, discardable.}

proc kinc_g4_clear*(flags:cuint, color: cuint, depth: cfloat, stencil: cint)
    {.header:hhkGraphics.}

proc kinc_g4_viewport*(x:cint, y: cint, width:cint, height:cint)
    {.header:hhkGraphics.}

proc kinc_g4_scissor*(x:cint, y: cint, width:cint, height:cint)
    {.header:hhkGraphics.}

proc kinc_g4_disable_scissor*()
    {.header:hhkGraphics.}

proc kinc_g4_draw_indexed_vertices*()
    {.header:hhkGraphics.}

proc kinc_g4_draw_indexed_vertices_from_to*(start: cint, count: cint)
    {.header:hhkGraphics.}

proc kinc_g4_draw_indexed_vertices_from_to_from*(start: cint, count: cint, vertex_start: cint)
    {.header:hhkGraphics.}

proc kinc_g4_draw_indexed_vertices_instanced*(instanceCount: cint)
    {.header:hhkGraphics.}

proc kinc_g4_draw_indexed_vertices_instanced_from_to*(instanceCount: cint, start: cint, count: cint)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_addressing*(unit: Kinc_g4_texture_unit, dir: Kinc_g4_texture_direction, addressing: Kinc_g4_texture_addressing)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture3d_addressing*(unit: Kinc_g4_texture_unit, dir: Kinc_g4_texture_direction, addressing: Kinc_g4_texture_addressing)
    {.header:hhkGraphics.}

proc kinc_g4_set_pipeline*(pipeline: var Kinc_g4_pipeline)
    {.header:hhkGraphics.}

proc kinc_g4_set_stencil_reference_value*(value: cint)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_operation*(operation: Kinc_g4_texture_operation, arg1: Kinc_g4_texture_argument, arg2: Kinc_g4_texture_argument)
    {.header:hhkGraphics.}

proc kinc_g4_set_int*(location: Kinc_g4_constant_location, value: cint)
    {.header:hhkGraphics.}
proc kinc_g4_set_int2*(location: Kinc_g4_constant_location, value1: cint, value2: cint)
    {.header:hhkGraphics.}
proc kinc_g4_set_int3*(location: Kinc_g4_constant_location, value1: cint, value2: cint, value3: cint)
    {.header:hhkGraphics.}
proc kinc_g4_set_int4*(location: Kinc_g4_constant_location, value1: cint, value2: cint, value3: cint, value4: cint)
    {.header:hhkGraphics.}
proc kinc_g4_set_ints*(location: Kinc_g4_constant_location, values: ptr cint, count: cint)
    {.header:hhkGraphics.}

proc kinc_g4_set_float*(location: Kinc_g4_constant_location, value: cfloat)
    {.header:hhkGraphics.}
proc kinc_g4_set_float2*(location: Kinc_g4_constant_location, value1: cfloat, value2: cfloat)
    {.header:hhkGraphics.}
proc kinc_g4_set_float3*(location: Kinc_g4_constant_location, value1: cfloat, value2: cfloat, value3: cfloat)
    {.header:hhkGraphics.}
proc kinc_g4_set_float4*(location: Kinc_g4_constant_location, value1: cfloat, value2: cfloat, value3: cfloat, value4: cfloat)
    {.header:hhkGraphics.}
proc kinc_g4_set_floats*(location: Kinc_g4_constant_location, values: ptr cfloat, count: cint)
    {.header:hhkGraphics.}

proc kinc_g4_set_bool*(location: Kinc_g4_constant_location, value: bool)
    {.header:hhkGraphics.}

proc kinc_g4_set_matrix3*(location: Kinc_g4_constant_location, value: var Kinc_matrix3x3)
    {.header:hhkGraphics.}
proc kinc_g4_set_matrix4*(location: Kinc_g4_constant_location, value: var Kinc_matrix4x4)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_magnification_filter*(unit: Kinc_g4_texture_unit, filter: Kinc_g4_texture_filter)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture3d_magnification_filter*(texunit: Kinc_g4_texture_unit, filter: Kinc_g4_texture_filter)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_minification_filter*(unit: Kinc_g4_texture_unit, filter: Kinc_g4_texture_filter)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture3d_minification_filter*(texunit: Kinc_g4_texture_unit, filter: Kinc_g4_texture_filter)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_mipmap_filter*(unit: Kinc_g4_texture_unit, filter: Kinc_g4_mipmap_filter)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture3d_mipmap_filter*(texunit: Kinc_g4_texture_unit, filter: Kinc_g4_mipmap_filter)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_compare_mode*(unit: Kinc_g4_texture_unit, enabled: bool)
    {.header:hhkGraphics.}

proc kinc_g4_set_cubemap_compare_mode*(unit: Kinc_g4_texture_unit, enabled: bool)
    {.header:hhkGraphics.}

proc kinc_g4_render_targets_inverted_y*():bool
    {.header: hhkGraphics.}

proc kinc_g4_non_pow2_textures_supported*():bool
    {.header: hhkGraphics.}

proc kinc_g4_restore_render_target*()
    {.header:hhkGraphics.}

proc kinc_g4_set_render_targets*(targets: var ptr Kinc_g4_render_target, count: cint)
    {.header:hhkGraphics.}

proc kinc_g4_set_render_target_face*(texture: var Kinc_g4_render_target, face: cint)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture*(unit: Kinc_g4_texture_unit, texture: ptr Kinc_g4_texture)
    {.header:hhkGraphics.}

proc kinc_g4_set_image_texture*(unit: Kinc_g4_texture_unit, texture: var Kinc_g4_texture)
    {.header:hhkGraphics.}

proc kinc_g4_init_occlusion_query*(occlusionQuery: var cuint):bool
    {.header:hhkGraphics.}

proc kinc_g4_delete_occlusion_query*(occlusionQuery: cuint)
    {.header:hhkGraphics.}

proc kinc_g4_start_occlusion_query*(occlusionQuery: cuint)
    {.header:hhkGraphics.}

proc kinc_g4_end_occlusion_query*(occlusionQuery: cuint)
    {.header:hhkGraphics.}

proc kinc_g4_are_query_results_available*(occlusionQuery: cuint):bool
    {.header:hhkGraphics.}

proc kinc_g4_get_query_results*(occlusionQuery: cuint, pixelCount:var cuint)
    {.header:hhkGraphics.}

proc kinc_g4_set_texture_array*(unit: Kinc_g4_texture_unit, array: ptr Kinc_g4_texture_array)
    {.header:hhkGraphics.}

proc kinc_g4_antialiasing_samples*():cint
    {.header:hhkGraphics.}

proc kinc_g4_set_antialiasing_samples*(samples: cint)
    {.header:hhkGraphics.}
