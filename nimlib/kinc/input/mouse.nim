
const hhkMouse = "kinc/input/mouse.h"


type 
    MouseBXYCallback = proc(w:cint, b:cint, x:cint, y:cint) {.cdecl.}
    MouseBXYXYCallback = proc(w:cint, b:cint, x:cint, y:cint, mx:cint, my:cint) {.cdecl.}
    MouseScrollCallback = proc(w:cint, d:cint) {.cdecl.}
    MouseWindowCallback = proc(w:cint) {.cdecl.}

var kinc_mouse_press_callback* {.header: hhkMouse.}:MouseBXYCallback
var kinc_mouse_release_callback* {.header: hhkMouse.}:MouseBXYCallback
var kinc_mouse_move_callback* {.header: hhkMouse.}:MouseBXYXYCallback
var kinc_mouse_scroll_callback* {.header: hhkMouse.}:MouseScrollCallback
var kinc_mouse_enter_window_callback* {.header: hhkMouse.}:MouseWindowCallback
var kinc_mouse_leave_window_callback* {.header: hhkMouse.}:MouseWindowCallback