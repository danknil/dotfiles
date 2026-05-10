hl.monitor {
    output = 'DP-1',
    mode = '2560x1440@143.97',
    position = '0x0',
    scale = '1',
}

hl.monitor {
    output = 'HDMI-A-1',
    mode = '1920x1080',
    position = '2560x180',
    scale = '1',
    transform = 3,
}

hl.workspace_rule { workspace = 'r[1-7]', monitor = 'DP-1' }
hl.workspace_rule { workspace = 'r[8-9]', monitor = 'HDMI-A-1' }

-- setup tablet
hl.device {
    name = 'huion-huion-tablet_l610-pen',
    output = 'DP-1',
}


