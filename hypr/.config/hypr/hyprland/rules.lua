-- FIXME warnings on types
---@diagnostic disable-next-line: param-type-mismatch, redundant-parameter
hl.permission('/usr/(bin|local/bin)/grim', 'screencopy', 'allow')
---@diagnostic disable-next-line: param-type-mismatch, redundant-parameter
hl.permission('/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland', 'screencopy', 'allow')
---@diagnostic disable-next-line: param-type-mismatch, redundant-parameter
hl.permission('/usr/(bin|local/bin)/hyprpm', 'plugin', 'allow')

-- smart gaps
hl.workspace_rule { workspace = 'w[tv1]s[false]', gaps_out = 0, gaps_in = 0 }
hl.workspace_rule { workspace = 'f[1]s[false]', gaps_out = 0, gaps_in = 0 }
hl.window_rule { match = { float = false, workspace = 'w[tv1]s[false]' }, border_size = 0 }
hl.window_rule { match = { float = false, workspace = 'w[tv1]s[false]' }, rounding = 0 }
hl.window_rule { match = { float = false, workspace = 'f[1]s[false]' }, border_size = 0 }
hl.window_rule { match = { float = false, workspace = 'f[1]s[false]' }, rounding = 0 }

-- Ignore maximize requests from all apps. You'll probably like this.
hl.window_rule { match = { class = '.*' }, suppress_event = 'maximize' }

-- Fix some dragging issues with XWayland
hl.window_rule {
    name = 'fix-xwayland-drags',
    match = {
        class = '^$',
        title = '^$',
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },

    no_focus = true,
}
