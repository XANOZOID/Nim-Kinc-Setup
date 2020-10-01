const hhkImage = "kinc/image.h"

type 
    KincImageCompression* {.importc:"enum kinc_image_compression", header:hhkImage.} = enum
        kincImageCompressionNone,
        kincImageCompressionDXT5,
        kincImageCompressionASTC,
        kincImageCompressionVRTC    
    KincImageFormat* {.importc:"enum kinc_image_format", header:hhkImage.} = enum
        kincImageFormatRGBA32, 
        kincImageFormatGrey8,
        kincImageFormatRGB24,
        kincImageFormatRGBA128,
        kincImageFormatA32,
        kincImageFormatBGRA32,
        kincImageFormatA16
    KincImage* {.importc:"struct kinc_image", header:hhkImage.} = object
        width, height, depth*: cint
        format*: KincImageFormat
        internal_format*: cuint
        compression*: KincImageCompression
        data*: pointer
        data_size*: cint

proc kinc_image_init_from_file*(image: var KincImage, memory: pointer, filename: cstring) 
    {.header:hhkImage.}

proc kinc_image_destroy*(image:var Kinc_image) {.header:hhkImage.}  