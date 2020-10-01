import window

const hhkSystem = "kinc/system.h"

proc kinc_init*(name: cstring, width: cint, height: cint, win: ptr Kinc_window_options, frame: ptr Kinc_framebuffer_options): cint
    {.header: hhkSystem, discardable.}
proc kinc_application_name*():cstring
    {.header: hhkSystem.}
proc kinc_set_application_name*(name: cstring)
    {.header: hhkSystem.}
proc kinc_width*(): cint
    {.header: hhkSystem.}
proc kinc_height*(): cint
    {.header: hhkSystem.}

proc kinc_start*()
    {.header: hhkSystem.}
proc kinc_internal_frame*():bool
    {.header: hhkSystem.}
proc kinc_stop*()
    {.header: hhkSystem.}

proc kinc_login*()
    {.header: hhkSystem.}
proc kinc_unlock_achievement*(id: cint)
    {.header: hhkSystem.}
proc kinc_disallow_user_change*()
    {.header: hhkSystem.}
proc kinc_allow_user_change*()
    {.header: hhkSystem.}

proc kinc_set_keep_screen_on*(on: bool)
    {.header: hhkSystem.}

type VoidCCallback = proc():void {.cdecl.}
proc kinc_set_update_callback*(cb: VoidCCallback)
    {.header: hhkSystem.}
# proc kinc_set_foreground_callback*(void *(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_resume_callback*(void *(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_pause_callback*(void *(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_background_callback*(void *(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_shutdown_callback*(void *(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_drop_files_callback*(void *(*value)*(wchar_t *))
#     {.header: hhkSystem.}
# proc kinc_set_cut_callback*(char **(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_copy_callback*(char **(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_paste_callback*(void *(*value)*(char *))
#     {.header: hhkSystem.}
# proc kinc_set_login_callback*(void *(*value)*())
#     {.header: hhkSystem.}
# proc kinc_set_logout_callback*(void *(*value)*())
#     {.header: hhkSystem.}