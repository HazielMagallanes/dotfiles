local monitors = {
	-- { output = "DP-3", mode = "1366x768@60.0", position = "auto", scale = 0.67 },
	{ output = "", mode = "preferred", position = "auto", scale = "auto" },
	{ output = "HDMI-A-1", mode = "1920x1080@60.0", position = "auto", scale = "auto" },
	{ output = "DP-3", mode = "1920x1080@60.0", position = "auto", scale = "auto" },
}

for _, monitor in ipairs(monitors) do
	hl.monitor(monitor)
end
