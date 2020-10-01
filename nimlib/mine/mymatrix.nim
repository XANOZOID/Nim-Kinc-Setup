import ../kinc/math/matrix

# proc mat3_mult(kinc_matrix3x3_t *a, kinc_matrix3x3_t *b): Kinc_matrix3x3 = 
# 	kinc_matrix3x3_t result;
# 	for (unsigned x = 0; x < 3; ++x)
# 		for (unsigned y = 0; y < 3; ++y) {
# 			float t = kinc_matrix3x3_get(a, 0, y) * kinc_matrix3x3_get(b, x, 0);
# 			for (unsigned i = 1; i < 3; ++i) 
# 				t += kinc_matrix3x3_get(a, i, y) * kinc_matrix3x3_get(b, x, i);
# 			kinc_matrix3x3_set(&result, x, y, t);
# 		}
# 	return result;
# }
 
# inline kinc_matrix3x3_t* mat3_translate(kinc_matrix3x3_t *k, float xval, float yval) {
# 	kinc_matrix3x3_set(k, 0, 2, xval);
# 	kinc_matrix3x3_set(k, 1, 2, yval);
# 	return k;
# }

proc scale*(k: var Kinc_matrix3x3 , xval:float , yval:float ):var Kinc_matrix3x3 {.discardable.} =
    k.kinc_matrix3x3_set(0, 0, kinc_matrix3x3_get(k, 0, 0) * xval);
    k.kinc_matrix3x3_set(1, 1, kinc_matrix3x3_get(k, 1, 1) * yval);
    result = k

proc scale*(m:Kinc_matrix4x4 , k:float):Kinc_matrix4x4 {.discardable.} =
    result = m
    result.m[0] *= k
    result.m[4*1 + 1] *= k
    result.m[4*2 + 2] *= k

proc define_row(mat:var KincMatrix4x4, i:int, x:float, y:float, z:float, d:float) =
    mat.m[4*0 + i] = x
    mat.m[4*1 + i] = y
    mat.m[4*2 + i] = z
    mat.m[4*3 + i] = d

proc set_projection*(projection:var KincMatrix4x4, left: float, right: float, bottom: float, top: float, zn: float, zf: float) =
    var tx:float = -((right + left) / (right - left))
    var ty:float = -((top + bottom) / (top - bottom))
    var tz:float = -((zf + zn) / (zf - zn))

    projection.define_row(0, 2.0 / (right-left), 0, 0,  tx)
    projection.define_row(1, 0, 2.0 / (top-bottom), 0,  ty)
    projection.define_row(2, 0, 0, 2.0 / (zf-zn),       tz)
    projection.define_row(3, 0, 0, 0,                   1)
    

proc set_identity*(projection:var KincMatrix4x4) =
    projection.define_row(0, 1, 0, 0, 0)
    projection.define_row(1, 0, 1, 0, 0)
    projection.define_row(2, 0, 0, 1, 0)
    projection.define_row(3, 0, 0, 0, 1)