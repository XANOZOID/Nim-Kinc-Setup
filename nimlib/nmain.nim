import 
    kinc/graphics4/texture ,
    kinc/graphics4/vertexbuffer,
    kinc/graphics4/indexbuffer,
    kinc/graphics4/graphics,
    kinc/math/matrix,
    kinc/system,
    kinc/input/mouse
import
    mine/mymatrix,
    mine/spritebatch,
    mine/bufutil,
    mine/loading

var batch:SpriteBatch
var nimTexture:array[2, ref KincG4Texture]
var scrollScale:cint = 10 * 5

proc on_mouse_scroll(w: cint, delta:cint): void {.exportc, cdecl.} = scrollScale -= delta * 3

proc nim_update() {.cdecl.} = 
    batch.do_draw(0):
        var num = 0
        for i in 0..<31:
            for j in 0..<31:
                batch.vertices.setVertRect(num, (i * 15).float, (j*15).float, 88, 16, 0, 0, 16, 16)
                inc num
        batch.transform = batch.projection.scale(scrollScale.toFloat/10)
        batch.lastTexture = nimTexture[0]
        batch.drawBuffer()
        num = 0
        for i in 0..<31:
            for j in 0..<31:
                batch.vertices.setVertRect(num, (i * 70).float, (j*99).float, 90, 87, 0, 0, 90, 87)
                inc num
        batch.lastTexture = nimTexture[1]

proc nim_start() {.exportc.} =
    const canvW = 1024.0
    const canvH = 768.0
    kinc_init("Game", canvW.int32, canvH.int32, nil, nil)
    kinc_set_update_callback(nim_update)
    for i, s in ["parrotpx.png", "kha_icon.png"]:
        nimTexture[i] = new (KincG4Texture)
        nimTexture[i][].load_texture(s)

    batch.init()
    batch.projectAsOrtho(canvW, canvH)

    kinc_mouse_scroll_callback = on_mouse_scroll
    kinc_start()
