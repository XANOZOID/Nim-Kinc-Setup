import 
    ../kinc/image,
    ../kinc/graphics4/texture ,
    ../kinc/graphics4/shader,
    ../kinc/io/filereader

proc load_texture*(texture:var KincG4Texture, imgName:string) = 
    var img:KincImage
    let data = alloc(250 * 250 * 4)
    img.kinc_image_init_from_file(data, imgName)
    texture.kinc_g4_texture_init_from_image(img)
    img.kinc_image_destroy()


proc load_shader*(shader:var KincG4Shader, file:string, shaderT:KincG4ShaderType) =
    var reader:KincFileReader
    reader.kinc_file_reader_open(file, kincFileTypeAsset)
    let size = reader.kinc_file_reader_size()
    let data = alloc(size)
    reader.kinc_file_reader_read(data, size)
    reader.kinc_file_reader_close()
    shader.kinc_g4_shader_init(data, size, shaderT)