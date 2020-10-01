import vertexstructure
import shader

const hhkPipe = "kinc/graphics4/pipeline.h"
const hhkCLoc = "kinc/graphics4/constantlocation.h"
const hhkTexU = "kinc/graphics4/constantlocation.h"

type
    Kinc_g4_constant_location* {.importc:"struct kinc_g4_constant_location", header: hhkCLoc.} = object
    Kinc_g4_texture_unit* {.importc:"struct kinc_g4_texture_unit", header: hhkTexU.} = object


# todo: come back to this file
type
    KincG4_blending_operation* {.importc:"enum kinc_g4_blending_operation_t", header:hhkPipe.} = enum
       kincG4BlendOne,
       kincG4BlendZero,
       kincG4BlendSourceAlpha,
       kincG4BlendDestAlpha,
       kincG4BlendINVSourceAlpha,
       kincG4BlendINVDestAlpha,
       kincG4BlendSourceColor,
       kincG4BlendDestColor,
       kincG4BlendINVSourceColor,
       kincG4BlendINVDestColor
    KincG4_compare_mode* {.importc:"enum kinc_g4_compare_mode_t", header:hhkPipe.} = enum
       kincG4CompareALWAYS,
       kincG4CompareNEVER,
       kincG4CompareEQUAL,
       kincG4CompareNOTEqual,
       kincG4CompareLESS,
       kincG4CompareLESSEqual,
       kincG4CompareGREATER,
       kincG4CompareGREATEREqual
    KincG4_cull_mode* {.importc:"enum kinc_g4_cull_mode_t", header:hhkPipe.} = enum
       kincG4CullClockwise,
       kincG4CullCounterClockwise,
       kincG4CullNothing
    KincG4_stencil_action* {.importc:"enum kinc_g4_stencil_action_t", header:hhkPipe.} = enum
       kincG4StencilKEEP,
       kincG4StencilZERO,
       kincG4StencilREPLACE,
       kincG4StencilINCREMENT,
       kincG4StencilINCREMENTWrap,
       kincG4StencilDECREMENT,
       kincG4StencilDECREMENTWrap,
       kincG4StencilINVERT

    Kinc_g4_pipeline* {.importc:"struct kinc_g4_pipeline", header:hhkPipe.} = object
        input_layout*:array[16, ptr Kinc_g4_vertex_structure]
        vertex_shader*:ptr KincG4Shader
        fragment_shader*:ptr Kinc_g4_shader
        geometry_shader*:ptr Kinc_g4_shader
        tessellation_control_shader*:ptr Kinc_g4_shader
        tessellation_evaluation_shader*:ptr Kinc_g4_shader

        cull_mode:Kinc_g4_cull_mode

        depth_write:bool
        depth_mode:Kinc_g4_compare_mode

        stencil_mode: Kinc_g4_compare_mode 
        stencil_both_pass:Kinc_g4_stencil_action
        stencil_depth_fail:Kinc_g4_stencil_action
        stencil_fail:Kinc_g4_stencil_action
        stencil_reference_value:cint
        stencil_read_mask:cint
        stencil_write_mask:cint

        # One, Zero deactivates blending
        blend_source*: Kinc_g4_blending_operation
        blend_destination*: Kinc_g4_blending_operation
        # BlendingOperation blendOperation
        alpha_blend_source*: Kinc_g4_blending_operation
        alpha_blend_destination*: Kinc_g4_blending_operation
        # BlendingOperation alphaBlendOperation

        color_write_mask_red: array[8, bool] # Per render target
        color_write_mask_green: array[8, bool]
        color_write_mask_blue: array[8, bool]
        color_write_mask_alpha: array[8, bool]

        conservative_rasterization: bool 

proc kinc_g4_pipeline_init*(state: var Kinc_g4_pipeline)
    {.header: hhkPipe.}
proc kinc_g4_pipeline_destroy*(state: var Kinc_g4_pipeline)
    {.header: hhkPipe.}
proc kinc_g4_pipeline_compile*(state: var Kinc_g4_pipeline)
    {.header: hhkPipe.}
proc kinc_g4_pipeline_get_constant_location*(state: var Kinc_g4_pipeline, name:cstring):Kinc_g4_constant_location
    {.header: hhkPipe.}
proc kinc_g4_pipeline_get_texture_unit*(state: var Kinc_g4_pipeline, name:cstring):Kinc_g4_texture_unit
    {.header: hhkPipe.}