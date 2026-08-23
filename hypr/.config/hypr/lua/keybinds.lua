local g = require("lua.globals")

local runtime_dir = os.getenv("XDG_RUNTIME_DIR")
local skwd_cmd = runtime_dir .. "/skwd/cmd"

hl.bind(g.main_mod .. " + Q", hl.dsp.exec_cmd(g.terminal))
hl.bind(g.main_mod .. " + C", hl.dsp.window.kill())
hl.bind(g.main_mod .. " + M", hl.dsp.exec_cmd("reboot"))
hl.bind(g.main_mod .. " + ALT + M", hl.dsp.exec_cmd("~/.local/share/quickshell-lockscreen/lock.sh"))
hl.bind(g.main_mod .. " + E", hl.dsp.exec_cmd("[float; size 1000 600] kitty yazi"))
hl.bind(g.main_mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(g.main_mod .. " + P", hl.dsp.window.pseudo())
hl.bind(g.main_mod .. " + J", hl.dsp.layout("togglesplit"))

hl.bind(g.main_mod .. " + R", hl.dsp.exec_cmd("echo applauncher > " .. skwd_cmd))
hl.bind(g.main_mod .. " + D", hl.dsp.exec_cmd("echo toggleBar > " .. skwd_cmd))
hl.bind(g.main_mod .. " + T", hl.dsp.exec_cmd("echo wallpaper > " .. skwd_cmd))
hl.bind(g.main_mod .. " + L", hl.dsp.exec_cmd("echo lock > " .. skwd_cmd))
hl.bind(g.main_mod .. " + escape", hl.dsp.exec_cmd("echo powermenu > " .. skwd_cmd))
hl.bind(g.main_mod .. " + SHIFT + L", hl.dsp.exec_cmd("echo powermenu > " .. skwd_cmd))
hl.bind(g.main_mod .. " + SHIFT + S", hl.dsp.exec_cmd("echo smarthome > " .. skwd_cmd))
hl.bind("ALT + TAB", hl.dsp.exec_cmd("echo switcherNext > " .. skwd_cmd))
hl.bind("ALT + SHIFT + TAB", hl.dsp.exec_cmd("echo switcherPrev > " .. skwd_cmd))
hl.bind("ALT + RETURN", hl.dsp.exec_cmd("echo switcherConfirm > " .. skwd_cmd))
hl.bind("ALT + escape", hl.dsp.exec_cmd("echo switcherCancel > " .. skwd_cmd))
hl.bind("ALT + C", hl.dsp.exec_cmd("echo switcherClose > " .. skwd_cmd))

for _, direction in ipairs({ "left", "right", "up", "down" }) do
	hl.bind(g.main_mod .. " + " .. direction, hl.dsp.focus({ direction = direction }))
end

for i = 1, 10 do
	local key = i % 10
	hl.bind(g.main_mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(g.main_mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(g.main_mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(g.main_mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(g.main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(g.main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(g.main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(g.main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(g.main_mod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(g.shift_mod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

hl.bind("SUPER + F", hl.dsp.window.fullscreen())
hl.bind("SUPER + SHIFT + F12", hl.dsp.exec_cmd("~/.local/bin/smart-steam-launch.sh"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

local exec_binds = {
	{ key = "XF86AudioRaiseVolume", cmd = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+", repeating = true },
	{ key = "XF86AudioLowerVolume", cmd = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-", repeating = true },
	{ key = "XF86AudioMute", cmd = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle", repeating = true },
	{ key = "XF86AudioMicMute", cmd = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle", repeating = true },
	{ key = "XF86MonBrightnessUp", cmd = "brightnessctl -e4 -n2 set 5%+", repeating = true },
	{ key = "XF86MonBrightnessDown", cmd = "brightnessctl -e4 -n2 set 5%-", repeating = true },
	{ key = "XF86AudioNext", cmd = "playerctl next" },
	{ key = "XF86AudioPause", cmd = "playerctl play-pause" },
	{ key = "XF86AudioPlay", cmd = "playerctl play-pause" },
	{ key = "XF86AudioPrev", cmd = "playerctl previous" },
}

for _, bind in ipairs(exec_binds) do
	local opts = { locked = true }
	if bind.repeating then
		opts.repeating = true
	end
	hl.bind(bind.key, hl.dsp.exec_cmd(bind.cmd), opts)
end
