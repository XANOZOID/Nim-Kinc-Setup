import 
    ../kinc/graphics4/texture ,
    ../kinc/graphics4/shader,
    ../kinc/graphics4/pipeline,
    ../kinc/graphics4/vertexstructure,
    ../kinc/graphics4/vertexbuffer,
    ../kinc/graphics4/indexbuffer,
    ../kinc/graphics4/graphics,
    ../kinc/math/matrix

import mymatrix, loading

type 
    BatchPipeline* = object
        pipeline:KincG4Pipeline
        struct:KincG4VertexStructure
        texunit:Kinc_g4_texture_unit
        offset:Kinc_g4_constant_location
        vertS:KincG4Shader
        fragS:KincG4Shader
    SpriteBatch* = object
        pipeline:BatchPipeline
        vertBuff*: KincG4VertexBuffer
        indexBuff*:KincG4IndexBuffer
        projection:KincMatrix4x4
        transform*:KincMatrix4x4
        vertices*:ptr UncheckedArray[cfloat]
        lastTexture*:ref KincG4Texture

proc setup(pipeline:var KincG4Pipeline, struct: var KincG4VertexStructure, 
           vertS:var KincG4Shader, fragS:var KincG4Shader) 
proc init(self:var BatchPipeline)
proc initBuffs(self:var SpriteBatch)


proc init*(self:var SpriteBatch) =
    init self.pipeline
    self.initBuffs()

proc projection*(self: var SpriteBatch):KincMatrix4x4 = self.projection
proc projectAsOrtho*(self:var SpriteBatch, w:float, h:float) =
    self.projection.set_identity()
    self.projection.set_projection( 0.0, w, h, 0, 0.0, 1000)

proc drawBuffer*(self:var SpriteBatch) =
    kinc_g4_vertex_buffer_unlock_all(self.vertBuff)    
    self.pipeline.pipeline.kinc_g4_set_pipeline()
    kinc_g4_set_vertex_buffer(self.vertBuff)
    kinc_g4_set_index_buffer(self.indexBuff)
    kinc_g4_set_texture(self.pipeline.texunit, addr self.lastTexture[])
    kinc_g4_set_texture_magnification_filter(self.pipeline.texunit, kincG4TextureFilterPoint)
    kinc_g4_set_texture_minification_filter(self.pipeline.texunit, kincG4TextureFilterPoint)
    kinc_g4_set_texture_mipmap_filter(self.pipeline.texunit, kincG4MipmapFilterNone)
    kinc_g4_set_matrix4(self.pipeline.offset, self.transform)        
    kinc_g4_draw_indexed_vertices() 
    self.vertices = kinc_g4_vertex_buffer_lock_all(self.vertBuff)

proc enter*(self:var SpriteBatch, color:uint) =
    kinc_g4_begin(0)
    kinc_g4_clear(kinc_g4_clear_color.cuint, color.cuint, 0.0f, 0)
    self.transform = KincMatrix4x4()

proc exit*(self:var SpriteBatch) =
    self.drawBuffer()
    kinc_g4_end(0)
    kinc_g4_swap_buffers()

template do_draw*(self:var SpriteBatch, color:uint, body:untyped) = 
    enter self, color
    body
    exit self




proc setup(pipeline:var KincG4Pipeline, struct: var KincG4VertexStructure, 
           vertS:var KincG4Shader, fragS:var KincG4Shader) = 
    struct.kinc_g4_vertex_structure_init()
    struct.kinc_g4_vertex_structure_add("pos", kincG4VertexDataFloat3)
    struct.kinc_g4_vertex_structure_add("tex", kincG4VertexDataFloat2)
    pipeline.kinc_g4_pipeline_init()
    pipeline.input_layout[0] = addr struct
    pipeline.input_layout[1] = nil
    pipeline.vertex_shader = addr vertS
    pipeline.fragment_shader = addr fragS
    pipeline.blend_source = kincG4BlendOne
    pipeline.blend_destination = kincG4BlendINVSourceAlpha
    pipeline.alpha_blend_source = kincG4BlendOne
    pipeline.alpha_blend_destination = kincG4BlendINVSourceAlpha
    pipeline.kinc_g4_pipeline_compile()

proc init(self:var BatchPipeline) =
    self.vertS.load_shader("texture.vert", kincG4ShaderTypeVertex)
    self.fragS.load_shader("texture.frag", kincG4ShaderTypeFragment)
    
    self.pipeline.setup(self.struct, self.vertS, self.fragS)

    self.texunit = self.pipeline.kinc_g4_pipeline_get_texture_unit("texsampler")
    self.offset = self.pipeline.kinc_g4_pipeline_get_constant_location("mvp")

proc initBuffs(self:var SpriteBatch) =
    const buffSize = 1000.int32
    # vertices
    kinc_g4_vertex_buffer_init(self.vertBuff, buffSize * 4, self.pipeline.struct,
        kincG4UsageDynamic, 0)
    self.vertices = kinc_g4_vertex_buffer_lock_all(self.vertBuff)
    # index
    kinc_g4_index_buffer_init(self.indexBuff, buffSize * 3 * 2)
    var indices = kinc_g4_index_buffer_lock(self.indexBuff)
    for ii in 0..<buffSize:
        indices[ii * 6 + 0] = ii * 4 + 0
        indices[ii * 6 + 1] = ii * 4 + 1
        indices[ii * 6 + 2] = ii * 4 + 2
        indices[ii * 6 + 3] = ii * 4 + 0
        indices[ii * 6 + 4] = ii * 4 + 2
        indices[ii * 6 + 5] = ii * 4 + 3
    kinc_g4_index_buffer_unlock(self.indexBuff)