const hhkShader = "kinc/graphics4/shader.h"

type 
    KincG4ShaderType* {.importc:"enum kinc_g4_shader_type", header:hhkShader.} = enum
        kincG4ShaderTypeFragment,
        kincG4ShaderTypeVertex,
        kincG4ShaderTypeGeometry,
        kincG4ShaderTypeTessellationControl,
        kincG4ShaderTypeTessellationEvaluation
    KincG4Shader* {.importc:"struct kinc_g4_shader", header:hhkShader.} = object

proc kinc_g4_shader_init*(shader: var Kinc_g4_shader, data: pointer, length: csize_t, tipe:KincG4ShaderType)
    {.header:hhkShader.}