
const hhkMatrix = "kinc/math/matrix.h"

type
    KincMatrix3x3* {.importc:"struct kinc_matrix3x3", header:hhkMatrix.} = object
        m*: array[3 * 3, cfloat]
    KincMatrix4x4* {.importc:"struct kinc_matrix4x4", header:hhkMatrix.} = object
        m*: array[4 * 4, cfloat]

proc kinc_matrix3x3_get*(matrix: var Kinc_matrix3x3, x: cint, y: cint):cfloat
    {.header: hhkMatrix.}
proc kinc_matrix3x3_set*(matrix: var Kinc_matrix3x3, x: cint, y: cint, value: cfloat )
    {.header: hhkMatrix.}
proc kinc_matrix3x3_transpose*(matrix: var Kinc_matrix3x3)
    {.header: hhkMatrix.}
proc kinc_matrix3x3_identity*(): Kinc_matrix3x3
    {.header: hhkMatrix.}
proc kinc_matrix3x_rotation_x*(alpha: cfloat): Kinc_matrix3x3
    {.header: hhkMatrix.}
proc kinc_matrix3x_rotation_y*(alpha: cfloat): Kinc_matrix3x3
    {.header: hhkMatrix.}
proc kinc_matrix3x_rotation_z*(alpha: cfloat): Kinc_matrix3x3
    {.header: hhkMatrix.}

proc kinc_matrix4x4_get*(matrix: var Kinc_matrix4x4, x: cint, y: cint):cfloat
    {.header: hhkMatrix.}
proc kinc_matrix4x4_transpose*(matrix: var Kinc_matrix4x4)
    {.header: hhkMatrix.}
