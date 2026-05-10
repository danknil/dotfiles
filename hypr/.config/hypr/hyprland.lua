-- config
local config = require 'hyprland.config'

local apps = config.apps
local colors = config.colors

-- settings per device
require 'hyprland.custom'

-- permissions, workspace rules, window rules
require 'hyprland.rules'

hl.config {
    ecosystem = {
        enforce_permissions = true,
        no_update_news = true,
        no_donation_nag = true,
    },
    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 5,
        col = {
            inactive_border = colors.muted,
            active_border = colors.rose,
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = 'dwindle',
    },
    dwindle = {
        preserve_split = true,
    },
    decoration = {
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 'rgba(1a1a1aee)',
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    input = {
        kb_layout = 'us,ru',
        kb_options = 'grp:caps_toggle',
        follow_mouse = true,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_scale_notification = true,
        disable_autoreload = true,
        disable_xdg_env_checks = true,
    },
    xwayland = {
        force_zero_scaling = true,
        create_abstract_socket = true,
    },
    -- FIXME add animations
    animations = {
        enabled = false,
    },
}

local mainMod = 'SUPER'

local function bind(keys, dispatch, flags)
    local map = mainMod .. ' + ' .. keys
    hl.bind(map, dispatch, flags or {})
end

local function exec_bind(keys, cmd, flags)
    bind(keys, hl.dsp.exec_cmd(cmd), flags)
end

exec_bind('Q', apps.terminal)
exec_bind('E', apps.fileManager)
exec_bind('R', apps.menu)

hl.bind('Print', hl.dsp.exec_cmd 'hyprshot -m region')
hl.bind('CONTROL + Print', hl.dsp.exec_cmd 'hyprshot -m output')

exec_bind('M', "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")

bind('C', hl.dsp.window.close())
bind('V', hl.dsp.window.float { action = 'toggle' })
bind('P', hl.dsp.window.pin())
bind('J', hl.dsp.layout 'togglesplit')

bind('left', hl.dsp.focus { direction = 'left' })
bind('right', hl.dsp.focus { direction = 'right' })
bind('down', hl.dsp.focus { direction = 'down' })
bind('up', hl.dsp.focus { direction = 'up' })

for key = 1, 9 do
    bind('' .. key, hl.dsp.focus { workspace = key })
    bind('SHIFT +' .. key, hl.dsp.window.move { workspace = key })
end

bind('S', hl.dsp.workspace.toggle_special 'magic')
bind('SHIFT + S', hl.dsp.window.move { workspace = 'special:magic' })

-- LMB & RMB
bind('mouse:272', hl.dsp.window.drag(), { mouse = true })
bind('mouse:273', hl.dsp.window.resize(), { mouse = true })

bind('mouse_down', hl.dsp.focus { workspace = 'e+1' })
bind('mouse_up', hl.dsp.focus { workspace = 'e-1' })

hl.bind(
    'XF86AudioRaiseVolume',
    hl.dsp.exec_cmd 'wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+',
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioLowerVolume',
    hl.dsp.exec_cmd 'wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-',
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioMute',
    hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle',
    { locked = true, repeating = true }
)
hl.bind(
    'XF86AudioMicMute',
    hl.dsp.exec_cmd 'wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle',
    { locked = true, repeating = true }
)
hl.bind('XF86MonBrightnessUp', hl.dsp.exec_cmd 'brightnessctl -e4 -n2 set 5%+', { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', hl.dsp.exec_cmd 'brightnessctl -e4 -n2 set 5%-', { locked = true, repeating = true })

hl.bind('XF86AudioNext', hl.dsp.exec_cmd 'playerctl next', { locked = true })
hl.bind('XF86AudioPause', hl.dsp.exec_cmd 'playerctl play-pause', { locked = true })
hl.bind('XF86AudioPlay', hl.dsp.exec_cmd 'playerctl play-pause', { locked = true })
hl.bind('XF86AudioPrev', hl.dsp.exec_cmd 'playerctl previous', { locked = true })
