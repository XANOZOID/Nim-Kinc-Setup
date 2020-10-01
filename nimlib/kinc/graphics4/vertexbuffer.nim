import vertexstructure

const hhkVBuf = "kinc/graphics4/vertexbuffer.h"

type 
    Kinc_g4_usage* {.importc:"enum kinc_g4_usage", header:hhkVBuf.} = enum
        kincG4UsageStatic,
        kincG4UsageDynamic,
        kincG4UsageReadable
    KincG4VertexBuffer* {.importc:"struct kinc_g4_vertex_buffer", header:hhkVBuf.} = object


proc kinc_g4_vertex_buffer_init*(buffer: var Kinc_g4_vertex_buffer, count:cint, structure: var Kinc_g4_vertex_structure, usage: Kinc_g4_usage, instance_data_step_rate:cint)
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_destroy*(buffer: var Kinc_g4_vertex_buffer)
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_lock_all*(buffer: var Kinc_g4_vertex_buffer):ptr UncheckedArray[cfloat]
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_lock*(buffer: var Kinc_g4_vertex_buffer, start:cint, count:cint):ptr UncheckedArray[cfloat]
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_unlock_all*(buffer: var Kinc_g4_vertex_buffer)
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_unlock*(buffer: var Kinc_g4_vertex_buffer, count:cint)
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_count*(buffer: var Kinc_g4_vertex_buffer):cint
    {.header:hhkVBuf.}
proc kinc_g4_vertex_buffer_stride*(buffer: var Kinc_g4_vertex_buffer):cint
    {.header:hhkVBuf.}
proc kinc_g4_set_vertex_buffers*(buffers: ptr ptr Kinc_g4_vertex_buffer, count:cint)
    {.header:hhkVBuf.}
proc kinc_g4_set_vertex_buffer*(buffer: var Kinc_g4_vertex_buffer)
    {.header:hhkVBuf.}