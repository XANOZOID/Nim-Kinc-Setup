
const hhkIBuff = "kinc/graphics4/indexbuffer.h"

type 
    Kinc_g4_index_buffer* {.importC:"struct kinc_g4_index_buffer", header:hhkIBuff.} = object

proc kinc_g4_index_buffer_init*(buffer: var Kinc_g4_index_buffer, count:cint)
    {.header:hhkIBuff.}
proc kinc_g4_index_buffer_destroy*(buffer: var Kinc_g4_index_buffer)
    {.header:hhkIBuff.}
proc kinc_g4_index_buffer_lock*(buffer: var Kinc_g4_index_buffer):ptr UncheckedArray[cint]
    {.header:hhkIBuff.}
proc kinc_g4_index_buffer_unlock*(buffer: var Kinc_g4_index_buffer)
    {.header:hhkIBuff.}
proc kinc_g4_index_buffer_count*(buffer: var Kinc_g4_index_buffer):cint
    {.header:hhkIBuff.}
proc kinc_g4_set_index_buffer*(buffer: var Kinc_g4_index_buffer)
    {.header:hhkIBuff.}