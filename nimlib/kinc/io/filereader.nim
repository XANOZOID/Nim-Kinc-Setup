
const hhkFilereader = "<kinc/io/filereader.h>"

const kincFileTypeAsset*:cint = 0
const kincFileTypeSave*:cint = 1


type 
    KincFileReader *{.importc: "struct kinc_file_reader", header:hhkFilereader} = object

proc kinc_file_reader_open*(reader: var Kinc_file_reader, filename:cstring, tipe:cint) 
    {.header:hhkFilereader.}
proc kinc_file_reader_close*(reader: var Kinc_file_reader) 
    {.header:hhkFilereader.}
proc kinc_file_reader_read*(reader: var Kinc_file_reader, data: pointer, size: csize_t)
    {.header:hhkFilereader.}
proc kinc_file_reader_size*(reader: var Kinc_file_reader):csize_t
    {.header:hhkFilereader.}