type BuffData = object
    pos: (float, float)
    tex: (float, float)

const vertSize:int = 5

proc addSegment*(v:ptr UncheckedArray[cfloat], vi:int, seg:int, data:BuffData) =
    let baseIndex = vi + seg * vertSize
    v[baseIndex + 0] = data.pos[0]
    v[baseIndex + 1] = data.pos[1]
    v[baseIndex + 2] = 0.5
    v[baseIndex + 3] = data.tex[0]
    v[baseIndex + 4] = data.tex[1]

proc setVertRect*(v:var ptr UncheckedArray[cfloat], vi:int, 
    x:float, y:float, w:float, h:float, 
    sx:float, sy:float, sw:float, sh:float) =
    let sx2 = sx/w
    let sy2 = sy/h; 
    let sw2 = sw/w; 
    let sh2 = sh/h;
    let offset = vi * vertSize * 4
    # bot left
    v.addSegment(offset, 0, BuffData(
        pos:(x, sh + y), 
        tex:(sx2, sy2 + sh2)))
    # bot right
    v.addSegment(offset, 1, BuffData(
        pos:(x + sw, sh + y), 
        tex:(sx2 + sw2, sy2 + sh2)))
    # top right
    v.addSegment(offset, 2, BuffData(
        pos:(x + sw, y), 
        tex:(sx2 + sw2, sy2)))
    # top left
    v.addSegment(offset, 3, BuffData(
        pos:(x, y), 
        tex:(sx2, sy2)))
