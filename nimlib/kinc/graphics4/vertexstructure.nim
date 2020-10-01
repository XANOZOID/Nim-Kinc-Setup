
const hhkVS = "kinc/graphics4/vertexstructure.h"
const kinc_g4_max_vertex_elements = 16

type 
    KincG4VertexData* {.importc:"enum kinc_g4_vertex_data", header:hhkVS.} = enum 
        kincG4VertexDataNone,
        kincG4VertexDataFloat1,
        kincG4VertexDataFloat2,
        kincG4VertexDataFloat3,
        kincG4VertexDataFloat4,
        kincG4VertexDataFloat4X4,
        kincG4VertexDataShort2Norm,
        kincG4VertexDataShort4Norm,
        kincG4VertexDataColor
    KincG4VertexElement* {.importc:"struct kinc_g4_vertex_element", header:hhkVS.} = object
        name:cstring
        data:Kinc_g4_vertex_data
    KincG4VertexStructure* {.importc:"struct kinc_g4_vertex_structure", header:hhkVS.} = object
        elements:array[kinc_g4_max_vertex_elements, KincG4VertexElement]
        size:cint
        instanced:bool

proc kinc_g4_vertex_element_init*(element: var Kinc_g4_vertex_element, name:cstring, data: Kinc_g4_vertex_data)
    {.header:hhkVS.}
proc kinc_g4_vertex_structure_init*(structure: var Kinc_g4_vertex_structure)
    {.header:hhkVS.}
proc kinc_g4_vertex_structure_add*(structure: var Kinc_g4_vertex_structure, name:cstring, data: Kinc_g4_vertex_data)
    {.header:hhkVS.}
